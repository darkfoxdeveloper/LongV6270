----------------------------------------------------------------------------
--Name:		[征服][模板逻辑]基础模板之npc模块.lua
--Purpose:	基础模板之npc模块
--Creator: 	郑江文
--Created:	2014/08/28
----------------------------------------------------------------------------

--//定义基础NPC类
DefaultNpc	=	{
	Text=tLuaRes[10001], --默认对白
	Option=tLuaRes[10002]	 --默认选项
}

function DefaultNpc:new(o)
	o =  o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end

--//cq_NPC接口函数(Action_id=94418000)
function  LinkNpcMain(...)
	local nNpcId = Get_NpcId()
	local nUserId = Get_UserId() or 0
	local arg = {...}

	if tNpcGossip[nNpcId] ~= nil then
		if tNpcGossip[nNpcId]["Emergency"] == 1 then
			return
		end

		tNpcGossip[nNpcId]:NpcProcess(nUserId,nNpcId,arg[1],arg[2],arg[3],arg[4])
	else
		--闲聊表 tNpcGossip 未配置 对白
		Sys_DialogText(tLuaRes[10001],nil,nUserId)
		Sys_DialogOption(tLuaRes[10002],"</F>NULL",nil,nUserId)
		Sys_DialogFace(nNpcId,nUserId)
		Sys_DialogEnd(nUserId)
	end
end

--//基础NPC类的成员函数_流程函数
function DefaultNpc:NpcProcess(nUserId,nNpcId,...)
	--功能 NPC处理
	local arg = {...}
	---print(111111)
	if type(tNpcGossip[nNpcId]["Function"]) == "function" then
		tNpcGossip[nNpcId]["Function"](arg[1],arg[2],arg[3],arg[4])
	else
		--先走入第二套模板，检测["Text1"]字段是否有配置，有则走第二套，无则走第三套。
		tNpcGossip[nNpcId]:AIFunc_New(nNpcId, nil, 0, tNpcGossip[nNpcId]["nPageNum"],nUserId)
	end

	--NPC对话开始选项
	if type(tNpcGossip[nNpcId]["OptionStarFunc"]) == "function" then
		tNpcGossip[nNpcId]["OptionStarFunc"](nNpcId,arg[1],arg[2],arg[3],arg[4])
	end

	--NPC对话结束选项
	if type(tNpcGossip[nNpcId]["OptionEndFunc"]) == "function" then
		tNpcGossip[nNpcId]["OptionEndFunc"](nNpcId,arg[1],arg[2],arg[3],arg[4])
	end

	if not(tNpcGossip[nNpcId]["OptionHidden"] == 1) then
		if tNpcGossip[nNpcId]["Option"] ~= nil and tNpcGossip[nNpcId]["Option"] ~= "" then
			Sys_DialogOption(tNpcGossip[nNpcId]["Option"],"</F>NULL",nil,nUserId)
		else
			Sys_DialogOption(tLuaRes[10003],"</F>NULL",nil,nUserId)
		end
	end
	Sys_DialogFace(nNpcId,nUserId)
	Sys_DialogEnd(nUserId)
end

--[[
@param
nNpcId:传入该NPC的ID
sIndex:从上一层传入的索引ID，第一层为nil传入
nPage:当前第几页选项，0为第一页
nPageNum:每页显示的选项数，默认为5
--]]
function DefaultNpc:AIFunc_New(nNpcId, sIndex, nPage, nPageNum,nUserId)
	local bFirst = false				--是否第一次走入此函数，即是否在NpcProcess所调用的。
	local nPage = nPage or 0			--当前页码，0为第一页
	local nPageNum = nPageNum or 8		--每页显示的选项数
	local nCount = 1					--当前应该显示第几项
	local nFlag = 0						--为0代表没出对白，1代表非指定对白，2代表指定对白
	local n = 1							--存储显示的Text表序号

	--第一层对白，支持条件选择
	if sIndex == nil then
		sIndex = "1"
		bFirst = true --第一层，因为执行完后要回调到NPC模板中，所以不能出现对话框结束的语句
	else
		if string.find(sIndex, "-") == nil then
			nFlag = 0
		else
			nFlag = 2
		end
		bFirst = false
	end

	--对Text进行处理，区分显示指定对白和非指定对白
	if nFlag == 2 then
		if tNpcGossip[nNpcId]["Text"..sIndex] == nil or  tNpcGossip[nNpcId]["Text"..sIndex] == {} then
			return
		end

		if tNpcGossip[nNpcId]["ChkFunc"..sIndex] == nil or (type(tNpcGossip[nNpcId]["ChkFunc"..sIndex]) == "function" and tNpcGossip[nNpcId]["ChkFunc"..sIndex](nUserId) == true) then
			local bDisplay = true

			if tNpcGossip[nNpcId]["ActiveTime"] ~= nil then
				if tNpcGossip[nNpcId]["Display"..sIndex] == 1 then
					bDisplay = LinkNpcGossipFunc_ChkBeforeTime(nNpcId)
				elseif tNpcGossip[nNpcId]["Display"..sIndex] == 2 then
					bDisplay = LinkNpcGossipFunc_ChkAfterTime(nNpcId)
				elseif tNpcGossip[nNpcId]["Display"..sIndex] == 3 then
					bDisplay = LinkNpcGossipFunc_ChkLevel(nNpcId,nUserId)
				else
					bDisplay = LinkNpcGossipFunc_ChkActiveTime(nNpcId)
				end
			end

			if bDisplay then
				for _,v in ipairs(tNpcGossip[nNpcId]["Text"..sIndex]) do
					if tNpcGossip[nNpcId]["Text"..v] ~= nil and tNpcGossip[nNpcId]["Text"..v] ~= "" then
						Sys_DialogText(tNpcGossip[nNpcId]["Text"..v],nil,nUserId)
					end
				end
			end
		else
			return
		end
	else
		for i = 1, 50 do
			if tNpcGossip[nNpcId]["Text"..sIndex.."-"..i] ~= nil and tNpcGossip[nNpcId]["Text"..sIndex.."-"..i] ~= "" then
				--功能对白出现检查函数
				if tNpcGossip[nNpcId]["ChkFunc"..sIndex.."-"..i] == nil or (type(tNpcGossip[nNpcId]["ChkFunc"..sIndex.."-"..i]) == "function" and tNpcGossip[nNpcId]["ChkFunc"..sIndex.."-"..i](nUserId) == true) then
					local bDisplay = true

					if tNpcGossip[nNpcId]["ActiveTime"] ~= nil then
						if tNpcGossip[nNpcId]["Display"..sIndex.."-"..i] == 1 then
							bDisplay = LinkNpcGossipFunc_ChkBeforeTime(nNpcId)
						elseif tNpcGossip[nNpcId]["Display"..sIndex.."-"..i] == 2 then
							bDisplay = LinkNpcGossipFunc_ChkAfterTime(nNpcId)
						elseif tNpcGossip[nNpcId]["Display"..sIndex.."-"..i] == 3 then
							bDisplay = LinkNpcGossipFunc_ChkLevel(nNpcId,nUserId)
						else
							bDisplay = LinkNpcGossipFunc_ChkActiveTime(nNpcId)
						end
					end

					if bDisplay then
						--出对白,最多可以配置5条
						for _,v in ipairs(tNpcGossip[nNpcId]["Text"..sIndex.."-"..i]) do
							if tNpcGossip[nNpcId]["Text"..v] ~= nil and tNpcGossip[nNpcId]["Text"..v] ~= "" then
								Sys_DialogText(tNpcGossip[nNpcId]["Text"..v],nil,nUserId)
							end
						end

						--对白已出，不再检测表中值
						nFlag = 1
						n = i
						break
					end
				end
			else
				break
			end
		end
	end

	--对传入的sIndex进行处理，使指定和非指定对白一致，方便下面的处理
	if nFlag == 2 then
		n = string.sub(sIndex, string.find(sIndex,"-") + 1)
		sIndex = string.sub(sIndex, 1, string.find(sIndex,"-") - 1)
	elseif nFlag == 0 then --没有可以显示的对白
		if bFirst then --第一次进入则显示默认对白否则直接中断
			Sys_DialogText(tNpcGossip[nNpcId]["Text"],nil,nUserId)
			return
		else
			return
		end
	end

	--选项显示部分
	if nFlag ~= 0 then
		--选项存在检查
		if type(tNpcGossip[nNpcId]["tOption"..sIndex.."-"..n]) == "table" and tNpcGossip[nNpcId]["tOption"..sIndex.."-"..n] ~= {} then
			for _, v in ipairs(tNpcGossip[nNpcId]["tOption"..sIndex.."-"..n]) do --检索选项表

				if nCount <= nPageNum and ((_ > nPage * nPageNum and nPage == 0) or (_ > nPage * nPageNum - (2 * nPage - 1) and nPage >= 1)) then --未超过每页选项数
					if tNpcGossip[nNpcId]["Option"..v] ~= nil and tNpcGossip[nNpcId]["Option"..v] ~= "" then --存在该选项
						if tNpcGossip[nNpcId]["OptionChkFunc"..v] == nil or (type(tNpcGossip[nNpcId]["OptionChkFunc"..v]) == "function" and tNpcGossip[nNpcId]["OptionChkFunc"..v](nUserId)) then --ChkFunc判定通过
							local sTemp = ""
							local sFunc = ""
							if tNpcGossip[nNpcId]["OptionPoint"..v] ~= nil and tNpcGossip[nNpcId]["OptionPoint"..v] ~= "" then
								sTemp = tNpcGossip[nNpcId]["OptionPoint"..v]
							else
								sTemp = nil
							end

							if tNpcGossip[nNpcId]["OptionFunc"..v] ~= nil and tNpcGossip[nNpcId]["OptionFunc"..v] ~= "" and type(tNpcGossip[nNpcId]["OptionFunc"..v]) == "string" then
								sFunc = "</F>"..tNpcGossip[nNpcId]["OptionFunc"..v]
							elseif sTemp ~= nil then
								sFunc = "</F>LinkNpcGossipFunc_New</N>"..nNpcId.."</S>"..sTemp.."</N>0</N>"..nPageNum
							else
								sFunc = "</F>NULL"
							end

							Sys_DialogOption(tNpcGossip[nNpcId]["Option"..v], sFunc,nil,nUserId)
							nCount = nCount + 1
							--if nCount < nPageNum then
							--	nCount = nCount + 1
							--end

							if nCount == nPageNum and #tNpcGossip[nNpcId]["tOption"..sIndex.."-"..n] > nPageNum and nPage == 0  then
								local sTemp = sIndex.."-"..n
								Sys_DialogOption(tLuaRes[10006] , "</F>LinkNpcGossipFunc_New</N>"..nNpcId.."</S>"..sTemp.."</N>"..(nPage + 1).."</N>"..nPageNum,nil,nUserId)
								break
							elseif nCount == nPageNum - 1 and #tNpcGossip[nNpcId]["tOption"..sIndex.."-"..n] > nPageNum * (nPage + 1) - 2 * nPage and nPage > 0 then
								local sTemp = sIndex.."-"..n
								Sys_DialogOption(tLuaRes[10006] , "</F>LinkNpcGossipFunc_New</N>"..nNpcId.."</S>"..sTemp.."</N>"..(nPage + 1).."</N>"..nPageNum,nil,nUserId)
								break
							end
						end

					end
				end
			end

			if nPage > 0 then
				local sTemp = sIndex.."-"..n
				Sys_DialogOption(tLuaRes[10005], "</F>LinkNpcGossipFunc_New</N>"..nNpcId.."</S>"..sTemp.."</N>"..(nPage - 1).."</N>"..nPageNum,nil,nUserId)
			end
		end
	end

	--后部处理，区分是否NpcProcess走入的函数
	if not bFirst then
		--Sys_SystemBroadcast("nCount is "..nCount)
		if nCount == 1 then
			Sys_DialogOption(tNpcGossip[nNpcId]["Option"] or tLuaRes[10002], "</F>NULL",nil,nUserId)
		end
		Sys_DialogFace(nNpcId,nUserId)
		Sys_DialogEnd(nUserId)
	end
end

function LinkNpcGossipFunc_New(nNpcId, sIndex, nPage, nPageNum,nUserId)
	return tNpcGossip[nNpcId]:AIFunc_New(nNpcId, sIndex, nPage, nPageNum,nUserId)
end

-- 活动前
function LinkNpcGossipFunc_ChkBeforeTime(nNpcId)
	if tNpcGossip[nNpcId]["ActiveTime"] == nil then
		return true
	end

	return CommonFunc_GetBeforeActivityTime(tNpcGossip[nNpcId]["ActiveTime"])
end

-- 活动中
function LinkNpcGossipFunc_ChkActiveTime(nNpcId)
	if tNpcGossip[nNpcId]["ActiveTime"] == nil then
		return true
	end

	return Sys_ChkFullTime(tNpcGossip[nNpcId]["ActiveTime"])
end

-- 活动后
function LinkNpcGossipFunc_ChkAfterTime(nNpcId)
	if tNpcGossip[nNpcId]["ActiveTime"] == nil then
		return true
	end

	return CommonFunc_GetAfterActivityTime(tNpcGossip[nNpcId]["ActiveTime"])
end

-- 活动中等级不足对白
function LinkNpcGossipFunc_ChkLevel(nNpcId,nUserId)
	-- 判断是否在活动时间内
	if not LinkNpcGossipFunc_ChkActiveTime(nNpcId) then
		return false
	end

	local nLevel = tNpcGossip[nNpcId]["NeedLev"]
	local nMetempsychosis = tNpcGossip[nNpcId]["NeedMetempsychosis"] or 0

	if nLevel == nil then
		return false
	end

	if User_JudgeLevelAndMetempsychosis(nLevel,nMetempsychosis,nUserId) then
		return false
	else
		return true
	end
end

-- 对白服务器启动自动加载
function LinkNpcGossipFunc_Load()
	for i,v in pairs(tNpcGossip) do
		if v["DialogueText"] ~= nil then
			LinkNpcGossipFunc_Judge(i)
		end
	end
end

function LinkNpcGossipFunc_ByKeys(t)
	local a = {}
	for n in pairs(t) do
		a[#a+1] = n
	end
	table.sort(a)
	return a
end

function LinkNpcGossipFunc_Judge(nNpcId)
	local tTable = LinkNpcGossipFunc_ByKeys(tNpcGossip[nNpcId])

	for i,v in pairs(tTable) do
		if string.find(v,"Text") and string.find(v,"-") then
			for m,n in pairs(tNpcGossip[nNpcId][v]) do
				if tNpcGossip[nNpcId]["DialogueText"]["Text" .. n] ~= nil then
					tNpcGossip[nNpcId]["Text" .. n] = tNpcGossip[nNpcId]["DialogueText"]["Text" .. n]
				end
			end
		elseif string.find(v,"tOption") then
			for m,n in pairs(tNpcGossip[nNpcId][v]) do
				if tNpcGossip[nNpcId]["DialogueText"]["Option" .. n] ~= nil then
					tNpcGossip[nNpcId]["Option" .. n] = tNpcGossip[nNpcId]["DialogueText"]["Option" .. n]
				end
			end
		end
	end
end

-------------------------NPC非任务对白模块示例-------------------------------
tServerStart["tFunction"] = tServerStart["tFunction"] or {}
table.insert(tServerStart["tFunction"],LinkNpcGossipFunc_Load)
