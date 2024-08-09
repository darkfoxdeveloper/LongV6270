using Long.Database.Entities;
using Long.Kernel.Managers;
using Long.Kernel.Network.Game.Packets;
using Long.Kernel.Scripting.Action;
using Long.Kernel.States.Items;
using Long.Kernel.States.Status;
using static Long.Kernel.Network.Game.Packets.MsgAction;
using System.Drawing;
using Long.Kernel.Database.Repositories;
using Long.Kernel.Modules.Systems.AstProf;

namespace Long.Kernel.States.User
{
    public partial class Character
    {
        #region Attributes

        public override int BattlePower
        {
            get
            {
                int result = Level + Math.Min((byte)2, Metempsychosis) * 5;
                if (Nobility != null)
                {
                    result += (int)NobilityRank;
                }
                result += TotemBattlePower;
                result += Math.Max(FamilyBattlePower, Guide?.Tutor?.SharedBattlePower ?? 0);
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.BattlePower ?? 0;
                }
                return result;
            }
        }

        public int PureBattlePower
        {
            get
            {
                int result = Level + Math.Min((byte)2, Metempsychosis) * 5;
                if (Nobility != null)
                {
                    result += (int)NobilityRank;
                }
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.BattlePower ?? 0;
                }
                return result;
            }
        }

        public override int MinAttack
        {
            get
            {
                if (Transformation != null)
                {
                    return Transformation.MinAttack;
                }

                int result = Strength;
#if DEBUG_MIN_ATTACK
                logger.Debug("=== Begin MinAttack ===");
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    if (pos == Item.ItemPosition.AttackTalisman || pos == Item.ItemPosition.DefenceTalisman)
                    {
                        continue;
                    }

                    int minAttack = (UserPackage.GetEquipment(pos)?.MinAttack ?? 0);
                    if (pos == Item.ItemPosition.LeftHand)
                    {
                        result +=  minAttack / 2;
                    }
                    else
                    {
                        result += minAttack;
                    }
                    logger.Debug("MinAttack: {0} {1} + {2}", result, pos, minAttack);
                }
                IStatus status = QueryStatus(StatusSet.BUFF_PATTACK + 1);
                if (status != null)
                {
                    result += status.Power;
                    logger.Debug("MinAttack: {0}", result);
                }
                result += AstProf?.GetPower(IAstProf.AstProfType.Performer) ?? 0;
                logger.Debug("MinAttack: {0}", result);
                result += Fate?.Attack ?? 0;
                logger.Debug("MinAttack: {0}", result);
                result += JiangHu?.Attack ?? 0;
                logger.Debug("MinAttack: {0}", result);
                result += InnerStrength?.Attack ?? 0;
                logger.Debug("MinAttack: {0}", result);
                logger.Debug("=== End MinAttack ===");
#else
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    if (pos == Item.ItemPosition.AttackTalisman || pos == Item.ItemPosition.DefenceTalisman)
                    {
                        continue;
                    }

                    int minAttack = (UserPackage.GetEquipment(pos)?.MinAttack ?? 0);
                    if (pos == Item.ItemPosition.LeftHand)
                    {
                        result += minAttack / 2;
                    }
                    else
                    {
                        result += minAttack;
                    }
                }
                IStatus status = QueryStatus(StatusSet.BUFF_PATTACK + 1);
                if (status != null)
                {
                    result += status.Power;
                }
                result += CoatStorage.Attack;
                result += AstProf?.GetPower(IAstProf.AstProfType.Performer) ?? 0;
                result += Fate?.Attack ?? 0;
                result += JiangHu?.Attack ?? 0;
                result += InnerStrength?.Attack ?? 0;
#endif
                return result;
            }
        }

        public override int MaxAttack
        {
            get
            {
                if (Transformation != null)
                {
                    return Transformation.MaxAttack;
                }

                int result = Strength;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    if (pos == Item.ItemPosition.AttackTalisman || pos == Item.ItemPosition.DefenceTalisman)
                    {
                        continue;
                    }

                    if (pos == Item.ItemPosition.LeftHand)
                    {
                        result += (UserPackage.GetEquipment(pos)?.MaxAttack ?? 0) / 2;
                    }
                    else
                    {
                        result += UserPackage.GetEquipment(pos)?.MaxAttack ?? 0;
                    }
                }
                IStatus status = QueryStatus(StatusSet.BUFF_PATTACK + 1);
                if (status != null)
                {
                    result += status.Power;
                }
                result += CoatStorage.Attack;
                result += AstProf?.GetPower(IAstProf.AstProfType.Performer) ?? 0;
                result += Fate?.Attack ?? 0;
                result += JiangHu?.Attack ?? 0;
                result += InnerStrength?.Attack ?? 0;
                return result;
            }
        }

        public override int MagicAttack
        {
            get
            {
                if (Transformation != null)
                {
                    return Transformation.MaxAttack;
                }

                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    if (pos == Item.ItemPosition.AttackTalisman || pos == Item.ItemPosition.DefenceTalisman)
                    {
                        continue;
                    }

                    result += UserPackage.GetEquipment(pos)?.MagicAttack ?? 0;
                }
                IStatus status = QueryStatus(StatusSet.BUFF_MATTACK + 1);
                if (status != null)
                {
                    result += status.Power;
                }
                result += CoatStorage.MagicAttack;
                result += AstProf?.GetPower(IAstProf.AstProfType.Performer) ?? 0;
                result += Fate?.MagicAttack ?? 0;
                result += JiangHu?.MagicAttack ?? 0;
                result += InnerStrength?.MagicAttack ?? 0;
                return result;
            }
        }

        public override int Defense
        {
            get
            {
                if (Transformation != null)
                {
                    return Transformation.Defense;
                }

                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    if (pos == Item.ItemPosition.AttackTalisman || pos == Item.ItemPosition.DefenceTalisman)
                    {
                        continue;
                    }

                    result += UserPackage.GetEquipment(pos)?.Defense ?? 0;
                }
                result += CoatStorage.Defense;
                result += JiangHu?.Defense ?? 0;
                result += InnerStrength?.Defense ?? 0;
                return result;
            }
        }

        public override int MagicDefense
        {
            get
            {
                if (Transformation != null)
                {
                    return Transformation.MagicDefense;
                }

                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    if (pos == Item.ItemPosition.AttackTalisman || pos == Item.ItemPosition.DefenceTalisman)
                    {
                        continue;
                    }

                    result += UserPackage.GetEquipment(pos)?.MagicDefense ?? 0;
                }
                result += CoatStorage.MagicDefense;
                result += Fate?.MagicDefense ?? 0;
                result += JiangHu?.MagicDefense ?? 0;
                result += InnerStrength?.MagicDefense ?? 0;
                return result;
            }
        }

        public override int MagicDefenseBonus
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.MagicDefenseBonus ?? 0;
                }
                return result;
            }
        }

        public override int Dodge
        {
            get
            {
                if (Transformation != null)
                {
                    return (int)Transformation.Dodge;
                }

                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Dodge ?? 0;
                }
                return result;
            }
        }

        public override int Blessing
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Blessing ?? 0;
                }
                return result;
            }
        }

        public override int AddFinalAttack
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin;
                    pos <= Item.ItemPosition.EquipmentEnd;
                    pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.AddFinalDamage ?? 0;
                }

                result += CoatStorage.FinalDamage;
                result += Fate?.FinalDamage ?? 0;
                result += JiangHu?.FinalDamage ?? 0;
                result += InnerStrength?.FinalPhysicalDamage ?? 0;

                IStatus status = QueryStatus(StatusSet.BUFF_FINAL_PDAMAGE + 1);
                if (status != null)
                {
                    result += status.Power;
                }

                return result;
            }
        }

        public override int AddFinalMAttack
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin;
                    pos <= Item.ItemPosition.EquipmentEnd;
                    pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.AddFinalMagicDamage ?? 0;
                }

                result += CoatStorage.FinalMagicDamage;
                result += Fate?.FinalMagicDamage ?? 0;
                result += JiangHu?.FinalMagicDamage ?? 0;
                result += InnerStrength?.FinalMagicalDamage ?? 0;

                IStatus status = QueryStatus(StatusSet.BUFF_FINAL_MDAMAGE + 1);
                if (status != null)
                {
                    result += status.Power;
                }

                return result;
            }
        }

        public override int AddFinalDefense
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin;
                    pos <= Item.ItemPosition.EquipmentEnd;
                    pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.AddFinalDefense ?? 0;
                }

                result += CoatStorage.FinalDefense;
                result += Fate?.FinalDefense ?? 0;
                result += JiangHu?.FinalDefense ?? 0;
                result += InnerStrength?.FinalPhysicalDefense ?? 0;

                IStatus status = QueryStatus(StatusSet.BUFF_FINAL_PDMGREDUCTION + 1);
                if (status != null)
                {
                    result += status.Power;
                }

                return result;
            }
        }

        public override int AddFinalMDefense
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.AddFinalMagicDefense ?? 0;
                }

                result += CoatStorage.FinalMagicDefense;
                result += Fate?.FinalMagicDefense ?? 0;
                result += JiangHu?.FinalMagicDefense ?? 0;
                result += InnerStrength?.FinalMagicalDefense ?? 0;

                IStatus status = QueryStatus(StatusSet.BUFF_FINAL_MDMGREDUCTION + 1);
                if (status != null)
                {
                    result += status.Power;
                }

                return result;
            }
        }

        public override int CriticalStrike
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.CriticalStrike ?? 0;
                }
                result += CoatStorage.CriticalStrike;
                result += AstProf?.GetPower(IAstProf.AstProfType.MartialArtist) ?? 0;
                result += (Fate?.CriticalStrike ?? 0) * 10;
                result += (JiangHu?.CriticalStrike ?? 0) * 10;
                result += InnerStrength?.CriticalStrike ?? 0;

                var tyrantAura = QueryStatus(StatusSet.TYRANT_AURA);
                if (tyrantAura != null)
                {
                    result += tyrantAura.Power * 100;
                }
                IStatus status = QueryStatus(StatusSet.BUFF_PSTRIKE + 1);
                if (status != null)
                {
                    result += status.Power;
                }
                return result;
            }
        }

        public override int SkillCriticalStrike

        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.SkillCriticalStrike ?? 0;
                }
                result += CoatStorage.SkillCriticalStrike;
                result += AstProf?.GetPower(IAstProf.AstProfType.Warlock) ?? 0;
                result += (Fate?.SkillCriticalStrike ?? 0) * 10;
                result += (JiangHu?.SkillCriticalStrike ?? 0) * 10;
                result += InnerStrength?.SkillCriticalStrike ?? 0;

                var tyrantAura = QueryStatus(StatusSet.TYRANT_AURA);
                if (tyrantAura != null)
                {
                    result += tyrantAura.Power * 100;
                }
                IStatus status = QueryStatus(StatusSet.BUFF_MSTRIKE + 1);
                if (status != null)
                {
                    result += status.Power;
                }
                return result;
            }
        }

        public override int Immunity
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Immunity ?? 0;
                }
                result += CoatStorage.Immunity;
                result += AstProf?.GetPower(IAstProf.AstProfType.ChiMaster) ?? 0;
                result += (Fate?.Immunity ?? 0) * 10;
                result += (JiangHu?.Immunity ?? 0) * 10;
                result += InnerStrength?.Immunity ?? 0;

                var fendAura = QueryStatus(StatusSet.FEND_AURA);
                if (fendAura != null)
                {
                    result += fendAura.Power * 100;
                }
                IStatus status = QueryStatus(StatusSet.BUFF_IMMUNITY + 1);
                if (status != null)
                {
                    result += status.Power;
                }
                return result;
            }
        }

        public override int Penetration
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Penetration ?? 0;
                }
                result += AstProf?.GetPower(IAstProf.AstProfType.Sage) ?? 0;
                return result;
            }
        }

        public override int Breakthrough
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Breakthrough ?? 0;
                }
                result += Fate?.Breakthrough ?? 0;
                result += JiangHu?.Breakthrough ?? 0;
                result += InnerStrength?.Breakthrough ?? 0;
                result += CoatStorage.Immunity;

                IStatus status = QueryStatus(StatusSet.BUFF_BREAK + 1);
                if (status != null)
                {
                    result += status.Power;
                }
                return result;
            }
        }

        public override int Counteraction
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Counteraction ?? 0;
                }
                result += Fate?.Counteraction ?? 0;
                result += JiangHu?.Counteraction ?? 0;
                result += CoatStorage.Counteraction;

                IStatus status = QueryStatus(StatusSet.BUFF_COUNTERACTION + 1);
                if (status != null)
                {
                    result += status.Power;
                }
                return result;
            }
        }

        public override int Block
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Block ?? 0;
                }
                return result;
            }
        }

        public override int Detoxication
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Detoxication ?? 0;
                }
                result += AstProf?.GetPower(IAstProf.AstProfType.Apothecary) ?? 0;
                return Math.Min(100, Math.Max(0, result));
            }
        }

        public override int FireResistance
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.FireResistance ?? 0;
                }
                var aura = QueryStatus(StatusSet.FIRE_AURA);
                if (aura != null)
                {
                    result += aura.Power;
                }
                return result;
            }
        }

        public override int WaterResistance
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.WaterResistance ?? 0;
                }
                var aura = QueryStatus(StatusSet.WATER_AURA);
                if (aura != null)
                {
                    result += aura.Power;
                }
                return result;
            }
        }

        public override int WoodResistance
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.WoodResistance ?? 0;
                }
                var aura = QueryStatus(StatusSet.WOOD_AURA);
                if (aura != null)
                {
                    result += aura.Power;
                }
                return result;
            }
        }

        public override int EarthResistance
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.EarthResistance ?? 0;
                }
                var aura = QueryStatus(StatusSet.EARTH_AURA);
                if (aura != null)
                {
                    result += aura.Power;
                }
                return result;
            }
        }

        public override int MetalResistance
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.MetalResistance ?? 0;
                }
                var aura = QueryStatus(StatusSet.METAL_AURA);
                if (aura != null)
                {
                    result += aura.Power;
                }
                return result;
            }
        }

        public override int AttackSpeed { get; } = 1000;

        public int Agility
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Agility ?? 0;
                }
                return result;
            }
        }

        public override int Accuracy
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.Accuracy ?? 0;
                }
                return result;
            }
        }

        public int DragonGemBonus
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    Item item = UserPackage.GetEquipment(pos);
                    if (item != null)
                    {
                        result += item.DragonGemEffect;
                    }
                }
                return result;
            }
        }

        public int PhoenixGemBonus
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.PhoenixGemEffect ?? 0;
                }
                return result;
            }
        }

        public int VioletGemBonus
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.VioletGemEffect ?? 0;
                }
                return result;
            }
        }

        public int MoonGemBonus
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.MoonGemEffect ?? 0;
                }
                return result;
            }
        }

        public int RainbowGemBonus
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.RainbowGemEffect ?? 0;
                }
                return result;
            }
        }

        public int FuryGemBonus
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.FuryGemEffect ?? 0;
                }
                return result;
            }
        }

        public int TortoiseGemBonus
        {
            get
            {
                int result = 0;
                for (Item.ItemPosition pos = Item.ItemPosition.EquipmentBegin; pos <= Item.ItemPosition.EquipmentEnd; pos++)
                {
                    result += UserPackage.GetEquipment(pos)?.TortoiseGemEffect ?? 0;
                }
                return Math.Min(48, result);
            }
        }

#endregion

        #region Multiple Exp

        private ExperienceManager.ExperienceMultiplierData experienceMultiplierData;

        public void LoadExperienceData()
        {
            experienceMultiplierData = ExperienceManager.GetExperienceMultiplierData(Identity);
        }

        public bool HasMultipleExp => !experienceMultiplierData.Equals(default) && experienceMultiplierData.EndTime > DateTime.Now;
        public float ExperienceMultiplier => experienceMultiplierData.Equals(default) ? 1f : experienceMultiplierData.ExperienceMultiplier;

        public async Task SendMultipleExpAsync()
        {
            if (RemainingExperienceSeconds > 0)
            {
                await SynchroAttributesAsync(ClientUpdateType.MultipleExpTimer, RemainingExperienceSeconds, 0, (uint)(ExperienceMultiplier * 100), 0);
            }
        }

        public uint RemainingExperienceSeconds
        {
            get
            {
                if (!experienceMultiplierData.IsActive)
                {
                    return 0;
                }

                return (uint)experienceMultiplierData.RemainingSeconds;
            }
        }

        public async Task<bool> SetExperienceMultiplierAsync(uint seconds, float multiplier = 2f)
        {
            if (ExperienceManager.AddExperienceMultiplierData(Identity, multiplier, (int)seconds))
            {
                experienceMultiplierData = ExperienceManager.GetExperienceMultiplierData(Identity);
            }
            await SendMultipleExpAsync();
            return true;
        }

        #endregion

        #region Experience

        #region Online Training

        public uint GodTimeExp
        {
            get => user.OnlineGodExpTime;
            set => user.OnlineGodExpTime = Math.Max(0, Math.Min(value, 60000));
        }

        public uint OnlineTrainingExp
        {
            get => user.BattleGodExpTime;
            set => user.BattleGodExpTime = Math.Max(0, Math.Min(value, 60000));
        }

        #endregion

        public bool IsNewbie() => Level < 70;

        public async Task<bool> AwardLevelAsync(ushort amount)
        {
            if (Level >= MAX_UPLEV)
            {
                return false;
            }

            if (Level + amount <= 0)
            {
                return false;
            }

            int addLev = amount;
            if (addLev + Level > MAX_UPLEV)
            {
                addLev = MAX_UPLEV - Level;
            }

            if (addLev <= 0)
            {
                return false;
            }

            await AddAttributesAsync(ClientUpdateType.Atributes, (ushort)(addLev * 3));
            await AddAttributesAsync(ClientUpdateType.Level, addLev);
            await BroadcastRoomMsgAsync(new MsgAction
            {
                Identity = Identity,
                Action = ActionType.CharacterLevelUp,
                X = Level
            }, true);

            await UpLevelEventAsync();
            return true;
        }

        public async Task AwardBattleExpAsync(long experience, bool bGemEffect)
        {
            if (experience == 0 || QueryStatus(StatusSet.CURSED) != null)
            {
                return;
            }

            if (Level >= MAX_UPLEV)
            {
                return;
            }

            if (experience < 0)
            {
                await AddAttributesAsync(ClientUpdateType.Experience, experience);
                return;
            }

            const int battleExpTax = 5;
            if (Level < 130)
            {
                experience *= battleExpTax;
            }

            if (Level >= 120)
            {
                experience /= 2;
            }

            double multiplier = 1;
            if (HasMultipleExp)
            {
                multiplier += ExperienceMultiplier - 1;
            }

            if (!IsNewbie() && ProfessionSort == 13 && ProfessionLevel >= 3)
            {
                multiplier += 1;
            }

            DbLevelExperience levExp = ExperienceManager.GetLevelExperience(Level);
            if (IsBlessed)
            {
                if (levExp != null)
                {
                    OnlineTrainingExp += (uint)(levExp.UpLevTime * (experience / (float)levExp.Exp));
                }
            }

            if (bGemEffect)
            {
                multiplier += RainbowGemBonus / 100d;
            }

            if (IsLucky && await ChanceCalcAsync(10, 10000))
            {
                await SendEffectAsync("LuckyGuy", true);
                experience *= 5;
                await SendAsync(StrLuckyGuyQuintuple);
            }

            multiplier += 1 + BattlePower / 100d;

            experience = (long)(experience * Math.Max(0.01d, multiplier));

            if (Metempsychosis >= 2)
            {
                experience /= 3;
            }

            if (QueryStatus(StatusSet.OBLIVION) != null)
            {
                //oblivionExperience += experience;
                return;
            }

            //if (Map.IsAutoHungUpMap() && IsAutoHangUp)
            //{
            //    AutoHangUpExperience += (ulong)experience;

            //    DbLevelExperience dbExp = ExperienceManager.GetLevelExperience(Level);
            //    if (dbExp != null && dbExp.Exp < (Experience + AutoHangUpExperience))
            //    {
            //        await AwardExperienceAsync((long)AutoHangUpExperience, true);
            //        AutoHangUpExperience = 0;
            //    }
            //    return;
            //}

            await AwardExperienceAsync(experience);
        }

        public long AdjustExperience(Role pTarget, long nRawExp, bool bNewbieBonusMsg)
        {
            if (pTarget == null)
            {
                return 0;
            }

            long nExp = nRawExp;
            //nExp = BattleSystem.AdjustExp(nExp, Level, pTarget.Level);
            return nExp;
        }

        public async Task<bool> AwardExperienceAsync(long amount, bool noContribute = false)
        {
            if (Level > ExperienceManager.GetLevelLimit())
            {
                return true;
            }

            if (Map != null && Map.IsNoExpMap())
            {
                return false;
            }

            amount += (long)Experience;
            var leveled = false;
            uint pointAmount = 0;
            byte newLevel = Level;
            ushort virtue = 0;
            double mentorUpLevTime = 0;
            while (newLevel < MAX_UPLEV && amount >= (long)ExperienceManager.GetLevelExperience(newLevel).Exp)
            {
                DbLevelExperience dbExp = ExperienceManager.GetLevelExperience(newLevel);
                amount -= (long)dbExp.Exp;
                leveled = true;
                newLevel++;

                if (newLevel <= 70)
                {
                    virtue += (ushort)dbExp.UpLevTime;
                }

                if (!AutoAllot || newLevel >= 120)
                {
                    pointAmount += 3;
                }

                mentorUpLevTime += dbExp.MentorUpLevTime;

                if (newLevel < ExperienceManager.GetLevelLimit())
                {
                    continue;
                }

                amount = 0;
                break;
            }

            uint metLev = 0;
            DbLevelExperience leveXp = ExperienceManager.GetLevelExperience(newLevel);
            if (leveXp != null)
            {
                float fExp = amount / (float)leveXp.Exp;
                metLev = (uint)(newLevel * 10000 + fExp * 1000);
            }

            int metLevel = user.MeteLevel2 != 0 ? 110 : 130;
            uint metExp = user.MeteLevel2 != 0 ? user.MeteLevel2 : user.MeteLevel;
            if (newLevel >= metLevel && Metempsychosis > 0 && metExp > metLev)
            {
                byte extra = 0;
                if (metExp / 10000 > newLevel)
                {
                    uint mete = metExp / 10000;
                    extra += (byte)(mete - newLevel);
                    pointAmount += (uint)(extra * 3);
                    leveled = true;
                    amount = 0;
                }

                newLevel += extra;

                if (newLevel >= ExperienceManager.GetLevelLimit())
                {
                    newLevel = (byte)ExperienceManager.GetLevelLimit();
                    amount = 0;
                }
                else if (metExp >= newLevel * 10000)
                {
                    amount = (long)(ExperienceManager.GetLevelExperience(newLevel).Exp *
                                     (metExp % 10000 / 1000d));
                }
            }

            if (leveled)
            {
                byte job;
                if (Profession > 100)
                {
                    job = 10;
                }
                else
                {
                    job = (byte)((Profession - Profession % 10) / 10);
                }

                Level = newLevel;

                if (AutoAllot && newLevel <= 120)
                {
                    DbPointAllot allot = PointAllotRepository.Get(job, Math.Min((byte)120, newLevel));
                    if (allot != null)
                    {
                        await SetAttributesAsync(ClientUpdateType.Strength, allot.Strength);
                        await SetAttributesAsync(ClientUpdateType.Agility, allot.Agility);
                        await SetAttributesAsync(ClientUpdateType.Vitality, allot.Vitality);
                        await SetAttributesAsync(ClientUpdateType.Spirit, allot.Spirit);
                    }
                }

                if (pointAmount > 0)
                {
                    await AddAttributesAsync(ClientUpdateType.Atributes, (int)pointAmount);
                }

                await SetAttributesAsync(ClientUpdateType.Level, Level);
                await SetAttributesAsync(ClientUpdateType.TeamMemberHP, MaxLife);
                await SetAttributesAsync(ClientUpdateType.Mana, MaxMana);
                await Screen.BroadcastRoomMsgAsync(new MsgAction
                {
                    Action = ActionType.CharacterLevelUp,
                    Identity = Identity,
                    X = Level
                });

                await UpLevelEventAsync();

                if (!noContribute && Guide.Tutor != null && mentorUpLevTime > 0)
                {
                    mentorUpLevTime /= 5;
                    await Guide.Tutor.AwardTutorExperienceAsync((uint)mentorUpLevTime).ConfigureAwait(false);
#if DEBUG
                    if (Guide.Tutor.Guide?.IsPm() == true)
                    {
                        await Guide.Tutor.Guide.SendAsync($"Mentor uplev time add: +{mentorUpLevTime}", TalkChannel.Talk);
                    }
#endif
                }
            }

            if (Team != null && !Team.IsLeader(Identity) && virtue > 0
                && Team.Leader.MapIdentity == MapIdentity && Team.Leader.GetDistance(this) < 30)
            {
                Team.Leader.VirtuePoints += virtue;
                await Team.SendAsync(new MsgTalk(TalkChannel.Team, Color.White, string.Format(StrAwardVirtue, Team.Leader.Name, virtue)));

                if (Team.Leader.SyndicateIdentity != 0)
                {
                    Team.Leader.SyndicateMember.GuideDonation += 1;
                    Team.Leader.SyndicateMember.GuideTotalDonation += 1;
                    await Team.Leader.SyndicateMember.SaveAsync();
                }
            }

            Experience = (ulong)amount;
            await SetAttributesAsync(ClientUpdateType.Experience, Experience);
            return true;
        }

        public async Task UpLevelEventAsync()
        {
            await GameAction.ExecuteActionAsync(USER_UPLEV_ACTION, this, this, null, string.Empty);

            if (Team != null)
            {
                await Team.BroadcastMemberLifeAsync(this, true);
                await Team.SyncFamilyBattlePowerAsync();
            }

            if (JiangHu != null)
            {
                await JiangHu.InitializationNotifyAsync();
            }

            if (Guide != null && Guide.ApprenticeCount > 0)
            {
                await Guide.SynchroApprenticesSharedBattlePowerAsync();
            }

            if (await ActivityManager.CheckForActivityTaskUpdatesAsync(this))
            {
                await SubmitActivityListAsync();
            }
        }

        public long CalculateExpBall(int amount = EXPBALL_AMOUNT)
        {
            long exp = 0;

            if (Level >= ExperienceManager.GetLevelLimit())
            {
                return 0;
            }

            byte level = Level;
            if (Experience > 0)
            {
                double pct = 1.00 - Experience / (double)ExperienceManager.GetLevelExperience(Level).Exp;
                if (amount > pct * ExperienceManager.GetLevelExperience(Level).UpLevTime)
                {
                    amount -= (int)(pct * ExperienceManager.GetLevelExperience(Level).UpLevTime);
                    exp += (long)(ExperienceManager.GetLevelExperience(Level).Exp - Experience);
                    level++;
                }
            }

            while (level < MAX_UPLEV && amount > ExperienceManager.GetLevelExperience(level).UpLevTime)
            {
                amount -= ExperienceManager.GetLevelExperience(level).UpLevTime;
                exp += (long)ExperienceManager.GetLevelExperience(level).Exp;

                if (level >= MAX_UPLEV)
                {
                    return exp;
                }

                level++;
            }

            exp += (long)(amount / (double)ExperienceManager.GetLevelExperience(Level).UpLevTime *
                           ExperienceManager.GetLevelExperience(Level).Exp);
            return exp;
        }

        public ExperiencePreview PreviewExpBallUsage(int amount = EXPBALL_AMOUNT)
        {
            long expBallExp = (long)Experience + CalculateExpBall(amount);
            byte newLevel = Level;
            DbLevelExperience dbExp = null;
            while (newLevel < MAX_UPLEV && expBallExp >= (long)ExperienceManager.GetLevelExperience(newLevel).Exp)
            {
                dbExp = ExperienceManager.GetLevelExperience(newLevel);
                expBallExp -= (long)dbExp.Exp;
                newLevel++;
                if (newLevel < MAX_UPLEV)
                {
                    continue;
                }

                dbExp = null;
                expBallExp = 0;
                break;
            }

            double percent = 0;
            if (expBallExp > 0 && dbExp != null)
            {
                percent = dbExp.Exp / (double)expBallExp * 100;
            }

            return new ExperiencePreview
            {
                Level = newLevel,
                Experience = (ulong)expBallExp,
                Percent = percent
            };
        }

        public ExperiencePreview PreviewExperienceIncrement(ulong experience)
        {
            if (Level >= MAX_UPLEV)
            {
                return new ExperiencePreview
                {
                    Level = MAX_UPLEV
                };
            }

            byte newLevel = Level;
            ulong newExperience = Experience + experience;
            double percent = 0;
            DbLevelExperience dbExp = ExperienceManager.GetLevelExperience(newLevel);
            do
            {
                if (newExperience < dbExp.Exp)
                {
                    break;
                }

                newLevel++;
                newExperience -= dbExp.Exp;
                dbExp = ExperienceManager.GetLevelExperience(newLevel);
            }
            while (newLevel < MAX_UPLEV && dbExp != null);

            if (newExperience != 0 && dbExp != null)
            {
                percent = (double)newExperience / dbExp.Exp * 100;
            }

            return new ExperiencePreview
            {
                Level = newLevel,
                Experience = newExperience,
                Percent = percent
            };
        }

        public async Task IncrementExpBallAsync()
        {
            await Statistic.IncrementValueAsync(EXP_BALL_USAGE_STC_EVENT, EXP_BALL_USAGE_STC_DATA);
            user.ExpBallUsage += EXPBALL_AMOUNT;
            user.MentorOpportunity += 10;
            //await SynchroAttributesAsync(ClientUpdateType.EnlightenPoints, EnlightenPoints);
            await SaveAsync();
        }

        /*
         * Reference from LUA
         * tExpProps_Stc[723700] = {}
         * tExpProps_Stc[723700]["EventType"] = 114
         * tExpProps_Stc[723700]["DataType"] = 44
         * tExpProps_Stc[723700]["MaxData"] = 10
         */
        private uint EXP_BALL_USAGE_STC_EVENT = 114;
        private uint EXP_BALL_USAGE_STC_DATA = 44;

        public bool CanUseExpBall()
        {
            if (Level >= ExperienceManager.GetLevelLimit())
            {
                return false;
            }

            var expUsageStc = Statistic.GetStc(EXP_BALL_USAGE_STC_EVENT, EXP_BALL_USAGE_STC_DATA);
            if (expUsageStc != null && UnixTimestamp.ToDateTime(expUsageStc.Timestamp).Date < DateTime.Now.Date)
            {
                user.ExpBallUsage = 0;
                Statistic.AddOrUpdateAsync(EXP_BALL_USAGE_STC_EVENT, EXP_BALL_USAGE_STC_DATA, 0, true).GetAwaiter().GetResult();
                return true;
            }

            if (expUsageStc != null && expUsageStc.Data >= 10)
            {
                return false;
            }

            return true;
        }

        public struct ExperiencePreview
        {
            public int Level { get; set; }
            public ulong Experience { get; set; }
            public double Percent { get; set; }
        }

        #endregion

        #region Transformation

        private TimeOut transformationTimer = new();

        public Transformation Transformation { get; protected set; }

        public async Task<bool> TransformAsync(uint dwLook, int nKeepSecs, bool bSynchro)
        {
            var bBack = false;

            if (Transformation != null)
            {
                await ClearTransformationAsync();
                bBack = true;
            }

            DbMonstertype pType = RoleManager.GetMonstertype(dwLook);
            if (pType == null)
            {
                return false;
            }

            var pTransform = new Transformation(this);
            if (pTransform.Create(pType))
            {
                Transformation = pTransform;
                TransformationMesh = (ushort)pTransform.Lookface;
                await SetAttributesAsync(ClientUpdateType.Mesh, Mesh);
                Life = MaxLife;
                transformationTimer = new TimeOut(nKeepSecs);
                transformationTimer.Startup(nKeepSecs);
                if (bSynchro)
                {
                    await SynchroTransformAsync();
                }
            }
            else
            {
                pTransform = null;
            }

            if (bBack)
            {
                await SynchroTransformAsync();
            }

            return true;
        }

        public async Task ClearTransformationAsync()
        {
            TransformationMesh = 0;
            Transformation = null;
            transformationTimer.Clear();

            await SynchroTransformAsync();
            //await MagicData.AbortMagicAsync(true);
            //BattleSystem.ResetBattle();
        }

        public async Task<bool> SynchroTransformAsync()
        {
            await SynchroAttributesAsync(ClientUpdateType.Mesh, Mesh, true);
            if (TransformationMesh != 98 && TransformationMesh != 99 && IsAlive)
            {
                Life = MaxLife;
                await SynchroAttributesAsync(ClientUpdateType.TeamMemberMaxHP, MaxLife);
                await SynchroAttributesAsync(ClientUpdateType.TeamMemberHP, Life, false);
            }
            return true;
        }

        public async Task SetGhostAsync()
        {
            if (IsAlive)
            {
                return;
            }

            ushort trans = 98;
            if (Gender == 2)
            {
                trans = 99;
            }

            TransformationMesh = trans;
            await SynchroTransformAsync();
        }

        #endregion

        #region Revive

        private readonly TimeOut reviveTimer = new();
        private readonly TimeOut protectionTimer = new();
        private bool reviveLeaveMap;

        public bool CanRevive()
        {
            return !IsAlive && reviveTimer.IsTimeOut();
        }

        public async Task RebornAsync(bool chgMap, bool isSpell = false)
        {
            if (IsAlive || !CanRevive() && !isSpell)
            {
                if (QueryStatus(StatusSet.GHOST) != null)
                {
                    await DetachStatusAsync(StatusSet.GHOST);
                }

                if (QueryStatus(StatusSet.DEAD) != null)
                {
                    await DetachStatusAsync(StatusSet.DEAD);
                }

                if (TransformationMesh == 98 || TransformationMesh == 99)
                {
                    await ClearTransformationAsync();
                }

                return;
            }

            reviveTimer.Clear();
            //BattleSystem.ResetBattle();

            await ClearTransformationAsync();
            await DetachStatusAsync(StatusSet.GHOST);
            await DetachStatusAsync(StatusSet.DEAD);

            await SetAttributesAsync(ClientUpdateType.Stamina, DEFAULT_USER_ENERGY);
            await SetAttributesAsync(ClientUpdateType.TeamMemberHP, MaxLife);
            await SetAttributesAsync(ClientUpdateType.Mana, MaxMana);
            await SetXpAsync(0);

            reviveLeaveMap = true;
            
            if (chgMap || !IsBlessed && !isSpell)
            {
                reviveLeaveMap = false;
                await FlyMapAsync(user.MapID, user.X, user.Y);
            }
            else
            {
                if (!isSpell && (Map.IsPrisionMap()
                                 || Map.IsPkField()
                                 || Map.IsCallNewbieDisable()
                || Map.IsSynMap()))
                {
                    await FlyMapAsync(user.MapID, user.X, user.Y);
                }
                else
                {
                    await FlyMapAsync(idMap, currentX, currentY);
                }
            }

            protectionTimer.Startup(CHGMAP_LOCK_SECS);
        }

        #endregion
    }
}
