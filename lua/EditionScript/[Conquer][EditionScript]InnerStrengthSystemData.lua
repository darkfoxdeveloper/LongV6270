----------------------------------------------------------------------------
--Name:		[����][���ܽű�]�ڹ�ϵͳ����.lua
--Purpose:	�ڹ�����
--Creator: 	֣�]
--Created:	2014/11/21
----------------------------------------------------------------------------
---------------------------------�����淶----------------------------------

-- �ڹ�������������ǰ׺�ʣ� InternalSystem_

-- ������
local tInternalSystem_Count = {}
	tInternalSystem_Count["MaxCultureValue"] = 999999999

-- �ؼ���ӦҪ���
local tInternalSystem_Item = {}
	-- ��Ԫ������ƪ
	tInternalSystem_Item[3005365] = {}
	tInternalSystem_Item[3005365]["InnerStrengthType"] = 1
	tInternalSystem_Item[3005365]["Metempsychosis"] = 2
	tInternalSystem_Item[3005365]["Level"] = 15
	tInternalSystem_Item[3005365]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3005365]["RequireType"] = 0
	tInternalSystem_Item[3005365]["RequireLevel"] = 0
	
	-- ��Ԫ������ƪ
	tInternalSystem_Item[3005366] = {}
	tInternalSystem_Item[3005366]["InnerStrengthType"] = 2
	tInternalSystem_Item[3005366]["Metempsychosis"] = 2
	tInternalSystem_Item[3005366]["Level"] = 15
	tInternalSystem_Item[3005366]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3005366]["RequireType"] = 1
	tInternalSystem_Item[3005366]["RequireLevel"] = 5
	
	-- �����������ƪ
	tInternalSystem_Item[3005395] = {}
	tInternalSystem_Item[3005395]["InnerStrengthType"] = 3
	tInternalSystem_Item[3005395]["Metempsychosis"] = 2
	tInternalSystem_Item[3005395]["Level"] = 15
	tInternalSystem_Item[3005395]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3005395]["RequireType"] = 2
	tInternalSystem_Item[3005395]["RequireLevel"] = 5
	
	-- �����������ƪ
	tInternalSystem_Item[3005396] = {}
	tInternalSystem_Item[3005396]["InnerStrengthType"] = 4
	tInternalSystem_Item[3005396]["Metempsychosis"] = 2
	tInternalSystem_Item[3005396]["Level"] = 15
	tInternalSystem_Item[3005396]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3005396]["RequireType"] = 3
	tInternalSystem_Item[3005396]["RequireLevel"] = 5
	
	-- ��ɲ������ƪ
	tInternalSystem_Item[3007113] = {}
	tInternalSystem_Item[3007113]["InnerStrengthType"] = 5
	tInternalSystem_Item[3007113]["Metempsychosis"] = 2
	tInternalSystem_Item[3007113]["Level"] = 15
	tInternalSystem_Item[3007113]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3007113]["RequireType"] = 4
	tInternalSystem_Item[3007113]["RequireLevel"] = 5
	
	-- ��ɲ������ƪ
	tInternalSystem_Item[3007114] = {}
	tInternalSystem_Item[3007114]["InnerStrengthType"] = 6
	tInternalSystem_Item[3007114]["Metempsychosis"] = 2
	tInternalSystem_Item[3007114]["Level"] = 15
	tInternalSystem_Item[3007114]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3007114]["RequireType"] = 5
	tInternalSystem_Item[3007114]["RequireLevel"] = 7
	
	-- �������������ƪ
	tInternalSystem_Item[3005397] = {}
	tInternalSystem_Item[3005397]["InnerStrengthType"] = 7
	tInternalSystem_Item[3005397]["Metempsychosis"] = 2
	tInternalSystem_Item[3005397]["Level"] = 15
	tInternalSystem_Item[3005397]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3005397]["RequireType"] = 6
	tInternalSystem_Item[3005397]["RequireLevel"] = 7
	
	-- �������������ƪ
	tInternalSystem_Item[3005398] = {}
	tInternalSystem_Item[3005398]["InnerStrengthType"] = 8
	tInternalSystem_Item[3005398]["Metempsychosis"] = 2
	tInternalSystem_Item[3005398]["Level"] = 15
	tInternalSystem_Item[3005398]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3005398]["RequireType"] = 7
	tInternalSystem_Item[3005398]["RequireLevel"] = 7

	-- �����ľ�����ƪ
	tInternalSystem_Item[3007115] = {}
	tInternalSystem_Item[3007115]["InnerStrengthType"] = 9
	tInternalSystem_Item[3007115]["Metempsychosis"] = 2
	tInternalSystem_Item[3007115]["Level"] = 15
	tInternalSystem_Item[3007115]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3007115]["RequireType"] = 8
	tInternalSystem_Item[3007115]["RequireLevel"] = 7
	
	-- �����ľ�����ƪ
	tInternalSystem_Item[3007116] = {}
	tInternalSystem_Item[3007116]["InnerStrengthType"] = 10
	tInternalSystem_Item[3007116]["Metempsychosis"] = 2
	tInternalSystem_Item[3007116]["Level"] = 15
	tInternalSystem_Item[3007116]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3007116]["RequireType"] = 9
	tInternalSystem_Item[3007116]["RequireLevel"] = 7
	
	-- �����ľ�����ƪ
	tInternalSystem_Item[3007117] = {}
	tInternalSystem_Item[3007117]["InnerStrengthType"] = 11
	tInternalSystem_Item[3007117]["Metempsychosis"] = 2
	tInternalSystem_Item[3007117]["Level"] = 15
	tInternalSystem_Item[3007117]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3007117]["RequireType"] = 10
	tInternalSystem_Item[3007117]["RequireLevel"] = 7

	-- ̫���񹦡���ƪ
	tInternalSystem_Item[3005399] = {}
	tInternalSystem_Item[3005399]["InnerStrengthType"] = 12
	tInternalSystem_Item[3005399]["Metempsychosis"] = 2
	tInternalSystem_Item[3005399]["Level"] = 15
	tInternalSystem_Item[3005399]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3005399]["RequireType"] = 11
	tInternalSystem_Item[3005399]["RequireLevel"] = 7
	
	-- ̫���񹦡���ƪ
	tInternalSystem_Item[3005400] = {}
	tInternalSystem_Item[3005400]["InnerStrengthType"] = 13
	tInternalSystem_Item[3005400]["Metempsychosis"] = 2
	tInternalSystem_Item[3005400]["Level"] = 15
	tInternalSystem_Item[3005400]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3005400]["RequireType"] = 12
	tInternalSystem_Item[3005400]["RequireLevel"] = 7
	
	-- ̫���񹦡���ƪ
	tInternalSystem_Item[3005401] = {}
	tInternalSystem_Item[3005401]["InnerStrengthType"] = 14
	tInternalSystem_Item[3005401]["Metempsychosis"] = 2
	tInternalSystem_Item[3005401]["Level"] = 15
	tInternalSystem_Item[3005401]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3005401]["RequireType"] = 13
	tInternalSystem_Item[3005401]["RequireLevel"] = 7

	-- ������������ƪ
	tInternalSystem_Item[3007230] = {}
	tInternalSystem_Item[3007230]["InnerStrengthType"] = 15
	tInternalSystem_Item[3007230]["Metempsychosis"] = 2
	tInternalSystem_Item[3007230]["Level"] = 15
	tInternalSystem_Item[3007230]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3007230]["RequireType"] = 14
	tInternalSystem_Item[3007230]["RequireLevel"] = 7
	
	-- ������������ƪ
	tInternalSystem_Item[3007231] = {}
	tInternalSystem_Item[3007231]["InnerStrengthType"] = 16
	tInternalSystem_Item[3007231]["Metempsychosis"] = 2
	tInternalSystem_Item[3007231]["Level"] = 15
	tInternalSystem_Item[3007231]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3007231]["RequireType"] = 15
	tInternalSystem_Item[3007231]["RequireLevel"] = 7
	
	-- ������������ƪ
	tInternalSystem_Item[3007232] = {}
	tInternalSystem_Item[3007232]["InnerStrengthType"] = 17
	tInternalSystem_Item[3007232]["Metempsychosis"] = 2
	tInternalSystem_Item[3007232]["Level"] = 15
	tInternalSystem_Item[3007232]["InnerStrengthVlue"] = 0
	tInternalSystem_Item[3007232]["RequireType"] = 16
	tInternalSystem_Item[3007232]["RequireLevel"] = 7

-- �ڹ����Ͷ�Ӧ��Ʒ��
local tInternalSystem_InnerType = {}
	tInternalSystem_InnerType[1] = 3005365
	tInternalSystem_InnerType[2] = 3005366
	tInternalSystem_InnerType[3] = 3005395
	tInternalSystem_InnerType[4] = 3005396
	tInternalSystem_InnerType[5] = 3007113
	tInternalSystem_InnerType[6] = 3007114
	tInternalSystem_InnerType[7] = 3005397
	tInternalSystem_InnerType[8] = 3005398
	tInternalSystem_InnerType[9] = 3007115
	tInternalSystem_InnerType[10] = 3007116
	tInternalSystem_InnerType[11] = 3007117
	tInternalSystem_InnerType[12] = 3005399
	tInternalSystem_InnerType[13] = 3005400
	tInternalSystem_InnerType[14] = 3005401
	tInternalSystem_InnerType[15] = 3007230
	tInternalSystem_InnerType[16] = 3007231
	tInternalSystem_InnerType[17] = 3007232

local tInternalSystem_Log = {}
	tInternalSystem_Log["OperType"] = "340"
	tInternalSystem_Log["Text"] = "0,0,%d,1,10002380,2,18,%d"

-- ����˵��õĽӿں���
function InternalSystem_InnerType(nInnerType)
	if type(nInnerType) ~= "number" then
		return
	end
	
	local nItemId = tInternalSystem_InnerType[nInnerType]
	InternalSystem_Item(nItemId)
end
	
-- ʹ���ؼ�
function InternalSystem_UseItem()
	local nItemId = Get_ItemType()
	InternalSystem_Item(nItemId)
end

function InternalSystem_Item(nItemId)
	if nItemId == nil then
		User_TalkChannel2005(tInternalSystem_Msg["NoItems"])
		return
	end

	-- �ж���Ʒ�Ƿ����
	if not Item_ChkItem(nItemId) then
		User_TalkChannel2005(tInternalSystem_Msg["NoItems"])
		return
	end

	local nInnerStrengthType = tInternalSystem_Item[nItemId]["InnerStrengthType"]
	-- �ж��Ƿ�ѧ�����ڹ�
	if User_IsLearnInnerStrengthType(nInnerStrengthType) then
		User_TalkChannel2005(tInternalSystem_Msg["Learn"])
		return
	end

	local nMetempsychosis = Get_UserMetempsychosis()
	local nLevel = Get_UserLevel()
	-- �ж�ת���ȼ��Ƿ�����
	if nMetempsychosis < tInternalSystem_Item[nItemId]["Metempsychosis"] then
		User_TalkChannel2005(tInternalSystem_Msg["Condition"])
		return
	end

	if nMetempsychosis == tInternalSystem_Item[nItemId]["Metempsychosis"] and 
		nLevel < tInternalSystem_Item[nItemId]["Level"] then
		
		User_TalkChannel2005(tInternalSystem_Msg["Condition"])
		return
	end

	-- �ж�ǰ���ڹ��Ƿ�����
	if tInternalSystem_Item[nItemId]["RequireType"] > 0 then
		local nRequirements = tInternalSystem_Item[nItemId]["RequireType"]

		if not User_IsLearnInnerStrengthType(nRequirements) then
			User_TalkChannel2005(tInternalSystem_Msg["NotLearn"])
			return
		end

		local nRequireLevel = Get_InnerStrengthLevByType(nRequirements)

		if nRequireLevel < tInternalSystem_Item[nItemId]["RequireLevel"] then
			User_TalkChannel2005(tInternalSystem_Msg["NotLearn"])
			return
		end
	end

	local nTotalValue = Get_InnerStrengthTotalValue(0)
	
	-- �ж�����Ҫ���Ƿ�����
	if nTotalValue < tInternalSystem_Item[nItemId]["InnerStrengthVlue"] then
		User_TalkChannel2005(tInternalSystem_Msg["NotVlue"])
		return
	end

	if Item_ChkItem(nItemId) and Item_DelItem(nItemId) then
		-- ѧϰ�ڹ�
		User_LearningInnerStrength(nInnerStrengthType)
		
		local sText = string.format(tInternalSystem_Log["Text"],nItemId,nInnerStrengthType)
		Sys_SaveActionLog(tInternalSystem_Log["OperType"],sText)
		
		local sInnerName = tInternalSystem_InnerName[nInnerStrengthType]
		local str = string.format(tInternalSystem_Msg["Study"],sInnerName)
		User_TalkChannel2005(str)
	end
end