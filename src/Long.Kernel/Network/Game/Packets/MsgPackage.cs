using Long.Kernel.Managers;
using Long.Kernel.States.Items;
using Long.Kernel.States.Npcs;
using Long.Kernel.States.User;
using Long.Kernel.States.World;
using Long.Network.Packets;

namespace Long.Kernel.Network.Game.Packets
{
    public sealed class MsgPackage : MsgBase<GameClient>
    {
        public MsgPackage()
        {
        }

        public MsgPackage(Item item, WarehouseMode action, StorageType mode)
        {
            Identity = item.OwnerIdentity;
            Action = action;
            Mode = mode;
            if (action == WarehouseMode.CheckOut)
            {
                Param = item.Identity;
            }
            else
            {
                Items = new List<WarehouseItem>
                {
                    new WarehouseItem
                    {
                        Identity = item.Identity,
                        Type = item.Type,
                        SocketOne = (byte)item.SocketOne,
                        SocketTwo = (byte)item.SocketTwo,
                        Blessing = (byte) item.Blessing,
                        Enchantment = item.Enchantment,
                        Magic1 = (byte)item.Effect,
                        Magic3 = item.Plus,
                        Color = (byte)item.Color,
                        Locked = item.IsLocked(),
                        Bound = item.IsBound,
                        Accumulate = (int)item.AccumulateNum,
                        CompositionProgress = item.CompositionProgress,
                        Inscribed = item.SyndicateIdentity != 0 ? 1 : 0,
                        SocketProgress = item.SocketProgress,
                        Suspicious = item.IsSuspicious(),
                        Durability = item.Durability,
                        MaximumDurability = item.MaximumDurability,
                        ActivationTime = item.RemainingSeconds > 0 ? 0 : item.SaveTime,
                        RemainingTime = item.RemainingSeconds
                    }
                };
            }
        }

        public List<WarehouseItem> Items = new();
        public uint Identity { get; set; }
        public WarehouseMode Action { get; set; }
        public StorageType Mode { get; set; }
        public ushort Unknown { get; set; }
        public int Data { get; set; }
        public uint Param { get; set; }

        public override void Decode(byte[] bytes)
        {
            using var reader = new PacketReader(bytes);
            Length = reader.ReadUInt16();
            Type = (PacketType)reader.ReadUInt16();
            Identity = reader.ReadUInt32(); // 4
            reader.ReadInt32();
            Action = (WarehouseMode)reader.ReadByte(); // 12
            Mode = (StorageType)reader.ReadByte(); // 13
            Unknown = reader.ReadUInt16(); // 14
            Data = reader.ReadInt32(); // 16
            Param = reader.ReadUInt32(); // 20
        }

        public override byte[] Encode()
        {
            using var writer = new PacketWriter();
            writer.Write((ushort)PacketType.MsgPackage);
            writer.Write(Identity); // 4
            writer.Write(0); // 8
            writer.Write((byte)Action); // 12
            writer.Write((byte)Mode); // 13
            writer.Write((ushort)0); // 14
            writer.Write(Data); // 16
            writer.Write(Param); // 20
            if (Items.Count > 0)
            {
                writer.Write(Items.Count); // 24
                foreach (WarehouseItem item in Items)
                {
                    writer.Write(item.Identity);                // 0 28
                    writer.Write(item.Type);                    // 4 32
                    writer.Write(item.Ident);                   // 8 36
                    writer.Write(item.SocketOne);               // 9 37
                    writer.Write(item.SocketTwo);               // 10 38
                    writer.Write((int)item.Magic1);             // 11 39
                    writer.Write((ushort)item.Magic2);          // 15 43
                    writer.Write(item.Magic3);                  // 17 45
                    writer.Write((byte)item.Blessing);          // 18 46
                    writer.Write(item.Bound);                   // 19 47
                    writer.Write(item.Enchantment);             // 20 48
                    writer.Write(item.AntiMonster);             // 22 50
                    writer.Write(item.Suspicious);              // 24 52
                    writer.Write((byte)0);                      // 25 53
                    writer.Write(item.Locked);                  // 26 54
                    writer.Write(item.Color);                   // 27 55
                    writer.Write(item.SocketProgress);          // 28 56
                    writer.Write(item.CompositionProgress);     // 32 60
                    writer.Write(item.Inscribed);               // 36 64 
                    writer.Write(item.RemainingTime);           // 40 68 
                    writer.Write(item.ActivationTime);          // 44 72
                    writer.Write(item.Accumulate);              // 48 76
                    writer.Write(item.Mode);                    // Mode? 52 80
                    writer.Write((int)item.PerfectionRank);          // *((_DWORD *)v13 + 90) = *(_DWORD *)(v15 + v8 + 84);
                    writer.Write(item.PerfectionLevel);         // CItem::SetRefineExp(v13, *(_DWORD *)(*((_DWORD *)this + 257) + v8 + 88));
                    writer.Write(item.PerfectionProgress);      // CItem::SetRefineOwner(v13, *(_DWORD *)(*((_DWORD *)this + 257) + v8 + 92));
                    // writer.Write(item.PerfectionOwnerId);       // 
                    writer.Write(item.PerfectionOwnerName ??  string.Empty, 16);        // CItem::SetRefineOwnerName(v13, (const char *)(*((_DWORD *)this + 257) + v8 + 96));
                    writer.Write(item.PerfectionOwnerSignature ?? string.Empty, 32);    // CItem::SetRefineComment(v13, (const char *)(*((_DWORD *)this + 257) + v8 + 112));
                }
            }
            else
            {
                writer.Write(Param);
            }

            return writer.ToArray();
        }

        public struct WarehouseItem
        {
            public uint Identity;
            public uint Type;
            public byte Ident;
            public byte SocketOne;
            public byte SocketTwo;
            public byte Magic1;
            public byte Magic2;
            public byte Magic3;
            public ushort Blessing;
            public bool Bound;
            public ushort Enchantment;
            public ushort AntiMonster;
            public bool Suspicious;
            public bool Locked;
            public byte Color;
            public uint SocketProgress;
            public uint CompositionProgress;
            public int Inscribed;
            public int RemainingTime;
            public int ActivationTime;
            public int Accumulate;
            public ushort Mode;
            public ushort Durability;
            public ushort MaximumDurability;
            public ushort PerfectionRank;
            public uint PerfectionLevel;
            public uint PerfectionProgress;
            public uint PerfectionOwnerId;
            public string PerfectionOwnerName;
            public string PerfectionOwnerSignature;
        }

        public enum StorageType : byte
        {
            None = 0,
            Storage = 10,
            Trunk = 20,
            Chest = 30,
            ChestPackage = 40
        }

        public enum WarehouseMode : byte
        {
            Query = 0,
            CheckIn,
            CheckOut
        }

        public override async Task ProcessAsync(GameClient client)
        {
            Character user = client.Character;
            if (!user.IsUnlocked())
            {
                await user.SendSecondaryPasswordInterfaceAsync();
                return;
            }

            BaseNpc npc = null;
            if (Mode == StorageType.Storage || Mode == StorageType.Trunk)
            {
                npc = RoleManager.GetRole(Identity) as BaseNpc;
                if (npc == null)
                {
                    if (user.IsPm())
                    {
                        await user.SendAsync($"Could not find Storage NPC, {Identity}");
                    }

                    return;
                }

                if (user.MapIdentity != npc.MapIdentity
                    || user.GetDistance(npc) > Screen.VIEW_SIZE)
                {
                    switch (npc.MapIdentity)
                    {
                        case 1002: // twin
                        case 1036: // market
                            if (user.VipLevel < 1)
                            {
                                return;
                            }

                            break;
                        case 1000: // desert
                            if (user.VipLevel < 2)
                            {
                                return;
                            }

                            break;
                        case 1020: // canyon
                            if (user.VipLevel < 3)
                            {
                                return;
                            }

                            break;
                        case 1015: // bird
                            if (user.VipLevel < 4)
                            {
                                return;
                            }

                            break;
                        case 1011: // phoenix
                            if (user.VipLevel < 5)
                            {
                                return;
                            }

                            break;
                        case 1213: // stone
                            if (user.VipLevel < 6)
                            {
                                return;
                            }

                            break;
                    }
                }
            }
            else if (Mode == StorageType.Chest && Action == WarehouseMode.CheckIn)
            {
                return;
            }

            if (Action == WarehouseMode.Query)
            {
                var storageItems = user.UserPackage.GetStorageItems(Identity, Mode);
                foreach (var expiredItem in storageItems.Values.Where(x => x.HasExpired()).ToList())
                {
                    storageItems.TryRemove(expiredItem.Identity, out _);
                    await expiredItem.DeleteAsync();
                }

                foreach (Item item in storageItems.Values)
                {
                    Items.Add(new WarehouseItem
                    {
                        Identity = item.Identity,
                        Type = item.Type,
                        SocketOne = (byte)item.SocketOne,
                        SocketTwo = (byte)item.SocketTwo,
                        Blessing = (byte)item.Blessing,
                        Enchantment = item.Enchantment,
                        Magic1 = (byte)item.Effect,
                        Magic3 = item.Plus,
                        Locked = item.IsLocked(),
                        Color = (byte)item.Color,
                        Suspicious = false,
                        CompositionProgress = item.CompositionProgress,
                        SocketProgress = item.SocketProgress,
                        Bound = item.IsBound,
                        Inscribed = item.SyndicateIdentity != 0 ? 1 : 0,
                        Accumulate = (int)item.AccumulateNum,
                        ActivationTime = item.RemainingSeconds > 0 ? 0 : item.SaveTime,
                        RemainingTime = item.RemainingSeconds,
                        Durability = item.Durability,
                        MaximumDurability = item.MaximumDurability
                    });

                    await user.SendAsync(this);
                    await item.TryUnlockAsync();
                    if (item.ItemStatus != null)
                    {
                        await item.ItemStatus.SendToAsync(user);
                    }
                    Items.Clear();
                }
            }
            else if (Action == WarehouseMode.CheckIn)
            {
                Item storeItem = user.UserPackage.GetInventory(Param);
                if (storeItem == null)
                {
                    await user.SendAsync(StrItemNotFound);
                    return;
                }

                if (!storeItem.CanBeStored())
                {
                    await user.SendAsync(StrItemCannotBeStored);
                    return;
                }

                if (storeItem.HasExpired())
                {
                    await storeItem.ExpireAsync();
                    return;
                }

                //if (Mode == StorageType.Storage && npc?.IsStorageNpc() != true)
                //{
                //    return;
                //}

                //if (Mode == StorageType.Trunk && npc?.Type != BaseNpc.TRUNCK_NPC)
                //{
                //    return;
                //}

                await user.UserPackage.AddToStorageAsync(Identity, storeItem, Mode, true);
            }
            else if (Action == WarehouseMode.CheckOut)
            {
                await user.UserPackage.GetFromStorageAsync(Identity, Param, Mode, true);
            }
        }
    }
}
