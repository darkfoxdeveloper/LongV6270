﻿using Long.Database;
using Long.Kernel.Managers;
using Long.Kernel.Service;
using Long.Kernel.Settings;
using Long.Kernel.States.World;
using Long.Network.Security;
using Long.Shared.Helpers;
using Serilog;
using System.Reflection;

namespace Long.Game
{
    internal class Program
    {
        public static string Version => Assembly.GetEntryAssembly()?
                                                .GetCustomAttribute<AssemblyInformationalVersionAttribute>()?
                                                .InformationalVersion ?? "0.0.0.0";

        const int NO_ERROR = 0;
        const int INITIALIZATION_ERROR = -1;
        const int DATABASE_ERROR = -2;
        const int NO_RELEASE_DATE_ERROR = -3;
        const int RELEASE_DATE_INVALID_ERROR = -4;
        const int INVALID_RELEASE_SETTINGS = -5;

        private static readonly ILogger logger = Log.ForContext<Program>();

        public static async Task<int> Main(params string[] args)
        {
            Console.Title = "Loading...";

            Console.WriteLine("\tLong: Game Server");
            Console.WriteLine($"\t\tCopyright 2023-{DateTime.Now:yyyy} Felipe Vieira Vendramini \"Konichu\"");
            Console.WriteLine($"\t\tVersion: {Version}");
            Console.WriteLine("\tSome Rights Reserved");
            Console.WriteLine();

            Logger.Initialize("CQServer");

            logger.Information("Logger initialized with success!");
            logger.Information("Initializating game settings");

            // do everything
            GameServerSettings serverSettings = new GameServerSettings("Game", args);
            AbstractDbContext.Configuration = serverSettings.Database;
            Console.WriteLine();
            logger.Information("Database settings: {0} {1} **** {2}", serverSettings.Database.Hostname, serverSettings.Database.Username, serverSettings.Database.Schema);
            logger.Information("Login Listener serverSettings:");
            logger.Information("\tPort: {0}", serverSettings.Login.Port);
            logger.Information("Game Listener serverSettings:");
            logger.Information("\tPort: {0}", serverSettings.Game.Port);
            logger.Information("\tRecv processors: {0}", serverSettings.Game.Listener.RecvProcessors);
            logger.Information("\tSend processors: {0}", serverSettings.Game.Listener.SendProcessors);
            logger.Information("Game Processor serverSettings:");
            logger.Information("\tProcessors: {0}", serverSettings.Game.Processors);
            Console.WriteLine();

            if (serverSettings.Game.ReleaseDate.HasValue && serverSettings.Game.ReleaseDate == default)
            {
                logger.Error("Please, set up a release date for the server starting from now or before.");
                Console.ReadLine();
                return NO_RELEASE_DATE_ERROR;
            }

            if (serverSettings.Game.ReleaseDate > DateTime.Now)
            {
                logger.Error("This server is setup to start on {0}", serverSettings.Game.ReleaseDate);
                Console.ReadLine();
                return RELEASE_DATE_INVALID_ERROR;
            }

            logger.Information("Initializating realm '{0}'", serverSettings.Game.Name);
            if (serverSettings.Game.ReleaseDate.HasValue)
            {
                logger.Information("This server has been released in {0}", serverSettings.Game.ReleaseDate);
            }

            if (serverSettings.CooperatorMode)
            {
                logger.Warning("Server is open in Cooperator Mode! Normal players may not be able to login to the game server.");
                RoleManager.ToggleCooperatorMode();
            }

#if !DEBUG
            if (serverSettings.Game.Username.Equals("yD3Ni6tMW1NNU1QH")
                || serverSettings.Game.Password.Equals("jETqqIKi9LuFvOgu"))
            {
                logger.LogCritical("Server has not been configured properly! Change your Realm credentials!");
                Console.ReadLine();
                return INVALID_RELEASE_SETTINGS;
            }

            if (ServerConfiguration.Configuration.Ai.Username.Equals("yD3Ni6tMW1NNU1QH")
                || ServerConfiguration.Configuration.Ai.Password.Equals("jETqqIKi9LuFvOgu"))
            {
                logger.LogCritical("Server has not been configured properly! Change your AI credentials!");
                Console.ReadLine();
                return INVALID_RELEASE_SETTINGS;
            }
#endif

            var tasks = new List<Task>
            {
                Services.Randomness.StartAsync(CancellationToken.None),
                NDDiffieHellman.ProbablePrimes.StartAsync(CancellationToken.None)
            };
            Task.WaitAll(tasks.ToArray());

            if (!await Kernel.InitializeAsync(serverSettings))
            {
                return INITIALIZATION_ERROR;
            }

            logger.Information("Server initialized and ready to login!");

            await CommandLineAsync();

            await ModuleManager.OnServerShutdownModulesAsync();
            await Kernel.CloseAsync();
            await Log.CloseAndFlushAsync();
            return NO_ERROR;
        }

        private static async Task CommandLineAsync()
        {
            string command;
            do
            {
                command = Console.ReadLine();
                if (string.IsNullOrEmpty(command))
                {
                    continue;
                }
                try
                {
                    await ProcessCommandAsync(command);
                }
                catch (Exception ex)
                {
                    logger.Error(ex, "Error [{1}] running command {0}", command, ex.Message);
                }
            }
            while (!"exit".Equals(command));
        }

        private static async Task ProcessCommandAsync(string command)
        {
            string[] splitCmd = command.Split(new[] { ' ' }, 2, StringSplitOptions.RemoveEmptyEntries);
            if (splitCmd.Length == 0)
            {
                return;
            }

            switch (splitCmd[0])
            {
                case "/version":
                    {
                        Console.WriteLine($"Version: {Version}");
                        break;
                    }
                case "/testjump":
                    {
                        string[] splitParams = command.Split(' ');
                        if (splitParams.Length < 6)
                        {
                            Console.WriteLine($"/testjump mapid x y tx ty");
                            break;
                        }

                        GameMap map = MapManager.GetMap(uint.Parse(splitParams[1]));
                        ushort x1 = ushort.Parse(splitParams[2]);
                        ushort y1 = ushort.Parse(splitParams[3]);
                        ushort x2 = ushort.Parse(splitParams[4]);
                        ushort y2 = ushort.Parse(splitParams[5]);

                        
                        break;
                    }
                case "/cooperator":
                    {
                        RoleManager.ToggleCooperatorMode();
                        break;
                    }
                default:
                    {
                        Console.WriteLine("Unknown command.");
                        break;
                    }
            }
        }
    }
}