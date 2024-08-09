using Long.Database.Entities;

namespace Long.Kernel.States
{
    public class Monster : Role
    {
        private readonly DbMonstertype monsterType;

        private readonly uint generatorId;

        public Monster(DbMonstertype monsterType,
            uint identity,
            uint generatorId,
            uint ownerId)
        {
            this.monsterType = monsterType;
            this.generatorId = generatorId;

            HasGenerator = this.generatorId != 0;

            Identity = identity;
            OwnerIdentity = ownerId;
        }

        public uint Type => monsterType?.Id ?? 0;
        public byte SpeciesType => monsterType?.SpeciesType ?? 0;
        public uint ActionId => (uint)(monsterType?.Action ?? 0);

        public override string Name
        {
            get => monsterType?.Name ?? "None";
            protected set => monsterType.Name = value;
        }

        public uint GeneratorId => generatorId;
        public virtual bool HasGenerator { get; protected set; } = false;

        #region Attributes

        public override byte Level
        {
            get => (byte)(monsterType?.Level ?? 0);
            set => monsterType.Level = value;
        }
        public override uint MaxLife => (uint)(monsterType?.Life ?? 1);

        public override int BattlePower => monsterType?.ExtraBattlelev ?? 0;

        public override int MinAttack => monsterType?.AttackMin ?? 0;

        public override int MaxAttack => monsterType?.AttackMax ?? 0;

        public override int ExtraDamage => monsterType?.ExtraDamage ?? 0;

        public override int MagicAttack => monsterType?.AttackMax ?? 0;

        public override int Defense => monsterType?.Defence ?? 0;

        public override int MagicDefense => monsterType?.MagicDef ?? 0;

        public override int Dodge => (int)(monsterType?.Dodge ?? 0);

        public override int AttackSpeed => monsterType?.AttackSpeed ?? 1000;

        public override int Accuracy => (int)(monsterType?.Dexterity ?? 0);

        public uint AttackUser => monsterType?.AttackUser ?? 0;

        public int ViewRange => monsterType?.ViewRange ?? 1;

        public override int Counteraction => monsterType?.StableDefence ?? 0;
        public override int CriticalStrike => monsterType?.CriticalRate ?? 0;
        public override int SkillCriticalStrike => monsterType?.MagicCriticalRate ?? 0;
        public override int Immunity => monsterType?.AntiCriticalRate ?? 0;
        public override int AddFinalAttack => monsterType?.FinalDmgAdd ?? 0;
        public override int AddFinalDefense => monsterType?.FinalDmgReduce ?? 0;
        public override int AddFinalMAttack => monsterType?.FinalDmgAddMgc ?? 0;
        public override int AddFinalMDefense => monsterType?.FinalDmgReduceMgc ?? 0;
        public int Defense2 => (int)(monsterType?.Defence2 ?? 0);

        #endregion

        #region Checks

        public override bool IsEvil()
        {
            return (AttackUser & ATKUSER_RIGHTEOUS) == 0 || base.IsEvil();
        }

        public override bool IsFarWeapon()
        {
            return monsterType.AttackRange > SHORTWEAPON_RANGE_LIMIT;
        }

        public bool IsPassive()
        {
            return (AttackUser & ATKUSER_PASSIVE) != 0;
        }

        public bool IsLockUser()
        {
            return (AttackUser & ATKUSER_LOCKUSER) != 0;
        }

        public bool IsRighteous()
        {
            return (AttackUser & ATKUSER_RIGHTEOUS) != 0;
        }

        public bool IsGuard()
        {
            return (AttackUser & ATKUSER_GUARD) != 0;
        }

        public bool IsPkKiller()
        {
            return (AttackUser & ATKUSER_PPKER) != 0;
        }

        public bool IsWalkEnable()
        {
            return (AttackUser & ATKUSER_FIXED) == 0;
        }

        public bool IsJumpEnable()
        {
            return (AttackUser & ATKUSER_JUMP) != 0;
        }

        public bool IsFastBack()
        {
            return (AttackUser & ATKUSER_FASTBACK) != 0;
        }

        public bool IsLockOne()
        {
            return (AttackUser & ATKUSER_LOCKONE) != 0;
        }

        public bool IsAddLife()
        {
            return (AttackUser & ATKUSER_ADDLIFE) != 0;
        }

        public bool IsEvilKiller()
        {
            return (AttackUser & ATKUSER_EVIL_KILLER) != 0;
        }

        public bool IsDormancyEnable()
        {
            return (AttackUser & ATKUSER_LOCKUSER) == 0;
        }

        public bool IsEscapeEnable()
        {
            return (AttackUser & ATKUSER_NOESCAPE) == 0;
        }

        public bool IsEquality()
        {
            return (AttackUser & ATKUSER_EQUALITY) != 0;
        }

        #endregion

        public const int ATKUSER_LEAVEONLY = 0,        // Ö»»áÌÓÅÜ
                         ATKUSER_PASSIVE = 0x01,       // ±»¶¯¹¥»÷
                         ATKUSER_ACTIVE = 0x02,        // Ö÷¶¯¹¥»÷
                         ATKUSER_RIGHTEOUS = 0x04,     // ÕýÒåµÄ(ÎÀ±ø»òÍæ¼ÒÕÙ»½ºÍ¿ØÖÆµÄ¹ÖÎï)
                         ATKUSER_GUARD = 0x08,         // ÎÀ±ø(ÎÞÊÂ»ØÔ­Î»ÖÃ)
                         ATKUSER_PPKER = 0x10,         // ×·É±ºÚÃû 
                         ATKUSER_JUMP = 0x20,          // »áÌø
                         ATKUSER_FIXED = 0x40,         // ²»»á¶¯µÄ
                         ATKUSER_FASTBACK = 0x0080,    // ËÙ¹é
                         ATKUSER_LOCKUSER = 0x0100,    // Ëø¶¨¹¥»÷Ö¸¶¨Íæ¼Ò£¬Íæ¼ÒÀë¿ª×Ô¶¯ÏûÊ§ 
                         ATKUSER_LOCKONE = 0x0200,     // Ëø¶¨¹¥»÷Ê×ÏÈ¹¥»÷×Ô¼ºµÄÍæ¼Ò
                         ATKUSER_ADDLIFE = 0x0400,     // ×Ô¶¯¼ÓÑª
                         ATKUSER_EVIL_KILLER = 0x0800, // °×ÃûÉ±ÊÖ
                         ATKUSER_WING = 0x1000,        // ·ÉÐÐ×´Ì¬
                         ATKUSER_NEUTRAL = 0x2000,     // ÖÐÁ¢
                         ATKUSER_ROAR = 0x4000,        // ³öÉúÊ±È«µØÍ¼Å­ºð
                         ATKUSER_NOESCAPE = 0x8000,    // ²»»áÌÓÅÜ
                         ATKUSER_EQUALITY = 0x10000;   // ²»ÃêÊÓ

        public const int SHORTWEAPON_RANGE_LIMIT = 2; // ½üÉíÎäÆ÷µÄ×î´ó¹¥»÷·¶Î§(ÒÔ´Ë·¶Î§ÊÇ·ñ¹­¼ýÊÖ)
        public const int NPC_REST_TIME = 7;
    }
}
