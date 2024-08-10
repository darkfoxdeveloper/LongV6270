----------------------------------------------------------------------------
--Name:		[征服][公用函数]物品函数.lua
--Purpose:	物品函数接口
--Creator: 	林锦
--Created:	2014/06/26
----------------------------------------------------------------------------
---------------------------------命名规范----------------------------------
------------------------------actiontype的分类------------------------------
--Sys  物品所有
--Send 消息发送
--Get  获得属性
--Set  修改属性
--Chk  检查属性
--Del  删除属性
--Add  添加属性
------------------------------------------------------------------------------
-- 物品函数命名前缀词：Item_
--例子：
--(fn_DeleteItem, "DeleteItem");//删除物品，参1:玩家ID, 参2:物品类型ID, 参3:数量, 参4:是否判断物品为乾坤袋

--function Item_DelItem(nUserId,nItemtypeId,nNum,bSash)
--
--end

------------------------------------------------------------------------------

--(fn_DeleteTaskItem, "DeleteTaskItem");		//删除任务物品  		参1:玩家ID, 参2:物品ID
--nItemId --对应cq_item表的id
function Item_DelTaskItem(nItemId,nUserId)
	if nItemId == nil then 
		nItemId = 0
	elseif type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_DelTaskItem 的 [nItemId]:[".. nItemId .."] 必须为整数且大于0。")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_DelTaskItem 中 [nItemId]:[".. nItemId .."] 的 nUserId 必须为整数且不小于0。")
		return
	end
	
	local nItemTypeId = Get_ItemType(nItemId)
	
	if Item_ChkItem(nItemTypeId) then
		return DeleteTaskItem(nUserId,nItemId)
	else
		Sys_SaveAbnormalLog(string.format("函数Item_DelTaskItem中玩家ID为%d背包里ID位%d的物品。",nUserId,nItemTypeId))
		return
	end
end

--(fn_DeleteItem, "DeleteItem");			//删除物品  			参1:玩家ID, 参2:物品类型ID, 参3:是否为赠品, 参4:是否判断物品为乾坤袋
--nItemNum,nSash为可选参数，默认值0
function Item_DelItem(nItemId,nMonopoly,nSash,nUserId)
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_DelItem 的 [nItemId]:[".. nItemId .."] 必须为整数且大于0。")
		return
	end
	
	if nMonopoly == nil then 
	   nMonopoly = 1
	elseif type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelItem 中 [nItemId]:[".. nItemId .."] 的 nMonopoly 必须为整数且不小于0。")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelItem 中 [nItemId]:[".. nItemId .."] 的 nSash 必须为整数且不小于0。")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_DelItem 中 [nItemId]:[".. nItemId .."] 的 nUserId必须为整数且不小于0。")
		return
	end
	-- 特殊段的物品不能删除时效物品
	local nSaveTime = RewardTemplate_DelSaveItem(nItemId,1)
	if Item_ChkMulItem(nItemId,nItemId,1,nMonopoly,nSash,nUserId,nSaveTime) then
		local sUserName = Get_UserName(nUserId)
		if sUserName ~= nil then
			if string.find(sUserName,"PM") then
				User_TalkChannel2005(string.format(tTestTiShi[8],Get_ItemtypeName(nItemId)),nUserId)
			end
		end
		if DeleteMultiItem(nUserId,nItemId,nItemId,1,nMonopoly,nSash,nSaveTime) then
			CommonFunc_Printing(nItemId,1,2,nUserId)
			return true
		else
			error("user have no item")
			return false
		end
	else
		Sys_SaveAbnormalLog(string.format("函数DeleteItem中玩家ID为%d背包里没有物品%d。",nUserId,nItemId))
		error("user have no item")
		return
	end
end

--(fn_DeleteMultiItem, "DeleteMultiItem");	//删除多个物品			参1:玩家ID, 参2:物品1类型ID, 参3:物品2类型ID, 参4:物品数量, 参5:能否使用赠品, 参6:是否判断物品为乾坤袋
--nMonopoly,nSash为可选参数，默认值0
function Item_DelMulItem(nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash,nUserId,nSaveTime)
	if type(nStartItemId) ~= "number" or nStartItemId <= 0 or nStartItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_DelMulItem 的 [nStartItemId]:[".. nStartItemId .."] 必须为整数且大于0。")
		return
	end
	
	if type(nEndItemId) ~= "number" or nEndItemId <= 0 or  tonumber(nEndItemId) < tonumber(nStartItemId) or nEndItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelMulItem 的 [nEndItemId]:[".. nEndItemId .."] 必须为大于0的整数,且要大于nStartItemId。")
		return
	end
	
	if type(nItemNum) ~= "number" or nItemNum <= 0 or nItemNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的 nItemNum 必须为整数且大于0。")
		return
	end
	
	if nMonopoly == nil then 
	   nMonopoly = 1
	elseif type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的 nMonopoly 必须为整数且不小于0。")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的 nSash 必须为整数且不小于0。")
		return
	end
	
	if nSaveTime == nil then
		nSaveTime = 1
	elseif type(nSaveTime) ~= "number" or nSaveTime < 0 or nSaveTime%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的 nSaveTime 必须为大于等于0的整数。")
		return
	end	
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_DelMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的 nUserId 必须为整数且不小于0。")
		return
	end
	-- 特殊段的物品不能删除时效物品
	nSaveTime = RewardTemplate_DelSaveItem(nStartItemId,nSaveTime)
	
	if Item_ChkMulItem(nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash,nUserId,nSaveTime) then
		local sUserName = Get_UserName(nUserId)
		if sUserName ~= nil then
			if string.find(sUserName,"PM") then
				User_TalkChannel2005(string.format(tTestTiShi[8],Get_ItemtypeName(nStartItemId)),nUserId)
			end
		end
		
		Sys_SetDelItemLog(nStartItemId,nUserId)
		if DeleteMultiItem(nUserId,nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash,nSaveTime) then
			CommonFunc_Printing(nStartItemId,nItemNum,2,nUserId)
			return true
		else
			error("user have no item")
			return false
		end
	else
		Sys_SaveAbnormalLog(string.format("函数DeleteMultiItem中玩家ID为%d背包里没有%d个ID为%d到%d的物品。",nUserId,nItemNum,nStartItemId,nEndItemId))
		error("user have no item")
		return
	end
end

--(fn_DelAllItemByType, "DelAllItemByType");	//删除所有某类型物品		参1:玩家ID, 参2:物品类型,		失败返回false，否则返回true
--参数说明： nItemId ：表示物品ID， nUserId ：表示玩家ID
function Item_DelAllItemByType(nItemId,nUserId)
	if type(nItemId) ~= "number" then
		Sys_SaveAbnormalLog("函数 Item_DelAllItemByType 中 [nItemId]:[".. nItemId .."] 只能传大于0的整数")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("函数 Item_DelAllItemByType 中 [nItemId]:[".. nItemId .."] 的 nUserId 只能传大于0的整数")
		return
	end
	
	if Item_ChkItem(nItemId,nil,nil,nUserId) then
		Sys_SetDelItemLog(nItemId,nUserId)
		return DelAllItemByType(nUserId,nItemId)
	else
		Sys_SaveAbnormalLog(string.format("函数DelAllItemByType中玩家ID为%d背包里没有ID为%d的物品。",nUserId,nItemId))
		return
	end
end


--(fn_CheckItem, "CheckItem");			//检查物品  			参1:玩家ID, 参2:物品类型ID, 参3:能否使用赠品, 参4:是否判断物品为乾坤袋
--nMonopoly,nSash为可选参数，默认值0
function Item_ChkItem(nItemId,nMonopoly,nSash,nUserId)
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkItem 的 [nItemId]:[".. nItemId .."] 必须为整数且大于0。")
		return
	end
	
	if nMonopoly == nil then 
	   nMonopoly = 1
	elseif type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkItem 中 [nItemId]:[".. nItemId .."] 的 nMonopoly 必须为整数且不小于0。")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkItem 中 [nItemId]:[".. nItemId .."] 的 nSash 必须为整数且不小于0。")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_ChkItem 中 [nItemId]:[".. nItemId .."] 的 nUserId 必须为整数且不小于0。")
		return
	end
	
	return CheckMultiItem(nUserId,nItemId,nItemId,1,nMonopoly,nSash,1)
end

--(fn_CheckMultiItem, "CheckMultiItem");		//检查多个物品			参1:玩家ID, 参2:物品1类型ID, 参3:物品2类型ID, 参4:物品数量, 参5:能否使用赠品, 参6:是否判断物品为乾坤袋
--nMonopoly,nSash为可选参数，默认值0
function Item_ChkMulItem(nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash,nUserId,nSaveTime)
	if type(nStartItemId) ~= "number" or nStartItemId <= 0 or nStartItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkMulItem 的 [nStartItemId]:[".. nStartItemId .."] 必须为整数且大于0。")
		return
	end
	
	if type(nEndItemId) ~= "number" or nEndItemId <= 0 or nEndItemId%1 ~= 0 or tonumber(nEndItemId) < tonumber(nStartItemId) then
		Sys_SaveAbnormalLog("函数 Item_ChkMulItem 的 [nEndItemId]:[".. nEndItemId .."] 必须为大于0的整数,且要大于nStartItemId。")
		return
	end
	
	if type(nItemNum) ~= "number" or nItemNum <= 0 or nItemNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的 nItemNum 必须为整数且大于0. nItemNum=" .. nItemNum)
		return
	end

	if nMonopoly == nil then 
	   nMonopoly = 1
	elseif type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的 nMonopoly 必须为整数且不小于0。")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的 nSash必须为整数且不小于0。")
		return
	end
	
	if nSaveTime == nil then 
	   nSaveTime = 1
	elseif type(nSaveTime) ~= "number" or nSaveTime < 0 or nSaveTime%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的 nSaveTime 必须为整数且不小于0。")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_ChkMulItem 中 [nStartItemId,nEndItemId]:[".. nStartItemId ..",".. nEndItemId .."] 的nUserId必须为整数且不小于0。")
		return
	end
	
	return CheckMultiItem(nUserId,nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash,nSaveTime)
end

--(fn_CheckAccumulate, "CheckAccumulate");	//检查物品类型			参1:玩家ID, 参2:物品类型ID, 参3:数量, 参4:是否判断物品为乾坤袋
--nItemNum,nSash为可选参数，nItemNum默认值1,nSash默认值0
function Item_ChkAccItem(nItemId,nItemNum,nSash,nUserId)
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkAccItem 的 [nItemId]:[".. nItemId .."] 必须为整数且大于0。")
		return
	end
	
	if nItemNum == nil then 
	   nItemNum = 1
	elseif type(nItemNum) ~= "number" or nItemNum < 0 or nItemNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkAccItem 中 [nItemId]:[".. nItemId .."] 的 nItemNum 必须为整数且不小于0。")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_ChkAccItem 中 [nItemId]:[".. nItemId .."] 的 nSash 必须为整数且不小于0。")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_ChkAccItem 中 [nItemId]:[".. nItemId .."] 的 nUserId 必须为整数且不小于0。")
		return
	end

	return CheckAccumulate(nUserId,nItemId,nItemNum,nSash)
end

-- 额外的物品ID处理
local tItem_IDConversion = {}
	-- 清心符ID 723727 转换成 720128
	tItem_IDConversion[723727] = 720128
	-- 夏威夷阳光外套ID 194795 转换成 189725
	tItem_IDConversion[194795] = 189725
	-- 夏威夷阳光外套【泡泡版】ID 194825 转换成 189735
	tItem_IDConversion[194825] = 189735
	-- 冰雪奇缘外套ID 193305 转换成 193505
	tItem_IDConversion[193305] = 193505
	-- 昆仑雪水ID 722700 转换成 723017
	tItem_IDConversion[722700] = 723017
	-- WizardRobeID 192311 转换成 192645
	tItem_IDConversion[192311] = 192645

function Item_Additional(nItemId)
	-- 判断是否要转换ID
	if tItem_IDConversion[nItemId] ~= nil then
		return tItem_IDConversion[nItemId]
	end

	return nItemId
end

-- 金币服特殊处理
function Item_GoldServer(nItemId)
	local tGold = {723713,723714,723715,723716,723717,723718,723719,723720,723721,723722,723723}
	
	for i,v in pairs(tGold) do
		if v == nItemId then
			return 723341
		end
	end
	
	return nItemId
end

-- 以下礼包只能给赠品属性
local tItem_Monopoly = {}
	tItem_Monopoly[3000060] = true
	tItem_Monopoly[3000061] = true
	tItem_Monopoly[3000062] = true
	tItem_Monopoly[3000063] = true
	tItem_Monopoly[3001408] = true
	tItem_Monopoly[3001409] = true
	tItem_Monopoly[3001410] = true
	tItem_Monopoly[3001411] = true
	tItem_Monopoly[3001412] = true
	tItem_Monopoly[3001413] = true
	
-- 以下物品只能给非赠属性，10月新服特殊服务器专用
local tItem_poly = {}
tItem_poly["Horse"] = {}
tItem_poly["Horse"][0] = 730001
tItem_poly["Horse"][1] = 730001
tItem_poly["Horse"][2] = 730002
tItem_poly["Horse"][3] = 730003
tItem_poly["Horse"][4] = 730004
tItem_poly["Horse"][5] = 730005
tItem_poly["Horse"][6] = 730006
tItem_poly["Horse"][7] = 730007
tItem_poly["Horse"][8] = 730008
tItem_poly["Horse"][9] = 730008
tItem_poly["Horse"][10] = 730008
tItem_poly["Horse"][11] = 730008
tItem_poly["Horse"][12] = 730008

tItem_poly["Num"] = 6
tItem_poly["GlobalId"] = 53779
tItem_poly["Split"] = {}
tItem_poly["Split"][101] = true
tItem_poly["Split"][102] = true
tItem_poly["Split"][111] = true
tItem_poly["Split"][112] = true
tItem_poly["Split"][113] = true
tItem_poly["Split"][114] = true
tItem_poly["Split"][115] = true
tItem_poly["Split"][116] = true
tItem_poly["Split"][117] = true
tItem_poly["Split"][118] = true
tItem_poly["Split"][120] = true
tItem_poly["Split"][121] = true
tItem_poly["Split"][123] = true
tItem_poly["Split"][130] = true
tItem_poly["Split"][131] = true
tItem_poly["Split"][132] = true
tItem_poly["Split"][133] = true
tItem_poly["Split"][134] = true
tItem_poly["Split"][135] = true
tItem_poly["Split"][136] = true
tItem_poly["Split"][137] = true
tItem_poly["Split"][138] = true
tItem_poly["Split"][139] = true
tItem_poly["Split"][141] = true
tItem_poly["Split"][142] = true
tItem_poly["Split"][143] = true
tItem_poly["Split"][144] = true
tItem_poly["Split"][145] = true
tItem_poly["Split"][146] = true
tItem_poly["Split"][147] = true
tItem_poly["Split"][148] = true
tItem_poly["Split"][150] = true
tItem_poly["Split"][151] = true
tItem_poly["Split"][152] = true
tItem_poly["Split"][160] = true
tItem_poly["Split"][170] = true
tItem_poly["Split"][410] = true
tItem_poly["Split"][420] = true
tItem_poly["Split"][421] = true
tItem_poly["Split"][430] = true
tItem_poly["Split"][440] = true
tItem_poly["Split"][450] = true
tItem_poly["Split"][460] = true
tItem_poly["Split"][480] = true
tItem_poly["Split"][481] = true
tItem_poly["Split"][490] = true
tItem_poly["Split"][500] = true
tItem_poly["Split"][510] = true
tItem_poly["Split"][511] = true
tItem_poly["Split"][530] = true
tItem_poly["Split"][540] = true
tItem_poly["Split"][560] = true
tItem_poly["Split"][561] = true
tItem_poly["Split"][562] = true
tItem_poly["Split"][580] = true
tItem_poly["Split"][601] = true
tItem_poly["Split"][610] = true
tItem_poly["Split"][611] = true
tItem_poly["Split"][612] = true
tItem_poly["Split"][613] = true
tItem_poly["Split"][614] = true
tItem_poly["Split"][616] = true
tItem_poly["Split"][617] = true
tItem_poly["Split"][619] = true
tItem_poly["Split"][620] = true
tItem_poly["Split"][622] = true
tItem_poly["Split"][624] = true
tItem_poly["Split"][626] = true
tItem_poly["Split"][670] = true
tItem_poly["Split"][671] = true
tItem_poly["Split"][680] = true
tItem_poly["Split"][681] = true
tItem_poly["Split"][900] = true

function Item_newSplit(nItemId)
	local nNum = tonumber(string.sub(nItemId,1,3))
	return nNum,#tostring(nItemId)
end

--如果是有追加的装备给小极品,
function Item_AddSplit(nItemId)
	local nNum = tonumber(string.sub(nItemId,1,5))
	return nNum
end


--10月新服2特殊段处理
function Item_poly(nItemId,monopoly,magic3)
	--nTip字段，默认0，1代表追加装备，2代表马匹
	local nTip = 0
	--判断是否是10月新服2
	local nGetGlobalId = Get_SysDynaGlobalData0(tItem_poly["GlobalId"])
	if nGetGlobalId == 0 then
		return monopoly,nTip
	end
	
	local nMonopoly = monopoly
	local nlocation,nlength = Item_newSplit(nItemId)
	if nlength == tItem_poly["Num"] and tItem_poly["Split"][nlocation] and monopoly == 3 then
		nMonopoly = 0
		if magic3 ~= nil and magic3 ~= 0 then
			nTip = 1
		end
	end
	
	if nItemId == 300000 then
		nMonopoly = 3
		nTip = 2
	end
	
	return nMonopoly,nTip
end

function Item_Monopoly(nItemId,monopoly,nNowUserId)
	local nMonopoly = monopoly
	
	if tItem_Monopoly[nItemId] and monopoly == 0 then
		nMonopoly = 3
	end
	
	local nUserId = nNowUserId
	
	if nUserId == nil or nUserId == 0 then
		nUserId = Get_UserId()
	end

	if tRewardTemplate_Inherit[nUserId] then
		local nItemMonopoly = Get_ItemtypeMonopoly(nItemId)
		
		if nItemMonopoly == 0 and nMonopoly == 0 then
			nMonopoly = 3
		end
	end
	
	return nMonopoly
end
-- 判断是否是可添加神佑属性的
function Item_GodBlessItem(nItemId)
	for i,v in pairs(tGodBlessItem) do
		if nItemId >= v[1] and nItemId <= v[2] then
			return true
		end
	end
	
	return false
end

-- 判断ID是否属于外套段
function Item_ChkCoatItem(nItemId)
	if nItemId >= tEquipItem[1][1] and nItemId <= tEquipItem[1][2] then
		return true
	end

	if nItemId >= tEquipItem[2][1] and nItemId <= tEquipItem[2][2] then
		return true
	end

	return false
end

-- 可追加和打洞的ID段
function Item_MakeAHole(nItemId)
	for i,v in pairs(tAdditionalItem) do
		if nItemId >= v[1] and nItemId <= v[2] then
			return true
		end
	end
	
	return false
end

-- 星陨石默认给非赠，2天激活时效
function Item_Asteroids(nItemId,nMonopoly,nSaveTime,nActive)
	if nItemId < 3009000 or nItemId > 3009003 then
		return nMonopoly,nSaveTime,nActive
	end
	
	return 0,2880,1
end

-- 法器默认不给神佑（添加外套默认给神佑1）
function Item_Instrument(nItemId,nGodBless)
	-- 判断是否属于外套段
	if Item_ChkCoatItem(nItemId) then
		if nGodBless == 0 then
			return 1
		else
			return nGodBless
		end
	end
	
	if nGodBless == 0 or math.floor(nItemId/1000) ~= 619 then
		return nGodBless
	end

	return 0
end

-- 神纹碎片ID互转（赠品的神纹碎片ID固定，非赠的神纹碎片ID固定）
function Item_GodFragments(nItemId,nMonopoly)
	-- 红色神纹碎片
	if (nItemId == 3306366 and nMonopoly > 0) or (nItemId == 3306369) then
		return 3314252,3
	end

	-- 黄色神纹碎片
	if (nItemId == 3306367 and nMonopoly > 0) or (nItemId == 3306370) then
		return 3314253,3
	end

	-- 蓝色神纹碎片
	if (nItemId == 3306368 and nMonopoly > 0) or (nItemId == 3306371) then
		return 3314254,3
	end
	
	-- 红色神纹碎片
	if nItemId == 3306366 then
		return 3314252,0
	end

	-- 黄色神纹碎片
	if nItemId == 3306367 then
		return 3314253,0
	end

	-- 蓝色神纹碎片
	if nItemId == 3306368 then
		return 3314254,0
	end
	
	-- 3311744	稀有黄色神纹碎片
	if nItemId == 3311744 then
		return 3314255,0
	end
	
	-- 3311745	稀有蓝色神纹碎片
	if nItemId == 3311745 then
		return 3314256,0
	end
	
	-- 3311748	稀有黄色神纹（赠）碎片
	if nItemId == 3311748 then
		return 3314255,3
	end
	-- 3311749	稀有蓝色神纹（赠）碎片
	if nItemId == 3311749 then
		return 3314256,3
	end


	return nItemId,nMonopoly
end


--(fn_AddNewItem, "AddNewItem");			//新增物品
--						// 添加物品程序自动区分是否叠加。data=itemtype_id,param="flag addamount monopoly save_time active onlinetime data reduce_dmg add_life addlevel_exp magic3 gem1 gem2 magic1 magic2 amount amount_limit anti_monster ident color",
--						// param可省略，所有缺省值为0(表示不修改), flag表示标识位,标志位第0位为0则不检查背包物品添加否则检查,标志位第1位为0则不继承赠品属性物品添加，否则继承;
--						// addamount表示添加物品的个数，为0只添加一个,monopoly表示赠品装备品质,save_time表示物品的有效时间（单位为分钟）,active表示激活,onlinetime表示时效性物品的删除时间
--						// data表示用做马匹物品的客户端表现颜色的记录，数值是R*65536+G*256+B叠加的结果,reduce_dmg表示装备神佑属性（1~7）,add_life表示装备加持生命,addlevel_exp表示追加升级经验,
--						// magic3表示装备追加数值（1~12）,gem1表示第一个洞（如果给的是没有镶嵌宝石的洞，这里写255就好了，如果是要给镶嵌好指定宝石的洞，这里就要写宝石编号）,gem2表示第二个洞
--						// magic1表示装备所带的第一种魔法效果,magic2表示装备所带的第二个魔法效果,amount表示当前耐久,amount_limit表示耐久上限,anti_monster表示装备克制怪物属性
--						// ident表示是否鉴定,color表示装备颜色

function Item_AddItem(nItemId,flag,addamount,monopoly,save_time,active,onlinetime,data,reduce_dmg,add_life,addlevel_exp,magic3,gem1,gem2,magic1,magic2,amount,amount_limit,anti_monster,ident,color,nUserId)
	
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then 
		Sys_SaveAbnormalLog("函数 Item_AddItem 的 [nItemId]:[".. nItemId .."] 必须为整数且大于0。")
		return
	end	
	
	if flag == nil then 
	   flag = 0
	elseif flag~= 0 and flag~= 1 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的flag必须为0或1。")
		return
	end

	if addamount == nil then 
		addamount = 0
	elseif type(addamount) ~= "number" or addamount < 0 or addamount%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的addamount必须大于等于0。")
		return
	end
	
	if monopoly == nil then 
		monopoly = 0
	elseif type(monopoly) ~= "number" or monopoly < 0 or monopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的monopoly必须为整数且不小于0。")
		return
	end
	
	if save_time == nil then 
		save_time = 0
	elseif type(save_time) ~= "number" or save_time < 0 or save_time%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的save_time必须大于等于0。")
		return
	end
	
	if save_time > 0 then
		local nSaveTime = Get_ItemtypeSaveTime(nItemId)
		local nAccumulateLimit = Get_ItemtypeAccumulateLimit(nItemId)
		if nSaveTime ~= nil and nAccumulateLimit ~= nil and type(nSaveTime) == "number" and type(nAccumulateLimit) == "number" then
			if nSaveTime == 0 and nAccumulateLimit > 1 then
				Sys_SaveAbnormalLog(string.format("函数Item_AddItem的所绐物品非时效可叠加，save_time必须=0,ItemId为%d",nItemId))
			end
		end
	end

	if active == nil then 
		active = 0
	elseif type(active) ~= "number" or active < 0 or active%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的active必须大于等于0。")
		return
	end
	
	if onlinetime == nil then 
		onlinetime = 0
	elseif type(onlinetime) ~= "number" or onlinetime < 0 or onlinetime%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的onlinetime必须大于等于0。")
		return
	end	
	
	if data == nil then 
		data = 0
	elseif type(data) ~= "number" or data < 0 or data%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的第data必须大于等于0。")
		return
	end

	if reduce_dmg == nil then 
		reduce_dmg = 0
	elseif type(reduce_dmg) ~= "number" or reduce_dmg < 0 or reduce_dmg%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的reduce_dmg必须为大于0的整数。")
		return
	end	
	
	if add_life == nil then 
		add_life = 0
	elseif type(add_life) ~= "number" or add_life < 0 or add_life%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的add_life必须为大于等于0的整数。")
		return
	end		   
	
	if addlevel_exp == nil then 
		addlevel_exp = 0
	elseif type(addlevel_exp) ~= "number" or addlevel_exp < 0 or addlevel_exp%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的addlevel_exp必须为大于等于0的整数。")
		return
	end	
	
	if magic3 == nil then 
		magic3 = 0
	elseif type(magic3) ~= "number" or magic3 < 0 or magic3%1 ~= 0 or magic3 > 12 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的magic3必须为0~12之间的整数。")
		return
	end	
	
	if gem1 == nil then 
		gem1 = 0
	elseif type(gem1) ~= "number" or gem1 < 0 or gem1%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的gem1必须为大于0的整数。")
		return
	end	
	
	if gem2 == nil then 
		gem2 = 0
	elseif type(gem2) ~= "number" or gem2 < 0 or gem2%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的gem2必须为大于0的整数。")
		return
	end	
	
	if magic1 == nil then 
		magic1 = 0
	elseif type(magic1) ~= "number" or magic1 < 0 or magic1%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的magic1必须为大于0的整数。")
		return
	end	
	
	if magic2 == nil then 
		magic2 = 0
	elseif type(magic2) ~= "number" or magic2 < 0 or magic2%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的magic2必须为大于0的整数。")
		return
	end	
	
	if amount == nil then 
		amount = 0
	elseif type(amount) ~= "number" or amount < 0 or amount%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的amount必须为大于0的整数。")
		return
	end		
	
	if amount_limit == nil then 
		amount_limit = 0
	elseif type(amount_limit) ~= "number" or amount_limit < 0 or amount_limit%1~= 0 or amount_limit < amount then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的amount_limit必须为大于等于0的整数且要大于等于amount。")
		return
	end		
	
	if anti_monster == nil then 
		anti_monster = 0
	elseif type(anti_monster) ~= "number" or anti_monster < 0 or anti_monster%1~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的anti_monster必须大于等于0。")
		return
	end		
	
	if ident == nil then 
		ident = 0
	elseif type(ident) ~= "number" or ident < 0 or ident%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的ident必须大于等于0。")
		return
	end		
	
	if color == nil then 
		color = 0
	elseif type(color) ~= "number" or (color < 0 or color > 9) or color%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的color必须必须在0-9之间。")
		return
	end		
	
	if nItemId == 300000 then 
	   local color1 = tonumber(reduce_dmg) * 65536
	   local color2 = tonumber(add_life) * 256
	   local color3 = tonumber(anti_monster)
	   local ndata = tonumber(data)
		if color1 + color2 + color3 ~= ndata then
			Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的第data必须为reduce_dmg*65536+add_life*256+anti_monster。")
			return
		end
	end
	
	if nUserId == nil then 
		nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddItem中[nItemId]:[".. nItemId .."]的nUserId必须为整数且不小于0。")
		return
	end
	
	nItemId = Item_Additional(nItemId)
	local nEserveTip = 0 
	monopoly = Item_Monopoly(nItemId,monopoly,nUserId)
	monopoly,save_time,active = Item_Asteroids(nItemId,monopoly,save_time,active)
	reduce_dmg = Item_Instrument(nItemId,reduce_dmg)
	nItemId,monopoly = Item_GodFragments(nItemId,monopoly)
	monopoly,nEserveTip = Item_poly(nItemId,monopoly,magic3)
	-- 判断是否金币服
	if CommonFunc_ChkGoldServer() then
		nItemId = Item_GoldServer(nItemId)
	end
	
	--是追加装备给小极品
	if nEserveTip == 1 then
		nItemId = Item_Additional(nItemId)
		nItemId = tonumber(Item_AddSplit(nItemId).."0")
		--magic3 = 0
	end
	
	--是马匹给相应的赤炼石
	if nEserveTip == 2 and nItemId == 300000 then
		nItemId = tItem_poly["Horse"][magic3] or tItem_poly["Horse"][0]
		monopoly = 3
		magic3 = 0
		
		active = 0
		reduce_dmg = 0
		gem1 = 0
		gem2 = 0
	end
	
	if AddNewItem(nUserId,nItemId,flag,addamount,monopoly,save_time,active,onlinetime,data,reduce_dmg,add_life,addlevel_exp,magic3,gem1,gem2,magic1,magic2,amount,amount_limit,anti_monster,ident) then
		local sUserName = Get_UserName(nUserId)
		if sUserName ~= nil then
			if string.find(sUserName,"PM") then
				if (math.floor(nItemId/10) == 20400) and reduce_dmg > 0 then
					User_TalkChannel2005(tTestTiShi[11],nUserId)
				elseif (math.floor(nItemId/10) == 20300) and (gem1 > 0 or gem2 > 0) then
					User_TalkChannel2005(tTestTiShi[12],nUserId)
				elseif (math.floor(nItemId/1000) == 619) and (gem1 > 0 or gem2 > 0 or reduce_dmg > 0) then
					User_TalkChannel2005(tTestTiShi[13],nUserId)
				elseif (nItemId >= 721936 and nItemId <= 721939) or nItemId == 722089 or nItemId == 720946 or nItemId == 728324 then
					User_TalkChannel2005(tTestTiShi[14],nUserId)
				elseif (nItemId >= 721940 and nItemId <= 721943) or nItemId == 722090 or nItemId == 720947 or nItemId == 728325 then
					User_TalkChannel2005(tTestTiShi[15],nUserId)
				elseif nItemId == 1060039 then
					User_TalkChannel2005(tTestTiShi[16],nUserId)
				elseif nItemId == 723724 then
					User_TalkChannel2005(tTestTiShi[17],nUserId)
				elseif nItemId == 723725 then
					User_TalkChannel2005(tTestTiShi[18],nUserId)
				elseif nItemId == 723727 then
					User_TalkChannel2005(tTestTiShi[19],nUserId)
				elseif nItemId >= 721091 and nItemId <= 721098 then
					User_TalkChannel2005(tTestTiShi[20],nUserId)
				else
					User_TalkChannel2005(string.format(tTestTiShi[7],Get_ItemtypeName(nItemId)),nUserId)
				end
			end
			
			-- 只有装备或外套才能给神佑属性
			if reduce_dmg > 0 then
				if not Item_GodBlessItem(nItemId) then
					Sys_SaveAbnormalLog("函数 Item_AddItem 添加物品ID为：" .. nItemId .."为非装备或外套物品给予神佑属性。")
				elseif nItemId ~= 300000 and reduce_dmg > G_Item_GodBless then
					Sys_SaveAbnormalLog("函数 Item_AddItem 添加物品ID为：" .. nItemId .."给予神佑属性超过7%。")
				end
			end
			
			-- 只有装备才能给追加、开洞的属性
			if magic3 > 0 then
				if not Item_MakeAHole(nItemId) then
					Sys_SaveAbnormalLog("函数 Item_AddItem 添加物品ID为：" .. nItemId .."为非装备给追加的属性。")
				elseif magic3 > G_Item_Additional then
					Sys_SaveAbnormalLog("函数 Item_AddItem 添加物品ID为：" .. nItemId .."给予追加属性超过12。")
				end
			end
			
			if gem1 > 0 then
				if not Item_MakeAHole(nItemId) then
					Sys_SaveAbnormalLog("函数 Item_AddItem 添加物品ID为：" .. nItemId .."为非装备给开洞的属性。")
				elseif nItemId ~= 300000 and (gem1 ~= G_Item_Gemstone and (gem1 < G_Item_MinGemstone or gem1 > G_Item_MaxGemstone)) then
					Sys_SaveAbnormalLog("函数 Item_AddItem 添加物品ID为：" .. nItemId .."给予宝石开洞的属性错。")
				end
			end
			
			if gem2 > 0 then
				if not Item_MakeAHole(nItemId) then
					Sys_SaveAbnormalLog("函数 Item_AddItem 添加物品ID为：" .. nItemId .."为非装备给开洞的属性。")
				elseif nItemId ~= 300000 and (gem2 ~= G_Item_Gemstone and (gem2 < G_Item_MinGemstone or gem2 > G_Item_MaxGemstone)) then
					Sys_SaveAbnormalLog("函数 Item_AddItem 添加物品ID为：" .. nItemId .."给予宝石开洞的属性错。")
				end
			end
		end
		
		return true
	else
		Sys_SaveAbnormalLog("函数 Item_AddItem 添加物品ID为：" .. nItemId .."失败。")
		return false
	end
end

--(fn_AddNewItem, "AddNewItem");			//新增物品
--和上面的函数功能相同，参数用法不同
--sItemAttr 类似action param用法。这样后面把属性配在表里可以比较一目了然。
--例子：Item_AddNewItem(1000000,"0 5 3")
--2015.12.25
--优化：支持物品属性用表的方式传入，常用配置如下，没有用到可以不配，按默认值
--例子：Item_AddNewItem(1000000,tItemAttr[1000000])
--常用配置
-- tItemAttr[1000000] = {}
-- tItemAttr[1000000].addamount = 3 --获得个数
-- tItemAttr[1000000].monopoly = 3 --赠品
-- tItemAttr[1000000].save_time = 43200 --时效
-- tItemAttr[1000000].active = 1 --获得激活
-- tItemAttr[1000000].gem1 = 255 --洞1
-- tItemAttr[1000000].gem2 = 255 --洞2
-- tItemAttr[1000000].reduce_dmg = 2 --神佑
-- tItemAttr[1000000].magic3 = 5 --追加等级

function Item_AddNewItem(nItemId,sItemAttr,nUserId)
	local flag  = 0
	local addamount = 0
	local monopoly =0
	local save_time =0
	local active =0
	local onlinetime = 0
	local data =0
	local reduce_dmg = 0
	local add_life = 0
	local addlevel_exp =0
	local magic3 = 0
	local gem1 = 0
	local gem2 = 0
	local magic1 = 0
	local magic2 = 0
	local amount = 0
	local amount_limit = 0
	local anti_monster = 0
	local ident = 0
	local color = 0
	
	
	if type(sItemAttr) == "string" then
		tItemAttr = Sys_Split(sItemAttr," ")
		flag  = tonumber(tItemAttr[1])
		addamount = tonumber(tItemAttr[2])
		monopoly = tonumber(tItemAttr[3])
		save_time = tonumber(tItemAttr[4])
		active = tonumber(tItemAttr[5])
		onlinetime = tonumber(tItemAttr[6])
		data = tonumber(tItemAttr[7])
		reduce_dmg = tonumber(tItemAttr[8])
		add_life = tonumber(tItemAttr[9])
		addlevel_exp = tonumber(tItemAttr[10])
		magic3 = tonumber(tItemAttr[11])
		gem1 = tonumber(tItemAttr[12])
		gem2 = tonumber(tItemAttr[13])
		magic1 = tonumber(tItemAttr[14])
		magic2 = tonumber(tItemAttr[15])
		amount = tonumber(tItemAttr[16])
		amount_limit = tonumber(tItemAttr[17])
		anti_monster = tonumber(tItemAttr[18])
		ident = tonumber(tItemAttr[19])
		color = tonumber(tItemAttr[20])
		
	elseif type(sItemAttr) == "table" then
		flag  = sItemAttr.flag
		addamount = sItemAttr.addamount
		monopoly = sItemAttr.monopoly
		save_time = sItemAttr.save_time
		active = sItemAttr.active
		onlinetime = sItemAttr.onlinetime
		data = sItemAttr.data
		reduce_dmg = sItemAttr.reduce_dmg
		add_life = sItemAttr.add_life
		addlevel_exp = sItemAttr.addlevel_exp
		magic3 = sItemAttr.magic3
		gem1 = sItemAttr.gem1
		gem2 = sItemAttr.gem2
		magic1 = sItemAttr.magic1
		magic2 = sItemAttr.magic2
		amount =sItemAttr.amount
		amount_limit = sItemAttr.amount_limit
		anti_monster = sItemAttr.anti_monster
		ident = sItemAttr.ident
		color = sItemAttr.color
		
	else
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的sItemAttr必须为字符串或者表类型。")
		return
	end
	
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then 
		Sys_SaveAbnormalLog("函数Item_AddNewItem的[nItemId]:[".. nItemId .."]必须为整数且大于0。")
		return
	end	
	
	if flag == nil then 
		flag = 0
	elseif flag~= 0 and flag~= 1 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的flag必须为0或1。")
		return
	end

	if addamount == nil then 
		addamount = 0
	elseif type(addamount) ~= "number" or addamount < 0 or addamount%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的addamount必须大于等于0。")
		return
	end
	
	if monopoly == nil then 
		monopoly = 0
	elseif type(monopoly) ~= "number" or monopoly < 0 or monopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的monopoly必须为整数且不小于0。")
		return
	end
	
	if save_time == nil then 
		save_time = 0
	elseif type(save_time) ~= "number" or save_time < 0 or save_time%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的save_time必须大于等于0。")
		return
	end
	
	if save_time > 0 then
		local nSaveTime = Get_ItemtypeSaveTime(nItemId)
		local nAccumulateLimit = Get_ItemtypeAccumulateLimit(nItemId)
		if nSaveTime ~= nil and nAccumulateLimit ~= nil and type(nSaveTime) == "number" and type(nAccumulateLimit) == "number" then
			if nSaveTime == 0 and nAccumulateLimit > 1 then
				Sys_SaveAbnormalLog(string.format("函数Item_AddNewItem的所绐物品非时效可叠加，save_time必须=0,ItemId为%d",nItemId))
			end
		end
	end
	
	if active == nil then 
		active = 0
	elseif type(active) ~= "number" or active < 0 or active%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的active必须大于等于0。")
		return
	end
	
	if onlinetime == nil then 
		onlinetime = 0
	elseif type(onlinetime) ~= "number" or onlinetime < 0 or onlinetime%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的onlinetime必须大于等于0。")
		return
	end	
	
	if data == nil then 
		data = 0
	elseif type(data) ~= "number" or data < 0 or data%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的第data必须大于等于0。")
		return
	end

	if reduce_dmg == nil then 
		reduce_dmg = 0
	elseif type(reduce_dmg) ~= "number" or reduce_dmg < 0 or reduce_dmg%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的reduce_dmg必须为大于0的整数。")
		return
	end	
	
	if add_life == nil then 
		add_life = 0
	elseif type(add_life) ~= "number" or add_life < 0 or add_life%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的add_life必须为大于等于0的整数。")
		return
	end		   
	
	if addlevel_exp == nil then 
		addlevel_exp = 0
	elseif type(addlevel_exp) ~= "number" or addlevel_exp < 0 or addlevel_exp%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的addlevel_exp必须为大于等于0的整数。")
		return
	end	
	
	if magic3 == nil then 
		magic3 = 0
	elseif type(magic3) ~= "number" or magic3 < 0 or magic3%1 ~= 0 or magic3 > 12 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的magic3必须为0~12之间的整数。")
		return
	end	
	
	if gem1 == nil then 
		gem1 = 0
	elseif type(gem1) ~= "number" or gem1 < 0 or gem1%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的gem1必须为大于0的整数。")
		return
	end	
	
	if gem2 == nil then 
		gem2 = 0
	elseif type(gem2) ~= "number" or gem2 < 0 or gem2%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的gem2必须为大于0的整数。")
		return
	end	
	
	if magic1 == nil then 
		magic1 = 0
	elseif type(magic1) ~= "number" or magic1 < 0 or magic1%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的magic1必须为大于0的整数。")
		return
	end	
	
	if magic2 == nil then 
		magic2 = 0
	elseif type(magic2) ~= "number" or magic2 < 0 or magic2%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的magic2必须为大于0的整数。")
		return
	end	
	
	if amount == nil then 
		amount = 0
	elseif type(amount) ~= "number" or amount < 0 or amount%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的amount必须为大于0的整数。")
		return
	end		
	
	if amount_limit == nil then 
		amount_limit = 0
	elseif type(amount_limit) ~= "number" or amount_limit < 0 or amount_limit%1~= 0 or amount_limit < amount then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的amount_limit必须为大于等于0的整数且要大于等于amount。")
		return
	end		
	
	if anti_monster == nil then 
		anti_monster = 0
	elseif type(anti_monster) ~= "number" or anti_monster < 0 or anti_monster%1~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的anti_monster必须大于等于0。")
		return
	end		
	
	if ident == nil then 
		ident = 0
	elseif type(ident) ~= "number" or ident < 0 or ident%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的ident必须大于等于0。")
		return
	end		
	
	if color == nil then 
		color = 0
	elseif type(color) ~= "number" or (color < 0 or color > 9) or color%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的color必须必须在0-9之间。")
		return
	end		
	
	if nItemId == 300000 then 
	   local color1 = tonumber(reduce_dmg) * 65536
	   local color2 = tonumber(add_life) * 256
	   local color3 = tonumber(anti_monster)
	   local ndata = tonumber(data)
		if color1 + color2 + color3 ~= ndata then
			Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的第data必须为reduce_dmg*65536+add_life*256+anti_monster。")
			return
		end
	end
	
	if nUserId == nil then 
		nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的nUserId必须为整数且不小于0。")
		return
	end
	
	local nEserveTip = 0 
	nItemId = Item_Additional(nItemId)
	monopoly = Item_Monopoly(nItemId,monopoly,nUserId)
	monopoly,save_time,active = Item_Asteroids(nItemId,monopoly,save_time,active)
	reduce_dmg = Item_Instrument(nItemId,reduce_dmg)
	nItemId,monopoly = Item_GodFragments(nItemId,monopoly)
	monopoly,nEserveTip = Item_poly(nItemId,monopoly,magic3)
		-- 判断是否金币服
	if CommonFunc_ChkGoldServer() then
		nItemId = Item_GoldServer(nItemId)
	end
	
	--是追加装备给小极品
	if nEserveTip == 1 then
		nItemId = Item_Additional(nItemId)
		nItemId = tonumber(Item_AddSplit(nItemId).."0")
		--magic3 = 0

	end
	
	--是马匹给相应的赤炼石
	if nEserveTip == 2 and nItemId == 300000 then
		nItemId = tItem_poly["Horse"][magic3] or tItem_poly["Horse"][0]
		monopoly = 3
		magic3 = 0
		
		active = 0
		reduce_dmg = 0
		gem1 = 0
		gem2 = 0
	end
	
	if AddNewItem(nUserId,nItemId,flag,addamount,monopoly,save_time,active,onlinetime,data,reduce_dmg,add_life,addlevel_exp,magic3,gem1,gem2,magic1,magic2,amount,amount_limit,anti_monster,ident) then
		local sUserName = Get_UserName(nUserId)
		if sUserName ~= nil then
			if string.find(sUserName,"PM") then
				if (math.floor(nItemId/10) == 20400) and reduce_dmg > 0 then
					User_TalkChannel2005(tTestTiShi[11],nUserId)
				elseif (math.floor(nItemId/10) == 20300) and (gem1 > 0 or gem2 > 0) then
					User_TalkChannel2005(tTestTiShi[12],nUserId)
				elseif (math.floor(nItemId/1000) == 619) and (gem1 > 0 or gem2 > 0 or reduce_dmg > 0) then
					User_TalkChannel2005(tTestTiShi[13],nUserId)
				elseif (nItemId >= 721936 and nItemId <= 721939) or nItemId == 722089 or nItemId == 720946 or nItemId == 728324 then
					User_TalkChannel2005(tTestTiShi[14],nUserId)
				elseif (nItemId >= 721940 and nItemId <= 721943) or nItemId == 722090 or nItemId == 720947 or nItemId == 728325 then
					User_TalkChannel2005(tTestTiShi[15],nUserId)
				elseif nItemId == 1060039 then
					User_TalkChannel2005(tTestTiShi[16],nUserId)
				elseif nItemId == 723724 then
					User_TalkChannel2005(tTestTiShi[17],nUserId)
				elseif nItemId == 723725 then
					User_TalkChannel2005(tTestTiShi[18],nUserId)
				elseif nItemId == 723727 then
					User_TalkChannel2005(tTestTiShi[19],nUserId)
				elseif nItemId >= 721091 and nItemId <= 721098 then
					User_TalkChannel2005(tTestTiShi[20],nUserId)
				else
					User_TalkChannel2005(string.format(tTestTiShi[7],Get_ItemtypeName(nItemId)),nUserId)
				end
			end
			
			-- 只有装备或外套才能给神佑属性
			if reduce_dmg > 0 then
				if not Item_GodBlessItem(nItemId) then
					Sys_SaveAbnormalLog("函数 Item_AddNewItem 添加物品ID为：" .. nItemId .."为非装备或外套物品给予神佑属性。")
				elseif nItemId ~= 300000 and reduce_dmg > G_Item_GodBless then
					Sys_SaveAbnormalLog("函数 Item_AddNewItem 添加物品ID为：" .. nItemId .."给予神佑属性超过7%。")
				end
			end
			
			-- 只有装备才能给追加、开洞的属性
			if magic3 > 0 then
				if not Item_MakeAHole(nItemId) then
					Sys_SaveAbnormalLog("函数 Item_AddNewItem 添加物品ID为：" .. nItemId .."为非装备给追加的属性。")
				elseif magic3 > G_Item_Additional then
					Sys_SaveAbnormalLog("函数 Item_AddNewItem 添加物品ID为：" .. nItemId .."给予追加属性超过12。")
				end
			end
			
			if gem1 > 0 then
				if not Item_MakeAHole(nItemId) then
					Sys_SaveAbnormalLog("函数 Item_AddNewItem 添加物品ID为：" .. nItemId .."为非装备给开洞的属性。")
				elseif nItemId ~= 300000 and (gem1 ~= G_Item_Gemstone and (gem1 < G_Item_MinGemstone or gem1 > G_Item_MaxGemstone)) then
					Sys_SaveAbnormalLog("函数 Item_AddNewItem 添加物品ID为：" .. nItemId .."给予宝石开洞的属性错。")
				end
			end
			
			if gem2 > 0 then
				if not Item_MakeAHole(nItemId) then
					Sys_SaveAbnormalLog("函数 Item_AddNewItem 添加物品ID为：" .. nItemId .."为非装备给开洞的属性。")
				elseif nItemId ~= 300000 and (gem2 ~= G_Item_Gemstone and (gem2 < G_Item_MinGemstone or gem2 > G_Item_MaxGemstone)) then
					Sys_SaveAbnormalLog("函数 Item_AddNewItem 添加物品ID为：" .. nItemId .."给予宝石开洞的属性错。")
				end
			end
		end
		return true
	else
		Sys_SaveAbnormalLog("函数 Item_AddNewItem 添加物品ID为：" .. nItemId .."失败。")
		return false
	end
end
-----------20140822---------


-----------20160122---------
-- 获取所需的背包空间(打开一种物品，获得一种物品)
function Item_GetSpace(nItemId,nUseNum,nRewardId,nRewardNum,sRewardAttr)
	local nSpace = 0
	local nItemLimit = Get_ItemtypeAccumulateLimit(nItemId)
	local nLimit = Get_ItemtypeAccumulateLimit(nRewardId)
	local nNum = 1
	
	if nRewardNum ~= nil then
		nNum = nRewardNum
	elseif sRewardAttr ~= nil then
		local tAttr = Sys_Split(sRewardAttr," ")
		nNum = tAttr[2]
	end
	
	if nItemLimit == 0 then
		nItemLimit = 1
	elseif nLimit == 0 then
		nLimit = 1
	end
	
	nSpace = -1*math.floor(nUseNum/nItemLimit)
	nSpace = nSpace + math.ceil(nNum/nLimit)
	
	return nSpace
end

-----2016.5.13
-- 服务端补丁：zfbug6826-84.11-yzl-rc2.diff
-- 配置：无
-- LUA接口说明：
-- LUA接口：ItemDialog
-- 参1：idUser玩家ID
-- 参2：idItem物品ID
-- 参3：pszText按钮提示内容
-- 参4：pszFunc表示点击确认按钮执行的LUA函数
-- 参5：pszFailFunc表示点击取消按钮执行的LUA函数
-- 返回值：成功返回ture，失败返回false

function Item_Dialog(nItemId,sText,sFunc,sFailFunc,nUserId)
	if type(nItemId) ~= "number" or  nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_Dialog的[nItemId]:[".. nItemId .."]必须为整数且不小于0。")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Item_Dialog中[nItemId]:[".. nItemId .."] 的 sText 只能传字符")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Item_Dialog中[nItemId]:[".. nItemId .."] 的 sFunc 只能传字符")
		return
	end
	
	if sFailFunc == nil then
		sFailFunc = "NULL"
	elseif type(sFailFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Item_Dialog中[nItemId]:[".. nItemId .."] 的 sFailFunc 只能传字符")
		return
	end
	
	if nUserId == nil then 
		nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_Dialog 中[nItemId]:[".. nItemId .."]的nUserId必须为整数且不小于0。")
		return
	end

	return ItemDialog(nUserId,nItemId,sText,string.format("</F>%s",sFunc),string.format("</F>%s",sFailFunc))
end

-- 物品弹出接口的二次封装
function Item_DialogByType(nItemTypeId,sText,sFunc,sFailFunc,nUserId)
	if type(nItemTypeId) ~= "number" or  nItemTypeId < 0 or nItemTypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_DialogByType的[nItemTypeId]:[".. nItemTypeId .."]必须为整数且不小于0。")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Item_DialogByType中[nItemTypeId]:[".. nItemTypeId .."] 的 sText 只能传字符")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Item_DialogByType中[nItemTypeId]:[".. nItemTypeId .."] 的 sFunc 只能传字符")
		return
	end
	
	if sFailFunc == nil then
		sFailFunc = "NULL"
	elseif type(sFailFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Item_DialogByType中[nItemTypeId]:[".. nItemTypeId .."] 的 sFailFunc 只能传字符")
		return
	end
	
	if nUserId == nil then 
		nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DialogByType 中[nItemTypeId]:[".. nItemTypeId .."]的nUserId必须为整数且不小于0。")
		return
	end
	
	local nItemId = Get_ItemLastAdd(nUserId)
	local nNowItemTypeId = Get_ItemType(nItemId)
	
	if nNowItemTypeId ~= nItemTypeId then
		return
	end
	
	return Item_Dialog(nItemId,sText,sFunc,sFailFunc,nUserId)
end

-- //物品属性设置。参1：idUser用户ID，参2: 物品ID，参3: 索引(2302-2313), 参4: 数值，参5：是否同步到客户端。	成功返回true，否则返回false
	-- LUA_FUNC(SetItemInt)
	-- {
		-- OBJID idUser	= Lua_GetParamULong(1);
		-- OBJID idItem	= Lua_GetParamULong(2);
		-- int   nIndex	= Lua_GetParamInt(3);
		-- int   nVal		= Lua_GetParamInt(4);
		-- int	  nSyn		= Lua_GetParamInt(5);
function Item_SetItemInt(nItemId,nIndex,nValues,nSyn,nUserId)
	if nItemId == nil then 
		nItemId = 0
	elseif type(nItemId) ~= "number" or  nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_SetItemInt 的 [nItemId]:[".. nItemId .."] 必须为整数且不小于0。")
		return
	end
	
	if type(nIndex) ~= "number" or  nIndex < 0 or nIndex%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_SetItemInt 中 [nItemId]:[".. nItemId .."] 的 nIndex 必须为整数且不小于0。")
		return
	end
	
	if type(nValues) ~= "number" or  nValues < 0 or nValues%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_SetItemInt 中 [nItemId]:[".. nItemId .."] 的 nValues 必须为整数且不小于0。")
		return
	end
	
	if nSyn == nil then 
		nSyn = 0
	elseif type(nSyn) ~= "number" or  nSyn < 0 or nSyn%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_SetItemInt 中 [nItemId]:[".. nItemId .."] 的 nSyn 必须为整数且不小于0。")
		return
	end

	if nUserId == nil then 
		nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_SetItemInt 中 [nItemId]:[".. nItemId .."] 的 nUserId 必须为整数且不小于0。")
		return
	end
	
	return SetItemInt(nUserId,nItemId,nIndex,nValues,nSyn)
end

function Item_AddNewItemAndMsg(nItemId,sItemAttr,nUserId)
	local flag  = 0
	local addamount = 0
	local monopoly =0
	local save_time =0
	local active =0
	local onlinetime = 0
	local data =0
	local reduce_dmg = 0
	local add_life = 0
	local addlevel_exp =0
	local magic3 = 0
	local gem1 = 0
	local gem2 = 0
	local magic1 = 0
	local magic2 = 0
	local amount = 0
	local amount_limit = 0
	local anti_monster = 0
	local ident = 0
	local color = 0
	
	
	if type(sItemAttr) == "string" then
		tItemAttr = Sys_Split(sItemAttr," ")
		flag  = tonumber(tItemAttr[1])
		addamount = tonumber(tItemAttr[2])
		monopoly = tonumber(tItemAttr[3])
		save_time = tonumber(tItemAttr[4])
		active = tonumber(tItemAttr[5])
		onlinetime = tonumber(tItemAttr[6])
		data = tonumber(tItemAttr[7])
		reduce_dmg = tonumber(tItemAttr[8])
		add_life = tonumber(tItemAttr[9])
		addlevel_exp = tonumber(tItemAttr[10])
		magic3 = tonumber(tItemAttr[11])
		gem1 = tonumber(tItemAttr[12])
		gem2 = tonumber(tItemAttr[13])
		magic1 = tonumber(tItemAttr[14])
		magic2 = tonumber(tItemAttr[15])
		amount = tonumber(tItemAttr[16])
		amount_limit = tonumber(tItemAttr[17])
		anti_monster = tonumber(tItemAttr[18])
		ident = tonumber(tItemAttr[19])
		color = tonumber(tItemAttr[20])
		
	elseif type(sItemAttr) == "table" then
		flag  = sItemAttr.flag
		addamount = sItemAttr.addamount
		monopoly = sItemAttr.monopoly
		save_time = sItemAttr.save_time
		active = sItemAttr.active
		onlinetime = sItemAttr.onlinetime
		data = sItemAttr.data
		reduce_dmg = sItemAttr.reduce_dmg
		add_life = sItemAttr.add_life
		addlevel_exp = sItemAttr.addlevel_exp
		magic3 = sItemAttr.magic3
		gem1 = sItemAttr.gem1
		gem2 = sItemAttr.gem2
		magic1 = sItemAttr.magic1
		magic2 = sItemAttr.magic2
		amount =sItemAttr.amount
		amount_limit = sItemAttr.amount_limit
		anti_monster = sItemAttr.anti_monster
		ident = sItemAttr.ident
		color = sItemAttr.color
		
	else
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的sItemAttr必须为字符串或者表类型。")
		return
	end
	
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then 
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的nItemId必须为整数且大于0。")
		return
	end	
	
	if flag == nil then 
		flag = 0
	elseif flag~= 0 and flag~= 1 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的flag必须为0或1。")
		return
	end

	if addamount == nil then 
		addamount = 0
	elseif type(addamount) ~= "number" or addamount < 0 or addamount%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的addamount必须大于等于0。")
		return
	end
	
	if monopoly == nil then 
		monopoly = 0
	elseif type(monopoly) ~= "number" or monopoly < 0 or monopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的monopoly必须为整数且不小于0。")
		return
	end
	
	if save_time == nil then 
		save_time = 0
	elseif type(save_time) ~= "number" or save_time < 0 or save_time%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的save_time必须大于等于0。")
		return
	end
	
	if save_time > 0 then
		local nSaveTime = Get_ItemtypeSaveTime(nItemId)
		local nAccumulateLimit = Get_ItemtypeAccumulateLimit(nItemId)
		if nSaveTime ~= nil and nAccumulateLimit ~= nil and type(nSaveTime) == "number" and type(nAccumulateLimit) == "number" then
			if nSaveTime == 0 and nAccumulateLimit > 1 then
				Sys_SaveAbnormalLog(string.format("函数Item_AddNewItem的所绐物品非时效可叠加，save_time必须=0,ItemId为%d",nItemId))
			end
		end
	end
	
	if active == nil then 
		active = 0
	elseif type(active) ~= "number" or active < 0 or active%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的active必须大于等于0。")
		return
	end
	
	if onlinetime == nil then 
		onlinetime = 0
	elseif type(onlinetime) ~= "number" or onlinetime < 0 or onlinetime%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的onlinetime必须大于等于0。")
		return
	end	
	
	if data == nil then 
		data = 0
	elseif type(data) ~= "number" or data < 0 or data%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的第data必须大于等于0。")
		return
	end

	if reduce_dmg == nil then 
		reduce_dmg = 0
	elseif type(reduce_dmg) ~= "number" or reduce_dmg < 0 or reduce_dmg%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的reduce_dmg必须为大于0的整数。")
		return
	end	
	
	if add_life == nil then 
		add_life = 0
	elseif type(add_life) ~= "number" or add_life < 0 or add_life%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的add_life必须为大于等于0的整数。")
		return
	end		   
	
	if addlevel_exp == nil then 
		addlevel_exp = 0
	elseif type(addlevel_exp) ~= "number" or addlevel_exp < 0 or addlevel_exp%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的addlevel_exp必须为大于等于0的整数。")
		return
	end	
	
	if magic3 == nil then 
		magic3 = 0
	elseif type(magic3) ~= "number" or magic3 < 0 or magic3%1 ~= 0 or magic3 > 12 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的magic3必须为0~12之间的整数。")
		return
	end	
	
	if gem1 == nil then 
		gem1 = 0
	elseif type(gem1) ~= "number" or gem1 < 0 or gem1%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的gem1必须为大于0的整数。")
		return
	end	
	
	if gem2 == nil then 
		gem2 = 0
	elseif type(gem2) ~= "number" or gem2 < 0 or gem2%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的gem2必须为大于0的整数。")
		return
	end	
	
	if magic1 == nil then 
		magic1 = 0
	elseif type(magic1) ~= "number" or magic1 < 0 or magic1%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的magic1必须为大于0的整数。")
		return
	end	
	
	if magic2 == nil then 
		magic2 = 0
	elseif type(magic2) ~= "number" or magic2 < 0 or magic2%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的magic2必须为大于0的整数。")
		return
	end	
	
	if amount == nil then 
		amount = 0
	elseif type(amount) ~= "number" or amount < 0 or amount%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的amount必须为大于0的整数。")
		return
	end		
	
	if amount_limit == nil then 
		amount_limit = 0
	elseif type(amount_limit) ~= "number" or amount_limit < 0 or amount_limit%1~= 0 or amount_limit < amount then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的amount_limit必须为大于等于0的整数且要大于等于amount。")
		return
	end		
	
	if anti_monster == nil then 
		anti_monster = 0
	elseif type(anti_monster) ~= "number" or anti_monster < 0 or anti_monster%1~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的anti_monster必须大于等于0。")
		return
	end		
	
	if ident == nil then 
		ident = 0
	elseif type(ident) ~= "number" or ident < 0 or ident%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的ident必须大于等于0。")
		return
	end		
	
	if color == nil then 
		color = 0
	elseif type(color) ~= "number" or (color < 0 or color > 9) or color%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的color必须必须在0-9之间。")
		return
	end		
	
	if nItemId == 300000 then 
	   local color1 = tonumber(reduce_dmg) * 65536
	   local color2 = tonumber(add_life) * 256
	   local color3 = tonumber(anti_monster)
	   local ndata = tonumber(data)
		if color1 + color2 + color3 ~= ndata then
			Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的第data必须为reduce_dmg*65536+add_life*256+anti_monster。")
			return
		end
	end
	
	if nUserId == nil then 
		nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_AddNewItem中[nItemId]:[".. nItemId .."]的nUserId必须为整数且不小于0。")
		return
	end
	
	nItemId = Item_Additional(nItemId)
	local nEserveTip = 0
	monopoly = Item_Monopoly(nItemId,monopoly,nUserId)
	monopoly,save_time,active = Item_Asteroids(nItemId,monopoly,save_time,active)
	reduce_dmg = Item_Instrument(nItemId,reduce_dmg)
	nItemId,monopoly = Item_GodFragments(nItemId,monopoly)
	monopoly,nEserveTip = Item_poly(nItemId,monopoly,magic3)
	-- 判断是否金币服
	if CommonFunc_ChkGoldServer() then
		nItemId = Item_GoldServer(nItemId)
	end
	
	--是追加装备给小极品
	if nEserveTip == 1 then
		nItemId = Item_Additional(nItemId)
		nItemId = tonumber(Item_AddSplit(nItemId).."0")
		--magic3 = 0

	end
	
	--是马匹给相应的赤炼石
	if nEserveTip == 2 and nItemId == 300000 then
		nItemId = tItem_poly["Horse"][magic3] or tItem_poly["Horse"][0]
		monopoly = 3
		magic3 = 0
		
		active = 0
		reduce_dmg = 0
		gem1 = 0
		gem2 = 0
	end
	
	if AddNewItem(nUserId,nItemId,flag,addamount,monopoly,save_time,active,onlinetime,data,reduce_dmg,add_life,addlevel_exp,magic3,gem1,gem2,magic1,magic2,amount,amount_limit,anti_monster,ident) then
		local sUserName = Get_UserName(nUserId)
		if sUserName ~= nil then
			if string.find(sUserName,"PM") then
				if (math.floor(nItemId/10) == 20400) and reduce_dmg > 0 then
					User_TalkChannel2005(tTestTiShi[11],nUserId)
				elseif (math.floor(nItemId/10) == 20300) and (gem1 > 0 or gem2 > 0) then
					User_TalkChannel2005(tTestTiShi[12],nUserId)
				elseif (math.floor(nItemId/1000) == 619) and (gem1 > 0 or gem2 > 0 or reduce_dmg > 0) then
					User_TalkChannel2005(tTestTiShi[13],nUserId)
				elseif (nItemId >= 721936 and nItemId <= 721939) or nItemId == 722089 or nItemId == 720946 or nItemId == 728324 then
					User_TalkChannel2005(tTestTiShi[14],nUserId)
				elseif (nItemId >= 721940 and nItemId <= 721943) or nItemId == 722090 or nItemId == 720947 or nItemId == 728325 then
					User_TalkChannel2005(tTestTiShi[15],nUserId)
				elseif nItemId == 1060039 then
					User_TalkChannel2005(tTestTiShi[16],nUserId)
				elseif nItemId == 723724 then
					User_TalkChannel2005(tTestTiShi[17],nUserId)
				elseif nItemId == 723725 then
					User_TalkChannel2005(tTestTiShi[18],nUserId)
				elseif nItemId == 723727 then
					User_TalkChannel2005(tTestTiShi[19],nUserId)
				elseif nItemId >= 721091 and nItemId <= 721098 then
					User_TalkChannel2005(tTestTiShi[20],nUserId)
				else
					User_TalkChannel2005(string.format(tTestTiShi[7],Get_ItemtypeName(nItemId)),nUserId)
				end
			end
		end
		local sItemName = tRewardTemplate_Text["ItemName"][nItemId] or Get_ItemtypeName(nItemId)
		local nItemNum = addamount
		
		-- 判断是否是赠品
		if Sys_ParseNumbersContain(1,monopoly) then
			-- local sGift = "<" .. tRewardTemplate_Text["Gift"] .. ">"
			sItemName = string.format(tLuaRes[10025],sItemName,tRewardTemplate_Text["Gift"])
		end
		
		--判断是否神纹
		if nItemId >= 4000000 and nItemId <= 4039999 then
			-- local sRune = "<" .. tRewardTemplate_Text["Rune"] .. ">"
			sItemName = string.format(tLuaRes[10025],sItemName,tRewardTemplate_Text["Rune"])
		end
		
		
		--判断神纹等级
		-- local nRuneType = math.floor(nItemId/10000)
		-- if (nRuneType == 402) or (nRuneType == 403) then 
			-- local nLev = math.fmod(nItemId,100)
			-- sItemName = nLev .. tRewardTemplate_Text["Lev"] .. sItemName
		-- end
		
		-- 获取给的数量
		if addamount == 0 then
			addamount = 1
		end
		
		if addamount > 1 then
			-- local sNumber = "<" .. tRewardTemplate_Text["Number"] .. ">"
			sItemName = string.format(tLuaRes[10026],sItemName,tRewardTemplate_Text["Number"],addamount)
		end
		
		-- 追加说明
		if magic3 > 0 then
			-- local sAdditional = "<" .. tRewardTemplate_Text["Additional"] .. ">"
			sItemName = string.format(tLuaRes[10026],tRewardTemplate_Text["Additional"],magic3,sItemName)
			-- 不是装备物品给追加属性
			if not Item_MakeAHole(nItemId) then
				Sys_SaveAbnormalLog("函数Item_AddNewItemAndMsg添加物品ID为：" .. nItemId .."为非装备物品给予追加属性。")
			elseif magic3 > G_Item_Additional then
				Sys_SaveAbnormalLog("函数Item_AddNewItemAndMsg添加物品ID为：" .. nItemId .."给予追加属性超过12。")
			end
		end

		-- 神佑说明
		if reduce_dmg > 0 then
			if nItemId ~= 300000 then 
				-- local sGodBless = "<" .. tRewardTemplate_Text["GodBless"] .. ">"
				sItemName = string.format(tLuaRes[10026],reduce_dmg,tRewardTemplate_Text["GodBless"],sItemName)
				-- 不是装备或外套物品给追加属性
				if not Item_GodBlessItem(nItemId) then
					Sys_SaveAbnormalLog("函数Item_AddNewItemAndMsg添加物品ID为：" .. nItemId .."为非装备或外套物品给予神佑属性。")
				elseif reduce_dmg > G_Item_GodBless then
					Sys_SaveAbnormalLog("函数Item_AddNewItemAndMsg添加物品ID为：" .. nItemId .."给予神佑属性超过7%。")
				end
			end
		end
		
		-- 几洞
		local nHoleNum = 0
		if gem1 > 0 then
			nHoleNum = nHoleNum + 1
			if not Item_MakeAHole(nItemId) then
				Sys_SaveAbnormalLog("函数 Item_AddNewItemAndMsg 添加物品ID为：" .. nItemId .."为非装备给开洞的属性。")
			elseif nItemId ~= 300000 and (gem1 ~= G_Item_Gemstone and (gem1 < G_Item_MinGemstone or gem1 > G_Item_MaxGemstone)) then
				Sys_SaveAbnormalLog("函数 Item_AddNewItemAndMsg 添加物品ID为：" .. nItemId .."给予宝石开洞的属性错。")
			end
		end
		
		if gem2 > 0 then
			nHoleNum = nHoleNum + 1
			if not Item_MakeAHole(nItemId) then
				Sys_SaveAbnormalLog("函数 Item_AddNewItemAndMsg 添加物品ID为：" .. nItemId .."为非装备给开洞的属性。")
			elseif nItemId ~= 300000 and (gem2 ~= G_Item_Gemstone and (gem2 < G_Item_MinGemstone or gem2 > G_Item_MaxGemstone)) then
				Sys_SaveAbnormalLog("函数 Item_AddNewItemAndMsg 添加物品ID为：" .. nItemId .."给予宝石开洞的属性错。")
			end
		end
		
		if nHoleNum > 0 then
			-- local sHole = "<" .. tRewardTemplate_Text["Hole"] .. ">"
			sItemName = string.format(tLuaRes[10026],nHoleNum,tRewardTemplate_Text["Hole"],sItemName)
		end
		
		-- 判断是否是装备
		if Item_ChkEquip(nItemId) then
			local nQuality = nItemId%10
			
			if nQuality == 9 then
				-- local sTheBeat = "<" .. tRewardTemplate_Text["TheBeat"] .. ">"
				sItemName = string.format(tLuaRes[10025],tRewardTemplate_Text["TheBeat"],sItemName)
			elseif nQuality == 8 then
				-- local sBoutique = "<" .. tRewardTemplate_Text["Boutique"] .. ">"
				sItemName = string.format(tLuaRes[10025],tRewardTemplate_Text["Boutique"],sItemName)
			elseif nQuality == 7 then
				-- local sTopGrade = "<" .. tRewardTemplate_Text["TopGrade"] .. ">"
				sItemName = string.format(tLuaRes[10025],tRewardTemplate_Text["TopGrade"],sItemName)
			elseif nQuality == 6 then
				-- local sGoodProduct = "<" .. tRewardTemplate_Text["GoodProduct"] .. ">"
				sItemName = string.format(tLuaRes[10025],tRewardTemplate_Text["GoodProduct"],sItemName)
			end
		end
		
		-- 时效说明
		local nDay = math.floor(save_time/1440)
		
		if nDay > 0 then
			-- local sPrescript = "<" .. tRewardTemplate_Text["Prescript"] .. ">"
			sItemName = string.format(tLuaRes[10026],nDay,tRewardTemplate_Text["Prescript"],sItemName)
		end
		
		-- User_TalkChannel2005(string.format(tRewardTemplate_Text["Currency"],sItemName),nUserId)
		return sItemName
	else
		Sys_SaveAbnormalLog("函数Item_AddNewItemAndMsg添加物品ID为：" .. nItemId .."失败。")
		return false
	end
end

function Item_ChkEquip(nItemId)
	for i,v in pairs(tNoItem) do
		if v[1] <= nItemId and v[2] >= nItemId then
			return false
		end
	end
	
	return true
end

-- ACTION_ITEM_WEAPONR_CHANGE_SUBTYPE = 545,	// 转换武器子类型(param="位置 武器子类型"; 位置为4表示右手武器,为5表示左手武器.)
-- //##【新增】LUA接口：ItemWeaponChangeSubtype
-- //##转换武器子类型
-- //##参1：玩家ID
-- //##参2：nPos装备位置
-- //##参3：nWeaponSubType子类型
-- //##返回值：成功返回ture，失败返回false

function Item_WeaponChangeSubtype(nPos,nWeaponSubType,nUserId)
	if type(nPos) ~= "number" or (nPos ~= 4 and nPos ~= 5) then
		Sys_SaveAbnormalLog("函数 Item_WeaponChangeSubtype 中 [nPos]:[".. nPos .."] 的只能传4或者5。")
		return
	end
	
	if type(nWeaponSubType) ~= "number" or  nWeaponSubType < 0 or nWeaponSubType%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_WeaponChangeSubtype 中 [nWeaponSubType]:[".. nWeaponSubType .."] 的必须为整数且不小于0。")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("函数 Item_WeaponChangeSubtype 中 [nWeaponSubType]:[".. nWeaponSubType .."] 的 nUserId 必须为整数且不小于0。")
		return
	end
	
	return WeaponChangeSubtype(nUserId,nPos,nWeaponSubType)
end



-- ItemRepairXuanBao
-- 修复玄宝，参数1：玩家ID，参数2：玄宝装备位置；返回值：true修复成功，false修复失败
function Item_ItemRepairXuanBao(nUserId)
	if nUserId == nil then 
		nUserId = Get_UserId()
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_ItemRepairXuanBao的nUserId必须为整数且不小于0。")
		return
	end
	
	return Item_ItemRepair(13,nUserId)
end


-- 函数名：ItemRepair
-- 参数1：玩家ID，参数2：装备位
function Item_ItemRepair(nPos,nUserId)
	if type(nPos) ~= "number" or  nPos < 0 or nPos%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_ItemRepair的nPos必须为整数且不小于0。")
		return
	end

	if nUserId == nil then 
		nUserId = Get_UserId()
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数Item_ItemRepair的nUserId必须为整数且不小于0。")
		return
	end
	
	return ItemRepair(nUserId,nPos)
end

-- // 异步获得跨服物品(贵重物品),参1:玩家服务器ID,参2:玩家id, 参3:物品类型, 参4:赠品属性, 参5:数量，参6:功能编号,参7:统计类型(lua从300开始), 失败返回false，成功先返回true，需要等待异步结果调用
function Item_AddAsynOSItem(nItemId,nMonopoly,nNum,nSerial,nNosuchType,nUserId,nServerId)
	if type(nItemId) ~= "number" or nItemId <= 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_AddAsynOSItem 中 [nItemId]:[".. nItemId .."] 只能传大于0的整数")
		return
	end
	
	if type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_AddAsynOSItem 中 [nMonopoly]:[".. nMonopoly .."] 只能传大于等于0的整数")
		return
	end
	
	if type(nNum) ~= "number" or nNum <= 0 or nNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_AddAsynOSItem 中 [nNum]:[".. nNum .."] 只能传大于0的整数")
		return
	end
	
	if type(nSerial) ~= "number" or nSerial < 10000 or nSerial > 20000 or nSerial%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_AddAsynOSItem 中 [nSerial]:[".. nSerial .."] 只能传10000-20000之间的整数")
		return
	end
	
	if type(nNosuchType) ~= "number" or nNosuchType < 0 or nNosuchType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_AddAsynOSItem 中 [nNosuchType]:[".. nNosuchType .."] 只能传大于等于0的整数")
		return
	end
	
	if type(nServerId) ~= "number" or nServerId < 0 or nServerId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_AddAsynOSItem 中 [nServerId]:[".. nServerId .."] 只能传大于等于0的整数")
		return
	end
	
	if nUserId == nil then
		nUserId = Get_UserId()
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_AddAsynOSItem 中 [nUserId]:[".. nUserId .."] 的 nUserId 只能传大于等于0的整数")
		return
	end
	
	return AddAsynOSItem(nServerId,nUserId,nItemId,nMonopoly,nNum,nSerial,nNosuchType)
end

-- // 异步删除跨服物品(贵重物品), 参1:玩家id, 参2:物品类型, 参3:赠品属性, 参4:数量，参5:功能编号,参6:统计类型(lua从300开始), 失败返回false，成功先返回true，需要等待异步结果调用
function Item_DelAsynOSItem(nItemId,nMonopoly,nNum,nSerial,nNosuchType,nUserId,nServerId)
	if type(nItemId) ~= "number" or nItemId <= 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelAsynOSItem 中 [nItemId]:[".. nItemId .."] 只能传大于0的整数")
		return
	end
	
	if type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelAsynOSItem 中 [nMonopoly]:[".. nMonopoly .."] 只能传大于等于0的整数")
		return
	end
	
	if type(nNum) ~= "number" or nNum <= 0 or nNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelAsynOSItem 中 [nNum]:[".. nNum .."] 只能传大于0的整数")
		return
	end
	
	if type(nSerial) ~= "number" or nSerial < 10000 or nSerial > 20000 or nSerial%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelAsynOSItem 中 [nSerial]:[".. nSerial .."] 只能传10000-20000之间的整数")
		return
	end
	
	if type(nNosuchType) ~= "number" or nNosuchType < 0 or nNosuchType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_AddAsynOSItem 中 [nNosuchType]:[".. nNosuchType .."] 只能传大于等于0的整数")
		return
	end
	
	if nUserId == nil then
		nUserId = Get_UserId()
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelAsynOSItem 中 [nUserId]:[".. nUserId .."] 的 nUserId 只能传大于等于0的整数")
		return
	end
	
	return DelAsynOSItem(nServerId,nUserId,nItemId,nMonopoly,nNum,nSerial,nNosuchType)
end

-- //删除玩家背包的小极品装备，参1：玩家ID，参2：追加等级，返回Table
-- //Table[0]=总数;Table[1]=一洞装备数;Table[2]=两洞装备数;Table[3]=神佑1%装备数;Table[4]=神佑3%装备数;Table[5]=神佑5%装备数;Table[6]=神佑7%装备数;
-- //值为0，不加入到表中，因此Table可能为空
-- this->LuaScript()->ExportCFunc(fn_DelSmallEpicEquip, "DelSmallEpicEquip");
function Item_DelSmallEpicEquip(nLev,nUserId)
	if type(nLev) ~= "number" or  nLev < 0 or nLev%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelSmallEpicEquip 的 nLev :[".. nLev .."] 必须为整数且不小于0。")
		return
	end

	if nUserId == nil then 
		nUserId = Get_UserId()
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Item_DelSmallEpicEquip 的 nUserId :[".. nUserId .."] 必须为整数且不小于0。")
		return
	end
	
	return DelSmallEpicEquip(nUserId,nLev)
end