----------------------------------------------------------------------------------------
--Name:		[简体征服][公用函数]常用函数
--Creator:		郑鋆
--Created:		2015/12/29
----------------------------------------------------------------------------------------


-- 命名前缀
-- CommonFunc_

-- 获取活动前的时间
function CommonFunc_GetBeforeActivityTime(sParam)
	if sParam == nil or type(sParam) ~= "string" then
		
		return false
	end
	
	-- 字符解析
	local sBeginYear,sBeginMonth,sBeginDay,sBeginHour,sBeginMinute,sEndYear,sEndMonth,sEndDay,sEndHour,sEndMinute = CommonFunc_AnalysisActivityTime(sParam)
	local nTime = os.time{year = tonumber(sBeginYear),month = tonumber(sBeginMonth),day = tonumber(sBeginDay),hour = tonumber(sBeginHour),min = tonumber(sBeginMinute),sec = 0}
	local nNowTime = os.time()
	
	-- 判断是否在活动时间前
	return nNowTime < nTime
end

--判断活动时间后
function CommonFunc_GetAfterActivityTime(sParam)
	if sParam == nil or type(sParam) ~= "string" then
		
		return false
	end
	
	local sBeginYear,sBeginMonth,sBeginDay,sBeginHour,sBeginMinute,sEndYear,sEndMonth,sEndDay,sEndHour,sEndMinute = CommonFunc_AnalysisActivityTime(sParam)
	local nTime = os.time{year = tonumber(sEndYear),month = tonumber(sEndMonth),day = tonumber(sEndDay),hour = tonumber(sEndHour),min = tonumber(sEndMinute),sec = 59}
	local nNowTime = os.time()
	
	--判断是否在活动时间后
	return nNowTime > nTime
end
-- 对表进行去掉重复
function CommonFunc_RemoveDplicate(tTable)
	local t = {}
	local tNew = {}
	
	for i,v in pairs (tTable) do
		t[v] = true
	end
	
	for i,v in pairs (t) do
		table.insert(tNew,i)
	end
	
	return tNew
end

-- 获取获得的物品数量
function CommonFunc_GetItemNum(sFullString)
	local tSplitArray = Sys_Split(sFullString," ")
	return tSplitArray[2]
end

-- 获取获得的符文数量
function CommonFunc_GetRuneNum(sFullString)
	local tSplitArray = Sys_Split(sFullString," ")
	return tSplitArray[2]
end

-- 计算此时距离传入的时间是多少天
-- sStartTime 格式：2016-02-25(年月日必须这么写，后面小时分钟格式不管)
function CommonFunc_DisActivityTime(sStartTime)
	if sStartTime == nil or type(sStartTime) ~= "string" then
		return 0
	end
	
	local i,j,sStaYear,sStaMonth,sStaDay = string.find(sStartTime,"(%d+)-(%d+)-(%d+)")
	-- 活动开始日期
	local nStaTime  =os.time{year=sStaYear,month=sStaMonth,day=sStaDay,hour=0,min=0,sec=0}
	local nYear,nMonth,nDay = os.date("%Y"),os.date("%m"),os.date("%d")
	local nEndTime  =os.time{year=nYear,month=nMonth,day=nDay,hour=0,min=0,sec=0}
	-- 一天秒数
	local nOnedaySec = 24*60*60
	local nDisSec = math.abs(nEndTime-nStaTime)
	-- 活动距离天数
	local nDisDay = math.floor(nDisSec/nOnedaySec)
	return nDisDay
end

--表复制
function CommonFunc_Copy(object)
    local lookup_table = {}
    local function copyObj(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs( object ) do
            new_table[copyObj(key)] = copyObj(value)
        end
        return setmetatable(new_table,getmetatable(object))
    end
    return copyObj(object)
end

-- 获取当前时间对应的农历时间
function CommonFunc_GetLunarTime(st)
--[[
    --天干名称
    local cTianGan = {"甲","乙","丙","丁","戊","己","庚","辛","壬","癸"}
    --地支名称
    local cDiZhi = {"子","丑","寅","卯","辰","巳","午", "未","申","酉","戌","亥"}
    --属相名称
    local cShuXiang = {"鼠","牛","虎","兔","龙","蛇", "马","羊","猴","鸡","狗","猪"}
    --农历日期名
    local cDayName ={"*","初一","初二","初三","初四","初五","初六","初七","初八","初九","初十","十一","十二","十三","十四","十五","十六","十七","十八","十九","二十","廿一","廿二","廿三","廿四","廿五","廿六","廿七","廿八","廿九","三十"}
    --农历月份名
    local cMonName = {"*","正","二","三","四","五","六", "七","八","九","十","十一","腊"}
--]]
    --公历每月前面的天数
    local wMonthAdd = {0,31,59,90,120,151,181,212,243,273,304,334}
    -- 农历数据
    local wNongliData = {2635,333387,1701,1748,267701,694,2391,133423,1175,396438
    ,3402,3749,331177,1453,694,201326,2350,465197,3221,3402
    ,400202,2901,1386,267611,605,2349,137515,2709,464533,1738
    ,2901,330421,1242,2651,199255,1323,529706,3733,1706,398762
    ,2741,1206,267438,2647,1318,204070,3477,461653,1386,2413
    ,330077,1197,2637,268877,3365,531109,2900,2922,398042,2395
    ,1179,267415,2635,661067,1701,1748,398772,2742,2391,330031
    ,1175,1611,200010,3749,527717,1452,2742,332397,2350,3222
    ,268949,3402,3493,133973,1386,464219,605,2349,334123,2709
    ,2890,267946,2773,592565,1210,2651,395863,1323,2707,265877}

    local wCurYear,wCurMonth,wCurDay;
    local nTheDate,nIsEnd,m,k,n,i,nBit;
    local szNongli, szNongliDay,szShuXiang;
    ---取当前公历年、月、日---
    wCurYear = st.year;
    wCurMonth = st.month;
    wCurDay = st.day;
    ---计算到初始时间1921年2月8日的天数：1921-2-8(正月初一)---
    nTheDate = (wCurYear - 1921) * 365 + (wCurYear - 1921) / 4 + wCurDay + wMonthAdd[wCurMonth] - 38
    if (((wCurYear % 4) == 0) and (wCurMonth > 2)) then
        nTheDate = nTheDate + 1
    end

    --计算农历天干、地支、月、日---
    nIsEnd = 0;
    m = 0;
	local nCalLoop = 0
    while nIsEnd ~= 1 do
		if nCalLoop > G_CalculateLoop then
			Sys_SaveAbnormalLog("函数 CommonFunc_GetLunarTime 1 中 [while]循环超过1000次！")
			break
		end
		nCalLoop = nCalLoop + 1
        if wNongliData[m+1] < 4095 then
            k = 11;
        else
            k = 12;
        end
        n = k;
		local nCalLoopNew = 0
        while n>=0 do
			if nCalLoopNew > G_CalculateLoop then
				Sys_SaveAbnormalLog("函数 CommonFunc_GetLunarTime 2 中 [while]循环超过1000次！")
				break
			end
			nCalLoopNew = nCalLoopNew + 1
            --获取wNongliData(m)的第n个二进制位的值
            nBit = wNongliData[m+1];
            for i=1,n do
                nBit = math.floor(nBit/2);
            end

            nBit = nBit % 2;

            if nTheDate <= (29 + nBit) then
                nIsEnd = 1;
                break;
            end

            nTheDate = nTheDate - 29 - nBit;
            n = n - 1;
        end
        if nIsEnd ~= 0 then
            break;
        end
        m = m + 1;
    end

    wCurYear = 1921 + m;
    wCurMonth = k - n + 1;
    wCurDay = math.floor(nTheDate);
    -- wCurDay = nTheDate;
    if k == 12 then
        if wCurMonth == wNongliData[m+1] / 65536 + 1 then
            wCurMonth = 1 - wCurMonth;
        elseif wCurMonth > wNongliData[m+1] / 65536 + 1 then
            wCurMonth = wCurMonth - 1;
        end
    end
	
	return wCurYear,wCurMonth,wCurDay
    -- print('农历', wCurYear, wCurMonth, wCurDay)
    --生成农历天干、地支、属相 ==> wNongli--
    -- szShuXiang = cShuXiang[(((wCurYear - 4) % 60) % 12) + 1]
    -- szShuXiang = cShuXiang[(((wCurYear - 4) % 60) % 12) + 1];
    -- szNongli = szShuXiang .. '(' .. cTianGan[(((wCurYear - 4) % 60) % 10)+1] .. cDiZhi[(((wCurYear - 4) % 60) % 12) + 1] .. ')年'
    -- szNongli,"%s(%s%s)年",szShuXiang,cTianGan[((wCurYear - 4) % 60) % 10],cDiZhi[((wCurYear - 4) % 60) % 12]);

    --生成农历月、日 ==> wNongliDay--*/
    -- if wCurMonth < 1 then
        -- szNongliDay =  "闰" .. cMonName[(-1 * wCurMonth) + 1]
    -- else
        -- szNongliDay = cMonName[wCurMonth+1]
    -- end

    -- szNongliDay =  szNongliDay .. "月" .. cDayName[wCurDay+1]
    -- return szNongli .. szNongliDay
end

-- 加经验的接口（满级给奇门秘籍）
function CommonFunc_RewardExp(tReward,nNowUserId)
	local nUserId = nNowUserId or Get_UserId()
	local tMayBeReward = CommonFunc_Copy(tReward)
	local nLevel = Get_UserLevel(nUserId)
	
	-- 判断是否满级
	if nLevel >= G_User_MaxLev then
		tMayBeReward = CommonFunc_RewardExpMaxLev(tMayBeReward,nUserId)
	end
	
	-- 给奖励
	RewardTemplate_UseItemAndMsg(tMayBeReward)
end

-- 满级给奇门秘籍
function CommonFunc_RewardExpMaxLev(tReward,nUserId)
	local tMayBeReward = CommonFunc_Copy(tReward)
	local nRewardNum = 0
	
	for i,v in pairs (tReward) do
		if string.find(i,"RewardExpTime") then
			nRewardNum = nRewardNum + v["Value"]/10
			tMayBeReward["RewardExpTime"] = nil
		elseif string.find(i,"RewardExp") then
			local nExpTime = 672957
			local nAddNum = math.floor((v["Value"]/nExpTime)/10)
			
			if nAddNum == 0 then
				nAddNum = 1
			end
			
			nRewardNum = nRewardNum + nAddNum
			tMayBeReward["RewardExp"] = nil
		end
	end
	
	local tRewardItem = {}
	tRewardItem["Id"] = 723340
	tRewardItem["Attr"] = string.format("0 %d",nRewardNum)
	
	if type(tMayBeReward["RewardItem"]) ~= "table" then
		tMayBeReward["RewardItem"] = {}
	end
	
	table.insert(tMayBeReward["RewardItem"],tRewardItem)
	
	return tMayBeReward
end

-- 解析小时时间
-- "mm mm"
function CommonFunc_AnalysisHourTime(sTime)
	local i,j,sBegin,sEnd = string.find(sTime,"(%d+)%s* %s*(%d+)")
	return sBegin,sEnd
end

-- 解析日时间
-- "hh:mm hh:mm"
function CommonFunc_AnalysisDayTime(sTime)
	local i,j,sBeginHour,sBeginMinute,sEndHour,sEndMinute = string.find(sTime,"(%d+)%s*:%s*(%d+)%s* %s*(%d+)%s*:%s*(%d+)")

	return sBeginHour,sBeginMinute,sEndHour,sEndMinute
end

-- 解析周某天/月某天时间
-- "dd hh:mm dd hh:mm"
function CommonFunc_AnalysisWDayTime(sTime)
	local i,j,sBeginDay,sBeginHour,sBeginMinute,sEndDay,sEndHour,sEndMinute = string.find(sTime,"(%d+)%s* %s*(%d+)%s*:%s*(%d+)%s* %s*(%d+)%s* %s*(%d+)%s*:%s*(%d+)")

	return sBeginDay,sBeginHour,sBeginMinute,sEndDay,sEndHour,sEndMinute
end

-- 解析年某天时间
-- "mm-dd hh:mm mm-dd hh:mm"
function CommonFunc_AnalysisYearTime(sTime)
	local i,j,sBeginMonth,sBeginDay,sBeginHour,sBeginMinute,sEndMonth,sEndDay,sEndHour,sEndMinute = string.find(sTime,"(%d+)%s*-%s*(%d+)%s* %s*(%d+)%s*:%s*(%d+)%s* %s*(%d+)%s*-%s*(%d+)%s* %s*(%d+)%s*:%s*(%d+)")

	return sBeginMonth,sBeginDay,sBeginHour,sBeginMinute,sEndMonth,sEndDay,sEndHour,sEndMinute
end

-- 解析完整的活动时间
function CommonFunc_AnalysisActivityTime(sTime)
	local i,j,sBeginYear,sBeginMonth,sBeginDay,sBeginHour,sBeginMinute,sEndYear,sEndMonth,sEndDay,sEndHour,sEndMinute = string.find(sTime,"(%d+)%s*-%s*(%d+)%s*-%s*(%d+)%s* %s*(%d+)%s*:%s*(%d+)%s* %s*(%d+)%s*-%s*(%d+)%s*-%s*(%d+)%s* %s*(%d+)%s*:%s*(%d+)")

	return sBeginYear,sBeginMonth,sBeginDay,sBeginHour,sBeginMinute,sEndYear,sEndMonth,sEndDay,sEndHour,sEndMinute
end

-- 检测是否是金币服
function CommonFunc_ChkGoldServer()
	return G_Sys_GoldServer >= 1
end

-- 设置是否金币服
function CommonFunc_SetGoldServer()
	G_Sys_GoldServer = Get_SysDynaGlobalData0(G_Gold_DynaGlobal)
end

tServerStart["tFunction"] = tServerStart["tFunction"] or {}
table.insert(tServerStart["tFunction"],CommonFunc_SetGoldServer)




-- 旧的职业编号转换成新的职业编号
function CommonFunc_OldProChangeNewPro(nOldPro)
	local nPro = math.floor(nOldPro/10)
	local nProEnd = nOldPro % 10

	local nNewPro = nPro*1000 + nProEnd
	return math.floor(nNewPro)
end

-- 新的职业编号转换成旧的职业编号
function CommonFunc_NewProChangeOldPro(nNewPro)
	local nPro = math.floor(nNewPro/1000)
	local nProEnd = nNewPro % 1000

	if nProEnd > 5 then
		nProEnd = 5
	end

	local nOldPro = nPro*10 + nProEnd
	return math.floor(nOldPro)
end
-- 龙灵物品打印log
function CommonFunc_Printing(nItemId,nItemNum,nType,nNowUserId)
	-- 判断是否龙灵
	if nItemId < tDragonSoulId[1] or nItemId > tDragonSoulId[2] then
		return
	end
	local sLogText = ""
	local nUserId = nNowUserId
	if nUserId == 0 or nUserId == nil then
		nUserId = Get_UserId()
	end
	if nType == 1 then
		sLogText = string.format("玩家ID为%d获得龙灵ID为	%d	,数量为	%d",nUserId,nItemId,nItemNum)
	else
		sLogText = string.format("玩家ID为%d删除龙灵ID为	%d	,数量为	%d",nUserId,nItemId,nItemNum)
	end
	local sLogFile = "gmlog/Statistics"
	return SaveCustomLog(sLogFile,sLogText)
end

local formatFun = string.format
local _G_STRING_FORMAT = function(formatStr,...)
	local args = {...}
	for i = 1,#args do
		if type(args[i]) == "string" then
			if string.match(args[i],"STR_") then
				local nNewIndex = string.find(args[i],"@@",-2)
				if nNewIndex == nil then
					args[i] = "<" .. args[i] .. "@@>"
				else
					args[i] = "<" .. args[i] .. ">"
				end
			end
		end
	end
	return formatFun(formatStr,table.unpack(args))
end
string.format = _G_STRING_FORMAT

-- 转换世界端文字格式
function CommonFunc_Conversion(sParam)
	-- 检测是否有@@@@的字符
	local nIndex = string.find(sParam,"@@@@")

	if nIndex == nil then
		return sParam
	end
	
	local sNewParam = CommonFunc_ConversionText(sParam,nIndex)
	local nLen = string.len(sParam)

	for i = 1,nLen do
		local nNewIndex = string.find(sNewParam,"@@@@")
		if nNewIndex == nil then
			break
		end
		sNewParam = CommonFunc_ConversionText(sNewParam,nNewIndex)
	end

	return sNewParam
end

function CommonFunc_ConversionText(sParam,nIndex)
	local sFore = string.sub(sParam,1,nIndex + 1)
	local sRear = string.sub(sParam,nIndex + 2,- 1)
	local sReverse = string.reverse(sFore)
	local nNewIndex = string.find(sReverse,"_RTS@",3)
	if nNewIndex == nil then
		return sParam
	end
	
	nNewIndex = string.len(sReverse) - nNewIndex -3
	local sNewParam = string.sub(sFore,1,nNewIndex)
	sRear = ">" .. sRear
	sNewParam = sNewParam .. "<" .. string.sub(sFore,nNewIndex + 1,-1)
	
	return sNewParam .. sRear
end