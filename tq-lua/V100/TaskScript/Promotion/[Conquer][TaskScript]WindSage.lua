----------------------------------------------------------------------------
-- Name: [Conquer][TaskScript]WingSage.lua
-- Purpose: Implementation of promotion NPC of Ninja
-- Creator: Felipe Vieira Vendramini
-- Created: 2024-08-04
----------------------------------------------------------------------------

-- local flag  = tonumber(tItemAttr[1])
-- local addamount = tonumber(tItemAttr[2])
-- local monopoly = tonumber(tItemAttr[3])
-- local save_time = tonumber(tItemAttr[4])
-- local active = tonumber(tItemAttr[5])
-- local onlinetime = tonumber(tItemAttr[6])
-- local data = tonumber(tItemAttr[7])
-- local reduce_dmg = tonumber(tItemAttr[8])
-- local add_life = tonumber(tItemAttr[9])
-- local addlevel_exp = tonumber(tItemAttr[10])
-- local magic3 = tonumber(tItemAttr[11])
-- local gem1 = tonumber(tItemAttr[12])
-- local gem2 = tonumber(tItemAttr[13])
-- local magic1 = tonumber(tItemAttr[14])
-- local magic2 = tonumber(tItemAttr[15])
-- local amount = tonumber(tItemAttr[16])
-- local amount_limit = tonumber(tItemAttr[17])
-- local anti_monster = tonumber(tItemAttr[18])
-- local ident = tonumber(tItemAttr[19])
-- local color = tonumber(tItemAttr[20])

-- Dialog messages
tConquerPromotion_WindSage_Text = {}
tConquerPromotion_WindSage_Text[4972] = {}

tConquerPromotion_WindSage_Text[4972]["Text111"] = "Fancy the skills of Ninja, huh? But the secrets of Ninja are not for trade. Find your own trainer, please."
tConquerPromotion_WindSage_Text[4972]["Option111"] = "What~a~shame!"

tConquerPromotion_WindSage_Text[4972]["Text121"] = "Cloaked in shadow, mysterious and aloof, the Ninja is the fastest class, with the most devastating attacks! So, what can I do for you?"
tConquerPromotion_WindSage_Text[4972]["Option121"] = "I~want~to~get~promoted."
tConquerPromotion_WindSage_Text[4972]["Option122"] = "Learn~class~skills."
tConquerPromotion_WindSage_Text[4972]["Option123"] = "Learn~Pure~Skills."
tConquerPromotion_WindSage_Text[4972]["Option124"] = "Okay.~I~see."

--
tConquerPromotion_WindSage_Text[4972]["Text211"] = "At level 15, you can get promoted to Ninja and learn Fatal Strike (XP skill)."
tConquerPromotion_WindSage_Text[4972]["Option211"] = "I`ll~try~to~reach~Lv.15."

tConquerPromotion_WindSage_Text[4972]["Text221"] = "You need to reach level 40 to get further promoted. Keep practicing!"
tConquerPromotion_WindSage_Text[4972]["Option221"] = "I`ll~try~to~reach~Lv.40."

tConquerPromotion_WindSage_Text[4972]["Text231"] = "You can get further promoted when you reach level 70."
tConquerPromotion_WindSage_Text[4972]["Option231"] = "I`ll~try~to~reach~Lv.70."

tConquerPromotion_WindSage_Text[4972]["Text241"] = "You should reach at least Level 100 to get promoted to be `Mystic Ninja`."
tConquerPromotion_WindSage_Text[4972]["Option241"] = "I`ll~try~to~reach~Lv.100."

tConquerPromotion_WindSage_Text[4972]["Text251"] = "When your reach level 110, you can give me 1 Moon Box and get promoted from Mystic Ninja to Ninja Master. But if you`ve been reincarnated before, you can be promoted without one."
tConquerPromotion_WindSage_Text[4972]["Text252"] = "~Then you can learn Archer Bane."
tConquerPromotion_WindSage_Text[4972]["Option251"] = "I`ll~try~to~reach~Lv.110."

tConquerPromotion_WindSage_Text[4972]["Text261"] = "You have been promoted to Ninja Master. Keep up with the hard work!"
tConquerPromotion_WindSage_Text[4972]["Option261"] = "Thank~you."

-- 
tConquerPromotion_WindSage_Text[4972]["Text311"] = "You are over level 15. You can now get promoted to Ninja and learn Fatal Strike (XP skill)."
tConquerPromotion_WindSage_Text[4972]["Option311"] = "Get~promoted."
tConquerPromotion_WindSage_Text[4972]["Option312"] = "Just~passing~by."

tConquerPromotion_WindSage_Text[4972]["Text321"] = "You are over level 40. You can now get promoted to Middle Ninja and learn Twofold Blades."
tConquerPromotion_WindSage_Text[4972]["Option321"] = "Get~promoted."
tConquerPromotion_WindSage_Text[4972]["Option322"] = "Just~passing~by."

tConquerPromotion_WindSage_Text[4972]["Text331"] = "You`ve reached the required level. All Level 70+ `Middle Ninjas` can get promoted to be `Dark Ninjas`."
tConquerPromotion_WindSage_Text[4972]["Text332"] = "~Then, you can learn [Toxic Fog] and [Shuriken Vortex]. If you are a Ninja in your past life and now,"
tConquerPromotion_WindSage_Text[4972]["Text333"] = "~you can learn Poison Star, too. If you are a Ninja in your 1st life, 2nd life and now, you can learn Counter-Kill."
tConquerPromotion_WindSage_Text[4972]["Option331"] = "Get~promoted."
tConquerPromotion_WindSage_Text[4972]["Option332"] = "Just~passing~by."

tConquerPromotion_WindSage_Text[4972]["Text341"] = "You`ve reached the required level. All Level 100+ `Dark Ninjas` can get promoted to be `Mystic Ninjas`."
tConquerPromotion_WindSage_Text[4972]["Option341"] = "Get~promoted."
tConquerPromotion_WindSage_Text[4972]["Option342"] = "Just~passing~by."

tConquerPromotion_WindSage_Text[4972]["Text351"] = "You are over level 110. You can give me 1 Moon Box and get promoted to Ninja Master. Should you have been reincarnated before, you can be promoted without one."
tConquerPromotion_WindSage_Text[4972]["Text352"] = "~Then you can learn Archer Bane."
tConquerPromotion_WindSage_Text[4972]["Option351"] = "Get~promoted."
tConquerPromotion_WindSage_Text[4972]["Option352"] = "Just~passing~by."

-- 
tConquerPromotion_WindSage_Text[4972]["Text431"] = "You do not have a %s."
tConquerPromotion_WindSage_Text[4972]["Option431"] = "I~will~find~one."

tConquerPromotion_WindSage_Text[4972]["Text441"] = "You do not have a Meteor."
tConquerPromotion_WindSage_Text[4972]["Option441"] = "I~will~find~one."

tConquerPromotion_WindSage_Text[4972]["Text451"] = "You do not have a Moon Box. Why not take the challenge in the Eight-Diagram Dimensions and get one?"
tConquerPromotion_WindSage_Text[4972]["Option451"] = "I~see."

tConquerPromotion_WindSage_Text[4972]["Text471"] = "You`re almost a master of %s. I have nothing more to teach you."
tConquerPromotion_WindSage_Text[4972]["Option471"] = "Alright."

-- Talk
tConquerPromotion_WindSage_Text["Improve"] = {}
tConquerPromotion_WindSage_Text["Improve"][50] = "Congratulations! You`ve successfully got promoted to Ninja and received a reward. Keep practicing."
tConquerPromotion_WindSage_Text["Improve"][51] = "Congratulations! You`ve successfully got promoted to Middle Ninja and received a reward. Keep practicing."
tConquerPromotion_WindSage_Text["Improve"][52] = "Congratulations! You`ve successfully got promoted to Dark Ninja and received a reward. Keep practicing."
tConquerPromotion_WindSage_Text["Improve"][53] = "Congratulations! You`ve successfully got promoted to Mystic Ninja and received a reward. Keep practicing."
tConquerPromotion_WindSage_Text["Improve"][54] = "Congratulations! You`ve successfully got promoted to Ninja Master and received a reward. Keep practicing."

-- Gender
tConquerPromotion_WindSage_Text["SexName"]={}
tConquerPromotion_WindSage_Text["SexName"][1] = ""
tConquerPromotion_WindSage_Text["SexName"][2] = ""

-- Promotion name
tConquerPromotion_WindSage_Text["ProName"] = {}
tConquerPromotion_WindSage_Text["ProName"][50] = "Intern Ninja"
tConquerPromotion_WindSage_Text["ProName"][51] = "Ninja"
tConquerPromotion_WindSage_Text["ProName"][52] = "Middle Ninja"
tConquerPromotion_WindSage_Text["ProName"][53] = "Dark Ninja"
tConquerPromotion_WindSage_Text["ProName"][54] = "Mystic Ninja"
tConquerPromotion_WindSage_Text["ProName"][55] = "Ninja Master"

-- Last improve
tConquerPromotion_WindSage_Text["LastImprove"] = {}
tConquerPromotion_WindSage_Text["LastImprove"][51] = "Congratulations! You`ve successfully got promoted to Ninja. Keep practicing."
tConquerPromotion_WindSage_Text["LastImprove"][52] = "Congratulations! You`ve successfully got promoted to Middle Ninja. Keep practicing."
tConquerPromotion_WindSage_Text["LastImprove"][53] = "Congratulations! You`ve successfully got promoted to Dark Ninja. Keep practicing."
tConquerPromotion_WindSage_Text["LastImprove"][54] = "Congratulations! You`ve successfully got promoted to Mystic Ninja. Keep practicing."
tConquerPromotion_WindSage_Text["LastImprove"][55] = "Congratulations! You`ve successfully got promoted to Master Ninja. Keep practicing."

-- Skills
tConquerPromotion_WindSage_Text[4972]["Text511"] = "The XP skills for Ninjas are Fatal Strike and Shuriken Vortex. Fatal Strike makes flash appearance, and Shuriken Vortex turns the caster into a cyclone."
tConquerPromotion_WindSage_Text[4972]["Text512"] = "~Ninjas are mysterious and unpredictable. Toxic Fog frightens the enemies. Which one do you want to learn?"
tConquerPromotion_WindSage_Text[4972]["Text513"] = ""
tConquerPromotion_WindSage_Text[4972]["Text514"] = ""
tConquerPromotion_WindSage_Text[4972]["Option511"] = "Learn~class~skills."
tConquerPromotion_WindSage_Text[4972]["Option512"] = "Learn~XP~skills."
tConquerPromotion_WindSage_Text[4972]["Option513"] = "Learn~pure~skills."
tConquerPromotion_WindSage_Text[4972]["Option514"] = "Leave."

tConquerPromotion_WindSage_Text[4972]["Text521"] = "Which skill do you want to learn?"
tConquerPromotion_WindSage_Text[4972]["Option521"] = "Twofold~Blade.~[Lv.40]"
tConquerPromotion_WindSage_Text[4972]["Option522"] = "Toxic~Fog~[Lvl~70]"
tConquerPromotion_WindSage_Text[4972]["Option523"] = "Poison~Star~[Lvl~70]"
tConquerPromotion_WindSage_Text[4972]["Option524"] = "Archer~Bane~[Lvl~110]"
tConquerPromotion_WindSage_Text[4972]["Option525"] = "Previous."
tConquerPromotion_WindSage_Text[4972]["Option526"] = "Leave."

tConquerPromotion_WindSage_Text[4972]["Text531"] = "You~acquired~the~skill~Twofold~Blade!"
tConquerPromotion_WindSage_Text[4972]["Option531"] = "Thank~you."
tConquerPromotion_WindSage_Text[4972]["Text541"] = "Sorry, only Ninjas above Level 40 are qualified to learn Super Twofold Blade."
tConquerPromotion_WindSage_Text[4972]["Option541"] = "Alright."

tConquerPromotion_WindSage_Text[4972]["Text551"] = "You`ve learned Toxic Fog! After casting 1 Toxic Fog in a target area, you can continually reduce 10% of the targets` current"
tConquerPromotion_WindSage_Text[4972]["Text552"] = "~HP for 20 times in 1 minute. The lower your battle power is compared to the target`s, the less the fog`s accuracy."
tConquerPromotion_WindSage_Text[4972]["Option551"] = "Thank~you."
tConquerPromotion_WindSage_Text[4972]["Text561"] = "You`ll need to reach at least Level 15 to learn Toxic Fog."
tConquerPromotion_WindSage_Text[4972]["Option561"] = "Okay."

tConquerPromotion_WindSage_Text[4972]["Text571"] = "You`ve learned Poison Star. Only Ninjas who were also Ninjas in their past lives can learn it. It will disable"
tConquerPromotion_WindSage_Text[4972]["Text572"] = "~the target from using medicines for 5 seconds. The lower battle power than the target`s, the less its accuracy."
tConquerPromotion_WindSage_Text[4972]["Option571"] = "Cool."
tConquerPromotion_WindSage_Text[4972]["Text581"] = "Only Dark Ninjas who were also Ninjas in their past lives can learn Poison Star. (Level70+)"
tConquerPromotion_WindSage_Text[4972]["Option581"] = "Got~it."

tConquerPromotion_WindSage_Text[4972]["Text591"] = "You`ve learned Archer Bane! It can disable the target`s Fly skill and deal a certain damages."
tConquerPromotion_WindSage_Text[4972]["Text592"] = "~The lower battle power than the target`s, the less its accuracy."
tConquerPromotion_WindSage_Text[4972]["Option591"] = "Thank~you."
tConquerPromotion_WindSage_Text[4972]["Text5101"] = "You need to be promoted to Ninja Master and reach level 110 to learn Archer Bane."
tConquerPromotion_WindSage_Text[4972]["Option5101"] = "I~see."

-- XP skills
tConquerPromotion_WindSage_Text[4972]["Text611"] = "Which skill do you want to learn?"
tConquerPromotion_WindSage_Text[4972]["Option611"] = "Fatal~Strike~[Lvl~3]"
tConquerPromotion_WindSage_Text[4972]["Option612"] = "Shuriken~Vortex~[Lvl~70]"
tConquerPromotion_WindSage_Text[4972]["Option613"] = "Previous."
tConquerPromotion_WindSage_Text[4972]["Option614"] = "Leave."

tConquerPromotion_WindSage_Text[4972]["Text621"] = "You`ve learned Fatal Strike. It`s a XP skill and the system will notify you when you can use it. When activated, it"
tConquerPromotion_WindSage_Text[4972]["Text622"] = "~will enable the Ninja to appear near the targets and deal melee damage. It will last 30 seconds each time. By the way,"
tConquerPromotion_WindSage_Text[4972]["Text623"] = "~Ninja can only use it against monsters."
tConquerPromotion_WindSage_Text[4972]["Option621"] = "Thank~you."
tConquerPromotion_WindSage_Text[4972]["Text631"] = "You can learn Fatal Strike after you reach level 3."
tConquerPromotion_WindSage_Text[4972]["Option631"] = "I~see."

tConquerPromotion_WindSage_Text[4972]["Text641"] = "You`ve learned Shuriken Vortex. It`s a XP skill and the system will notify you when you can use it. It will last 20 seconds."
tConquerPromotion_WindSage_Text[4972]["Text642"] = "~Ninja will swirl among targets when ejecting lethal Surikens, and meanwhile all damages against Ninja are fixed at 1 point."
tConquerPromotion_WindSage_Text[4972]["Option641"] = "Cool."
tConquerPromotion_WindSage_Text[4972]["Text651"] = "Only Dark Ninja above level 70 can learn Shuriken Vortex."
tConquerPromotion_WindSage_Text[4972]["Option651"] = "I~see."

-- Pure skills
tConquerPromotion_WindSage_Text[4972]["Text711"] = "Only Pure Ninjas can learn the Pure skill, Counter Kill. To be a Pure Ninja you must be reborn twice and be a Ninja in"
tConquerPromotion_WindSage_Text[4972]["Text712"] = "~all previous lives. If you`ve been reborn twice, but are not a Pure Ninja, you cannot learn the secrets of the skill."
tConquerPromotion_WindSage_Text[4972]["Option711"] = "I~see."

tConquerPromotion_WindSage_Text[4972]["Text721"] = "Only Pure Ninjas can learn the Pure skill, Counter Kill. It allows you to dodge an incoming attack and has 30% chance"
tConquerPromotion_WindSage_Text[4972]["Text722"] = "~to summon a duplicate of yourself near the target to strike back. Do you want to learn it now?"
tConquerPromotion_WindSage_Text[4972]["Option721"] = "I~want~to~learn~it~now."
tConquerPromotion_WindSage_Text[4972]["Option722"] = "I`ll~think~about~it."

tConquerPromotion_WindSage_Text[4972]["Text731"] = "You`ve learned the Pure Skill, Counter Kill!"
tConquerPromotion_WindSage_Text[4972]["Option731"] = "Thanks!"

-- string Base skill
tConquerPromotion_WindSage_Text["SkillName"] = {}
tConquerPromotion_WindSage_Text["SkillName"][1] = "Twofold~Blades"
tConquerPromotion_WindSage_Text["SkillName"][2] = "Toxic~Fog"
tConquerPromotion_WindSage_Text["SkillName"][3] = "Poison~Star"
tConquerPromotion_WindSage_Text["SkillName"][4] = "Archer~Bane"
tConquerPromotion_WindSage_Text["SkillName"][5] = "Counter-Kill"
tConquerPromotion_WindSage_Text["SkillName"][6] = "Fatal~Strike"
tConquerPromotion_WindSage_Text["SkillName"][7] = "Shuriken~Vortex"

tConquerPromotion_WindSage_Text["SkillLearn"] = "%s~(Lvl.~%d)"
tConquerPromotion_WindSage_Text["SkillLearnAlready"] = "[Learnt]"

tConquerPromotion_WindSage_Text["Channel2005"] = {}
tConquerPromotion_WindSage_Text["Channel2005"]["LearnSkill"] = "You`ve acquired [%s]. Go practice and feel its power."

--不同阶级职业对应的对白索引
local tConquerWindSage_ProIndex ={}
--职业进阶
tConquerWindSage_ProIndex["ImprovePro"]={}
tConquerWindSage_ProIndex["ImprovePro"][50]={}
tConquerWindSage_ProIndex["ImprovePro"][50]["NextProNeedLevel"] = 15 --需要等级
tConquerWindSage_ProIndex["ImprovePro"][50]["Index"] = "3-1" --满足条件的对白
tConquerWindSage_ProIndex["ImprovePro"][50]["LevelErrorIndex"]="2-1" --满足条件的对白

tConquerWindSage_ProIndex["ImprovePro"][51]={}
tConquerWindSage_ProIndex["ImprovePro"][51]["NextProNeedLevel"] = 40
tConquerWindSage_ProIndex["ImprovePro"][51]["Index"] = "3-2"
tConquerWindSage_ProIndex["ImprovePro"][51]["LevelErrorIndex"] = "2-2"

tConquerWindSage_ProIndex["ImprovePro"][52]={}
tConquerWindSage_ProIndex["ImprovePro"][52]["NextProNeedLevel"] = 70
tConquerWindSage_ProIndex["ImprovePro"][52]["Index"] = "3-3"
tConquerWindSage_ProIndex["ImprovePro"][52]["LevelErrorIndex"] = "2-3"

tConquerWindSage_ProIndex["ImprovePro"][53]={}
tConquerWindSage_ProIndex["ImprovePro"][53]["NextProNeedLevel"] = 100
tConquerWindSage_ProIndex["ImprovePro"][53]["Index"] = "3-4"
tConquerWindSage_ProIndex["ImprovePro"][53]["LevelErrorIndex"] = "2-4"

tConquerWindSage_ProIndex["ImprovePro"][54]={}
tConquerWindSage_ProIndex["ImprovePro"][54]["NextProNeedLevel"]=110
tConquerWindSage_ProIndex["ImprovePro"][54]["Index"] = "3-5"
tConquerWindSage_ProIndex["ImprovePro"][54]["LevelErrorIndex"] = "2-5"
-- 

tConquerWindSage_ProIndex["ImprovePro"][55]={}
tConquerWindSage_ProIndex["ImprovePro"][55]["NextProNeedLevel"]=110
tConquerWindSage_ProIndex["ImprovePro"][55]["Index"]="2-6"

local tConquerWindSage_Cont = {}

tConquerWindSage_Cont["MoonItemId"] = {721051,721052,721020,721021,721022,721023,
	721024,721025,721053,721054,721055,721061,721030,721031,721032,721033,721034,
	721035,721062,721063,721064,721065,721040,721041,721042,721043,721080,721081,
	721082,721083,721084,721090,3306558,3310883}

tConquerWindSage_Cont["Skill"] = {}
-- TwofoldBlades
tConquerWindSage_Cont["Skill"][1] = {}
tConquerWindSage_Cont["Skill"][1]["MagicType"] = 6000
tConquerWindSage_Cont["Skill"][1]["NeedLev"] = 40
tConquerWindSage_Cont["Skill"][1]["Index"] = "5-3"
tConquerWindSage_Cont["Skill"][1]["FailIndex"] = "5-4"
-- ToxicFog
tConquerWindSage_Cont["Skill"][2] = {}
tConquerWindSage_Cont["Skill"][2]["MagicType"] = 6001
tConquerWindSage_Cont["Skill"][2]["NeedLev"] = 70
tConquerWindSage_Cont["Skill"][2]["Index"] = "5-5"
tConquerWindSage_Cont["Skill"][2]["FailIndex"] = "5-6"
-- PoisonStar
tConquerWindSage_Cont["Skill"][3] = {}
tConquerWindSage_Cont["Skill"][3]["MagicType"] = 6002
tConquerWindSage_Cont["Skill"][3]["NeedLev"] = 70
tConquerWindSage_Cont["Skill"][3]["Index"] = "5-7"
tConquerWindSage_Cont["Skill"][3]["FailIndex"] = "5-8"
tConquerWindSage_Cont["Skill"][3]["FlagFailIndex"] = "5-8"
-- ArcherBane
tConquerWindSage_Cont["Skill"][4] = {}
tConquerWindSage_Cont["Skill"][4]["MagicType"] = 6002
tConquerWindSage_Cont["Skill"][4]["NeedLev"] = 110
tConquerWindSage_Cont["Skill"][4]["NeedPro"] = 55
tConquerWindSage_Cont["Skill"][4]["Index"] = "5-9"
tConquerWindSage_Cont["Skill"][4]["FailIndex"] = "5-10"
-- Counter-Kill
tConquerWindSage_Cont["Skill"][5] = {}
tConquerWindSage_Cont["Skill"][5]["MagicType"] = 6003
tConquerWindSage_Cont["Skill"][5]["NeedLev"] = 70
tConquerWindSage_Cont["Skill"][5]["Index"] = "7-3"
tConquerWindSage_Cont["Skill"][5]["FailIndex"] = "7-2"
tConquerWindSage_Cont["Skill"][5]["FlagFailIndex"] = "7-2"
-- FatalStrike
tConquerWindSage_Cont["Skill"][6] = {}
tConquerWindSage_Cont["Skill"][6]["MagicType"] = 6011
tConquerWindSage_Cont["Skill"][6]["NeedLev"] = 1
tConquerWindSage_Cont["Skill"][6]["Index"] = "6-2"
tConquerWindSage_Cont["Skill"][6]["FailIndex"] = "6-3"
-- ShurikenVortex
tConquerWindSage_Cont["Skill"][7] = {}
tConquerWindSage_Cont["Skill"][7]["MagicType"] = 6010
tConquerWindSage_Cont["Skill"][7]["NeedLev"] = 70
tConquerWindSage_Cont["Skill"][7]["Index"] = "6-4"
tConquerWindSage_Cont["Skill"][7]["FailIndex"] = "6-5"


local tConquerWindSage_Log = {}

tConquerWindSage_Log["DelItem"] = "0,0,%d,%d,18000190,2,0,0"


local tConquerWindSage_Reward = {}
-- Level 15
tConquerWindSage_Reward["Improve"] = {}
tConquerWindSage_Reward["Improve"][50] = {}
tConquerWindSage_Reward["Improve"][50]["NeedSpace"] = 3
tConquerWindSage_Reward["Improve"][50]["NextPro"] = 51
tConquerWindSage_Reward["Improve"][50][0] = {}
tConquerWindSage_Reward["Improve"][50][0]["LogId"] = 18000050
tConquerWindSage_Reward["Improve"][50][0]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][50]
tConquerWindSage_Reward["Improve"][50][0]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][50][0]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][50][0]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][50][0]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][50][0]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][50][0]["RewardItem"][2]["Id"] = 730003
tConquerWindSage_Reward["Improve"][50][0]["RewardItem"][2]["Attr"] = "0 2 3"

-- Level 40
tConquerWindSage_Reward["Improve"][51] = {}
tConquerWindSage_Reward["Improve"][51]["NeedSpace"] = 3
tConquerWindSage_Reward["Improve"][51]["NextPro"] = 52
-- No reborn
tConquerWindSage_Reward["Improve"][51][0] = {}
tConquerWindSage_Reward["Improve"][51][0]["LogId"] = 18000051
tConquerWindSage_Reward["Improve"][51][0]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][51]
tConquerWindSage_Reward["Improve"][51][0]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][51][0]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][51][0]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][51][0]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][51][0]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][51][0]["RewardItem"][2]["Id"] = 730004
tConquerWindSage_Reward["Improve"][51][0]["RewardItem"][2]["Attr"] = "0 2 3"
-- 1 reborn
tConquerWindSage_Reward["Improve"][51][1] = {}
tConquerWindSage_Reward["Improve"][51][1]["LogId"] = 18000151
tConquerWindSage_Reward["Improve"][51][1]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][51]
tConquerWindSage_Reward["Improve"][51][1]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][51][1]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][51][1]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][51][1]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][51][1]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][51][1]["RewardItem"][2]["Id"] = 730004
tConquerWindSage_Reward["Improve"][51][1]["RewardItem"][2]["Attr"] = "0 2 3"
-- 2 reborn
tConquerWindSage_Reward["Improve"][51][2] = {}
tConquerWindSage_Reward["Improve"][51][2]["LogId"] = 18000251
tConquerWindSage_Reward["Improve"][51][2]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][51]
tConquerWindSage_Reward["Improve"][51][2]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][51][2]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][51][2]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][51][2]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][51][2]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][51][2]["RewardItem"][2]["Id"] = 730004
tConquerWindSage_Reward["Improve"][51][2]["RewardItem"][2]["Attr"] = "0 2 3"

-- Level 70
tConquerWindSage_Reward["Improve"][52] = {}
tConquerWindSage_Reward["Improve"][52]["NeedSpace"] = 3
tConquerWindSage_Reward["Improve"][52]["NextPro"] = 53
tConquerWindSage_Reward["Improve"][52]["NeedItem"] = 1080001
-- No reborn
tConquerWindSage_Reward["Improve"][52][0] = {}
tConquerWindSage_Reward["Improve"][52][0]["LogId"] = 18000052
tConquerWindSage_Reward["Improve"][52][0]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][52]
tConquerWindSage_Reward["Improve"][52][0]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][52][0]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][52][0]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][52][0]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][52][0]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][52][0]["RewardItem"][2]["Id"] = 730005
tConquerWindSage_Reward["Improve"][52][0]["RewardItem"][2]["Attr"] = "0 2 3"
-- 1 reborn
tConquerWindSage_Reward["Improve"][52][1] = {}
tConquerWindSage_Reward["Improve"][52][1]["LogId"] = 18000152
tConquerWindSage_Reward["Improve"][52][1]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][52]
tConquerWindSage_Reward["Improve"][52][1]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][52][1]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][52][1]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][52][1]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][52][1]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][52][1]["RewardItem"][2]["Id"] = 730005
tConquerWindSage_Reward["Improve"][52][1]["RewardItem"][2]["Attr"] = "0 2 3"
-- 2 reborn
tConquerWindSage_Reward["Improve"][52][2] = {}
tConquerWindSage_Reward["Improve"][52][2]["LogId"] = 18000252
tConquerWindSage_Reward["Improve"][52][2]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][52]
tConquerWindSage_Reward["Improve"][52][2]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][52][2]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][52][2]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][52][2]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][52][2]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][52][2]["RewardItem"][2]["Id"] = 730005
tConquerWindSage_Reward["Improve"][52][2]["RewardItem"][2]["Attr"] = "0 2 3"

-- Level 100
tConquerWindSage_Reward["Improve"][53] = {}
tConquerWindSage_Reward["Improve"][53]["NeedSpace"] = 3
tConquerWindSage_Reward["Improve"][53]["NextPro"] = 54
tConquerWindSage_Reward["Improve"][53]["NeedItem"] = 1088001
-- No reborn
tConquerWindSage_Reward["Improve"][53][0] = {}
tConquerWindSage_Reward["Improve"][53][0]["LogId"] = 18000053
tConquerWindSage_Reward["Improve"][53][0]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][53]
tConquerWindSage_Reward["Improve"][53][0]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][53][0]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][53][0]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][53][0]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][53][0]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][53][0]["RewardItem"][2]["Id"] = 730006
tConquerWindSage_Reward["Improve"][53][0]["RewardItem"][2]["Attr"] = "0 2 3"
-- 1 reborn
tConquerWindSage_Reward["Improve"][53][1] = {}
tConquerWindSage_Reward["Improve"][53][1]["LogId"] = 18000153
tConquerWindSage_Reward["Improve"][53][1]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][53]
tConquerWindSage_Reward["Improve"][53][1]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][53][1]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][53][1]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][53][1]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][53][1]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][53][1]["RewardItem"][2]["Id"] = 730006
tConquerWindSage_Reward["Improve"][53][1]["RewardItem"][2]["Attr"] = "0 2 3"
-- 2 reborn
tConquerWindSage_Reward["Improve"][53][2] = {}
tConquerWindSage_Reward["Improve"][53][2]["LogId"] = 18000253
tConquerWindSage_Reward["Improve"][53][2]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][53]
tConquerWindSage_Reward["Improve"][53][2]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][53][2]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][53][2]["RewardItem"][1]["Id"] = 723700
tConquerWindSage_Reward["Improve"][53][2]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][53][2]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][53][2]["RewardItem"][2]["Id"] = 730006
tConquerWindSage_Reward["Improve"][53][2]["RewardItem"][2]["Attr"] = "0 2 3"

-- Level 110
tConquerWindSage_Reward["Improve"][54] = {}
tConquerWindSage_Reward["Improve"][54]["NeedSpace"] = 5
tConquerWindSage_Reward["Improve"][54]["NextPro"] = 55
tConquerWindSage_Reward["Improve"][54]["NeedItem"] = "MoonBox"
-- No reborn
tConquerWindSage_Reward["Improve"][54][0] = {}
tConquerWindSage_Reward["Improve"][54][0]["LogId"] = 18000054
tConquerWindSage_Reward["Improve"][54][0]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][54]
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][1]["Id"] = 723744
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][1]["Attr"] = "0 1 3"
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][2] = {}
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][2]["Id"] = 123099
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][2]["Attr"] = "0 1 3 0 0 0 0 3 255 0 6 255 255"
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][3] = {}
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][3]["Id"] = 135099
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][3]["Attr"] = "0 1 3 0 0 0 0 3 255 0 6 255 255"
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][4] = {}
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][4]["Id"] = 601219
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][4]["Attr"] = "0 1 3 0 0 0 0 3 255 0 6 255 255"
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][5] = {}
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][5]["Id"] = 601219
tConquerWindSage_Reward["Improve"][54][0]["RewardItem"][5]["Attr"] = "0 1 3 0 0 0 0 3 255 0 6 255 255"
-- 1 reborn
tConquerWindSage_Reward["Improve"][54][1] = {}
tConquerWindSage_Reward["Improve"][54][1]["LogId"] = 18000154
tConquerWindSage_Reward["Improve"][54][1]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][54]
tConquerWindSage_Reward["Improve"][54][1]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][54][1]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][54][1]["RewardItem"][1]["Id"] = 723744
tConquerWindSage_Reward["Improve"][54][1]["RewardItem"][1]["Attr"] = "0 2 3"
-- 2 reborn
tConquerWindSage_Reward["Improve"][54][2] = {}
tConquerWindSage_Reward["Improve"][54][2]["LogId"] = 18000254
tConquerWindSage_Reward["Improve"][54][2]["Talk"] = tConquerPromotion_WindSage_Text["Improve"][54]
tConquerWindSage_Reward["Improve"][54][2]["RewardItem"] = {}
tConquerWindSage_Reward["Improve"][54][2]["RewardItem"][1] = {}
tConquerWindSage_Reward["Improve"][54][2]["RewardItem"][1]["Id"] = 723744
tConquerWindSage_Reward["Improve"][54][2]["RewardItem"][1]["Attr"] = "0 3 3"

--月光宝盒物品判断
function WindSageNpc_GetBagMoonItemId(nNowUserId)
	local nUserId = nNowUserId or Get_UserId()
	
	for i,nItemId in ipairs (tConquerWindSage_Cont["MoonItemId"]) do
		if Item_ChkItem(nItemId, nil, nil, nUserId) then
			return nItemId
		end
	end
	return -1
end

function WindSageNpc_IsNinjaPro(nPro)
    local nUserPro = nPro or Get_UserProfession()
    return G_PRO_Ninja0 <= nUserPro and nUserPro <= G_PRO_Ninja5
end

function WindSageNpc_ImproveProfessionLink()
    --非铁扇门职业
    if not WindSageNpc_IsNinjaPro() then
        return
    end

    local nNpcId = Get_NpcId()
    local nUserPro = Get_UserProfession()
    local nUserLevel = Get_UserLevel()
    local sSexName = WindSageNpc_GetSexName()
    local sNextProName = WindSageNpc_GetNextProName()
    local nNeedLevel = tConquerWindSage_ProIndex["ImprovePro"][nUserPro]["NextProNeedLevel"]
    local nNeedItem = tConquerWindSage_ProIndex["ImprovePro"][nUserPro]["NextProNeedItem"]
    local nNeedItemCount = tConquerWindSage_ProIndex["ImprovePro"][nUserPro]["NextProNeedItemCount"]

    if nUserLevel < nNeedLevel then
        --等级不足对白
        LinkNpcGossipFunc_New(nNpcId,tConquerWindSage_ProIndex["ImprovePro"][nUserPro]["LevelErrorIndex"])
        return 
    end

    --职业进阶
    LinkNpcGossipFunc_New(nNpcId,tConquerWindSage_ProIndex["ImprovePro"][nUserPro]["Index"])
end

--得到性别对应名称
--1，表示男性 --> 师弟
--2，表示女性 --> 师妹
function WindSageNpc_GetSexName()
    local nUserId = Get_UserId()
    local nSex = Get_UserSex(nUserId)
    return tConquerPromotion_WindSage_Text["SexName"][nSex]
end

--得到下一个职业的名称
function WindSageNpc_GetNextProName()
    --非铁扇门职业
    if not WindSageNpc_IsNinjaPro() then
        return ""
    end

    local nUserId = Get_UserId()
    local nUserPro = Get_UserProfession(nUserId)
    local nTemp = nUserPro +1
    local nNextPro = nTemp >= G_PRO_Ninja5 and G_PRO_Ninja5 or nTemp
    return tConquerPromotion_WindSage_Text["ProName"][nNextPro]
end

--选择：我要进阶
function WindSageNpc_Improve()
    --非铁扇门职业
    if not WindSageNpc_IsNinjaPro() then
        return
    end

    local nNpcId = Get_NpcId()

    local nUserPro = Get_UserProfession()
    --已经是最高的职业阶级
    if tConquerWindSage_Reward["Improve"][nUserPro] == nil then
        return
    end

    local nMete = Get_UserMetempsychosis()
    if nMete >= 3 then
        --特转以上不获得奖励
        local nNextProfession = tConquerWindSage_Reward["Improve"][nUserPro]["NextPro"]
        local nSex = Get_UserSex()
        User_SetProfession(nNextProfession)
        User_TalkChannel2005(tConquerPromotion_WindSage_Text["LastImprove"][nNextProfession])
        return
    end

    --背包空间不足
    local nNeedSpace = tConquerWindSage_Reward["Improve"][nUserPro]["NeedSpace"]
    if not User_CheckLeftSpace(nNeedSpace) then
        User_TalkChannel2005(tConquerPromotion_WindSage_Text["NoSpace"])
        return
    end

    --进阶需要的物品判断,进阶最高职业需要消耗月光宝盒
    local nNextProfession = tConquerWindSage_Reward["Improve"][nUserPro]["NextPro"]
    local nNeedItem = tConquerWindSage_Reward["Improve"][nUserPro]["NeedItem"]
	if nNeedItem ~= nil then
		
        if type(nNeedItem) == "string" and nNeedItem == "MoonBox" then
            nNeedItem = WindSageNpc_GetBagMoonItemId(nUserId)
        else
            if not Item_ChkItem(nNeedItem) then
                local sItemName = Get_ItemtypeName(nNeedItem)
                tNpcGossip[4972]["Text431"] = string.format(tConquerPromotion_WindSage_Text[4972]["Text431"],sItemName)
                LinkNpcGossipFunc_New(nNpcId,"4-3")
				return
			end
        end

		if nNeedItem == -1 then
			--没有月光宝盒
			LinkNpcGossipFunc_New(nNpcId,"4-5")
			return
		else
			if not (Item_ChkItem(nNeedItem) and Item_DelItem(nNeedItem)) then
				return
			end
			
			Sys_SaveActionFestivalLog(string.format(tConquerWindSage_Log["DelItem"], nNeedItem, 1),nUserId)
		end

	end

    --就职
    User_SetProfession(nNextProfession)

    if tConquerWindSage_Reward["Improve"][nUserPro][nMete] ~=nil then
        RewardTemplate_Reward(tConquerWindSage_Reward["Improve"][nUserPro][nMete])
    end
end

--得到铁扇门的转世次数，1--1转，2--2转，3--纯转； 未转世或非铁扇门，返回0
function WindSageNpc_GetNinjaMete()
    local nUserId = Get_UserId()
    local nMeteTimes = Get_UserMetempsychosis(nUserId) --玩家转世次数
    local nUserPro = Get_UserProfession(nUserId) --取玩家职业

    --非铁扇门职业
    if not WindSageNpc_IsNinjaPro(nUserPro) then
        return 0
    end

    --转世不满足
    if nMeteTimes < 1 then
        return 0
    end

    --铁扇1转，今世是铁扇门
    if nMeteTimes == 1  then
        --当前世是铁扇门，未转世前也是铁扇门
        --  1转的时候，获得前世职业，需要通过Get_UserFirstPro(nUserId)，前世的职业保留在cq_user的first_prof
        local nOldPro =  Get_UserFirstPro(nUserId)
        if WindSageNpc_IsNinjaPro(nOldPro) then
            return 2
        else
            return 1
        end
    end


    --2转及以上
    if nMeteTimes >= 2 then
        local nOldPro = Get_UserOldPro(nUserId) --取玩家前世职业
        local nUserFirstPro = Get_UserFirstPro(nUserId) --取玩家前前世职业

        if WindSageNpc_IsNinjaPro(nUserFirstPro) and WindSageNpc_IsNinjaPro(nOldPro) then
            return 3 --三世纯转
        elseif (not WindSageNpc_IsNinjaPro(nUserFirstPro)) and WindSageNpc_IsNinjaPro(nOldPro) then
            return 2 --2世都是铁扇门
        else
            return 1 --今世是铁扇门
        end

    end

end

--学习技能
function WindSageNpc_LearnSkill(nIndex, nFlag)
	--非雷神职业
	if not WindSageNpc_IsNinjaPro() then
		return
	end
	
	local nUserId = Get_UserId()
	local sMagicName = tConquerPromotion_WindSage_Text["SkillName"][nIndex]
	
	local nMeteTimes = Get_UserMetempsychosis(nUserId) --玩家转世次数
	
	local nNpcId = Get_NpcId()
	
	--是否上一职业是雷神
	if nFlag == 1 then
		if nMeteTimes < 1 then
			LinkNpcGossipFunc_New(nNpcId, tConquerWindSage_Cont["Skill"][nIndex]["FlagFailIndex"])
			return
		end
		
		local nOldPro = 0
		
		if nMeteTimes == 1 then
			nOldPro = Get_UserFirstPro(nUserId)
		else
			nOldPro = Get_UserOldPro(nUserId)
		end
		
		if not WindSageNpc_IsNinjaPro(nOldPro) then
			Sys_MsgBox(string.format(tConquerPromotion_WindSage_Text["Channel2005"]["NoLearn"], sMagicName))
			return
		end
		
	--是否三世纯转
	elseif nFlag == 2 then
		if nMeteTimes < 2 then
			LinkNpcGossipFunc_New(nNpcId, tConquerWindSage_Cont["Skill"][nIndex]["FlagFailIndex"])
			return
		end
		
		local nOldPro = Get_UserOldPro(nUserId) --取玩家前世职业
		local nUserFirstPro = Get_UserFirstPro(nUserId) --取玩家前前世职业
		
		if not WindSageNpc_IsNinjaPro(nOldPro) or not WindSageNpc_IsNinjaPro(nUserFirstPro) then
			tNpcGossip[nNpcId]["Text541"] = string.format(tConquerPromotion_WindSage_Text[nNpcId]["Text541"],sMagicName)
			LinkNpcGossipFunc_New(nNpcId,"5-4")
			return
		end
	end
	
	local nMagicType = tConquerWindSage_Cont["Skill"][nIndex]["MagicType"]
	local nNeedLev = tConquerWindSage_Cont["Skill"][nIndex]["NeedLev"]
	local nUserLevel = Get_UserLevel()
	
	--已学习
	if Magic_ChkType(nMagicType) then
		tNpcGossip[nNpcId]["Text471"] = string.format(tConquerPromotion_WindSage_Text[nNpcId]["Text471"],sMagicName)
		LinkNpcGossipFunc_New(nNpcId,"4-7")
		return
	end
	
	--等级不足
	if nUserLevel < nNeedLev then
		LinkNpcGossipFunc_New(nNpcId,tConquerWindSage_Cont["Skill"][nIndex]["FailIndex"])
		return
	end

	if tConquerWindSage_Cont["Skill"][nIndex]["NeedPro"] ~= nil and type(tConquerWindSage_Cont["Skill"][nIndex]["NeedPro"]) == "number" then
		local nNeedPro = tConquerWindSage_Cont["Skill"][nIndex]["NeedPro"]
		if nNeedPro ~= Get_UserProfession() then
			LinkNpcGossipFunc_New(nNpcId,tConquerWindSage_Cont["Skill"][nIndex]["FailIndex"])
			return
		end
	end
	
	-- 学习技能
	if not Magic_ChkType(nMagicType) then
		if Magic_Learn(nMagicType) then
			LinkNpcGossipFunc_New(nNpcId,tConquerWindSage_Cont["Skill"][nIndex]["Index"])
			User_TalkChannel2005(string.format(tConquerPromotion_WindSage_Text["Channel2005"]["LearnSkill"],sMagicName))
		end
	else
		tNpcGossip[nNpcId]["Text471"] = string.format(tConquerPromotion_WindSage_Text[nNpcId]["Text471"],sMagicName)
		LinkNpcGossipFunc_New(nNpcId,"4-7")
	end
end

--技能选项对白判断
function WindSageNpc_ChkSkillText(nIndex)
	local nUserId = Get_UserId()
	local nMagicType = tConquerWindSage_Cont["Skill"][nIndex]["MagicType"]
	local nNeedLev = tConquerWindSage_Cont["Skill"][nIndex]["NeedLev"]
	local sMagicName = tConquerPromotion_WindSage_Text["SkillName"][nIndex]
	
	--获取技能对白
	local sText = string.format(tConquerPromotion_WindSage_Text["SkillLearn"], sMagicName, nNeedLev)
	
	--判断是否已经学过
	if Magic_ChkType(nMagicType, nUserId) then
		sText = sText..tConquerPromotion_WindSage_Text["SkillLearnAlready"]
	end
	
	return sText
end

function WindSageNpc_ChkPureNin()
	local nCurrPro = Get_UserProfession()
	local nOldPro = Get_UserOldPro() --取玩家前世职业
	local nUserFirstPro = Get_UserFirstPro() --取玩家前前世职业		
	if not WindSageNpc_IsNinjaPro(nOldPro) or not WindSageNpc_IsNinjaPro(nUserFirstPro) or not WindSageNpc_IsNinjaPro(nCurrPro) then
		return false
	end
	return true
end

tNpcFace[833] = 27

tNpcGossip[4972]= tNpcGossip[4972] or DefaultNpc:new{}
tNpcGossip[4972]["OptionHidden"] = 1
tNpcGossip[4972]["DialogueText"] = tConquerPromotion_WindSage_Text[4972]

--
tNpcGossip[4972]["Text1-1"] = {111}
tNpcGossip[4972]["ChkFunc1-1"] = function()
    if WindSageNpc_IsNinjaPro() then
        return false
    end
    return true
end
tNpcGossip[4972]["tOption1-1"] = {111}

tNpcGossip[4972]["Text1-2"] = {121}
tNpcGossip[4972]["ChkFunc1-2"] = function()
    if not WindSageNpc_IsNinjaPro() then
        return false
    end
    return true
end
tNpcGossip[4972]["tOption1-2"] = {121,122,123,124}
tNpcGossip[4972]["OptionFunc121"] = "WindSageNpc_ImproveProfessionLink"
tNpcGossip[4972]["OptionPoint122"] = "5-1"
tNpcGossip[4972]["OptionPoint123"] = "7-2"

-- Level error messages
-- Level 15
tNpcGossip[4972]["Text2-1"] = {211}
tNpcGossip[4972]["tOption2-1"] = {211}
-- Level 40
tNpcGossip[4972]["Text2-2"] = {221}
tNpcGossip[4972]["tOption2-2"] = {221}
-- Level 70
tNpcGossip[4972]["Text2-3"] = {231}
tNpcGossip[4972]["tOption2-3"] = {231}
-- Level 100
tNpcGossip[4972]["Text2-4"] = {241}
tNpcGossip[4972]["tOption2-4"] = {241}
-- Level 110
tNpcGossip[4972]["Text2-5"] = {251,252}
tNpcGossip[4972]["tOption2-5"] = {251}
-- Already master
tNpcGossip[4972]["Text2-6"] = {261}
tNpcGossip[4972]["tOption2-6"] = {261}

-- Get promoted 
-- Level 15
tNpcGossip[4972]["Text3-1"] = {311}
tNpcGossip[4972]["tOption3-1"] = {311,312}
tNpcGossip[4972]["OptionFunc311"] = "WindSageNpc_Improve"

-- Level 40
tNpcGossip[4972]["Text3-2"] = {321}
tNpcGossip[4972]["tOption3-2"] = {321,322}
tNpcGossip[4972]["OptionFunc321"] = "WindSageNpc_Improve"

-- Level 70
tNpcGossip[4972]["Text3-3"] = {331,332,333}
tNpcGossip[4972]["tOption3-3"] = {331,332}
tNpcGossip[4972]["OptionFunc331"] = "WindSageNpc_Improve"

-- Level 100
tNpcGossip[4972]["Text3-4"] = {341}
tNpcGossip[4972]["tOption3-4"] = {341,342}
tNpcGossip[4972]["OptionFunc341"] = "WindSageNpc_Improve"

-- Level 110
tNpcGossip[4972]["Text3-5"] = {351,352}
tNpcGossip[4972]["tOption3-5"] = {351,352}
tNpcGossip[4972]["OptionFunc351"] = "WindSageNpc_Improve"

-- Required item error
-- Level 70
tNpcGossip[4972]["Text4-3"] = {431}
tNpcGossip[4972]["tOption4-3"] = {431}
-- Level 100
tNpcGossip[4972]["Text4-4"] = {441}
tNpcGossip[4972]["tOption4-4"] = {441}
-- Level 110
tNpcGossip[4972]["Text4-5"] = {451}
tNpcGossip[4972]["tOption4-5"] = {451}

-- Skills
-- Skill already learnt
tNpcGossip[4972]["Text4-7"] = {471}
tNpcGossip[4972]["tOption4-7"] = {471}

-- Learn class skills
tNpcGossip[4972]["Text5-1"] = {511,512}
tNpcGossip[4972]["tOption5-1"] = {511,512,513,514}
tNpcGossip[4972]["OptionPoint511"] = "5-2"
tNpcGossip[4972]["OptionPoint512"] = "6-1"
tNpcGossip[4972]["OptionPoint513"] = "7-2"

tNpcGossip[4972]["Text5-2"] = {521}
tNpcGossip[4972]["tOption5-2"] = {521,522,523,524,525,526}
tNpcGossip[4972]["OptionFunc521"] = "WindSageNpc_LearnSkill</N>1"
tNpcGossip[4972]["OptionChkFunc521"] = function ()
	tNpcGossip[4972]["Option521"] = WindSageNpc_ChkSkillText(1)
	return true
end
tNpcGossip[4972]["OptionFunc522"] = "WindSageNpc_LearnSkill</N>2"
tNpcGossip[4972]["OptionChkFunc522"] = function ()
	tNpcGossip[4972]["Option522"] = WindSageNpc_ChkSkillText(2)
	return true
end
tNpcGossip[4972]["OptionFunc523"] = "WindSageNpc_LearnSkill</N>3</N>1"
tNpcGossip[4972]["OptionChkFunc523"] = function ()
	tNpcGossip[4972]["Option523"] = WindSageNpc_ChkSkillText(3)
	return true
end
tNpcGossip[4972]["OptionFunc524"] = "WindSageNpc_LearnSkill</N>4"
tNpcGossip[4972]["OptionChkFunc524"] = function ()
	tNpcGossip[4972]["Option524"] = WindSageNpc_ChkSkillText(4)
	return true
end
tNpcGossip[4972]["OptionPoint525"] = "5-1"

-- TwofoldBlades
tNpcGossip[4972]["Text5-3"] = {531}
tNpcGossip[4972]["tOption5-3"] = {531}
tNpcGossip[4972]["Text5-4"] = {541}
tNpcGossip[4972]["tOption5-4"] = {541}
-- ToxicFog
tNpcGossip[4972]["Text5-5"] = {551,552}
tNpcGossip[4972]["tOption5-5"] = {551}
tNpcGossip[4972]["Text5-6"] = {561}
tNpcGossip[4972]["tOption5-6"] = {561}
-- PoisonStar
tNpcGossip[4972]["Text5-7"] = {571,572}
tNpcGossip[4972]["tOption5-7"] = {571}
tNpcGossip[4972]["Text5-8"] = {581}
tNpcGossip[4972]["tOption5-8"] = {581}
-- ArcherBane
tNpcGossip[4972]["Text5-7"] = {591,592}
tNpcGossip[4972]["tOption5-7"] = {591}
tNpcGossip[4972]["Text5-8"] = {5101}
tNpcGossip[4972]["tOption5-8"] = {5101}

-- Learn XP Skills
tNpcGossip[4972]["Text6-1"] = {611}
tNpcGossip[4972]["tOption6-1"] = {611,612,613,614}
tNpcGossip[4972]["OptionFunc611"] = "WindSageNpc_LearnSkill</N>6"
tNpcGossip[4972]["OptionChkFunc611"] = function ()
	tNpcGossip[4972]["Option611"] = WindSageNpc_ChkSkillText(6)
	return true
end
tNpcGossip[4972]["OptionFunc612"] = "WindSageNpc_LearnSkill</N>7"
tNpcGossip[4972]["OptionChkFunc612"] = function ()
	tNpcGossip[4972]["Option612"] = WindSageNpc_ChkSkillText(7)
	return true
end
tNpcGossip[4972]["OptionPoint613"] = "5-1"

-- FatalStrike
tNpcGossip[4972]["Text6-2"] = {621,622,623}
tNpcGossip[4972]["tOption6-2"] = {621}
tNpcGossip[4972]["Text6-3"] = {631}
tNpcGossip[4972]["tOption6-3"] = {631}

-- ShurikenVortex
tNpcGossip[4972]["Text6-4"] = {641,642}
tNpcGossip[4972]["tOption6-4"] = {641}
tNpcGossip[4972]["Text6-5"] = {651}
tNpcGossip[4972]["tOption6-5"] = {651}

-- Pure skills
tNpcGossip[4972]["Text7-2"] = {721,722}
tNpcGossip[4972]["tOption7-2"] = {721,722}
tNpcGossip[4972]["OptionFunc721"] = "WindSageNpc_LearnSkill</N>7</N>2"
