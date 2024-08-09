﻿using Microsoft.Extensions.Hosting;
using Org.BouncyCastle.Math;
using Org.BouncyCastle.Security;
using System.Threading.Channels;

namespace Long.NetworkServices
{
    /// <summary>
    ///     This background service uses a single Random instance to generate all probable
    ///     primes for the server. This is used in the Diffie Hellman Key Exchange.
    /// </summary>
    public class PrimeGeneratorService : BackgroundService
    {
        // Fields and Properties
        private readonly int mBitLength;
        private readonly Channel<BigInteger> mBufferChannel;

        /// <summary>
        ///     Instantiates a new instance of <see cref="PrimeGeneratorService" /> using a
        ///     default capacity to buffer probable primes.
        /// </summary>
        /// <param name="capacity">Capacity of the bounded channel.</param>
        /// <param name="bitLength">Bit length of probable primes generated.</param>
        public PrimeGeneratorService(int capacity = 100, int bitLength = 256)
        {
            mBitLength = bitLength;
            mBufferChannel = Channel.CreateBounded<BigInteger>(capacity);
        }

        /// <summary>
        ///     Triggered when the application host is ready to start queuing probable primes.
        ///     Since the channel holding probable primes is bounded, writes will block
        ///     naturally on an await rather than locking threads to generate probable primes.
        /// </summary>
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                await mBufferChannel.Writer.WriteAsync(
                    BigInteger.ProbablePrime(mBitLength, new SecureRandom()),
                    stoppingToken);
            }
        }

        /// <summary>Returns the next probable prime from the generator.</summary>
        public Task<BigInteger> NextAsync()
        {
            return mBufferChannel.Reader.ReadAsync().AsTask();
        }
    }
}
