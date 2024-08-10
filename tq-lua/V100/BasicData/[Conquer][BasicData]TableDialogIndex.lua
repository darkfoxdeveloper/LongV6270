----------------------------------------------------------------------------
--Name:		[征服][基础数据]中文索引表.lua
--Purpose:	中文索引表
--Creator: 	郑江文
--Created:	2014/08/28
------------------------------------------------------------------------------------
--key为10000~99999
--10000-29999 公用函数、模板逻辑
--30000-59999 功能脚本
--60000-99999 任务脚本
tLuaRes = {}
tLuaRes[10001] = "Eh..."
tLuaRes[10002] = "See~you."
tLuaRes[10003] = "Leave."
tLuaRes[10004] = "The item is useless now, and you threw it away."
tLuaRes[10005] = "Previous."
tLuaRes[10006] = "Next."

tLuaRes[10024] = "%s%s%s%s%s%s%s%s"
tLuaRes[10025] = "%s%s"
tLuaRes[10026] = "%s%s%s"

tBackpackLetter_Text = tBackpackLetter_Text or {}

-----------------------------------测试提示文---------------------------------------
tTestTiShi = {}
tTestTiShi[1] = "Test tip: the player receives %s gold coins. Please note whether gold coins are checked. The upper limit and value are consistent with the document"
tTestTiShi[2] = "Test tip: After deducting players %s gold coins, please note that players do not have gold coins, the amount deducted is correct, the two dialogue to confirm the deduction of money, pay attention to second times the deduction of money detection"
tTestTiShi[3] = "Test tip: Game player %s Tianshi, please pay attention to whether there is a stone ceiling, check with the document is consistent with the numerical"
tTestTiShi[4] = "Test tip: %s net game player Tianshi, please note that no game player's day, whether to deduct the correct quantity and two dialogue confirmation deducting money should pay attention to deduct money second times detection"
tTestTiShi[5] = "Test tip: A game player %s Tianshi, please note whether there is a stone ceiling, with numerical check document consistency"
tTestTiShi[6] = "Test tip: Net game player %s Tianshi, please note that the body did not receive the game player is deducted Tianshi, number of correct and two dialogues confirm deducting money should pay attention to deduct money second times detection"
tTestTiShi[7] = "Test tip: Game player %s game player backpack items, detection space, goods and property check (whether for storage, gifts, blessings, etc.) id items and the number is correct, try will continue to get the goods"
tTestTiShi[8] = "Test tip: Deduct player %s items, items ID and number is correct, two dialogue delete items can deposit, goods recycling, change bonus, need to consider aging and gifts"
tTestTiShi[9] = "Test tip: The player switches the map to see if the player can escape the prison by keeping 101 conversations and 105 frames"
tTestTiShi[10] = "Test tip: For player masks, check the value assigned by the mask. If the task has been set up, take care of the line and see if you can continue the task. Check it every other day"
tTestTiShi[11] = "Error: to the game player a thunder wings, not with God Fenglei wing"
tTestTiShi[12] = "Error: give the player a whip, and the whip can't take the hole"
tTestTiShi[13] = "Error: found to a game player and not God cannot whisk whisk with holes"
tTestTiShi[14] = "Test tip: Be careful！ Equipment good packets can be recovered for Tianshi, please follow the production check"
tTestTiShi[15] = "Test tip: Be careful！ The equipment can be recovered for top grade package Tianshi, please follow the production check"
tTestTiShi[16] = "Test tip: Be careful！ Void transfer can be recovered in conformity with the production of Tianshi, please check."
tTestTiShi[17] = "Test tip: Be careful！ Our system can be recycled for rune Tianshi, please check with the production."
tTestTiShi[18] = "Test tip: Be careful！ Article ID 723725 can be recovered in the basket with the production of Tianshi, please check."
tTestTiShi[19] = "Test tip: Be careful！ Article ID 723727 symbols can be recovered in Qingxin Tianshi, please follow the production check"
tTestTiShi[20] = "Be careful！ Open the box can be recycled for the stone symbol. Please check with the manufacturer"

----------------------------------------------------------------------------
--Name:		[征服][模板逻辑]奖励模板.lua
--Purpose:	奖励模板
--Creator: 	郑鋆
--Created:	2016/03/28
----------------------------------------------------------------------------
-- 默认文字
tRewardTemplate_Text = {}
tRewardTemplate_Text["Main"] = "Received: %s."
tRewardTemplate_Text["Punctuat"] = ", "
tRewardTemplate_Text["RewardMoney"] = "%s Silver"
tRewardTemplate_Text["RewardEMoney"] = "%s CP(s)"
tRewardTemplate_Text["RewardEMoneyMono"] = "%s CP(s) (B)"
tRewardTemplate_Text["RewardItem"] = "%s x%s"
tRewardTemplate_Text["RewardZhenQi"] = "%s Talent(s) for Jiang Hu training"
tRewardTemplate_Text["RewardCultivation"] = "%s Study Point(s)"
tRewardTemplate_Text["RewardStrengthValue"] = "%s Chi Point(s)"
tRewardTemplate_Text["RewardFreePractNum"] = "%s Free Course(s) for Jiang Hu training"
tRewardTemplate_Text["RewardRidingPoint"] = "%s Horse Racing Point(s)"
tRewardTemplate_Text["RewardRepairValue"] = "%s Potency Point(s)"
tRewardTemplate_Text["RewardBless"] = "%s hour(s) of Heaven Blessing"
tRewardTemplate_Text["RewardExp"] = "%s EXP"
tRewardTemplate_Text["RewardExpTime"] = "%s minute(s) of EXP"
tRewardTemplate_Text["RewardExpPercent"] = "%s%% EXP"
tRewardTemplate_Text["RewardBund"] = "(B)"
tRewardTemplate_Text["RewardMulExpTime"] = "%s hour(s) of %sx EXP"
tRewardTemplate_Text["RewardBeans"] = "%s Domino Coins"
tRewardTemplate_Text["RewardGoldenLeague"] = "%s Champion Points"


tRewardTemplate_Text["NoSpace"] = "Please clear at least %s empty space(s) in your inventory, first."
tRewardTemplate_Text["NoItem"] = "Please make sure you have this item in your inventory, first."
tRewardTemplate_Text["FreePract"] = "You`ve already accumulated 100 Free Courses and you can`t get more."
tRewardTemplate_Text["EMoneyMono"] = "You`re carrying the maximum amount of CPs (B) and you can`t get more."
tRewardTemplate_Text["EMoney"] = "You`re carrying the maximum amount of CPs and you can`t get more."
tRewardTemplate_Text["Money"] = "You`re carrying the maximum amount of Silver and you can`t get more."
tRewardTemplate_Text["ZhenQi"] = "You`ve already accumulated 5 Talents and you can`t get more."
tRewardTemplate_Text["RepairValue"] = "You`ve already accumulated lots of Potency Points and you can`t get more."
tRewardTemplate_Text["HaveReceive"] = "You`ve already claimed this reward."
tRewardTemplate_Text["NoMoney"] = "Please make sure you have enough Silver first."
tRewardTemplate_Text["NoEMoney"] = "Please make sure you have enough CPs first."
tRewardTemplate_Text["NoEMoneyMono"] = "Please make sure you have enough CPs (B) first."
-- 未自创武功
tRewardTemplate_Text["GongFu"] = "You haven`t joined the Jiang Hu and can`t get the reward."
-- 银两不足
tRewardTemplate_Text["CostMoney"] = "You don`t have enough Silver."
-- 天石不足
tRewardTemplate_Text["CostEMoney"] = "You don`t have enough CPs."
-- 赠品天石不足
tRewardTemplate_Text["CostEMoneyMono"] = "You don`t have enough CPs (B)."
-- 黄金联赛积分达上限
tRewardTemplate_Text["GoldenLeague"] = "You have accumulated lots of Champion`s Arena points and can`t get more."
-- 属性点达到上限
tRewardTemplate_Text["MaxPoint"] = "Your attribute points have reached the maximum."
-- 欢乐豆（多米诺币）达上限
tRewardTemplate_Text["Beans"] = "You`re carrying the maximum amount of Domino Coins and you can`t get more."


tRewardTemplate_Text["Currency"] = "Received: %s!"
tRewardTemplate_Text["Gift"] = "(B)"
tRewardTemplate_Text["Number"] = " x"
tRewardTemplate_Text["Prescript"] = "-day"
tRewardTemplate_Text["GodBless"] = "% Blessed"
tRewardTemplate_Text["Additional"] = "+"
tRewardTemplate_Text["Hole"] = "-Soc."

tRewardTemplate_Text["TheBeat"] = "Super"
tRewardTemplate_Text["Boutique"] = "Elite"
tRewardTemplate_Text["TopGrade"] = "Unique"
tRewardTemplate_Text["GoodProduct"] = "Refined"
tRewardTemplate_Text["WhiteGoods"] = "Normal"

--赤炼石提示
tRewardTemplate_Text["ItemName"] = {}
tRewardTemplate_Text["ItemName"][730001] = "+1 Stone"
tRewardTemplate_Text["ItemName"][730002] = "+2 Stone"
tRewardTemplate_Text["ItemName"][730003] = "+3 Stone"
tRewardTemplate_Text["ItemName"][730004] = "+4 Stone"
tRewardTemplate_Text["ItemName"][730005] = "+5 Stone"
tRewardTemplate_Text["ItemName"][730006] = "+6 Stone"
tRewardTemplate_Text["ItemName"][730007] = "+7 Stone"
tRewardTemplate_Text["ItemName"][730008] = "+8 Stone"
tRewardTemplate_Text["ItemName"][730009] = "+9 Stone"
tRewardTemplate_Text["NoRuneSpace"] = "Please clear at least %s empty slot in your Rune Bag, first."
tRewardTemplate_Text["Lev"] = "Lv."
tRewardTemplate_Text["Rune"] = "Rune"
tRewardTemplate_Text["RuneName"] = {}
tRewardTemplate_Text["XuanBao"] = {}

-- 花费的通用提示
tRewardTemplate_Text["Consume"] = {}
tRewardTemplate_Text["Consume"]["EMoney"] = "Please make sure you have enough CPs first."
tRewardTemplate_Text["Consume"]["EMoneyMono"] = "Please make sure you have enough CPs (B) first."
tRewardTemplate_Text["Consume"]["Money"] = "Please make sure you have enough Silver first."
tRewardTemplate_Text["Consume"]["StrengthValue"] = "Please make sure you have enough Chi Points first."
tRewardTemplate_Text["Consume"]["Cultivation"] = "Please make sure you have enough Potency Points first."
tRewardTemplate_Text["Consume"]["RidingPoint"] = "Please make sure you have enough Horse Racing Points first."
tRewardTemplate_Text["Consume"]["GoldenLeague"] = "Please make sure you have enough Champion Points first."
tRewardTemplate_Text["Consume"]["DeleteItem"] = "Please make sure you have this item in your inventory, first."
tRewardTemplate_Text["NoComplete"] = "The quest cannot be completed, %s"
