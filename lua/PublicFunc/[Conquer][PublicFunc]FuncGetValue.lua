----------------------------------------------------------------------------
--Name:		[����][���ú���]ȡֵ����.lua
--Purpose:	ȡֵ�����ӿ�
--Creator: 	�ֽ�
--Created:	2014/06/26
----------------------------------------------------------------------------
---------------------------------�����淶----------------------------------
------------------------------actiontype�ķ���------------------------------
--Get  �������
------------------------------ȡֵ����ķ���------------------------------
--Sys		��ȡϵͳ����
--User		��ȡ�������
--Npc		��ȡNpc����
--Item		��ȡ��Ʒ����
--Monster	��ȡ��������
--Map		��ȡ��ͼ����
--Trap		��ȡ��������
--Task		��ȡ������������
----------------------------------------------------------------------------
-- ȡֵ��������ǰ׺�ʣ�Get_
--���ӣ�
--��ȡ���Id
--function Get_UserId(nUserId)
--
--end

------------------------------------------------------------------------------

------------------------------------------------------------------------------
-------------------------------------ϵͳ-------------------------------------
------------------------------------------------------------------------------

--cq_dyna_global_data ������data0
--SCRIPT_PARAM_DYNA_GLOBAL_DATA0 		= 2202;
--����cq_dyna_global_data��data0
function Get_SysDynaGlobalData0(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalData0 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end

	return GetSynaGlobalData(nSysDyGlobId,G_DYNA_GLOBAL_DATA0)
end

--cq_dyna_global_data ������data1
--SCRIPT_PARAM_DYNA_GLOBAL_DATA1 		= 2203;
--����cq_dyna_global_data��data1
function Get_SysDynaGlobalData1(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalData1 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalData(nSysDyGlobId,G_DYNA_GLOBAL_DATA1)
end

--cq_dyna_global_data ������data2
--SCRIPT_PARAM_DYNA_GLOBAL_DATA2		= 2204;
--����cq_dyna_global_data��data2
function Get_SysDynaGlobalData2(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalData2 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalData(nSysDyGlobId,G_DYNA_GLOBAL_DATA2)
end

--cq_dyna_global_data ������data3
--SCRIPT_PARAM_DYNA_GLOBAL_DATA3		= 2205;
--����cq_dyna_global_data��data3
function Get_SysDynaGlobalData3(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalData3 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalData(nSysDyGlobId,G_DYNA_GLOBAL_DATA3)
end

--cq_dyna_global_data ������data4
--SCRIPT_PARAM_DYNA_GLOBAL_DATA4		= 2206;
--����cq_dyna_global_data��data4
function Get_SysDynaGlobalData4(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalData4 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalData(nSysDyGlobId,G_DYNA_GLOBAL_DATA4)
end

--cq_dyna_global_data ������data5
--SCRIPT_PARAM_DYNA_GLOBAL_DATA5		= 2207;
--����cq_dyna_global_data��data5
function Get_SysDynaGlobalData5(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalData5 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalData(nSysDyGlobId,G_DYNA_GLOBAL_DATA5)
end

--cq_dyna_global_data ������datastr0
--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR0	= 2208;
--����cq_dyna_global_data��datastr0
function Get_SysDynaGlobalDataStr0(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalDataStr0 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalDataStr(nSysDyGlobId,G_DYNA_GLOBAL_DATASTR0)
end

--cq_dyna_global_data ������datastr1
--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR1	= 2209;
--����cq_dyna_global_data��datastr1
function Get_SysDynaGlobalDataStr1(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalDataStr1 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalDataStr(nSysDyGlobId,G_DYNA_GLOBAL_DATASTR1)
end

--cq_dyna_global_data ������datastr2
--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR2	= 2210;
--����cq_dyna_global_data��datastr2
function Get_SysDynaGlobalDataStr2(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalDataStr2 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalDataStr(nSysDyGlobId,G_DYNA_GLOBAL_DATASTR2)
end

--cq_dyna_global_data ������datastr3
-- SCRIPT_PARAM_DYNA_GLOBAL_DATASTR3	= 2211;
--����cq_dyna_global_data��datastr3
function Get_SysDynaGlobalDataStr3(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalDataStr3 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalDataStr(nSysDyGlobId,G_DYNA_GLOBAL_DATASTR3)
end

--cq_dyna_global_data ������datastr4
-- SCRIPT_PARAM_DYNA_GLOBAL_DATASTR4	= 2212;
--����cq_dyna_global_data��datastr4
function Get_SysDynaGlobalDataStr4(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalDataStr4 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalDataStr(nSysDyGlobId,G_DYNA_GLOBAL_DATASTR4)
end

--cq_dyna_global_data ������datastr5
-- SCRIPT_PARAM_DYNA_GLOBAL_DATASTR5	= 2213;
--����cq_dyna_global_data��datastr5
function Get_SysDynaGlobalDataStr5(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalDataStr5 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalDataStr(nSysDyGlobId,G_DYNA_GLOBAL_DATASTR5)
end

--cq_dyna_global_data ������TIME0
-- SCRIPT_PARAM_DYNA_GLOBAL_TIME0		= 2214;
--����cq_dyna_global_data��TIME0
function Get_SysDynaGlobalTime0(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalTime0 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalTime(nSysDyGlobId,G_DYNA_GLOBAL_TIME0)
end

--cq_dyna_global_data ������TIME1
-- SCRIPT_PARAM_DYNA_GLOBAL_TIME1		= 2215;
--����cq_dyna_global_data��TIME1
function Get_SysDynaGlobalTime1(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalTime1 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalTime(nSysDyGlobId,G_DYNA_GLOBAL_TIME1)
end

--cq_dyna_global_data ������TIME2
-- SCRIPT_PARAM_DYNA_GLOBAL_TIME2		= 2216;
--����cq_dyna_global_data��TIME2
function Get_SysDynaGlobalTime2(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalTime2 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalTime(nSysDyGlobId,G_DYNA_GLOBAL_TIME2)
end

--cq_dyna_global_data ������TIME3
-- SCRIPT_PARAM_DYNA_GLOBAL_TIME3		= 2217;
--����cq_dyna_global_data��TIME3
function Get_SysDynaGlobalTime3(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalTime3 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalTime(nSysDyGlobId,G_DYNA_GLOBAL_TIME3)
end

--cq_dyna_global_data ������TIME4
-- SCRIPT_PARAM_DYNA_GLOBAL_TIME4		= 2218;
--����cq_dyna_global_data��TIME4
function Get_SysDynaGlobalTime4(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalTime4 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalTime(nSysDyGlobId,G_DYNA_GLOBAL_TIME4)
end

--cq_dyna_global_data ������TIME5
-- SCRIPT_PARAM_DYNA_GLOBAL_TIME5		= 2219;
--����cq_dyna_global_data��TIME5
function Get_SysDynaGlobalTime5(nSysDyGlobId)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalTime5 �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	return GetSynaGlobalTime(nSysDyGlobId,G_DYNA_GLOBAL_TIME5)
end

-- ��ȡcq_dyna_global_data ���е�data0 ~ 5��ֵ
function Get_SysDynaGlobalData(nSysDyGlobId,nPos)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalData �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 or nPos > 5 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalData �� nPos ֻ�ܴ�0~5֮�������")
		return
	end
	
	local nIndex = 0
	
	if nPos == 0 then
		nIndex = G_DYNA_GLOBAL_DATA0
	elseif nPos == 1 then
		nIndex = G_DYNA_GLOBAL_DATA1
	elseif nPos == 2 then
		nIndex = G_DYNA_GLOBAL_DATA2
	elseif nPos == 3 then
		nIndex = G_DYNA_GLOBAL_DATA3
	elseif nPos == 4 then
		nIndex = G_DYNA_GLOBAL_DATA4
	elseif nPos == 5 then
		nIndex = G_DYNA_GLOBAL_DATA5
	end
	
	return GetSynaGlobalData(nSysDyGlobId,nIndex)
end

-- ��ȡcq_dyna_global_data ���е�datastr0 ~ 5��ֵ
function Get_SysDynaGlobalDataStr(nSysDyGlobId,nPos)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalDataStr �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 or nPos > 5 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalDataStr �� nPos ֻ�ܴ�0~5֮�������")
		return
	end
	
	local nIndex = 0
	
	if nPos == 0 then
		nIndex = G_DYNA_GLOBAL_DATASTR0
	elseif nPos == 1 then
		nIndex = G_DYNA_GLOBAL_DATASTR1
	elseif nPos == 2 then
		nIndex = G_DYNA_GLOBAL_DATASTR2
	elseif nPos == 3 then
		nIndex = G_DYNA_GLOBAL_DATASTR3
	elseif nPos == 4 then
		nIndex = G_DYNA_GLOBAL_DATASTR4
	elseif nPos == 5 then
		nIndex = G_DYNA_GLOBAL_DATASTR5
	end
	
	return GetSynaGlobalDataStr(nSysDyGlobId,nIndex)
end

-- ��ȡcq_dyna_global_data ���е�Time0 ~ 5��ֵ
function Get_SysDynaGlobalTime(nSysDyGlobId,nPos)
	if type(nSysDyGlobId) ~= "number" or nSysDyGlobId <= 0 or nSysDyGlobId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalTime �� nSysDyGlobId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 or nPos > 5 then
		Sys_SaveAbnormalLog("���� Get_SysDynaGlobalTime �� nPos ֻ�ܴ�0~5֮�������")
		return
	end
	
	local nIndex = 0
	
	if nPos == 0 then
		nIndex = G_DYNA_GLOBAL_TIME0
	elseif nPos == 1 then
		nIndex = G_DYNA_GLOBAL_TIME1
	elseif nPos == 2 then
		nIndex = G_DYNA_GLOBAL_TIME2
	elseif nPos == 3 then
		nIndex = G_DYNA_GLOBAL_TIME3
	elseif nPos == 4 then
		nIndex = G_DYNA_GLOBAL_TIME4
	elseif nPos == 5 then
		nIndex = G_DYNA_GLOBAL_TIME5
	end
	
	return GetSynaGlobalTime(nSysDyGlobId,nIndex)
end

--��ȡ�ͻ����ϴ���һ���Ӵ�. ���磺103type����������޲����� 
--���ؿͻ����ϴ���һ���Ӵ�.
function Get_SysAcceptStr()
	return GetAcceptStr()
end

--��ȡָ��ʱ�䵽����ʱ���ж����죨ԭaction�� PARA_SERVER_REMIAN_DAYS��Ӧ���ݣ��޲�����
--��������
function Get_SysServerRemainDays()
	return GetServerRemainDays()
end

--LUA�ӿڣ�GetServerName
--������������ID����Ϊ0��ʾ��ȡ��������������
--����ֵ����ѯ�ķ��������Ʋ����ڷ���"null"���ɹ����ؾ�����������ƣ���"���ڻ�Ծ"
function Get_SysServerName(nServerID)
	if nServerID == nil then
		nServerID = 0
	elseif type(nServerID) ~= "number" or nServerID < 0 or nServerID%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_SysServerName �� nServerID ֻ�ܴ������0������")
		return
	end
	
	return GetServerName(nServerID)
end

------------------------------------------------------------------------------
-------------------------------------���-------------------------------------
------------------------------------------------------------------------------

--ȡ���id
--SCRIPT_PARAM_PLAYER_ID 	1001	//��ǰ���ID,id=0
--�������id
function Get_UserId()
	return GetUserInt(0,G_PLAYER_ID)
end

--ȡ�������
--SCRIPT_PARAM_PLAYER_Name,	1002	//�������
--����������֣��ַ�����
function Get_UserName(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserName �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserStr(nUserId,G_PLAYER_Name)
end

--��ȡ��ͼmapdoc 
function Get_MapDoc(nMapId)
	if nMapId == nil then
		nMapId = Get_UserMapId(0)
	elseif type(nMapId) ~= "number" or nMapId < 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MapDoc �� nMapId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetMapIntEx(nMapId,G_MAP_DOC)
end

--[[
����û���ꡣ
--ȡ���ͷ����
--SCRIPT_PARAM_PLAYER_LookFace,	1003	//���ͷ����
--�������ͷ����
function Get_UserLookFace(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLookFace �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,1003)
end

--ȡ��ҷ��ͱ��
--SCRIPT_PARAM_PLAYER_Hair,	1004	//��ҷ��ͱ��
--������ҷ��ͱ��
function Get_UserHair(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserHair �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,1004)
end
]]

--ȡ���ְҵ
--SCRIPT_PARAM_PLAYER_Profession,	1005	//��ҵ�ְҵ
--�������ְҵ���
function Get_UserProfession(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserProfession �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Profession)
end

--ȡ��ҵȼ�
--SCRIPT_PARAM_PLAYER_Level,	1006	//��ҵȼ�
--������ҵ�ǰ�ȼ�
function Get_UserLevel(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLevel �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Level)
end


--ȡ������ڵ�ͼid
--SCRIPT_PARAM_PLAYER_MapID,	1007	//������ڵ�ͼID
--������ҵ�ǰ���ڵ�ͼid
function Get_UserMapId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserMapId �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_MapID)
end

--ȡ���x����
--SCRIPT_PARAM_PLAYER_PosX,	1008	//������ڵ�ͼX����
--������ҵ�ǰ��x����
function Get_UserPositionX(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserPositionX �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_PosX)
end

--ȡ���y����
--SCRIPT_PARAM_PLAYER_PosY,	1009	//������ڵ�ͼY����
--������ҵ�ǰ��y����
function Get_UserPositionY(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserPositionY �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_PosY)
end


--ȡ��ҹ���ֵ
--SCRIPT_PARAM_PLAYER_Virtue,	1010	//��ҹ���ֵ
--������ҵĹ���ֵ
function Get_UserVirtue(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserVirtue �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Virtue)
end


--ȡ���ת������
--SCRIPT_PARAM_PLAYER_Meto,	1011	//���ת��
--������ҵ�ת������
function Get_UserMetempsychosis(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserMetempsychosis �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Meto)
end

--ȡ����Ա�
--SCRIPT_PARAM_PLAYER_Sex,	1012	//����Ա�
--����ֵΪ��
--1����ʾ����;
--2����ʾŮ��
function Get_UserSex(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSex �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Sex)
end

--ȡ��Ҷ����Ա����
--SCRIPT_PARAM_PLAYER_TeamMemberNum,	1013	//��Ҷ����Ա������û�ж���Ϊ0
--������ҵ�ǰ���������(�����ӳ�)
--�ӳ��Ͷ�Ա���ɴ���
function Get_UserTeamNumbers(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserTeamNumbers �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_TeamMemberNum)
end

--ȡ��ҷ���Id
--SCRIPT_PARAM_PLAYER_HomeID,	1014	//��ҷ���id
--������ҵķ���id
--��û����,����:0
function Get_UserHouseId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserHouseId �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_HomeID)
end

--ȡ����˺�Id
--SCRIPT_PARAM_PLAYER_AccountId,	1015	//����˺�id
--������ҵ��˺�Id
function Get_UserAccountId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserAccountId �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_AccountId)
end


--ȡ���ս����
--SCRIPT_PARAM_PLAYER_BattleEffect,	1016	//���ս����
--������ҵ�ս����ֵ
function Get_UserBattleLevel(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserBattleLevel �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_BattleEffect)
end

--ȡ��Ұ�������
--SCRIPT_PARAM_PLAYER_MateName,	1017	//��Ұ�������
--������ҵİ������֣��ַ�����
function Get_UserMateName(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserMateName �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserStr(nUserId,G_PLAYER_MateName)
end

--ȡ����������
--SCRIPT_PARAM_PLAYER_RidingPoints,	1018	//���������
--������ҵ�����������
function Get_UserRidingPoints(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserRidingPoints �� nUserId ֻ�ܴ������0������")
		return
	end

	return GetUserInt(nUserId,G_PLAYER_RidingPoints)
end


--ȡ��ҵ�ǰ����ֵ
--SCRIPT_PARAM_PLAYER_Life,	1019	//�������ֵ
--������ҵ�ǰ����ֵ
function Get_UserLife(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLife �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Life)
end


--ȡ����������ֵ
--SCRIPT_PARAM_PLAYER_MaxLife,	1020	//����������ֵ
--��������������ֵ
function Get_UserMaxLife(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserMaxLife �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_MaxLife)
end

--ȡ��ҵ�ǰ����ֵ
--SCRIPT_PARAM_PLAYER_Mana,	1021	//��ҷ���ֵ
--������ҵ�ǰ����ֵ
--û�з���ֵ��ְҵ,����:0
function Get_UserMana(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserMana �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Mana)
end

--ȡ��������ֵ
--SCRIPT_PARAM_PLAYER_MaxMana,	1022	//��������ֵ
--������������ֵ
--û�з���ֵ��ְҵ,����:0
function Get_UserMaxMana(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserMaxMana �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_MaxMana)
end

--ȡ��ҵ㻯����
--SCRIPT_PARAM_PLAYER_Mentor,	1023	//��ҵ㻯����
--������ҵ㻯����
--����ֵ:�㻯����*100
--ps:0.1���㻯����,����ֵΪ10
function Get_UserMentor(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserMentor �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Mentor)
end

--ȡ��ұ���ID
--SCRIPT_PARAM_PLAYER_Transfrom,	1024	//����ID
--������ұ���ID
--û����״̬����ֵΪ:-1
--����״̬,���ر����Ӧ�Ĺ����lookface�ֶ�ֵ
function Get_UserTransformId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserTransformId �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Transfrom)
end

--ȡ��ҽ����
--SCRIPT_PARAM_PLAYER_Money,	1025	//�����Ϸ��
--������ҽ����
-- function Get_UserMoney(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserMoney �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetUserInt(nUserId,G_PLAYER_Money)
-- end


---bug
--ȡ�����������ʯ����
--SCRIPT_PARAM_PLAYER_MoneyTrial,	1026	//��������ʯ����
--���������������ʯ����
--Ĭ�Ϸ���ֵ:-1
-- function Get_UserTrialMoney(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserTrialMoney �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetUserInt(nUserId,G_PLAYER_MoneyTrial)
-- end


--ȡ�����ʯ��
--SCRIPT_PARAM_PLAYER_EMoney,	1027	//�����ʯ
--���������ʯ��
function Get_UserEMoney(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserEMoney �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_EMoney)
end


--ȡ�����Ʒ��ʯ��
--SCRIPT_PARAM_PLAYER_EMoneyMono,	1028	//�������
--���������Ʒ��ʯ��
function Get_UserMonoEMoney(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserMonoEMoney �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_EMoneyMono)
end


--ȡ��Ҿ���ֵ
--SCRIPT_PARAM_PLAYER_Exp,	1029	//��Ҿ���(add���������ӹ���)
--������Ҿ���ֵ
--����cq_user���exp�ֶ�ֵ
--������߻�þ��鲻�����ϸı���ֶε�ֵ,���ߺ�Żᱻд�����ݿ�.
function Get_UserExp(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserExp �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Exp)
end

--ȡ���PKֵ
--SCRIPT_PARAM_PLAYER_PK,	1031	//���PKֵ
--�������PKֵ
--����cq_user���pk�ֶ�ֵ
--����д��
function Get_UserPk(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserPk �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_PK)
end


--ȡ�������ֵ
--SCRIPT_PARAM_PLAYER_Strength,	1032	//�������ֵ
--�����������ֵ
--����cq_user��strength�ֶ�ֵ
function Get_UserStrength(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStrength �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Strength)
end

--ȡ�������ֵ
--SCRIPT_PARAM_PLAYER_Speed,	1033	//�������ֵ
--�����������ֵ
--����cq_user��speed�ֶ�ֵ
function Get_UserSpeed(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSpeed �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Speed)
end

--ȡ�������ֵ
--SCRIPT_PARAM_PLAYER_Health,	1034	//�������ֵ
--�����������ֵ
--����cq_user��Health�ֶ�ֵ
function Get_UserHealth(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserHealth �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Health)
end


--ȡ��Ҿ���ֵ
--SCRIPT_PARAM_PLAYER_Soul,	1035	//��Ҿ���ֵ
--������Ҿ���ֵ
--����cq_user��soul�ֶ�ֵ
function Get_UserSoul(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSoul �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Soul)
end


--ȡ��Ұ���������
--SCRIPT_PARAM_PLAYER_SynRank,	1036	//��Ұ���������
--���ذ���ְλ���
function Get_UserGuildRank(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGuildRank �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_SynRank)
end

--��ʱ�����ˡ�
--����������ϵͳ�е���
--SCRIPT_PARAM_PLAYER_Iterator,	1037	//����������ϵͳ�е���
--����
-- function Get_UserIterator(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserIterator �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetUserInt(nUserId,1037)
-- end

--ȡ��ҷ���ʱ��
--SCRIPT_PARAM_PLAYER_Crime,	1038	//����ʱ��
--������ҷ���ʱ��
--��������ִ���pk����ɫ��˸��ʱ��,����1
--����ʱ�򷵻�0
--��������δ����
function Get_UserCrimeTime(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserCrimeTime �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Crime)
end

--ȡ���cq_card��¼��������
--SCRIPT_PARAM_PLAYER_GameCard,	1039	//cq_card��¼����
--�������cq_card��¼��������
function Get_UserGameCard(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGameCard �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_GameCard)
end

--ȡ���cq_card2��¼������С��
--SCRIPT_PARAM_PLAYER_GameCard2,	1040	//cq_card2��¼����
--�������cq_card2��¼������С��
function Get_UserGameCard2(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGameCard2 �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_GameCard2)
end

--ȡ��ҵ�ǰxpֵ
--SCRIPT_PARAM_PLAYER_XP,	1041	//��ǰXPֵ
--������ҵ�ǰxpֵ
--ֻ������10��ֵ
--��:1-9,����ֵ=0;10-19,����ֵΪ10.
--��xpѡ���ܹ���,����ֵ=100
--xp���̷���ֵ=0
function Get_UserXp(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserXp �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_XP)
end

--ȡ�������ֵ
--SCRIPT_PARAM_PLAYER_EP,	1042	//����ֵ
--�����������ֵ
function Get_UserEp(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserEp �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_EP)
end

--ȡ������Ե�
--SCRIPT_PARAM_PLAYER_,	1043	//������Ե�
--����������Ե�
--����cq_user��additional_point�ֶ�ֵ
function Get_UserAddPoint(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserAddPoint �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_AddPoint)
end

--��ʱȡ����ûʲô�ã�ֻ���ؿͻ��˰汾��
--ȡ�ͻ��İ汾��
--SCRIPT_PARAM_PLAYER_ClientVersion,	1044	//�ͻ��İ汾
--���ؿͻ��İ汾��
--����:һֱ����145
-- function Get_UserClientVersion(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserClientVersion �� nUserId ֻ�ܴ������0������")
		-- return
	-- end

	-- return GetUserInt(nUserId,G_PLAYER_ClientVersion)
-- end

--ȡ��Ҿ�λ
--SCRIPT_PARAM_PLAYER_Peerage,	1045	//��Ҿ�λ
--������Ҿ�λ
function Get_UserPeerage(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserPeerage �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Peerage)
end

--��ʱ����
--ȡ��ҽ���״̬
--SCRIPT_PARAM_PLAYER_Businness,	1046	//��ҽ���״̬
--������ҽ���״̬
-- function Get_UserBusinness(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserBusinness �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetUserInt(nUserId,1046)
-- end

--ȡ���VIP�ȼ�
--SCRIPT_PARAM_PLAYER_VIP,	1047	//���VIP�ȼ�
--�������VIP�ȼ�
function Get_UserVip(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserVip �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_VIP)
end

--��ʱ����
--ȡ���VIPֵ
--SCRIPT_PARAM_PLAYER_VIPValue,	1048	//���VIPֵ
--�������VIPֵ
-- function Get_UserVipValue(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserVipValue �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetUserInt(nUserId,1048)
-- end

--ȡ��Ҳֿ���Ľ������
--SCRIPT_PARAM_PLAYER_StorageMoney,	1049	//��Ҵ洢��Ǯ
--������Ҳֿ���Ľ������
-- function Get_UserStorageMoney(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserStorageMoney �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetUserInt(nUserId,G_PLAYER_StorageMoney)
-- end



--ȡ���ǰǰ��ְҵ
--SCRIPT_PARAM_PLAYER_FirstPro,	1050	//ְҵ
--�������ǰǰ��ְҵ���
function Get_UserFirstPro(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserFirstPro �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_FirstPro)
end


--ȡ���ǰ��ְҵ
--SCRIPT_PARAM_PLAYER_OldPro,	1051	//ǰ��ְҵ
--�������ǰ��ְҵ���
function Get_UserOldPro(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserOldPro �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_OldPro)
end

--��ʱ����
--ȡ��������ƶ���
--SCRIPT_PARAM_PLAYER_AddMount,	1052	//�����ƶ���
--������������ƶ���
-- function Get_UserMountSpeed(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserMountSpeed �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetUserInt(nUserId,G_PLAYER_AddMount)
-- end

--ȡ�������ֵ
--SCRIPT_PARAM_PLAYER_Cultivation,	1054	//����ֵ
--�����������ֵ
function Get_UserCultivation(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserCultivation �� nUserId ֻ�ܴ������0������")
		return
	end

	return GetUserInt(nUserId,G_PLAYER_Cultivation)
end


--ȡ���PKЭ��
--SCRIPT_PARAM_PLAYER_PKProtocol,	1055	//PKģʽ
--�������PKЭ��
--�º�,����ֵΪ0
--25��ʱ,����pkЭ��,����ֵΪ1
--������,����ֵΪ2
function Get_UserPKProtocol(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserPKProtocol �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_PKProtocol)
end


--ȡ�������������ֵ
--SCRIPT_PARAM_PLAYER_StrengthValue,	1056	//����ֵ
--�����������������ֵ
function Get_UserStrengthValue(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStrengthValue �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_StrengthValue)
end

--ȡ��Ұ���ID
--SCRIPT_PARAM_PLAYER_SynID,	1057	//����ID
--������Ұ���ID
function Get_UserGuildId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGuildId �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_SynID)
end

--bug,һֱ����null��û������������
--ȡ��Ұ�������
--SCRIPT_PARAM_PLAYER_SynName,	1058	//��������
--������Ұ�������
-- function Get_UserGuildName(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserGuildName �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetUserStr(nUserId,1058)
-- end

--ȡ��Ҽ���ID
--SCRIPT_PARAM_PLAYER_FamilyID,	1059	//����ID
--������Ҽ���ID
function Get_UserFamilyId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserFamilyId �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_FamilyID)
end

--ȡ�����������һ�����辭��
--SCRIPT_PARAM_PLAYER_LevupExp,	1060	//��������һ�����辭��
--���������������һ�����辭��
function Get_UserLevupExp(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLevupExp �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_LevupExp)
end

--ȡ�����żID
--SCRIPT_PARAM_PLAYER_MateID,	1061	//�����żID
--���������żID
function Get_UserMateId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserMateId �� nUserId ֻ�ܴ������0������")
		return
	end

	return GetUserInt(nUserId,G_PLAYER_MateID)
end

--ȡ��һ��ף��ʣ��ʱ��
--SCRIPT_PARAM_PLAYER_GodBless,	1062	//���ף��ʣ��ʱ��
--������һ��ף��ʣ��ʱ��
function Get_UserBless(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserBless �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_GodBless)
end

--ȡ�Ĵ�������-��ֵ��
--3.��ȡ�Ĵ�������ֵ�ӿڣ�int  GetUserVarData(int UserId, int nInx);
--����1�����id������2������
--����ֵ���Ĵ�������ֵ
--���Ĵ���ֵΪ�յ�ʱ��,����null
--���Ĵ���ֵ����Ϊ0��ʱ��,����Ϊ0
function Get_UserVarData(nInx,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserVarData �� nUserId ֻ�ܴ������0������")
		return
	end
	
	if type(nInx) ~= "number" or nInx < 0 or nInx > 7 or nInx%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserVarData �� nInx ֻ�ܴ�0~7������")
		return
	end

	return GetUserVarData(nUserId,nInx)
end

--ȡ�Ĵ�������-�ַ�����
--5.��ȡ�Ĵ�������ֵ���ַ������ͣ��ӿڣ�char*  GetUserVarStr(int UserId, int nInx);
--����1�����id������2������
--����ֵ���Ĵ�������ֵ
function Get_UserVarStr(nInx,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserVarStr �� nUserId ֻ�ܴ������0������")
		return
	end
	
	if type(nInx) ~= "number" or nInx < 0 or nInx > 7 or nInx%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserVarStr �� nInx ֻ�ܴ�0~7������")
		return
	end

	return GetUserVarStr(nUserId,nInx)
end

-- ��ȡ��Ҷ���ID
-- ����˵���� 		nUserId:���ID
function Get_UserTeamId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserTeamId �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTeamAttr(nUserId,G_TEAM_ID)
end

-- ��ȡ��Ҷ�������
-- ����˵���� 		nUserId:���ID	
-- ���ض������� ����
function Get_UserTeamAmount(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserTeamAmount �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTeamAttr(nUserId,G_TEAM_Amount)
end

-- ��ȡ��Ҷ�������Ա��͵ȼ�
-- ����˵���� 		nUserId:���ID	
-- ������͵ȼ�ֵ ����
function Get_UserTeamMinLev(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserTeamMinLev �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTeamAttr(nUserId,G_TEAM_MinLev)
end

-- ��ȡ��Ҷ�������Ա��ߵȼ�
-- ����˵���� 		nUserId:���ID	
-- ������ߵȼ�ֵ ����
function Get_UserTeamMaxLev(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserTeamMaxLev �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTeamAttr(nUserId,G_TEAM_MaxLev)
end

-- ��ȡ��Ҷ�������Ա���ٽ��
-- ����˵���� 		nUserId:���ID	
-- ���ؽ������ ����
-- function Get_UserTeamMinMoney(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_UserTeamMinMoney �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetTeamAttr(nUserId,G_TEAM_MinMoney)
-- end

-- ��ȡ��Ҷ�������Ա�Ƿ�Ϊ����
-- ����˵���� 		nUserId:���ID
-- �ǵĻ�����1  ���ǵĻ�����0
function Get_UserTeamMate(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserTeamMate �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTeamAttr(nUserId,G_TEAM_Mate)
end

-- ��ȡ��Ҷ�������Ա�Ƿ�Ϊ����
-- ����˵���� 		nUserId:���ID
-- �ǵĻ�����1  ���ǵĻ�����0
function Get_UserTeamFriend(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserTeamFriend �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTeamAttr(nUserId,G_TEAM_Friend)
end

-- ��ȡ��Ҷ�������Ա�Ƿ񶼻���
-- ����˵���� 		nUserId:���ID
-- �ǵĻ�����1  ���ǵĻ�����0
function Get_UserTeamAlive(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserTeamAlive �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTeamAttr(nUserId,G_TEAM_Alive)
end

--nVarNumberΪ�Ĵ�����ţ�����ʱ���ö�Ӧ�ļĴ���������ҵ��������ʱ���뵱ǰʱ���ʱ����λ���죩
--����ʱ���죩
--ռ��1�żĴ���
--��������ʱ�䵹ת��ִ��ʧ�ܡ�������ʱ��ֻ��˳�ӡ�
function Get_UserLastLoginTime(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLastLoginTime �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	UserLastLoginOperator(nUserId,1,1)
	local nDays = Get_UserVarData(1,0)
	User_SetVarData(1,0,0)

	return nDays
end

-- SCRIPT_PARAM_SYN_MEMBER_ATTR_RANK	 = 2901,		//������ҵİ����ڵȼ�(ָ��������������)
--����ʱ������-1
--�����ַ������ȼ����ơ����������������ȣ�
function Get_UserGuildRankName(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGuildRankName �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetSynMemberStr(nUserId,G_SYN_MEMBER_ATTR_RANK)
end


--SCRIPT_PARAM_SYN_MEMBER_ATTR_PROFFER = 2902,		//������ҵ���Ϸ�ҹ���ֵ
--û�а���ʱ������0
--�����ڰ����ڵĹ��׶�ֵ
function Get_UserGuildContribution(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGuildContribution �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetSynMemberInt(nUserId,G_SYN_MEMBER_ATTR_PROFFER)
end

--��ȡ���ɵ���������_���ɳ�Ա����
--����˵����nGuildIdָҪ��������Ұ���ID, nIdxָSCRIPT_PARAM_SYNDICATE_BEGIN-SCRIPT_PARAM_SYNDICATE_END��ö��ֵ�����ʧ�ܷ���"-1"�����򷵻ؾ����ֵ��
--LUA_FUNC(GetSynInt)
--int idObj	= Lua_GetParamInt(1);
--int nIdx	= Lua_GetParamInt(2);
--SCRIPT_PARAM_SYNDICATE_MEMBER_AMOUNT = 2834,					//���ɳ�Ա����
--����
function Get_UserSynDicateMemberAmount(nGuildId)
	if type(nGuildId) ~= "number" or nGuildId <= 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSynDicateMemberAmount �� nGuildId ֻ�ܴ���0������")
		return
	end

	return GetSynInt(nGuildId,G_SYNDICATE_MEMBER_AMOUNT)
end

--��ȡ���ɵ���������_������ҵİ����ڵȼ�(ָ��������������)
--����˵����nGuildIdָҪ��������Ұ���ID, nIdxָSCRIPT_PARAM_SYNDICATE_BEGIN-SCRIPT_PARAM_SYNDICATE_END��ö��ֵ�����ʧ�ܷ���"-1"�����򷵻ؾ����ֵ��
--LUA_FUNC(GetSynInt)
--int idObj	= Lua_GetParamInt(1);
--int nIdx	= Lua_GetParamInt(2);
--SCRIPT_PARAM_SYN_MEMBER_ATTR_RANK	 = 2901,		//������ҵİ����ڵȼ�(ָ��������������)
--����
function Get_UserSynMemberAttrRank(nGuildId)
	if type(nGuildId) ~= "number" or nGuildId <= 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSynMemberAttrRank �� nGuildId ֻ�ܴ���0������")
		return
	end
	
	return GetSynInt(nGuildId,G_SYN_MEMBER_ATTR_RANK)
end	

	
--��ȡ���ɵ��ַ�����������_��������
--����˵����nGuildIdָҪ��������Ұ���ID, nIdxָSCRIPT_PARAM_SYNDICATE_BEGIN-SCRIPT_PARAM_SYNDICATE_END��ö��ֵ�����ʧ�ܷ���"null"�����򷵻ؾ����ֵ��
--LUA_FUNC(GetSynStr)
--int idObj	= Lua_GetParamInt(1);
--int nIdx	= Lua_GetParamInt(2);
--SCRIPT_PARAM_SYNDICATE_NAME			 = 2831,					//��������
--����
function Get_UserSynDicateName(nGuildId)
	if type(nGuildId) ~= "number" or nGuildId <= 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSynDicateName �� nGuildId ֻ�ܴ���0������")
		return
	end
	
	return GetSynStr(nGuildId,G_SYNDICATE_NAME)
end	

--��ȡ���ɵ��ַ�����������_���ɰ�������
--����˵����nGuildIdָҪ��������Ұ���ID, nIdxָSCRIPT_PARAM_SYNDICATE_BEGIN-SCRIPT_PARAM_SYNDICATE_END��ö��ֵ�����ʧ�ܷ���"null"�����򷵻ؾ����ֵ��
--LUA_FUNC(GetSynStr)
--int idObj	= Lua_GetParamInt(1);
--int nIdx	= Lua_GetParamInt(2);
--SCRIPT_PARAM_SYNDICATE_LEADER_NAME	 = 2832,					//���ɰ�������
--����
function Get_UserSynDicateLeaderName(nGuildId)
	if type(nGuildId) ~= "number" or nGuildId <= 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSynDicateLeaderName �� nGuildId ֻ�ܴ���0������")
		return
	end
	
	return GetSynStr(nGuildId,G_SYNDICATE_LEADER_NAME)
end

-- ��ȡ���ɻ���
function Get_UserSynMoney(nGuildId)
	if type(nGuildId) ~= "number" or nGuildId <= 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSynMoney �� nGuildId ֻ�ܴ���0������")
		return
	end
	
	return GetSynInt(nGuildId,G_SYNDICATE_MONEY)
end

-- ��ȡ������ʯ
function Get_UserSynEmoney(nGuildId)
	if type(nGuildId) ~= "number" or nGuildId <= 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSynEmoney �� nGuildId ֻ�ܴ���0������")
		return
	end
	
	return GetSynInt(nGuildId,G_SYNDICATE_EMONEY)
end

--��ʯ�����д����͵�δʹ�õ���ʯ������.  
--nCard��ʾ��ʯ�����,ָSCRIPT_PARAM_EMONEY_CARD1��ö��ֵ{2601,2602,2603,2604}
--nCardType��ʾ��ʯ������, ֻ��emoney_cardʱ��ʹ��, ��������0. 
--nUserId��ʾ�û�id.
--���ؾ��������.
--��:GetEmoneyCardCount(2601,780000,0)||GetEmoneyCardCount(2602,0,0)
function Get_UserEmoneyCardCount(nCard,nCardType,nUserId)
	if type(nCard) ~= "number" or nCard%1 ~= 0 or nCard < 2601 or nCard > 2604 then
		Sys_SaveAbnormalLog("���� Get_UserEmoneyCardCount ��һ������nCardΪ�����ҷ�Χ��2601--2604")
		return
	end
	
	if type(nCardType) ~= "number" or nCardType%1 ~= 0 or nCardType < 0 then
		Sys_SaveAbnormalLog("���� Get_UserEmoneyCardCount �ڶ�������nCardTypeΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Get_UserEmoneyCardCount ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return GetEmoneyCardCount(nUserId,nCard,nCardType)
end

-- //��ȡ��ҹ������Ե��������ԣ�����˵����idUserָҪ������USERID, nIdxָSCRIPT_PARAM_GONGFU_ATTR_BEGIN-SCRIPT_PARAM_GONGFU_ATTR_END��ö��ֵ�����ʧ�ܷ���"-1"�����򷵻ؾ����ֵ��
-- LUA_FUNC(GetGongFuInt)
	-- int idUser	= Lua_GetParamInt(1);
	-- int nIdx	= Lua_GetParamInt(2);
function Get_UserGongFuInt(nIdx,nUserId)
	if type(nIdx) ~= "number" or nIdx < 0 or nIdx%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGongFuInt ��1������nIdx����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGongFuInt ��2������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return GetGongFuInt(nUserId,nIdx)
end

-- ��ҵĹ�������
function Get_UserGongFuSkill(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGongFuInt ��2������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return GetGongFuInt(nUserId,G_GONGFU_ATTR_REALM)
end

-- ��������������
function Get_UserGongFureePractNum(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGongFuInt ��2������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return GetGongFuInt(nUserId,G_GONGFU_ATTR_FREE_CULTIVATE_PARAM)
end

-- ��������ȼ�
function Get_UserGongFuQiLev(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserGongFuInt ��2������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return GetGongFuInt(nUserId,G_GONGFU_ATTR_GENUINEQI_LV)
end
------------------------------------------------------------------------------
-------------------------------------Npc--------------------------------------
------------------------------------------------------------------------------

--ȡ��ǰNPC��ID
--NPC��ID  =  2001
--����npc Id ����
function Get_NpcId()
	return GetNpcInt(0,G_NPC_ID)
end

--ȡNPC������
--NPC������ = 2002
--����npc���֣��ַ�����
function Get_NpcName(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcName �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcStr(nNpcId,G_NPC_Name)
end

--ȡNPC��OwnerID
--NPC��OwnerID = 2003
--����ȡNPC��OwnerID������
function Get_NpcOwnerID(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcOwnerID �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_OwnerID)
end


--ȡNPC��OwnerType
--NPC��OwnerType = 2004
--����ȡNPC��OwnerType������
function Get_NpcOwnerType(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcOwnerType �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_OwnerType)
end

--ȡNPC��Type
--NPC��Type = 2005
--����ȡNPC��Type������
function Get_NpcType(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcType �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_Type)
end


--ȡNPC��Lookface
--NPC��Lookface = 2006
--����ȡNPC��Lookface������
function Get_NpcLookface(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcLookface �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_LookFace)
end

--ȡNPC���ڵĵ�ͼ���
--NPC��MapID = 2007
--����ȡNPC��MapID������
function Get_NpcMapID(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcMapID �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_MapID)
end

--ȡNPC���ڵ�ͼ��X����
--NPC��X���� = 2008
--����ȡNPC��X���꣬����
function Get_NpcPositionX(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcPositionX �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_PosX)
end

--ȡNPC���ڵ�ͼ��Y����
--NPC��Y���� = 2009
--����ȡNPC��Y���꣬����
function Get_NpcPositionY(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcPositionY �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_PosY)
end

--ȡNPC���ϵ�Data0ֵ 
--NPC��Data0 = 2010
--����ȡNPC��Data0ֵ������
function Get_NpcData0(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcData0 �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_Data0)
end

--ȡNPC���ϵ�Data1ֵ 
--NPC��Data1 = 2011
--����ȡNPC��Data1ֵ������
function Get_NpcData1(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcData1 �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_Data1)
end

--ȡNPC���ϵ�Data2ֵ 
--NPC��Data2 = 2012
--����ȡNPC��Data2ֵ������
function Get_NpcData2(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcData2 �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_Data2)
end

--ȡNPC���ϵ�Data3ֵ 
--NPC��Data3 = 2013
--����ȡNPC��Data3ֵ������
function Get_NpcData3(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcData3 �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_Data3)
end

--ȡNPC���ϵ�DataStrֵ 
--NPC��DataStr = 2014
--����ȡNPC��DataStrֵ���ַ���
function Get_NpcDataStr(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcDataStr �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcStr(nNpcId,G_NPC_DataStr)
end

--ȡNPC���Ѫֵ
--NPC��MaxLife = 2015
--����ȡNPC��MaxLife������
function Get_NpcMaxLife(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcMaxLife �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_MaxLife)
end

--ȡNPC��ǰѪֵ
--NPC��Life = 2016
--����ȡNPC��Life������
function Get_NpcLife(nNpcId)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcLife �� nNpcId ֻ�ܴ������0������")
		return
	end
	
	return GetNpcInt(nNpcId,G_NPC_Life)
end

--SCRIPT_PARAM_NPC_COUNT_ALL,=2801				//ȡ��ҵ�ͼ������NPC������
--������ֵ=cq_npc��+cq_dynanpc��ĵ�ǰ��ͼNPC�ܺ�
function Get_NpcCount(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcCount �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	return GetNpcCount(nUserId,G_NPC_COUNT_ALL,"")
end

--SCRIPT_PARAM_NPC_COUNT_FURNITURE,=2802			//ȡ��ҵ�ͼ�����мҾߵ�����
function Get_NpcCountByFurniture(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcCountByFurniture �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	return GetNpcCount(nUserId,G_NPC_COUNT_FURNITURE,"")
end

--SCRIPT_PARAM_NPC_COUNT_NAME,=2803				//ȡ��ҵ�ͼ������ָ�����ֵ�NPC����
--������ֵ=cq_npc��+cq_dynanpc��ĵ�ǰ��ͼ����������NPC�ܺ�
function Get_NpcCountByName(sNpcName,nUserId)
	if type(sNpcName) ~= "string" then
		Sys_SaveAbnormalLog("���� Get_NpcCountByName �� sNpcName ֻ�ܴ��ַ������͵Ĳ���")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcCountByName �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetNpcCount(nUserId,G_NPC_COUNT_NAME,sNpcName)
end

--SCRIPT_PARAM_NPC_COUNT_TYPE,=2804				//ȡ��ҵ�ͼ������ָ�����͵�NPC����
--������ֵ=cq_npc��+cq_dynanpc��ĵ�ǰ��ͼ����������NPC�ܺ�
function Get_NpcCountByType(nNpcType,nUserId)
	if type(nNpcType) ~= "number" or nNpcType <= 0 or nNpcType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcCountByType �� nNpcType ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_NpcCountByType �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetNpcCount(nUserId,G_NPC_COUNT_TYPE,nNpcType)
end




------------------------------------------------------------------------------
-------------------------------------��Ʒ-------------------------------------
------------------------------------------------------------------------------
--ȡcq_item��Type
--SCRIPT_PARAM_ITEM_Type,=2302				//��Ʒ����
--����cq_item��Type��ʧ�ܷ���-1
function Get_ItemType(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemType �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Type)
end

--ȡcq_item��OwnerID
--SCRIPT_PARAM_ITEM_OwnerID,=2303			//OwnerID
--����cq_item��OwnerID��ʧ�ܷ���-1
function Get_ItemOwnerId(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemOwnerId �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_OwnerID)
end

--ȡcq_item��PlayerID
--SCRIPT_PARAM_ITEM_PlayerID,=2304			//PlayerID
--����cq_item��PlayerID��ʧ�ܷ���-1
function Get_ItemPlayerId(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemPlayerId �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_PlayerID)
end

--ȡcq_item��Amount
--SCRIPT_PARAM_ITEM_Amount,=2305			//��ǰ�;�
--����cq_item��Amount��ʧ�ܷ���-1
function Get_ItemAmount(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemAmount �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Amount)
end

--ȡcq_item��AmountLimit
--SCRIPT_PARAM_ITEM_AmountLimit,=2306		//�;�����
--����cq_item��AmountLimit��ʧ�ܷ���-1
function Get_ItemAmountLimit(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemAmountLimit �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_AmountLimit)
end

--ȡcq_item��Ident
--SCRIPT_PARAM_ITEM_Ident,=2307			//�Ƿ����
--����cq_item��Ident��ʧ�ܷ���-1
function Get_ItemIdent(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemIdent �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Ident)
end

--ȡcq_item��Position
--SCRIPT_PARAM_ITEM_Position,=2308			//λ��
--����cq_item��Position��ʧ�ܷ���-1
function Get_ItemPosition(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemPosition �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Position)
end

--ȡcq_item��Gem1
--SCRIPT_PARAM_ITEM_Gem1,=2309				//��һ����
--����cq_item��Gem1��ʧ�ܷ���-1
function Get_ItemGem1(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemGem1 �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Gem1)
end

--ȡcq_item��Gem2
--SCRIPT_PARAM_ITEM_Gem2,=2310				//�ڶ�����
--����cq_item��Gem2��ʧ�ܷ���-1
function Get_ItemGem2(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemGem2 �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Gem2)
end

--ȡcq_item��Magic1
--SCRIPT_PARAM_ITEM_Magic1,=2311			//��һ��ħ��Ч��
--����cq_item��Magic1��ʧ�ܷ���-1
function Get_ItemMagic1(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemMagic1 �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Magic1)
end

--ȡcq_item��Magic2
--SCRIPT_PARAM_ITEM_Magic2,=2312			//�ڶ���ħ��Ч��
--����cq_item��Magic2��ʧ�ܷ���-1
function Get_ItemMagic2(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemMagic2 �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Magic2)
end

--ȡcq_item��Magic3
--SCRIPT_PARAM_ITEM_Addition,=2313			//׷����ֵ			//�������SCRIPT_PARAM_ITEM_Magic3
--����cq_item��Magic3��ʧ�ܷ���-1
function Get_ItemMagic3(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemMagic3 �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Addition)
end

--ȡcq_item��Data
--SCRIPT_PARAM_ITEM_Data,=2314				//��ƷData�ֶ�ֵ
--����cq_item��Data��ʧ�ܷ���-1
function Get_ItemData(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemData �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Data)
end

--ȡcq_item��ReduceDmg
--SCRIPT_PARAM_ITEM_ReduceDmg,=2315		//����
--����cq_item��ReduceDmg��ʧ�ܷ���-1
function Get_ItemReduceDmg(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemReduceDmg �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_ReduceDmg)
end

--ȡcq_item��AddLife
--SCRIPT_PARAM_ITEM_AddLife,=2316			//�����ӳ�
--����cq_item��AddLife��ʧ�ܷ���-1
function Get_ItemAddLife(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemAddLife �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_AddLife)
end

--ȡcq_item��AntiMonster
--SCRIPT_PARAM_ITEM_AntiMonster,=2317		//���ƹ���
--����cq_item��AntiMonster��ʧ�ܷ���-1
function Get_ItemAntiMonster(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemAntiMonster �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_AntiMonster)
end

--ֻ����ʾnameԭ���������С���Ʒ����+6����������
--ȡ��Ʒ��name
--SCRIPT_PARAM_ITEM_Name,=2318				//����
--������Ʒ��name��cq_item��û��Name�ֶΣ�ʧ�ܷ���-1
function Get_ItemName(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemName �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemStr(nItemId,G_ITEM_Name)
end

--ȡcq_item��Color
--SCRIPT_PARAM_ITEM_Color,=2319			//��ɫ
--����cq_item��Color��ʧ�ܷ���-1
function Get_ItemColor(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemColor �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Color)
end

--ȡcq_item��Monopoly
--SCRIPT_PARAM_ITEM_Monopoly,=2320			//��Ʒװ������
--����cq_item��Monopoly��ʧ�ܷ���-1
function Get_ItemMonopoly(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemMonopoly �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_Monopoly)
end

--ȡcq_item��AddExp
--SCRIPT_PARAM_ITEM_AddExp,=2321			//׷�Ӿ���
--����cq_item��AddExp��ʧ�ܷ���-1
function Get_ItemAddExp(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemAddExp �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_AddExp)
end

--ȡcq_item��del_time
--SCRIPT_PARAM_ITEM_DelTime,=2322			//ʱЧ����Ʒɾ��ʱ��
--����cq_item��del_time��ʧ�ܷ���-1
function Get_ItemDelTime(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemDelTime �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_DelTime)
end

--ȡcq_item��SaveTime
--SCRIPT_PARAM_ITEM_SaveTime,=2323			//��Ʒ��Чʱ��
--����cq_item��SaveTime��ʧ�ܷ���-1
function Get_ItemSaveTime(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemSaveTime �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_SaveTime)
end

--ȡcq_itemtype��acution_deposit
--SCRIPT_PARAM_ITEM_AcutionDeposit,=2324	//�����б�֤��
--����cq_item��acution_deposit��ʧ�ܷ���-1
function Get_ItemAcutionDeposit(nItemId)
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId < 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemAcutionDeposit �� nItemId ֻ�ܴ������0������")
		return
	end

	return GetItemInt(nItemId,G_ITEM_AcutionDeposit)
end

--����itemid,
--��ջʽ������ƷA�����֣�B�����֣���ʱ������B��ID
--��B����������ۻ��ף��ٴ�ִ�к���������A��ID.
--//������ֵ���ƷID   	��1:���ID��		ʧ�ܷ���ID_NONE�����򷵻���ƷID
--LUA_FUNC(GetLastAddItemID)
--	OBJID idUser = Lua_GetParamUInt(1);
function Get_ItemLastAdd(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemLastAdd �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetLastAddItemID(nUserId)
end

--����itemid
--������������Ч��������Ч��
--//���ɾ������ƷID   	��1:���ID��		ʧ�ܷ���ID_NONE�����򷵻���ƷID
--LUA_FUNC(GetLastDelItemID)
--	OBJID idUser = Lua_GetParamUInt(1);
function Get_ItemLastDel(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemLastDel �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetLastDelItemID(nUserId)
end

--ȡcq_itemtype��Name
--SCRIPT_PARAM_ITEMTYPE_Name,=2701				//����
--����cq_item��Name��ʧ�ܷ���-1
function Get_ItemtypeName(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemSaveTime �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeStr(nItemtypeId,G_ITEMTYPE_Name)
end

--ȡcq_itemtype��Profession
--SCRIPT_PARAM_ITEMTYPE_Profession,=2702		//ְҵ����
--����cq_item��req_Profession��ʧ�ܷ���-1
function Get_ItemtypeProfession(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeProfession �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_Profession)
end

--ȡcq_itemtype��req_weaponskill
--SCRIPT_PARAM_ITEMTYPE_Skill,=2703			//��������
--����cq_item��req_weaponSkill��ʧ�ܷ���-1
function Get_ItemtypeSkill(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeSkill �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_Skill)
end

--ȡcq_itemtype��Level
--SCRIPT_PARAM_ITEMTYPE_Level,=2704			//�ȼ�����
--����cq_item��req_Level��ʧ�ܷ���-1
function Get_ItemtypeLevel(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeLevel �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_Level)
end

--ȡcq_itemtype��Sex
--SCRIPT_PARAM_ITEMTYPE_Sex,=2705				//�Ա�����
--����cq_item��req_Sex��ʧ�ܷ���-1
function Get_ItemtypeSex(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeSex �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_Sex)
end

--ȡcq_itemtype��Monopoly
--SCRIPT_PARAM_ITEMTYPE_Monopoly,=2706			//��ռ��
--����cq_item��Monopoly��ʧ�ܷ���-1
function Get_ItemtypeMonopoly(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeMonopoly �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_Monopoly)
end

--ȡcq_itemtype��type_Mask
--SCRIPT_PARAM_ITEMTYPE_Mask,=2707				//(������Ʒ֮�������)
--����cq_item��Mask��ʧ�ܷ���-1
function Get_ItemtypeMask(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeMask �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_Mask)
end

--ȡcq_itemtype��EmoneyPrice
--SCRIPT_PARAM_ITEMTYPE_EmoneyPrice,=2708		//��ʯ�۸�
--����cq_item��EmoneyPrice��ʧ�ܷ���-1
function Get_ItemtypeEmoneyPrice(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeEmoneyPrice �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_EmoneyPrice)
end

--ȡcq_itemtype��EmoneyMonoPrice
--SCRIPT_PARAM_ITEMTYPE_EmoneyMonoPrice,=2709	//����۸�
--����cq_item��EmoneyMonoPrice��ʧ�ܷ���-1
function Get_ItemtypeEmoneyMonoPrice(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeEmoneyMonoPrice �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_EmoneyMonoPrice)
end

--ȡcq_itemtype��SaveTime
--SCRIPT_PARAM_ITEMTYPE_SaveTime,=2710			//����ʱ��
--����cq_item��Save_Time��ʧ�ܷ���-1
function Get_ItemtypeSaveTime(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeSaveTime �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_SaveTime)
end

--ȡcq_itemtype��TypeDesc
--SCRIPT_PARAM_ITEMTYPE_TypeDesc,=2711			//����˵��
--����cq_item��TypeDesc��ʧ�ܷ���-1
function Get_ItemtypeTypeDesc(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeTypeDesc �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeStr(nItemtypeId,G_ITEMTYPE_TypeDesc)
end

--ȡcq_itemtype��ItemDesc
--SCRIPT_PARAM_ITEMTYPE_ItemDesc,=2712			//��Ʒ˵��
--����cq_item��ItemDesc��ʧ�ܷ���-1
function Get_ItemtypeItemDesc(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeItemDesc �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeStr(nItemtypeId,G_ITEMTYPE_ItemDesc)
end

--// ��ȡװ��������. ����˵��: idUser��ʾ���ID; nPos��ʾװ��λ��(1-8). ���ʧ�ܷ���0, �ɹ�����װ��������(���͵�ʮ��λ����λ��ǧλ).
-- LUA_FUNC(GetEquipSubType)
	-- OBJID idUser = Lua_GetParamUInt(1);
	-- int   nPos   = Lua_GetParamInt(2);
function Get_ItemSubType(nPos,nUserId)
	if type(nPos) ~= "number" or nPos < 0 or nPos > 8 or nPos%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemSubType �� nPos ֻ�ܴ�1~8������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemSubType �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	return GetEquipSubType(nUserId,nPos)
end

--ȡcq_itemtype��AccumulateLimit
--G_ITEMTYPE_AccumulateLimit,=2713			//��Ʒ������
--����cq_item��AccumulateLimit
function Get_ItemtypeAccumulateLimit(nItemtypeId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_ItemtypeAccumulateLimit �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	return GetItemTypeInt(nItemtypeId,G_ITEMTYPE_AccumulateLimit)
end

------------------------------------------------------------------------------
-------------------------------------����-------------------------------------
------------------------------------------------------------------------------

--G_MONSTER_Name,					=	3102
function Get_MonsterName(nMonsterId)
	if nMonsterId == nil then
		nMonsterId = 0
	elseif type(nMonsterId) ~= "number" or nMonsterId < 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MonsterName �� nMonsterId ֻ�ܴ������0������")
		return
	end

	return GetMonsterStr(nMonsterId,G_MONSTER_Name)
end

--G_MONSTER_Type,					=	3103
function Get_MonsterType(nMonsterId)
	if nMonsterId == nil then
		nMonsterId = 0
	elseif type(nMonsterId) ~= "number" or nMonsterId < 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MonsterType �� nMonsterId ֻ�ܴ������0������")
		return
	end

	return GetMonsterInt(nMonsterId,G_MONSTER_Type)
end

--G_MONSTER_MapID,					=	3104
function Get_MonsterMapID(nMonsterId)
	if nMonsterId == nil then
		nMonsterId = 0
	elseif type(nMonsterId) ~= "number" or nMonsterId < 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MonsterMapID �� nMonsterId ֻ�ܴ������0������")
		return
	end

	return GetMonsterInt(nMonsterId,G_MONSTER_MapID)
end

--G_MONSTER_PosX,					=	3105
function Get_MonsterPosX(nMonsterId)
	if nMonsterId == nil then
		nMonsterId = 0
	elseif type(nMonsterId) ~= "number" or nMonsterId < 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MonsterPosX �� nMonsterId ֻ�ܴ������0������")
		return
	end

	return GetMonsterInt(nMonsterId,G_MONSTER_PosX)
end

--G_MONSTER_PosY,					=	3106
function Get_MonsterPosY(nMonsterId)
	if nMonsterId == nil then
		nMonsterId = 0
	elseif type(nMonsterId) ~= "number" or nMonsterId < 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MonsterPosY �� nMonsterId ֻ�ܴ������0������")
		return
	end

	return GetMonsterInt(nMonsterId,G_MONSTER_PosY)
end

--G_MONSTER_MaxLife,				=	3107
function Get_MonsterMaxLife(nMonsterId)
	if nMonsterId == nil then
		nMonsterId = 0
	elseif type(nMonsterId) ~= "number" or nMonsterId < 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MonsterMaxLife �� nMonsterId ֻ�ܴ������0������")
		return
	end

	return GetMonsterInt(nMonsterId,G_MONSTER_MaxLife)
end

--G_MONSTER_Life,					=	3108
function Get_MonsterLife(nMonsterId)
	if nMonsterId == nil then
		nMonsterId = 0
	elseif type(nMonsterId) ~= "number" or nMonsterId < 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MonsterLife �� nMonsterId ֻ�ܴ������0������")
		return
	end

	return GetMonsterInt(nMonsterId,G_MONSTER_Life)
end

--G_MONSTER_Level,					=	3109
function Get_MonsterLevel(nMonsterId)
	if nMonsterId == nil then
		nMonsterId = 0
	elseif type(nMonsterId) ~= "number" or nMonsterId < 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MonsterLevel �� nMonsterId ֻ�ܴ������0������")
		return
	end

	return GetMonsterInt(nMonsterId,G_MONSTER_Level)
end


------------------------------------------------------------------------------
-------------------------------------��ͼ-------------------------------------
------------------------------------------------------------------------------
--SCRIPT_PARAM_MAP_Name,= 2102          //ȡ��ͼ������
function Get_MapName(nMapId)
	if nMapId == nil then
		nMapId = Get_UserMapId(0)
	elseif type(nMapId) ~= "number" or nMapId < 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MapName �� nMapId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetMapStr(nMapId,G_MAP_Name)
end


--SCRIPT_PARAM_MAP_Type,= 2103			//ȡ��ͼ������
function Get_MapType(nMapId)
	if nMapId == nil then
		nMapId = Get_UserMapId(0)
	elseif type(nMapId) ~= "number" or nMapId < 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MapType �� nMapId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetMapInt(nMapId,G_MAP_Type)
end


--SCRIPT_PARAM_MAP_OwnerID,= 2104		//ȡ��ͼ����ID
function Get_MapOwnerId(nMapId)
	if nMapId == nil then
		nMapId = Get_UserMapId(0)
	elseif type(nMapId) ~= "number" or nMapId < 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MapOwnerId �� nMapId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetMapInt(nMapId,G_MAP_OwnerID)
end

--SCRIPT_PARAM_MAP_RebornMap,= 2105		//ȡ��ͼ������ͼID
function Get_MapRebornMapId(nMapId)
	if nMapId == nil then
		nMapId = Get_UserMapId(0)
	elseif type(nMapId) ~= "number" or nMapId < 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MapRebornMapId �� nMapId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetMapInt(nMapId,G_MAP_RebornMap)
end

--SCRIPT_PARAM_MAP_PosX,= 2106			//ȡ��ͼ������X����
function Get_MapRebornX(nMapId)
	if nMapId == nil then
		nMapId = Get_UserMapId(0)
	elseif type(nMapId) ~= "number" or nMapId < 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MapRebornX �� nMapId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetMapInt(nMapId,G_MAP_PosX)
end

--SCRIPT_PARAM_MAP_PosY,= 2107			//ȡ��ͼ������Y����
function Get_MapRebornY(nMapId)
	if nMapId == nil then
		nMapId = Get_UserMapId(0)
	elseif type(nMapId) ~= "number" or nMapId < 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MapRebornY �� nMapId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetMapInt(nMapId,G_MAP_PosY)
end

--G_MAP_RES_LEV 						=	2109	--��Դ�ȼ�
function Get_MapResLev(nMapId)
	if nMapId == nil then
		nMapId = Get_UserMapId(0)
	elseif type(nMapId) ~= "number" or nMapId < 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MapResLev �� nMapId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetMapIntEx(nMapId,G_MAP_RES_LEV)
end


------------------------------------------------------------------------------
-------------------------------------����-------------------------------------
------------------------------------------------------------------------------

--bug,�ýӿ���εİ汾��δ�ϣ����ﱸע��
--����˵����	��ȡ������ID
--����˵����	nUserId ���ID
-- function Get_TransferId(nUserId)
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_TransferId �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetLastTransportor(nUserId)
-- end

--����˵����	 ��ȡ����Ϊtype����������
--����˵����	nType��ʾ�������ͣ�����ֵ����������
function Get_TrapCount(nType)
	if type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TrapCount �� nType ֻ�ܴ������0������")
		return
	end

	return GetTrapCount(nType)
end

--G_TRAP_ID							=	2501
function Get_TrapID()
	return GetMapTrapInt(0,G_TRAP_ID)
end

--G_TRAP_TYPE							=	2502
function Get_TrapType(nTrapId)
	if nTrapId == nil then
		nTrapId = 0
	elseif type(nTrapId) ~= "number" or nTrapId < 0 or nTrapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TrapType �� nTrapId ֻ�ܴ������0������")
		return
	end

	return GetMapTrapInt(nTrapId,G_TRAP_TYPE)
end

--G_TRAP_LOOK							=	2503
function Get_TrapLook(nTrapId)
	if nTrapId == nil then
		nTrapId = 0
	elseif type(nTrapId) ~= "number" or nTrapId < 0 or nTrapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TrapLook �� nTrapId ֻ�ܴ������0������")
		return
	end

	return GetMapTrapInt(nTrapId,G_TRAP_LOOK)
end

--G_TRAP_MAPID						=	2505
function Get_TrapMAPID(nTrapId)
	if nTrapId == nil then
		nTrapId = 0
	elseif type(nTrapId) ~= "number" or nTrapId < 0 or nTrapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TrapMAPID �� nTrapId ֻ�ܴ������0������")
		return
	end

	return GetMapTrapInt(nTrapId,G_TRAP_MAPID)
end

--G_TRAP_PosX							=	2506
function Get_TrapPosX(nTrapId)
	if nTrapId == nil then
		nTrapId = 0
	elseif type(nTrapId) ~= "number" or nTrapId < 0 or nTrapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TrapPosX �� nTrapId ֻ�ܴ������0������")
		return
	end

	return GetMapTrapInt(nTrapId,G_TRAP_PosX)
end

--G_TRAP_PosY							=	2507
function Get_TrapPosY(nTrapId)
	if nTrapId == nil then
		nTrapId = 0
	elseif type(nTrapId) ~= "number" or nTrapId < 0 or nTrapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TrapPosY �� nTrapId ֻ�ܴ������0������")
		return
	end

	return GetMapTrapInt(nTrapId,G_TRAP_PosY)
end

------------------------------------------------------------------------------
-------------------------------------����-------------------------------------
------------------------------------------------------------------------------
--����˵����	��ȡstc����ֵ
--����˵����	nUserId ���ID��nEvent ����ǰ3λ��nType�����2λ ����stc(123,45) nEvent = 123, nType = 45
function Get_UserStatisticValue(nEvent,nType,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStatisticValue �� nUserId ֻ�ܴ������0������")
		return
	end
	
	if type(nEvent) ~= "number" or nEvent <= 0 or nEvent%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStatisticValue �� nEvent ֻ�ܴ�����0������")
		return
	end
	
	if type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStatisticValue �� nType ֻ�ܴ����ڵ���0������")
		return
	end
	
	return GetUserStatistic(nUserId, nEvent, nType)
end

--����˵����	��ȡstc����ֵ 1067
--����˵����	nUserId ���ID��nEvent ����ǰ3λ��nType�����2λ ����stc(123,45) nEvent = 123, nType = 45
function Get_UserStatisticDailyValue(nEvent,nType,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStatisticDailyValue �� nUserId ֻ�ܴ������0������")
		return
	end
	
	if type(nEvent) ~= "number" or nEvent <= 0 or nEvent%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStatisticDailyValue �� nEvent ֻ�ܴ�����0������")
		return
	end
	
	if type(nType) ~= "number" or nType <= 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStatisticDailyValue �� nType ֻ�ܴ�����0������")
		return
	end
	
	return GetUserStatisticDaily(nUserId, nEvent, nType)
end

--����˵����	��ȡstc����ֵʱ���
--����˵����	nUserId ���ID��nEvent ����ǰ3λ��nType�����2λ ����stc(123,45) nEvent = 123, nType = 45
function Get_UserStcTimestampValue(nEvent,nType,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStcTimestampValue �� nUserId ֻ�ܴ������0������")
		return
	end
	
	if type(nEvent) ~= "number" or nEvent <= 0 or nEvent%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStcTimestampValue �� nEvent ֻ�ܴ�����0������")
		return
	end
	
	if type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserStcTimestampValue �� nType ֻ�ܴ����ڵ���0������")
		return
	end
	
	return GetUserStcTimestamp(nUserId, nEvent, nType)
end

-- bug������ֵΪ0
-- ��ȡ���task_detail���idֵ
-- ����˵����nUserId�����ID
-- ����˵����nQuestId�����task_detail���task_idֵ
-- ���û����Ҫȡ��taskDetailId,�������ε�
-- function Get_TaskDetailId(nQuestId,nUserId)
	-- if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_TaskDetailId �� nQuestId ֻ�ܴ�����0������")
		-- return
	-- end

	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_TaskDetailId �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_ID)
-- end

-- bug������ֵΪ0
-- ��ȡ���task_detail���user_idֵ
-- ����˵����nUserId�����ID
-- ����˵����nQuestId�����task_detail���task_idֵ
-- û����Ҫȡ��UserId,�������ε�
-- function Get_TaskDetailUserId(nQuestId,nUserId)
	-- if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_TaskDetailUserId �� nQuestId ֻ�ܴ�����0������")
		-- return
	-- end

	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_TaskDetailUserId �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_USER_ID)
-- end

-- bug������ֵΪ0
-- ��ȡ���task_detail���task_idֵ
-- ����˵����nUserId�����ID
-- ����˵����nQuestId�����task_detail���task_idֵ
-- û����Ҫȡ��task_id,�������ε�
-- function Get_TaskDetailTaskId(nQuestId,nUserId)
	-- if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_TaskDetailTaskId �� nQuestId ֻ�ܴ�����0������")
		-- return
	-- end
	
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_TaskDetailTaskId �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_TASK_ID)
-- end

-- ��ȡ���task_detail���Complete_Flagֵ
-- ����˵����nUserId�����ID
-- ����˵����nQuestId�����task_detail���task_idֵ
function Get_TaskDetailCompleteFlag(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailCompleteFlag �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailCompleteFlag �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_COMPLETE_FLAG)
end

-- ��ȡ���task_detail���Notify_Flagֵ
-- ����˵����nUserId�����ID
-- ����˵����nQuestId�����task_detail���task_idֵ
function Get_TaskDetailNotifyFlag(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailNotifyFlag �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailNotifyFlag �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_NOTIFY_FLAG)
end

-- ��ȡ���task_detail���data1ֵ
-- ����˵����nUserId�����ID
-- ����˵����nQuestId�����task_detail���task_idֵ
function Get_TaskDetailData1(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData1 �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData1 �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_DATA1)
end

-- ��ȡ���task_detail���data2ֵ
-- ����˵����nUserId�����ID
-- ����˵����nQuestId�����task_detail���task_idֵ
function Get_TaskDetailData2(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData2 �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData2 �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_DATA2)
end

-- ��ȡ���task_detail���data3ֵ
-- ����˵����nUserId�����ID
-- ����˵����nQuestId�����task_detail���task_idֵ
function Get_TaskDetailData3(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData3 �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData3 �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_DATA3)
end

-- ��ȡ���task_detail���data4ֵ
function Get_TaskDetailData4(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData4 �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData4 �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_DATA4)
end

-- ��ȡ���task_detail���data5ֵ
function Get_TaskDetailData5(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData5 �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData5 �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_DATA5)
end

-- ��ȡ���task_detail���data6ֵ
function Get_TaskDetailData6(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData6 �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData6 �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_DATA6)
end

-- ��ȡ���task_detail���data7ֵ
function Get_TaskDetailData7(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData7 �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailData7 �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_DATA7)
end

-- ��ȡ���task_detail���task_overtimeֵ
function Get_TaskDetailovertime(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailovertime �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetailovertime �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_TASK_OVERTIME)
end

-- ��ȡ���task_detail���typeֵ
--bug ��ʾһֱΪ0
-- �����û��ȡ���ֵ�ýӿ�
-- function Get_TaskDetailtype(nQuestId,nUserId)
	-- if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_TaskDetailtype �� nQuestId ֻ�ܴ�����0������")
		-- return
	-- end
	
	-- if nUserId == nil then
		-- nUserId = 0
	-- elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		-- Sys_SaveAbnormalLog("���� Get_TaskDetailtype �� nUserId ֻ�ܴ������0������")
		-- return
	-- end
	
	-- return GetTaskDetailData(nUserId,nQuestId,G_TASKDETAIL_TYPE)
-- end

-- ��ȡ���task_detail���max_accumulate_times ֵ
function Get_MaxAccumulateTime(nQuestId,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MaxAccumulateTime �� nQuestId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_MaxAccumulateTime �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,G_MAX_ACCUMULATE_TIMES)
end

-- ��ȡ���task_detail�������
-- nQuestId ����ID
-- sPos ��Ӧ�������ֶ� ֻ�ܴ� "CompleteFlag"��"NotifyFlag"��"1"��"2"��"3"��"4"��"5"��"6"��"7"��"OverTime"��"OverTimeSec"
-- nUserId ���ID
function Get_TaskDetail(nQuestId,sPos,nUserId)
	if type(nQuestId) ~= "number" or nQuestId <= 0 or nQuestId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetail �� nQuestId ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetail �� nUserId ֻ�ܴ������0������")
		return
	end
	
	local nIndex = 0
	
	if sPos == "CompleteFlag" then
		nIndex = G_TASKDETAIL_COMPLETE_FLAG
	elseif sPos == "NotifyFlag" then
		nIndex = G_TASKDETAIL_NOTIFY_FLAG
	elseif sPos == "1" then
		nIndex = G_TASKDETAIL_DATA1
	elseif sPos == "2" then
		nIndex = G_TASKDETAIL_DATA2
	elseif sPos == "3" then
		nIndex = G_TASKDETAIL_DATA3
	elseif sPos == "4" then
		nIndex = G_TASKDETAIL_DATA4
	elseif sPos == "5" then
		nIndex = G_TASKDETAIL_DATA5
	elseif sPos == "6" then
		nIndex = G_TASKDETAIL_DATA6
	elseif sPos == "7" then
		nIndex = G_TASKDETAIL_DATA7
	elseif sPos == "OverTime" then
		nIndex = G_TASKDETAIL_TASK_OVERTIME
	elseif sPos == "OverTimeSec" then
		nIndex = G_TASKDETAIL_TASK_OVERTIME_SEC
	end
	
	if nIndex == 0 then
		Sys_SaveAbnormalLog("���� Get_TaskDetail �� sPos ����ĸ�ʽ�д�")
		return
	end
	
	return GetTaskDetailData(nUserId,nQuestId,nIndex)
end

-------------------------------------------2014.12.5
-- ��ȡ��������ڹ���������ֵ
-- ����˵������1��idUser���ID������ֵ����ҵ�������ֵ
function Get_InnerStrengthTotalValue(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_InnerStrengthTotalValue �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetInnerStrengthTotalValue(nUserId)
end

-- ��ȡ���ָ���ڹ����͵ĵȼ�
-- ����1�����ID������2���ڹ����ͣ�����ֵ����Ӧ���ڹ��ȼ�
function Get_InnerStrengthLevByType(nType,nUserId)
	if type(nType) ~= "number" or nType%1 ~= 0 or nType <= 0 then
		Sys_SaveAbnormalLog("���� Get_InnerStrengthLevByType �� nType ֻ�ܴ�����0С��14������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_InnerStrengthLevByType �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetInnerStrengthLevByType(nUserId,nType)
end

-- ��ȡ�����Ϊֵ
function Get_UserCultureValue(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserCultureValue �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_CultureValue)
end

--2015.01.08
--��ӻ�ȡ��ҵ�ǰ����ɿ������Ĵ���

--	// ��õ�ǰ����ɿ���������������-1��ʾ���󣬷��򷵻ؾ����ֵ
--	// ����1: ���ID

function Get_CompleteOSTaskAmount(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_CompleteOSTaskAmount �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return GetCompleteOSTaskAmount(nUserId)
end

--��ӻ�ȡ���ÿ�տ���ɵĿ���������

--	// ���ÿ�տ���ɿ���������������-1��ʾ���󣬷��򷵻ؾ����ֵ
--	// �޲���

function Get_OSTaskMaxCompleteTimes()
	return GetOSTaskMaxCompleteTimes()
end

--------------------2014.12.16
-- ������ڹ���ש��
-- Int GetCountryBrickAmount();
-- ����ֵ�����ڹ���ש��
function Get_CountryBrickAmount()
	return GetCountryBrickAmount()
end



--------------2014.12.19
-- ���¼����ӿ�ֻ����Event_Kill_User�¼���ʹ��
-- ��ȡĿ�����(��ɱ���)
-- // ��ȡĿ�����(��ɱ���)�������ԡ� ����1��Ŀ�����ID����0ΪĬ��Ŀ����ң��� nIdx ʹ�õ�ö�ٺͽӿ�GetUserInt��ͬ(����ʹ������ӿڻ�ȡ��ɱ���ID)��ʧ�ܷ���-1�����򷵻ؾ���ֵ.
function Get_TargetUserProfession(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TargetUserProfession �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTargetUserInt(nUserId,G_PLAYER_Profession)
end

--��ȡĿ�����(��ɱ���)���֣��ַ�����
function Get_TargetUserName(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_TargetUserName �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTargetUserStr(nUserId,G_PLAYER_Name)
end
--------------------------------------------------------------------------------------

--------------2015.7.6
-- ������ȡ�ƽ��������ֵĽӿ�
function Get_UserLeaguePoint(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLeaguePoint �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_League_Point)
end

-- ��ȡ����ִ����id
function Get_CountryId()
	return GetCountryId()
end

-- ��ȡ�������id
function Get_UserLeagueId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLeagueId �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_League_ID)
end

-- ��ȡ���ս��ֵ
function Get_UserServiceValue(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserServiceValue �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetUserInt(nUserId,G_PLAYER_Service_Value)
end

----2015.07.24����ӽӿ�

--��ȡ��ҹ�ְ��
-- ������ȡ��ҹ�ְ����ֵ��2���Ʊ�ʾ������еĹ�ְ�����ĳλΪ1����ʾ����иù�ְ������û�С�
-- ����ֵ�ӵ�λ����λ���α�ʾ�����������࣬�����࣬��Ԫ˧����Ԫ˧����������������������������
-- ���Ľ��������־����ʺ󣨹��򣩣�����������������ˣ��๫��
function Get_UserLeagueOfficial(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLeagueOfficial �� nUserId ֻ�ܴ������0������")
		return
	end

	return GetUserInt(nUserId,G_PLAYER_League_Official)
end

-- ��ȡ�������Ľӿ�
function Get_Harem(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_Harem �� nUserId ֻ�ܴ������0������")
		return
	end
	
	local nOfficial = Get_UserLeagueOfficial(nUserId)
	local nSex = Get_UserSex(nUserId)
	
	if Sys_ParseNumbersContain(4096,nOfficial) then
		local sOfficial = {tLuaRes[10022],tLuaRes[10021]}
		return sOfficial[nSex]
	elseif Sys_ParseNumbersContain(2048,nOfficial) then
		local sOfficial = {tLuaRes[10020],tLuaRes[10019]}
		return sOfficial[nSex]
	elseif Sys_ParseNumbersContain(1024,nOfficial) then
		local sOfficial = {tLuaRes[10018],tLuaRes[10017]}
		return sOfficial[nSex]
	end
end

-- ����lua�ӿڣ�
-- GetVexillumRank(int idSyn)
-- ����1������id��������ɴ�0��Ĭ��ȡ��ǰ������ڰ���id
-- ����ֵ��������ս�����е�����(����0��ʾ��һ��,����Ҫ+1)
function Get_VexillumRank(nGuildId)
	if nGuildId == nil then
		nGuildId = 0
	elseif type(nGuildId) ~= "number" or nGuildId < 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_VexillumRank �� nGuildId ֻ�ܴ������0������")
		return
	end
	
	return GetVexillumRank(nGuildId)
end

--��ȡ���ɵȼ�
--����˵����nGuildIdָҪ��������Ұ���ID, nIdxָSCRIPT_PARAM_SYNDICATE_BEGIN-SCRIPT_PARAM_SYNDICATE_END��ö��ֵ�����ʧ�ܷ���"-1"�����򷵻ؾ����ֵ��
-- GetSynInt������������SCRIPT_PARAM_SYNDICATE_LEVEL=2837, ��ȡ���ɵȼ�
function Get_UserSynLevel(nGuildId)
	if type(nGuildId) ~= "number" or nGuildId <= 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserSynLevel �� nGuildId ֻ�ܴ���0������")
		return
	end
	
	return GetSynInt(nGuildId,G_SYNDICATE_LEVEL)
end	

-- ��ȡ��ɱ���߱������������id
function Get_TargetUserLeagueId(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLeagueId �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetTargetUserInt(nUserId,G_PLAYER_League_ID)
end

-- ����lua�ӿڣ�
-- GetBrickQuality(int idUser)
-- ����1�����id��������idΪ0.Ĭ��ȡ��ǰ���id
-- ����ֵ����שƷ�ʴӵ͵��߷ֱ�Ϊ0-4�����󷵻�-1
function Get_BrickQuality(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_BrickQuality �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return GetBrickQuality(nUserId)
end