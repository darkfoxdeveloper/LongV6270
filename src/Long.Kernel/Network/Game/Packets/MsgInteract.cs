using Long.Kernel.States.Items;
using Long.Kernel.States.User;
using Long.Kernel.States.World;
using Long.Network.Packets;
using static Long.Kernel.Network.Game.Packets.MsgName;
using static Long.Kernel.States.User.Character;
using System.Drawing;
using Long.Kernel.Managers;
using Long.Kernel.States;

namespace Long.Kernel.Network.Game.Packets
{
    public sealed class MsgInteract : MsgBase<GameClient>
    {
        private static readonly ILogger logger = Log.ForContext<MsgInteract>();

        public MsgInteract()
        {
            Timestamp = Environment.TickCount;
        }

        public int Timestamp { get; set; }
        public int Padding { get; set; }
        public uint SenderIdentity { get; set; }
        public uint TargetIdentity { get; set; }
        public ushort PosX { get; set; }
        public ushort PosY { get; set; }
        public MsgInteractType Action { get; set; }
        public int Data { get; set; }

        public ushort MagicType
        {
            get => (ushort)Data;
            set => Data = (MagicLevel << 16) | value;
        }

        public ushort MagicLevel
        {
            get => (ushort)(Data >> 16);
            set => Data = (value << 16) | MagicType;
        }

        public int Command { get; set; }
        public InteractionEffect Effect { get; set; }
        public int EffectValue { get; set; }

        /// <summary>
        ///     Decodes a byte packet into the packet structure defined by this message class.
        ///     Should be invoked to structure data from the client for processing. Decoding
        ///     follows TQ Digital's byte ordering rules for an all-binary protocol.
        /// </summary>
        /// <param name="bytes">Bytes from the packet processor or client socket</param>
        public override void Decode(byte[] bytes)
        {
            using var reader = new PacketReader(bytes);
            Length = reader.ReadUInt16();
            Type = (PacketType)reader.ReadUInt16();
            Timestamp = reader.ReadInt32(); // 4
            Padding = reader.ReadInt32(); // 8
            SenderIdentity = reader.ReadUInt32(); // 12
            TargetIdentity = reader.ReadUInt32(); // 16
            PosX = reader.ReadUInt16(); // 20
            PosY = reader.ReadUInt16(); // 22
            Action = (MsgInteractType)reader.ReadUInt32(); // 24
            Data = reader.ReadInt32(); // 28
            Command = reader.ReadInt32(); // 32
            Effect = (InteractionEffect)reader.ReadInt32(); // 36
            EffectValue = reader.ReadInt32(); // 40
        }

        /// <summary>
        ///     Encodes the packet structure defined by this message class into a byte packet
        ///     that can be sent to the client. Invoked automatically by the client's send
        ///     method. Encodes using byte ordering rules interoperable with the game client.
        /// </summary>
        /// <returns>Returns a byte packet of the encoded packet.</returns>
        public override byte[] Encode()
        {
            using var writer = new PacketWriter();
            writer.Write((ushort)PacketType.MsgInteract);
            writer.Write(Timestamp); // 4
            writer.Write(Padding); // 8
            writer.Write(SenderIdentity); // 12
            writer.Write(TargetIdentity); // 16
            writer.Write(PosX); // 20
            writer.Write(PosY); // 22 
            writer.Write((uint)Action); // 24
            writer.Write(Data); // 28
            writer.Write(Command); // 32
            writer.Write((int)Effect); // 36
            writer.Write(EffectValue); // 40
            return writer.ToArray();
        }

        public enum MsgInteractType : uint
        {
            None = 0,
            Steal = 1,
            Attack = 2,
            Heal = 3,
            Poison = 4,
            Assassinate = 5,
            Freeze = 6,
            Unfreeze = 7,
            Court = 8,
            Marry = 9,
            Divorce = 10,
            PresentMoney = 11,
            PresentItem = 12,
            SendFlowers = 13,
            Kill = 14,
            JoinGuild = 15,
            AcceptGuildMember = 16,
            KickoutGuildMember = 17,
            PresentPower = 18,
            QueryInfo = 19,
            RushAttack = 20,
            Unknown21 = 21,
            AbortMagic = 22,
            ReflectWeapon = 23,
            MagicAttack = 24,
            Shoot5065 = 25,
            ReflectMagic = 26,
            Dash = 27,
            Shoot = 28,
            Quarry = 29,
            Chop = 30,
            Hustle = 31,
            Soul = 32,
            AcceptMerchant = 33,
            IncreaseJar = 36,
            PresentEmoney = 39,
            InitialMerchant = 40,
            CancelMerchant = 41,
            MerchantProgress = 42,
            CounterKill = 43,
            CounterKillSwitch = 44,
            FatalStrike = 45,
            CoupleActionRequest = 46,
            CoupleActionConfirm,
            CoupleActionRefuse,
            CoupleActionStart,
            CoupleActionEnd,
            AnnounceAttack = 52,
            DashWhirl = 53,
            AzureDmg = 55
        }

        [Flags]
        public enum InteractionEffect : ushort
        {
            None = 0x0,
            Block = 0x1,          // 1
            Penetration = 0x2,    // 2
            CriticalStrike = 0x4, // 4
            Breakthrough = 0x2,   // 8
            MetalResist = 0x10,   // 16
            WoodResist = 0x20,    // 32
            WaterResist = 0x40,   // 64
            FireResist = 0x80,    // 128
            EarthResist = 0x100
        }

        public override async Task ProcessAsync(GameClient client)
        {
            Character user = client.Character;
            Role sender = RoleManager.GetRole(SenderIdentity);
            if (SenderIdentity == user.Identity && !user.IsAlive)
            {
                await user.SendAsync(StrDead);
                return;
            }

            Role target = sender?.Map.QueryAroundRole(sender, TargetIdentity);
            if (target == null
                && Action != MsgInteractType.MagicAttack
                && Action != MsgInteractType.CounterKillSwitch)
            {
                await user.Screen.RemoveAsync(TargetIdentity, true);
                return;
            }

            switch (Action)
            {
                case MsgInteractType.IncreaseJar:
                    {
                        Item targetItem = user?.UserPackage.GetItemByType(Item.TYPE_JAR);
                        if (targetItem == null)
                        {
                            return;
                        }
                        Command = (ushort)(targetItem.Data * 2);
                        await client.SendAsync(this);
                        break;
                    }

                case MsgInteractType.Court:
                    {
                        if (target == null || target.Identity == user.Identity)
                        {
                            return;
                        }

                        if (target is not Character targetUser)
                        {
                            return;
                        }

                        if (targetUser.MapIdentity != user.MapIdentity || user.GetDistance(targetUser) > Screen.VIEW_SIZE)
                        {
                            await user.SendAsync(StrTargetNotInRange);
                            return;
                        }

                        if (targetUser.MateIdentity != 0)
                        {
                            await user.SendAsync(StrMarriageTargetNotSingle);
                            return; // target is already married
                        }

                        if (user.MateIdentity != 0)
                        {
                            await user.SendAsync(StrMarriageYouNoSingle);
                            return; // you're already married
                        }

                        if (user.Gender == targetUser.Gender)
                        {
                            await user.SendAsync(StrMarriageErrSameGender);
                            return; // not allow same gender
                        }

                        targetUser.SetRequest(RequestType.Marriage, user.Identity);
                        await targetUser.SendRelationAsync(user);
                        await targetUser.SendAsync(this);
                        break;
                    }

                case MsgInteractType.Marry:
                    {
                        if (target == null || target.Identity == user.Identity)
                        {
                            return;
                        }

                        if (!(target is Character targetUser))
                        {
                            return;
                        }

                        if (user.QueryRequest(RequestType.Marriage) != targetUser.Identity)
                        {
                            await user.SendAsync(StrMarriageNotApply);
                            return;
                        }

                        user.PopRequest(RequestType.Marriage);

                        if (targetUser.MapIdentity != user.MapIdentity || user.GetDistance(targetUser) > Screen.VIEW_SIZE)
                        {
                            await user.SendAsync(StrTargetNotInRange);
                            return;
                        }

                        if (targetUser.MateIdentity != 0)
                        {
                            await user.SendAsync(StrMarriageTargetNotSingle);
                            return; // target is already married
                        }

                        if (user.MateIdentity != 0)
                        {
                            await user.SendAsync(StrMarriageYouNoSingle);
                            return; // you're already married
                        }

                        if (user.Gender == targetUser.Gender)
                        {
                            await user.SendAsync(StrMarriageErrSameGender);
                            return; // not allow same gender
                        }

                        user.MateIdentity = targetUser.Identity;
                        user.MateName = targetUser.Name;
                        await user.SaveAsync();
                        targetUser.MateIdentity = user.Identity;
                        targetUser.MateName = user.Name;
                        await targetUser.SaveAsync();

                        await user.SendAsync(new MsgName
                        {
                            Identity = user.Identity,
                            Strings = new List<string> { targetUser.Name },
                            Action = StringAction.Mate
                        });

                        await targetUser.SendAsync(new MsgName
                        {
                            Identity = targetUser.Identity,
                            Strings = new List<string> { user.Name },
                            Action = StringAction.Mate
                        });

                        await user.BroadcastRoomMsgAsync(new MsgItem
                        {
                            Action = MsgItem.ItemActionType.Fireworks,
                            Identity = user.Identity
                        }, false);

                        await targetUser.BroadcastRoomMsgAsync(new MsgItem
                        {
                            Action = MsgItem.ItemActionType.Fireworks,
                            Identity = targetUser.Identity
                        }, false);
                        await RoleManager.BroadcastWorldMsgAsync(string.Format(StrMarry, targetUser.Name, user.Name),
                                                            TalkChannel.Center, Color.Red);

                        await user.Achievements.AwardAchievementAsync(AchievementManager.AchievementType.Tietheknot);
                        await targetUser.Achievements.AwardAchievementAsync(AchievementManager.AchievementType.Tietheknot);
                        break;
                    }

                case MsgInteractType.InitialMerchant:
                case MsgInteractType.AcceptMerchant:
                    {
                        // ON ACCEPT: Sender = 1 Target = 1
                        if (SenderIdentity == 1 && TargetIdentity == 1)
                        {
                            await user.SetMerchantAsync();
                        }

                        break;
                    }

                case MsgInteractType.CancelMerchant:
                    {
                        await user.RemoveMerchantAsync();
                        break;
                    }

                case MsgInteractType.MerchantProgress:
                    {
                        break;
                    }
            }
        }
    }
}
