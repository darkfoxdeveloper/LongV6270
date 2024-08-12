using Long.Database.Entities;
using Long.Kernel.Managers;
using Long.Network.Packets;
using static Long.Kernel.States.User.Character;

namespace Long.Kernel.Network.Game.Packets
{
    public sealed class MsgTraining : MsgBase<GameClient>
    {
        private static readonly ILogger logger = Log.ForContext<MsgTraining>();

        public Mode Action { get; set; }
        public uint TrainingTime { get; set; }

        public override void Decode(byte[] bytes)
        {
            using var reader = new PacketReader(bytes);
            Length = reader.ReadUInt16();
            Type = (PacketType)reader.ReadUInt16();
            Action = (Mode)reader.ReadUInt32();
            TrainingTime = reader.ReadUInt32();
        }

        public override byte[] Encode()
        {
            using var writer = new PacketWriter();
            writer.Write((ushort)PacketType.MsgTraining);
            writer.Write((uint)Action);
            writer.Write(TrainingTime);
            return writer.ToArray();
        }

        public enum Mode
        {
            RequestTime,
            RequestEnter,
            Unknown2,
            RequestRewardInfo,
            ClaimReward
        }

        public override async Task ProcessAsync(GameClient client)
        {
            switch (Action)
            {
                case Mode.RequestTime:
                    {
                        TrainingTime = client.Character.CurrentTrainingMinutes;
                        await client.Character.SendAsync(this);
                        break;
                    }

                case Mode.RequestEnter:
                    {
                        if (!client.Character.IsBlessed || client.Character.CurrentTrainingMinutes == 0)
                        {
                            await client.Character.SendAsync(StrCannotEnterTG);
                            return;
                        }

                        if (client.Character.MapIdentity != 601)
                        {
                            await client.Character.EnterAutoExerciseAsync();
                        }

                        await client.Character.SendAsync(this);
                        break;
                    }

                case Mode.RequestRewardInfo:
                    {
                        ExperiencePreview currData = client.Character.GetCurrentOnlineTGExp();

                        DbLevelExperience expInfo = ExperienceManager.GetLevelExperience((byte)currData.Level);
                        if (expInfo == null)
                        {
                            await client.SendAsync(new MsgTrainingInfo());
                            return;
                        }

                        var exp = (int)(currData.Experience / (double)expInfo.Exp * 10000000);
                        await client.Character.SendAsync(new MsgTrainingInfo
                        {
                            Experience = exp,
                            Level = currData.Level,
                            TimeRemaining = (ushort)(client.Character.CurrentTrainingTime -
                                                      Math.Min(client.Character.CurrentOfflineTrainingTime,
                                                               client.Character.CurrentTrainingTime)),
                            TimeUsed = Math.Min(client.Character.CurrentOfflineTrainingTime,
                                                client.Character.CurrentTrainingTime)
                        });
                        break;
                    }

                case Mode.ClaimReward:
                    {
                        await client.Character.LeaveAutoExerciseAsync();
                        break;
                    }

                default:
                    logger.Warning($"Unhandled MsgTraining::{Action}\r\n{PacketDump.Hex(Encode())}");
                    break;
            }
        }
    }
}