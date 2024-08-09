using Long.Database.Entities;
using Long.Kernel.Network.Game.Packets;
using Long.Kernel.States.Items;
using Long.Shared.Managers;
using static Long.Kernel.Network.Game.Packets.MsgAction;
using System.Drawing;
using Long.Kernel.Database;
using Long.Shared.Helpers;
using Long.Kernel.Managers;
using Long.Kernel.Modules.Systems.Trade;
using Long.Kernel.Modules.Systems.Booth;
using Long.Kernel.States.Storage;
using Microsoft.EntityFrameworkCore.Diagnostics;

namespace Long.Kernel.States.User
{
    public partial class Character
    {
        public const int SASH_SPACE_PRICE = 90;
        public const int MAXIMUM_SASH_SLOTS = 300;

        public UserPackage UserPackage { get; }

        public Item GetEquipment(Item.ItemPosition itemPosition) => UserPackage?.GetEquipment(itemPosition);

        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item Headgear => GetEquipment(Item.ItemPosition.Headwear);
        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item Necklace => GetEquipment(Item.ItemPosition.Necklace);
        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item Ring => GetEquipment(Item.ItemPosition.Ring);
        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item RightHand => GetEquipment(Item.ItemPosition.RightHand);
        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item LeftHand => GetEquipment(Item.ItemPosition.LeftHand);
        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item Armor => GetEquipment(Item.ItemPosition.Armor);
        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item Boots => GetEquipment(Item.ItemPosition.Boots);
        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item Garment => GetEquipment(Item.ItemPosition.Garment);
        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item Mount => GetEquipment(Item.ItemPosition.Mount);
        /// <summary>
        /// The specified EQUIPED item. Takes in consideration secondary equipment.
        /// </summary>
        public Item Wings => GetEquipment(Item.ItemPosition.Wing);

        #region Map Item

        private static readonly ILogger dropMoneyLogger =   Logger.CreateLogger("money_drop");
        private static readonly ILogger pickupMoneyLogger = Logger.CreateLogger("money_pickup");
        private static readonly ILogger dropItemLogger =    Logger.CreateLogger("item_drop");
        private static readonly ILogger pickupItemLogger =  Logger.CreateLogger("item_pickup");

        public async Task<bool> DropItemAsync(uint idItem, int x, int y)
        {
            var pos = new Point(x, y);
            if (!Map.FindDropItemCell(9, ref pos))
            {
                return false;
            }

            Item item = UserPackage.FindItemByIdentity(idItem);
            if (item == null)
            {
                return false;
            }

            //if (Booth?.QueryItem(idItem) != null)
            //{
            //    return false;
            //}

            //if (Trade != null)
            //{
            //    if (Trade.ContainsItem(idItem))
            //    {
            //        return false;
            //    }
            //}

            if (item.IsSuspicious())
            {
                return false;
            }

            if (item.IsDisappearWhenDropped())
            {
                return await UserPackage.RemoveFromInventoryAsync(item, UserPackage.RemovalType.Delete);
            }
            if (item.CanBeDropped())
            {
                await UserPackage.RemoveFromInventoryAsync(item, UserPackage.RemovalType.RemoveAndDisappear);
            }
            else
            {
                await SendAsync(string.Format(StrItemCannotDiscard, item.Name));
                return false;
            }

            dropItemLogger.Information($"{Name}({Identity}) drop item:[id={item.Identity}, type={item.Type}], dur={item.Durability}, max_dur={item.OriginalMaximumDurability}");

            var dropItemLog = new DbItemDrop
            {
                UserId = Identity,
                ItemId = item.Identity,
                ItemType = item.Type,
                MapId = MapIdentity,
                X = X,
                Y = Y,
                Addition = item.Plus,
                Gem1 = (byte)item.SocketOne,
                Gem2 = (byte)item.SocketTwo,
                ReduceDmg = item.ReduceDamage,
                AddLife = item.Enchantment,
                Data = item.Data,
                DropTime = UnixTimestamp.Now
            };
            await ServerDbContext.CreateAsync(dropItemLog);

            var mapItem = new MapItem((uint)IdentityManager.MapItem.GetNextIdentity, dropItemLog);
            if (await mapItem.CreateAsync(Map, pos, item, Identity))
            {
                item.Position = Item.ItemPosition.Floor;
                await mapItem.EnterMapAsync();
                await item.SaveAsync();
            }
            else
            {
                IdentityManager.MapItem.ReturnIdentity(mapItem.Identity);
                if (IsGm())
                {
                    await SendAsync("The MapItem object could not be created. Check Output log");
                }

                return false;
            }

            return true;
        }

        public async Task<bool> DropSilverAsync(uint amount)
        {
            if (amount > 10_000_000)
            {
                return false;
            }

            //if (Trade != null)
            //{
            //    return false;
            //}

            var pos = new Point(X, Y);
            if (!Map.FindDropItemCell(1, ref pos))
            {
                return false;
            }

            if (!await SpendMoneyAsync((int)amount, true))
            {
                return false;
            }

            dropMoneyLogger.Information($"{Identity},{Name},{amount}");

            var dropItemLog = new DbItemDrop
            {
                UserId = Identity,
                ItemId = 0,
                ItemType = amount,
                MapId = MapIdentity,
                X = X,
                Y = Y,
                Addition = 0,
                Gem1 = 0,
                Gem2 = 0,
                ReduceDmg = 0,
                AddLife = 0,
                Data = 0,
                DropTime = UnixTimestamp.Now
            };
            await ServerDbContext.CreateAsync(dropItemLog);

            var mapItem = new MapItem((uint)IdentityManager.MapItem.GetNextIdentity, dropItemLog);
            if (mapItem.CreateMoney(Map, pos, amount, 0u))
            {
                await mapItem.EnterMapAsync();
            }
            else
            {
                IdentityManager.MapItem.ReturnIdentity(mapItem.Identity);
                if (IsGm())
                {
                    await SendAsync("The DropSilver MapItem object could not be created. Check Output log");
                }

                return false;
            }

            return true;
        }

        public async Task<bool> PickMapItemAsync(uint idItem, bool priorizeSash = false)
        {
            var mapItem = Map.QueryAroundRole(this, idItem) as MapItem;
            if (mapItem == null)
            {
                return false;
            }

            if (GetDistance(mapItem) > 0)
            {
                await SendAsync(StrTargetNotInRange);
                return false;
            }

            if (mapItem.OwnerIdentity != Identity && mapItem.IsPrivate())
            {
                Character owner = RoleManager.GetUser(mapItem.OwnerIdentity);
                if (owner != null && !IsMate(owner))
                {
                    if (Team == null || !Team.IsMember(mapItem.OwnerIdentity) ||
                        mapItem.IsMoney() && !Team.MoneyEnable || mapItem.IsJewel() && !Team.JewelEnable ||
                        mapItem.IsItem() && !Team.ItemEnable)
                    {
                        await SendAsync(StrCannotPickupOtherItems);
                        return false;
                    }
                }
            }

            if (mapItem.IsMoney())
            {
                await AwardMoneyAsync((int)mapItem.Money);
                if (mapItem.Money > 1000)
                {
                    await SendAsync(new MsgAction
                    {
                        Identity = Identity,
                        Command = mapItem.Money,
                        ArgumentX = X,
                        ArgumentY = Y,
                        Action = ActionType.MapGold
                    });
                }
                await SendAsync(string.Format(StrPickupSilvers, mapItem.Money));

                pickupMoneyLogger.Information($"{Identity},{Name},{mapItem.Money},{MapIdentity},{Map.Name},{X},{Y}");
            }
            else
            {
                Item checkItem = mapItem.GetInfo();
                int itemCount = (int)(checkItem?.AccumulateNum ?? 1);
                if (priorizeSash)
                {
                    var storageSize = UserPackage.StorageSize(Identity, MsgPackage.StorageType.ChestPackage);
                    if (storageSize >= SashSlots)
                    {
                        priorizeSash = false;
                    }
                }

                if (!priorizeSash && !UserPackage.IsPackSpare(itemCount, mapItem.Itemtype))
                {
                    await SendAsync(StrYourBagIsFull);
                    return false;
                }

                Item item = await mapItem.GetInfoAsync(this);
                if (item.IsBound && item.OwnerIdentity != Identity)
                {
                    logger.Warning("Attempt to get bound item from the floor!");
                    return false;
                }

                if (item != null)
                {
                    if (item.IsSuperFlag())
                    {
                        await item.ClearSuperFlagAsync();
                    }

                    if (!priorizeSash)
                    {
                        await UserPackage.AddItemAsync(item);
                        await SendAsync(string.Format(StrPickupItem, item.Name));

                        if (VipLevel > 0 && UserPackage.MultiCheckItem(Item.TYPE_METEOR, Item.TYPE_METEOR, 10, true))
                        {
                            await UserPackage.MultiSpendItemAsync(Item.TYPE_METEOR, Item.TYPE_METEOR, 10, true);
                            await UserPackage.AwardItemAsync(Item.TYPE_METEOR_SCROLL);
                        }

                        if (VipLevel > 0 && UserPackage.MultiCheckItem(Item.TYPE_DRAGONBALL, Item.TYPE_DRAGONBALL, 10, true))
                        {
                            await UserPackage.MultiSpendItemAsync(Item.TYPE_DRAGONBALL, Item.TYPE_DRAGONBALL, 10, true);
                            await UserPackage.AwardItemAsync(Item.TYPE_DRAGONBALL_SCROLL);
                        }
                    }
                    else
                    {
                        await UserPackage.AddItemAsync(item);
                        await UserPackage.AddToStorageAsync(Identity, item, MsgPackage.StorageType.ChestPackage, true);
                        await SendAsync(string.Format(StrPickupItem, item.Name));
                    }

                    pickupItemLogger.Information($"{Identity},{Name},{mapItem.ItemIdentity},{mapItem.Itemtype},{MapIdentity},{Map.Name},{X},{Y}");
                }
            }

            var itemPickUpLog = new DbItemPickUp
            {
                PickUpTime = UnixTimestamp.Now,
                UserId = Identity,
                ItemId = mapItem.IsMoney() ? 0 : mapItem.ItemIdentity,
                ItemType = mapItem.IsMoney() ? mapItem.Money : mapItem.Itemtype
            };
            if (mapItem.ItemDrop != null)
            {
                itemPickUpLog.DropId = mapItem.ItemDrop.Id;
            }
            await ServerDbContext.CreateAsync(itemPickUpLog);

            await mapItem.LeaveMapAsync();
            return true;
        }

        #endregion

        #region Sash

        public uint SashSlots
        {
            get => user.ChestPackageSize;
            set => user.ChestPackageSize = value;
        }

        public async Task SetSashSlotAmountAsync(int count)
        {
            SashSlots = (uint)Math.Min(MAXIMUM_SASH_SLOTS, count);
            await SynchroAttributesAsync(ClientUpdateType.CurrentSashSlots, SashSlots);
            await SaveAsync();
        }

        public async Task AddSashSpaceAsync(int count)
        {
            if (SashSlots >= MAXIMUM_SASH_SLOTS)
            {
                await SendAsync(StrQkdMax, TalkChannel.TopLeft, Color.White);
                return;
            }

            if (SashSlots + count > MAXIMUM_SASH_SLOTS)
            {
                await SendAsync(StrQkdExceedMax, TalkChannel.TopLeft, Color.White);
                return;
            }

            int price = count * SASH_SPACE_PRICE;
            if (!await SpendBoundConquerPointsAsync(EmoneyOperationType.ChestPackage, price, true))
            {
                return;
            }

            SashSlots = (uint)Math.Min(MAXIMUM_SASH_SLOTS, Math.Max(0, SashSlots + count));
            await SynchroAttributesAsync(ClientUpdateType.CurrentSashSlots, SashSlots);
            await SaveAsync();
        }

        public async Task OpenSashSlotsAsync(Item sash)
        {
            int amount = (int)(sash.Type % 10);
            if (amount == 9)
            {
                amount += 3;
            }

            if (UserPackage.StorageSize(sash.Identity, MsgPackage.StorageType.Chest) > 0)
            {
                await SendAsync(StrQkdNeedEmpty, TalkChannel.TopLeft, Color.White);
                return;
            }

            if (SashSlots >= MAXIMUM_SASH_SLOTS)
            {
                await SendAsync(StrQkdMax, TalkChannel.TopLeft, Color.White);
                return;
            }

            SashSlots = (uint)Math.Min(MAXIMUM_SASH_SLOTS, Math.Max(0, SashSlots + amount));
            await SynchroAttributesAsync(ClientUpdateType.CurrentSashSlots, SashSlots);
            await UserPackage.SpendItemAsync(sash);
            await SaveAsync();
        }

        #endregion

        #region Secondary Equipment

        private readonly TimeOut secondaryEquipmentToggleTimer = new(1);

        public async Task<bool> ToggleSecondaryEquipmentAsync()
        {
            if (!secondaryEquipmentToggleTimer.IsTimeOut())
            {
                return false;
            }

            if (QueryStatus(Status.StatusSet.PATH_OF_SHADOW) != null)
            {
                return false;
            }

            if (QueryStatus(Status.StatusSet.FLY) != null)
            {
                return false;
            }

            if (!UserPackage.IsSecondaryEquipmentUser && !UserPackage.HasSecondaryEquipment)
            {
                return false;
            }

            UserPackage.IsSecondaryEquipmentUser = !UserPackage.IsSecondaryEquipmentUser;
            secondaryEquipmentToggleTimer.Update();

            await UserPackage.SyncEquipmentAsync();
            await SendAsync(new MsgPlayerAttribInfo(this));
            await BroadcastRoomMsgAsync(new MsgPlayer(this), false);
            return true;
        }

        #endregion

        #region Trade

        public ITrade Trade { get; set; }
        public IBooth Booth { get; set; }

        #endregion

        #region Wardrobe

        private uint osWingId;
        private uint osTitleId;
        private uint osTitleScore;

        public CoatStorage CoatStorage { get; }
        public TitleStorage TitleStorage { get; }

        public uint WingId
        {
            get
            {
                if (IsOSUser())
                {
                    return osWingId;
                }
                return TitleStorage?.WingId ?? 0;
            }
            set
            {
                if (IsOSUser())
                {
                    osWingId = value;
                }
            }
        }

        public uint TitleId
        {
            get
            {
                if (IsOSUser())
                {
                    return osTitleId;
                }
                return TitleStorage?.TitleId ?? 0;
            }
            set
            {
                if (IsOSUser())
                {
                    osTitleId = value;
                }
            }
        }

        public uint TitleScore
        {
            get
            {
                if (IsOSUser())
                {
                    return osTitleScore;
                }
                return TitleStorage?.Score ?? 0;
            }
            set
            {
                if (IsOSUser())
                {
                    osTitleScore = value;
                }
            }
        }
        
        #endregion
    }
}
