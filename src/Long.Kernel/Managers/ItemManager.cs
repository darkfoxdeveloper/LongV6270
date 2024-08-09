using Long.Database.Entities;
using Long.Database.Entities.Long.Database.Entities;
using Long.Kernel.Database.Repositories;
using Long.Kernel.States.Items;
using Long.Kernel.States.Items.Status;
using System.Collections.Concurrent;

namespace Long.Kernel.Managers
{
    public class ItemManager
    {
        private static readonly ILogger logger = Log.ForContext<ItemManager>();

        private static ConcurrentDictionary<uint, DbItemtype> itemtypes = new();
        private static ConcurrentDictionary<ulong, DbItemAddition> itemAdditions = new();
        private static ConcurrentDictionary<uint, DbItemLimit> itemLimits = new();
        private static List<uint> validRefineryIds = new();

        private static ConcurrentDictionary<int, QuenchInfoData> refineryTypes { get; } = new(new Dictionary<int, QuenchInfoData>
        {
            { 301, new QuenchInfoData { Attribute1 = ItemStatusAttribute.Intensification } },
            { 302, new QuenchInfoData { Attribute1 = ItemStatusAttribute.FinalDamage } },
            { 303, new QuenchInfoData { Attribute1 = ItemStatusAttribute.FinalAttack } },
            { 304, new QuenchInfoData { Attribute1 = ItemStatusAttribute.Detoxication } },
            { 305, new QuenchInfoData { Attribute1 = ItemStatusAttribute.FinalMagicAttack } },
            { 306, new QuenchInfoData { Attribute1 = ItemStatusAttribute.FinalMagicDefense } },
            { 307, new QuenchInfoData { Attribute1 = ItemStatusAttribute.CriticalStrike } },
            { 308, new QuenchInfoData { Attribute1 = ItemStatusAttribute.SkillCriticalStrike } },
            { 309, new QuenchInfoData { Attribute1 = ItemStatusAttribute.Immunity } },
            { 310, new QuenchInfoData { Attribute1 = ItemStatusAttribute.Breakthrough } },
            { 311, new QuenchInfoData { Attribute1 = ItemStatusAttribute.Counteraction } },
            { 312, new QuenchInfoData { Attribute1 = ItemStatusAttribute.Penetration } },
            { 313, new QuenchInfoData { Attribute1 = ItemStatusAttribute.Block } },
            { 314, new QuenchInfoData { Attribute1 = ItemStatusAttribute.MetalResist } },
            { 315, new QuenchInfoData { Attribute1 = ItemStatusAttribute.WoodResist } },
            { 316, new QuenchInfoData { Attribute1 = ItemStatusAttribute.WaterResist } },
            { 317, new QuenchInfoData { Attribute1 = ItemStatusAttribute.FireResist } },
            { 318, new QuenchInfoData { Attribute1 = ItemStatusAttribute.WoodResist } },
            { 319, new QuenchInfoData { Attribute1 = ItemStatusAttribute.MagicDefense } }
        });

        public static async Task InitializeAsync()
        {
            logger.Information("Starting Item Manager");

            foreach (var item in ItemtypeRepository.Get())
            {
                itemtypes.TryAdd(item.Type, item);
            }

            foreach (var addition in ItemAdditionRepository.Get())
            {
                itemAdditions.TryAdd(AdditionKey(addition.TypeId, addition.Level), addition);
            }

            foreach (var limit in await ItemRepository.GetLimitsAsync())
            {
                itemLimits.TryAdd(limit.Type, limit);
            }

            using StreamReader quenchReader = new(Path.Combine(Environment.CurrentDirectory, "ini", "ItemQuench.ini"));
            string quenchLine;
            while ((quenchLine = await quenchReader.ReadLineAsync()) != null)
            {
                if (uint.TryParse(quenchLine, out uint quenchId) && validRefineryIds.All(x => x != quenchId))
                {
                    validRefineryIds.Add(quenchId);
                }
            }
        }

        public static bool IsMeteorLevelUpgrade(Item item)
        {
            if (!itemLimits.TryGetValue((uint)item.GetItemSubType(), out var itemLimit))
            {
                return false;
            }
            return item.GetLevel() + 1 < itemLimit.LimitLevel;
        }

        public static List<DbItemtype> GetByRange(int mobLevel, int tolerationMin, int tolerationMax, int maxLevel = 120)
        {
            return itemtypes.Values.Where(x =>
                x.ReqLevel >= mobLevel - tolerationMin && x.ReqLevel <= mobLevel + tolerationMax &&
                x.ReqLevel <= maxLevel).ToList();
        }

        public static DbItemtype GetItemtype(uint type)
        {
            return itemtypes.TryGetValue(type, out var item) ? item : null;
        }

        public static DbItemAddition GetItemAddition(uint type, byte level)
        {
            return itemAdditions.TryGetValue(AdditionKey(type, level), out var item) ? item : null;
        }

        public static bool IsValidRefinery(uint id)
        {
            return validRefineryIds.Any(x => x == id);
        }

        public static bool GetQuenchInfoData(int quenchType, out QuenchInfoData data)
        {
            return refineryTypes.TryGetValue(quenchType, out data);
        }

        private static ulong AdditionKey(uint type, byte level)
        {
            uint key = type;
            Item.ItemSort sort = Item.GetItemSort(type);
            if (sort == Item.ItemSort.ItemsortWeaponSingleHand && Item.GetItemSubType(type) != 421)
            {
                key = type / 100000 * 100000 + type % 1000 + 44000 - type % 10;
            }
            else if (sort == Item.ItemSort.ItemsortWeaponDoubleHand && !Item.IsBow(type))
            {
                key = type / 100000 * 100000 + type % 1000 + 55000 - type % 10;
            }
            else
            {
                key = type / 1000 * 1000 + (type % 1000 - type % 10);
            }

            return (key + ((ulong)level << 32));
        }

        public struct QuenchInfoData
        {
            public ItemStatusAttribute Attribute1 { get; init; }
            public ItemStatusAttribute Attribute2 { get; init; }
        }
    }
}
