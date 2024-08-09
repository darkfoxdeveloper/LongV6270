﻿using Microsoft.Extensions.Hosting;
using System.Collections.Concurrent;

namespace Long.Network.Sockets
{
    /// <summary>
    ///     TcpServerRegistry gives the server basic flood protection by keeping a registry of
    ///     connection attempts, blocked connections, and active connections. A background worker
    ///     will clean blocked records automatically.
    ///     ///
    /// </summary>
    public sealed class TcpServerRegistry : IHostedService, IDisposable
    {
        private readonly int mBanMinutes;
        private readonly int mMaxActiveConnections;
        private readonly int mMaxAttemptsPerMinute;

        // Fields and properties
        private Dictionary<string, int> mActive;
        private object mActiveMutex;
        private Dictionary<string, int> mAttempts;
        private object mAttemptsMutex;
        private readonly ConcurrentDictionary<string, DateTime> mBlocks;
        private Timer mPurgeTimer;

        /// <summary>
        ///     Instantiates a new instance of <see cref="TcpServerRegistry" /> with initialized
        ///     collections for connection registration checks. The background worker for
        ///     trimming connections does not start until Start is called.
        /// </summary>
        /// <param name="banMinutes">Minutes a ban should remain in effect for</param>
        /// <param name="maxActiveConn">Maximum active connections alive at any given time</param>
        /// <param name="maxAttemptsPerMinute">Maximum connection attempts per minute</param>
        public TcpServerRegistry(
            int banMinutes = 15,
            int maxActiveConn = int.MaxValue,
            int maxAttemptsPerMinute = int.MaxValue)
        {
            mActive = new Dictionary<string, int>();
            mAttempts = new Dictionary<string, int>();
            mBlocks = new ConcurrentDictionary<string, DateTime>();

            mActiveMutex = new object();
            mAttemptsMutex = new object();
            mBanMinutes = banMinutes;
            mMaxActiveConnections = maxActiveConn;
            mMaxAttemptsPerMinute = maxAttemptsPerMinute;
        }

        /// <summary>Disposes of the purge timer.</summary>
        public void Dispose()
        {
            mPurgeTimer?.Dispose();
        }

        /// <summary>
        ///     Triggered when the application host is ready to start cleaning connection records
        ///     from the registry. Blocked entries with expired times will be unblocked, and
        ///     attempt counters will be reset.
        /// </summary>
        public Task StartAsync(CancellationToken cancellationToken)
        {
            mPurgeTimer = new Timer(
                TimedPurgeJob,
                null,
                TimeSpan.Zero,
                TimeSpan.FromSeconds(60));

            return Task.CompletedTask;
        }

        /// <summary>Stops cleaning attempt counters and stop checking for bans.</summary>
        public Task StopAsync(CancellationToken cancellationToken)
        {
            mPurgeTimer?.Change(Timeout.Infinite, 0);
            return Task.CompletedTask;
        }

        /// <summary>
        ///     Adds a new active client to the registry of connections. If the maximum number
        ///     of active connections has been exceeded for an IP address, or the accept volume
        ///     has spiked beyond permitted limits, this method will return false and ban the
        ///     client if evaluated to be an attack.
        /// </summary>
        /// <param name="ip">IPv4 address of the client</param>
        /// <returns>True if the connection is allowed.</returns>
        public BlockReason AddActiveClient(string ip)
        {
            // Check for blocked IP addresses
            if (mBlocks.ContainsKey(ip))
            {
                return BlockReason.MaxConnectionsAttempts;
            }

            // Check if the client should be blocked for frequent connections and then 
            // increment the active connections counter if the previous operation succeeded.
            if (!IncrementCounter(ip, mMaxAttemptsPerMinute, true, ref mAttemptsMutex, ref mAttempts))
            {
                return BlockReason.MaxConnectionsAttempts;
            }
            if (!IncrementCounter(ip, mMaxActiveConnections, false, ref mActiveMutex, ref mActive))
            {
                return BlockReason.MaxActiveConnections;
            }
            return BlockReason.None;
        }

        /// <summary>
        ///     Increments a counter given a collection of counts keyed by the client's IP
        ///     address. If the counter exceeds the ceiling value set by the parent method, then
        ///     the connection will be banned.
        /// </summary>
        /// <param name="ip">IPv4 address of the client</param>
        /// <param name="ceiling">Highest counter value before banning the connection</param>
        /// <param name="mutex">Mutex for locking the counter collection</param>
        /// <param name="collection">Counter collection keyed by IP address</param>
        /// <returns>True if the counter was incremented and the client wasn't banned.</returns>
        public bool IncrementCounter(
            string ip,
            int ceiling,
            bool block,
            ref object mutex,
            ref Dictionary<string, int> collection)
        {
            lock (mutex)
            {
                if (collection.TryGetValue(ip, out int count))
                {
                    count++;
                    if (count > ceiling)
                    {
                        if (block)
                        {
                            mBlocks.TryAdd(ip, DateTime.Now.AddMinutes(mBanMinutes));
                        }
                        return false;
                    }

                    collection[ip] = count;
                }
                else
                {
                    collection.TryAdd(ip, 1);
                }
            }

            return true;
        }

        /// <summary>Removes an active connection from the registry.</summary>
        /// <param name="ip">IPv4 address of the client</param>
        public void RemoveActiveClient(string ip)
        {
            // Decrement active connections count
            lock (mActiveMutex)
            {
                if (mActive.TryGetValue(ip, out int attempts))
                {
                    attempts--;
                    if (attempts == 0)
                    {
                        mActive.Remove(ip);
                    }
                    else
                    {
                        mActive[ip] = attempts;
                    }
                }
            }
        }

        /// <summary>
        ///     Invoked on a timer to purge attempt counters and check for expired bans. If the
        ///     interval calling this method isn't fast enough, it could cause players to get
        ///     banned unjustly.
        /// </summary>
        public void TimedPurgeJob(object state)
        {
            lock (mAttemptsMutex)
            {
                mAttempts.Clear();
            }

            DateTime now = DateTime.Now;
            foreach (KeyValuePair<string, DateTime> blockedConnection in mBlocks)
            {
                if (blockedConnection.Value < now)
                {
                    mBlocks.TryRemove(blockedConnection.Key, out DateTime _);
                }
            }
        }

        public enum BlockReason
        {
            None,
            MaxActiveConnections,
            MaxConnectionsAttempts
        }
    }
}
