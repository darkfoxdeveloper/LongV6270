----------------------------------------------------------------------------
--Name:		[征服][公用函数]程序触发.lua
--Purpose:	程序触发
--Creator: 	郑江文
--Created:	2014/12/18

--玩家杀人触发
-- 参数1：玩家id
-- 参数2：目标玩家id
function Event_Kill_User(nUserId,nTargetId)
	-- local nKillerId = Get_UserId()

	--各自活动有需求死亡的逻辑封装成函数插入表中。
	local nEvent_Loop = 0
	if type(tUserKilled["tFunction"]) == "table" then
		for _,func in ipairs(tUserKilled["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 Event_Kill_User 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nTargetId)
			end
		end
	end
end

-- 玩家使用复活触发
-- 参数1：玩家id
-- 参数2：目标玩家id
function Event_Save_User(nUserId,nTargetId)
	local nEvent_Loop = 0
	if type(tUserSave["tFunction"]) == "table" then
		for _,func in ipairs(tUserSave["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 Event_Save_User 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nTargetId)
			end
		end
	end
end

-- 玩家使用锁人触发
-- 参数1：施放者id
-- 参数2：目标id
function Event_KeepGhost(nUserId,nTargetId)
	local nEvent_Loop = 0
	if type(tKeepGhost["tFunction"]) == "table" then
		for _,func in ipairs(tKeepGhost["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 Event_KeepGhost 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nTargetId)
			end
		end
	end
end

-- 玩家使用解锁
-- 参数1：玩家id
-- 参数2：目标玩家id
function Event_ClearKeepGhost(nUserId,nTargetId)
	local nEvent_Loop = 0
	if type(tClearKeepGhost["tFunction"]) == "table" then
		for _,func in ipairs(tClearKeepGhost["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 Event_ClearKeepGhost 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nTargetId)
			end
		end
	end
end

-- 个人排位赛：	赢场：
-- 参1，玩家id，参2，场数
function UserArenicWins(nUserId,nFieldNum)
	local nEvent_Loop = 0
	if type(tArenicWins["tFunction"]) == "table" then
		for _,func in ipairs(tArenicWins["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 UserArenicWins 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFieldNum)
			end
		end
	end
end

-- 个人排位赛：	参赛场：
-- 参1，玩家id，参2，场数
function UserArenicCompetes(nUserId,nFieldNum)
	local nEvent_Loop = 0
	if type(tArenicCompetes["tFunction"]) == "table" then
		for _,func in ipairs(tArenicCompetes["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 UserArenicCompetes 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFieldNum)
			end
		end
	end
end

-- 组队排位赛：	赢场：
-- 参1，玩家id，参2，场数
function TeamArenicWins(nUserId,nFieldNum)
	local nEvent_Loop = 0
	if type(tTeamArenicWins["tFunction"]) == "table" then
		for _,func in ipairs(tTeamArenicWins["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 TeamArenicWins 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFieldNum)
			end
		end
	end
end

-- 组队排位赛：	参赛场：
-- 参1，玩家id，参2，场数
function TeamArenicCompetes(nUserId,nFieldNum)
	local nEvent_Loop = 0
	if type(tTeamArenicCompetes["tFunction"]) == "table" then
		for _,func in ipairs(tTeamArenicCompetes["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 TeamArenicCompetes 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFieldNum)
			end
		end
	end
end

-- 骑宠，玩家冲过终点是触发
-- 参数1，玩家ID
function RideArriveTerminal(nUserId)
	local nEvent_Loop = 0
	if type(tRideArrive["tFunction"]) == "table" then
		for _,func in ipairs(tRideArrive["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 RideArriveTerminal 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId)
			end
		end
	end
end

-- 武功，每次修炼时触发：
-- 参数1：玩家id 参数2：玩家当日修炼次数
function TrainingGongfu(nUserId,nTrainNum)
	local nEvent_Loop = 0
	if type(tTrainGongFu["tFunction"]) == "table" then
		for _,func in ipairs(tTrainGongFu["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 TrainingGongfu 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nTrainNum)
			end
		end
	end
end

-- 服务端启动触发
function Event_Server_Start()
	local nEvent_Loop = 0
	if type(tServerStart["tFunction"]) == "table" then
		for _,func in ipairs(tServerStart["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 Event_Server_Start 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func()
			end
		end
	end
end

-- 添加内功转换
-- 第一个参数是目标玩家ID
function InnerStrength_Exchange(nChangeUserId,nUserId)
	-- local nUserId = Get_UserId()
	local nEvent_Loop = 0
	if type(tStrengthExchange["tFunction"]) == "table" then
		for _,func in ipairs(tStrengthExchange["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 InnerStrength_Exchange 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nChangeUserId)
			end
		end
	end
end

-- 2016.01.07 添加外套仓库类函数
-- 放入外套到外套仓库调用的接口，玩家每次放物品到外套仓库时调用
function UserCheckInItemToCoatStorage(nUserId,nFlag)
	local nEvent_Loop = 0
	if type(tCheckInItemToCoatStorage["tFunction"]) == "table" then
		for _,func in ipairs(tCheckInItemToCoatStorage["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 UserCheckInItemToCoatStorage 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFlag)
			end
		end
	end
end

-- 2、从外套仓库中取出外套调用的LUA接口，玩家每次从外套仓库中取出物品时调用
function UserCheckOutItemFromCoatStorage(nUserId,nFlag)
	local nEvent_Loop = 0
	if type(tCheckOutItemFromCoatStorage["tFunction"]) == "table" then
		for _,func in ipairs(tCheckOutItemFromCoatStorage["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 UserCheckOutItemFromCoatStorage 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFlag)
			end
		end
	end
end

-- 服务端调用的lua接口
--//练气成功后的操作
-- 函数名：ProcessAfterTrainingVitality
-- 参数1：玩家id

function ProcessAfterTrainingVitality(nUserId)
	local nEvent_Loop = 0
	if type(tProcessTrainingVitality["tFunction"]) == "table" then
		for _,func in ipairs(tProcessTrainingVitality["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 ProcessAfterTrainingVitality 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId)
			end
		end
	end
end

-- //修炼自创武功，替换属性后的操作
-- 函数名：ProcessAfterReplaceGongfuValue
-- 参数1：玩家id
-- 参数2：属性是否变化

function ProcessAfterReplaceGongfuValue(nUserId,nFlag)
	local nEvent_Loop = 0
	if type(tReplaceGongfuValue["tFunction"]) == "table" then
		for _,func in ipairs(tReplaceGongfuValue["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 ProcessAfterReplaceGongfuValue 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFlag)
			end
		end
	end
end

-- //战旗赛结束后的操作
-- 函数名：ProcessAfterVexillum
-- 无参数：
function ProcessAfterVexillum()
	local nEvent_Loop = 0
	if type(tAfterVexillum["tFunction"]) == "table" then
		for _,func in ipairs(tAfterVexillum["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 ProcessAfterVexillum 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func()
			end
		end
	end
end

-- 2016.02.16
-- 外套仓库内删除外套时触发。例如：时效外套到期后消失
function DelUserItemFromCoatStorage(nUserId,nFlag)
	local nEvent_Loop = 0
	if type(tDelUserItemFromCoatStorage["tFunction"]) == "table" then
		for _,func in ipairs(tDelUserItemFromCoatStorage["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 DelUserItemFromCoatStorage 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFlag)
			end
		end
	end
end

-- 2016.05.17  战士翻身
-- 发奖调用的lua接口：(备注：此接口请尽量只做通过发邮件lua接口发送奖励的操作)
-- 智力竞赛个人奖励：
-- QuizPersonalReward(idUser)

function QuizPersonalReward(nUserId)
	local nEvent_Loop = 0
	if type(tQuizPersonalReward["tFunction"]) == "table" then
		for _,func in ipairs(tQuizPersonalReward["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 QuizPersonalReward 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId)
			end
		end
	end
end

-- 智力竞赛排行奖励：
-- QuizRankingsReward(idUser, nRank)
function QuizRankingsReward(nUserId,nRank)
	local nEvent_Loop = 0
	if type(tQuizRankingsReward["tFunction"]) == "table" then
		for _,func in ipairs(tQuizRankingsReward["tFunction"]) do
			if nEvent_Loop > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 QuizRankingsReward 中 [for]循环超过1000次！")
				break
			end
			nEvent_Loop = nEvent_Loop + 1
			if func ~= nil and type(func) == "function" then
				func(nUserId,nRank)
			end
		end
	end
end
