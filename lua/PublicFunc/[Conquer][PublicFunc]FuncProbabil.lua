----------------------------------------------------------------------------
--Name:		[����][���ú���]���ʽӿں���.lua
--Purpose:	���ʽӿ�
--Creator: 	֣�]
--Created:	2015/03/06
----------------------------------------------------------------------------
-- ��������ǰ׺�ʣ�Probabil_

-- ���ʲ������ñ�
tProbabil_Test = {}

-----------------------------ģ��---------------------------------------------
-- �������ñ�ο�
-- tProbabil_Award = {}
-- tProbabil_Award[711897] = {}
-- tProbabil_Award[711897][1] = {}
-- tProbabil_Award[711897][1]["ItemChanceSum"] = 1000						--------------��ͬ���ʻ���������

-- tProbabil_Award[711897][1][1] = {}
-- tProbabil_Award[711897][1][1]["RandomItemChanceType"] = 2				--------------���ʵ����ͣ�1Ϊ���Ը��ʴ�����2Ϊ��ͬ���ʻ�����3Ϊ���Ը��ʻ�����
-- tProbabil_Award[711897][1][1]["ItemChance"] = 600						--------------����
-- tProbabil_Award[711897][1][1]["Item_1"] = 1								--------------��Ӧ����ƷID���������Լ�����������������ʲ��Ժ����ķ���

-- tProbabil_Award[711897][1][2] = {}
-- tProbabil_Award[711897][1][2]["RandomItemChanceType"] = 2
-- tProbabil_Award[711897][1][2]["ItemChance"] = 300
-- tProbabil_Award[711897][1][2]["Item_1"] = 5

-- tProbabil_Award[711897][1][3] = {}
-- tProbabil_Award[711897][1][3]["RandomItemChanceType"] = 2
-- tProbabil_Award[711897][1][3]["ItemChance"] = 90
-- tProbabil_Award[711897][1][3]["Item_1"] = 10

-- tProbabil_Award[711897][1][4] = {}
-- tProbabil_Award[711897][1][4]["RandomItemChanceType"] = 2
-- tProbabil_Award[711897][1][4]["ItemChance"] = 10
-- tProbabil_Award[711897][1][4]["Item_1"] = 100

-- tProbabil_Award[711897][1][5] = {}
-- tProbabil_Award[711897][1][5]["RandomItemChanceType"] = 3
-- tProbabil_Award[711897][1][5]["ItemSelfChanceSum"] = 100					--------------���Ը��ʻ�������
-- tProbabil_Award[711897][1][5]["ItemChance"] = 10							--------------����
-- tProbabil_Award[711897][1][5]["Item_1"] = 1000

-- tProbabil_Award[711897][1][6] = {}
-- tProbabil_Award[711897][1][6]["RandomItemChanceType"] = 1
-- tProbabil_Award[711897][1][6]["Item_1"] = 10000

-- tProbabil_Test[711897] = {}																	--------------���ʲ��Ա��IDһ��Ϊ�����ID���߹���ID															
-- tProbabil_Test[711897]["Table"] = tProbabil_Award[711897]									--------------��ӦҪ���Եĸ��ʱ�
-- tProbabil_Test[711897]["Index"] = {1}														--------------��ӦҪ���Եĸ��ʱ�������±꣬һ������1
-- tProbabil_Test[711897]["Times"] = 10000														--------------���Թ�ģ��������
-- tProbabil_Test[711897]["TableForEach"] = {"xingtian","kuafu","houyi","fengbo"}              	--------------װ�������±꣬װ����������BOSS�ã�Ҳ���ڶ��ļ���
-- tProbabil_Test[711897]["LogName"] = "2015������"												--------------LOG�ļ���
-- tProbabilTest[90725]["MultiLog"] = 1                                                      	--------------����Ϊ1������ļ����
-- tProbabil_Test[711897]["IsGroup"] = 1														--------------����Ϊ1����������ͳ��
-- tProbabil_Test[711897]["Group"] = {}          												--------------��������£����������ֵ��Ӧ���ʱ����Item_1��ֵ                                          
-- tProbabil_Test[711897]["Group"]["1����"] = {1}
-- tProbabil_Test[711897]["Group"]["5����"] = {5} 
-- tProbabil_Test[711897]["Group"]["10����"] = {10} 
-- tProbabil_Test[711897]["Group"]["100����"] = {100}

-- Probabil_Main(711897,1000)                                                              --------------��2�����������Զ�����Թ�ģ��ȡ�����ñ���Ĵ�������

-----------------------------ģ��---------------------------------------------

local tProbabil_Text = {}
tProbabil_Text["ErrorType0"] = "?????nIndex?%d???%d?RandomItemChanceType????,????1-3??"
tProbabil_Text["ErrorType1"] = "??????????,?????nIndex?%d???"
tProbabil_Text["ErrorType2"] = "?????????????1,?????nIndex?%d???"
tProbabil_Text["Absolute"] = "  ???????????"
tProbabil_Text["Award"] = "  ????????????"
tProbabil_Text["SelfItemChance"] = "  ????????????"
tProbabil_Text["TestId"] = "????id:"
tProbabil_Text["Statistics"] = "===========================??=================================="
tProbabil_Text["TestTimes"] = "????:"
tProbabil_Text["CountTime"] = "%s%d??%d?	???????%f"
tProbabil_Text["NewCountTime"] = "%s%s??%d?	???????%f"
tProbabil_Text["NoGroup"] = "???"
tProbabil_Text["GroupTime"] = "%s?????%d??????%f"
tProbabil_Text["ErrorType3"] = "nTimes??????%d"
tProbabil_Text["Index"] = "===========================???%d?????=================================="

-- ������ʽӿ�
function Probabil_RandomAward(tTable,nIndex,nTimes)
	-- ������Ϣ����
	local tRecycleMsg = {}
	-- ����һ������Դ�����ڴ����ͬ���ʻ���������
	local tAwardSource = {}
	-- ����һ������Դ�����ڴ��ӵ�и��Ը��ʵ�����
	local tSelfItemChanceAwardSource = {}
	-- ����һ������Դ�����ڴ�ž��Դ���������
	local tAbsoluteSource = {}
	-- ����һ�������洫��Ľ�����
	local tAwardChart = tTable[nIndex]

	-- ������������
	if type(tAwardChart) == "table" then
		-- �˴��Խ������ͷ�����뽱��Դ��
		for i = 1,#tAwardChart do
			local v = tAwardChart[i]

			local randomItemChanceType = v.RandomItemChanceType or 0
			if randomItemChanceType == 1 then
				table.insert(tAbsoluteSource, v)
			elseif randomItemChanceType == 2 then
				table.insert(tAwardSource, v)
			elseif randomItemChanceType == 3 then
				table.insert(tSelfItemChanceAwardSource, v)
			else
				tRecycleMsg.ErrorType = 0
				tRecycleMsg.Text = string.format(tProbabil_Text["ErrorType0"],nIndex,i)
				return -1,tRecycleMsg
			end
		end
	else
		tRecycleMsg.ErrorType = 1
		tRecycleMsg.Text = string.format(tProbabil_Text["ErrorType1"],nIndex)
		return -1, tRecycleMsg
	end
	
	-- �����������
	-- ��������>1��ʾΪ���ʲ��ԣ�
	local nTimes = nTimes or 1
	-- �����
	local tResults = {}
	
	for _times = 1, nTimes do
		---���Դ�������
		local nAbsoluteNum = #tAbsoluteSource or 0
		local Tmp_tAbsolute = {}
		if nAbsoluteNum ~= 0 then
			for i = 1, nAbsoluteNum do
				table.insert(Tmp_tAbsolute, tAbsoluteSource[i])
			end
		end
		
		---��ͬ���ʻ���	���ʲ���
		local nCommonNum = #tAwardSource or 0
		local Tmp_tAward = {}
		local nItemChanceSum = tAwardChart["ItemChanceSum"]
		
		if nCommonNum ~= 0 then
			--�����
			local nRandomNum = math.random(1,nItemChanceSum)
			
			local nTemp = 0
			for i = 1, nCommonNum do
				nTemp = nTemp + tAwardSource[i]["ItemChance"]
				if nRandomNum <= nTemp then
					table.insert(Tmp_tAward,tAwardSource[i])
					break
				end
			end
		end
		
		---���Ը��ʲ���
		local nEachNum = #tSelfItemChanceAwardSource or 0
		local Tmp_tSelfItemChanceAward = {}
		
		if nEachNum ~= 0 then
			for i = 1, nEachNum do
				local nItemSelfChanceSum = tSelfItemChanceAwardSource[i]["ItemSelfChanceSum"]
				local nItemChance = tSelfItemChanceAwardSource[i]["ItemChance"]
				
				if nItemSelfChanceSum >= 1 then
					if math.random(1,nItemSelfChanceSum) <= nItemChance then
						table.insert(Tmp_tSelfItemChanceAward,tSelfItemChanceAwardSource[i])
					end
				else
					tRecycleMsg.ErrorType = 2
					tRecycleMsg.Text = string.format(tProbabil_Text["ErrorType2"],nIndex)
					return -1, tRecycleMsg
				end
			end
		end
		
		table.insert(tResults,
			{tAward = Tmp_tAward,
			tSelfItemChanceAward = Tmp_tSelfItemChanceAward,
			tAbsoluteAward = Tmp_tAbsolute
			}
		)
	end

	return 0,tResults
end

---------------------------------------------- ���ʲ��Խӿ�
-- ����ļ����ļ���
function Probabil_GetLogName(nTempIndex)
	local sLogName = "���ʲ���.log"
	if tProbabil_Test[nTempIndex]["LogName"] ~= nil and tProbabil_Test[nTempIndex]["LogName"] ~= "" then
		sLogName = tProbabil_Test[nTempIndex]["LogName"]
	end

	sLogName = string.format("syslog/%s",sLogName)
	return sLogName
end

-- ��ʼ������Դ��
function Probabil_InitTables(nTempIndex)
	local tTable = tProbabil_Test[nTempIndex]["Table"]
	local tTableForEach = tProbabil_Test[nTempIndex]["TableForEach"]
	local tEnum = {}

	if tTableForEach ~= nil and type(tTableForEach) == "table" and #tTableForEach > 0 then
		for k,v in pairs(tTableForEach) do
			tEnum[v] = tTable[v]
		end
	else
		table.insert(tEnum,tTable)
	end
	
	return tEnum
end

-- ������ʲ���log�ļ�
function Probabil_AwardDetails(nTempIndex,tTable,nTimes,sLogName)
	local nIsGroup = tProbabil_Test[nTempIndex]["IsGroup"]
	-- log�ļ���
	local sLogName = sLogName or "TestUnit.log"
	-- �������ñ�
	local tTable = tTable or {}
	-- ѭ������
	local nTimes = nTimes or 1
	local sAbsoluteAward = nTimes > 1 and tProbabil_Text["Absolute"] or ""
	local sAward = nTimes > 1 and tProbabil_Text["Award"] or ""
	local sSelfItemChanceAward = nTimes > 1 and tProbabil_Text["SelfItemChance"] or ""
	local tResult = {}

	if nTimes == #tTable then
		-- ��ȡ������ʱ�
		local ArrayKeys={}
		ArrayKeys[1]={KEYName = "tAbsoluteAward",KEYStr = sAbsoluteAward}
		ArrayKeys[2]={KEYName = "tAward",KEYStr = sAward}
		ArrayKeys[3]={KEYName = "tSelfItemChanceAward",KEYStr = sSelfItemChanceAward}

		-- ����������ʱ�
		for i,v in pairs(tTable) do
			for nKey = 1,3 do
				local KEYName = ArrayKeys[nKey]["KEYName"]
				local KEYStr = ArrayKeys[nKey]["KEYStr"]

				if v[KEYName] ~= nil then
					for _i = 1,#v[KEYName] do
						local tValue = v[KEYName][_i]

						for nIndex = 1,5 do
							if tValue["Item_"..nIndex] ~= nil then
								local nItemId = 0 
								-- ��¼���ִ���
								tResult[KEYName] = tResult[KEYName] or {}

								if (type(tValue["Item_"..nIndex]) == "number") then
									nItemId = tValue["Item_"..nIndex]
								elseif (type(tValue["Item_"..nIndex]) == "table") then
									local n = math.random(#tValue["Item_"..nIndex])
									nItemId = tValue["Item_"..nIndex][n]
								end

								if tResult[KEYName][nItemId] ~= nil then
									tResult[KEYName][nItemId] = tResult[KEYName][nItemId] + 1
								else
									tResult[KEYName][nItemId] = 1
								end

								local sSingleTestLog = tProbabil_Text["TestId"]..i..KEYStr..nItemId
								-- ���β������log
								SaveCustomLog(sLogName,sSingleTestLog)
							else	
								break
							end
						end
					end
				end
			end
		end

		-- ͳ�ƴ���
		SaveCustomLog(sLogName,tProbabil_Text["Statistics"])
		SaveCustomLog(sLogName,tProbabil_Text["TestTimes"]..nTimes)
		
		for nIndex = 1,3 do
			local KEYName = ArrayKeys[nIndex]["KEYName"]
			local KEYStr = ArrayKeys[nIndex]["KEYStr"]
		
			if tResult[KEYName] ~= nil then
				-- �Զ������
				if nIsGroup ~= nil and nIsGroup == 1 and tProbabil_Test[nTempIndex]["Group"] ~= nil then
					---------------��������
					local tGroupResult = {}
					local bIsUsed = false  
					
					-- ����Ĵ���ͳ��
					for _i,_v in pairs(tResult[KEYName]) do
						bIsUsed = false

						local sSingleTestLog = string.format(tProbabil_Text["CountTime"],KEYStr,_i,_v,_v/nTimes)
						-- ���β������log
						SaveCustomLog(sLogName,sSingleTestLog)
						
						-- ����LOG����
						for _G_k,_G_v in pairs(tProbabil_Test[nTempIndex]["Group"]) do
							if not bIsUsed then
								for _T_k,_T_v in pairs(_G_v) do
									if _T_v == _i then
										bIsUsed = true
										tGroupResult[_G_k] = tGroupResult[_G_k] or 0
										tGroupResult[_G_k] = tGroupResult[_G_k] + _v
									end
								end
							end
						end
						
						-- δ�����������
						if not bIsUsed then
							tGroupResult[tProbabil_Text["NoGroup"]] = tGroupResult[tProbabil_Text["NoGroup"]] or 0
							tGroupResult[tProbabil_Text["NoGroup"]] = tGroupResult[tProbabil_Text["NoGroup"]] + _v
						end
					end
					
					-- ����LOG���
					for _i,_v in pairs(tGroupResult) do
						local sSingleTestLog = string.format(tProbabil_Text["GroupTime"],_i,_v,_v/nTimes)
						SaveCustomLog(sLogName,sSingleTestLog)
					end
				else
					-- ͳ�Ʋ��Խ��
					for _i,_v in pairs(tResult[KEYName]) do
						local sSingleTestLog = string.format(tProbabil_Text["CountTime"],KEYStr,_i,_v,_v/nTimes)
						-- ���ͳ�ƽ��log
						SaveCustomLog(sLogName,sSingleTestLog)
					end
				end
			end
		end
	else
		SaveCustomLog(sLogName,string.format(tProbabil_Text["ErrorType3"],#tTable))
	end
end

-- ����������ʽӿڲ�������ʲ���log�ļ�
function Probabil_OutPutLog(nTempIndex,tTable,nIndex,nTimes,sLogName)
	local nTimes = nTimes or 1
	local flat,tRetAwardDetails = Probabil_RandomAward(tTable,nIndex,nTimes)

	if flat == -1 then
		SaveCustomLog(sLogName,tRetAwardDetails.Text)
	elseif flat == 0 then
		Probabil_AwardDetails(nTempIndex,tRetAwardDetails,nTimes,sLogName)
	end
end

-- ������
function Probabil_Main(nTempIndex,nTimes)
	-- ��ȡ�Ƿ��Զ�����LOG�ļ���
	local nMultiLog = tProbabil_Test[nTempIndex]["MultiLog"]
	local sMultiLogName = ""
	-- ��ȡLOG�ļ���
	local sLogName = Probabil_GetLogName(nTempIndex)
	-- ��ʼ������Դ��
	local tEnum = Probabil_InitTables(nTempIndex)
	-- ��ȡ�±��
	local tIndex = tProbabil_Test[nTempIndex]["Index"]
	-- ��ȡ���Դ���
	local nTimes = nTimes or tProbabil_Test[nTempIndex]["Times"]

	-- �������Դ��
	for k,v in pairs(tEnum) do
		-- �ڲ��±�
		for kk,vv in pairs(tIndex) do
			-- �Ƿ��Զ�����LOG�ļ���
			if nMultiLog ~= nil and nMultiLog == 1 then
				sMultiLogName = sLogName .. "_" .. k .. "_" .. vv
				Probabil_OutPutLog(nTempIndex,v,vv,nTimes,sMultiLogName)
			else
				Probabil_OutPutLog(nTempIndex,v,vv,nTimes,sLogName)
			end
		end
	end
end