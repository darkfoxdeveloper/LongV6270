----------------------------------------------------------------------------
--Name:		[����][���ú���]NPC����.lua
--Purpose:	NPC�����ӿ�
--Creator: 	�ֽ�
--Created:	2014/06/26
----------------------------------------------------------------------------
---------------------------------�����淶----------------------------------
------------------------------actiontype�ķ���------------------------------
--Sys  ϵͳ����
--Send ��Ϣ����
--Get  �������
--Set  �޸�����
--Chk  �������
--Del  ɾ������
--Add  �������
------------------------------------------------------------------------------
-- Npc��������ǰ׺�ʣ�Npc_
--���ӣ�
--//ɾ��ָ����NPC,����˵����idNpcָҪɾ����NPCID��ע�⣺ɾ���󣬲�Ҫ�ٶԴ�NPC���в�����
--NpcDelByID(OBJID idNpc)

--function Npc_DelById(nNpcId)
--
--end

------------------------------------------------------------------------------
-- NPC������ؽӿ�˵����
-- //����NPC�������������ԣ�����˵����idNpcָҪ������NPCID��idxָ2000-2099��ö��ֵ��nValueָҪ���õľ���ֵ�����ʧ�ܷ���false�����򷵻�true��
-- SetNpcInt(OBJID idNpc, int idx, int nValue)
-- //����NPC���ַ��������ԣ�����˵����idNpcָҪ������NPCID��idxָ2000-2099��ö��ֵ��nValueָҪ���õľ���ֵ�����ʧ�ܷ���false�����򷵻�true��
-- SetNpcStr(OBJID idNpc, int idx, const char* strVaule)
--�������ǵ�Ҫ��SetNpcInt��SetNpcStr�������ӿ����ӵ�4�����������ڿ����Ƿ�Ҫ�������µ����ݿ⣬��0��ʾҪ�������µ����ݿ⣬�����ɷ�����������Ƹ��»���

-- //ɾ��ָ����NPC,����˵����idNpcָҪɾ����NPCID��ע�⣺ɾ���󣬲�Ҫ�ٶԴ�NPC���в�����
-- NpcDelByID(OBJID idNpc)
-- //ɾ��ָ�����͵�����NPC������˵����nNpcTypeָҪɾ����NPC���ͣ�ע�⣺ɾ���󣬲�Ҫ�ٶԴ�NPC���в�����
-- NpcDelByType(int nNpcType)
-- //��NPC�ƶ���ָ����ͼ��ָ��λ�ã�����˵����idNpcָҪ�ƶ���NPCID��idMapָҪ�ƶ����ĵ�ͼID��nPosXָX���꣬nPosYָY���ꡣע�⣺NPCҪΪ�̶�NPC
-- NpcMove(OBJID idNpc, OBJID idMap, int nPosX, int nPosY)


--����DynaNPC��name�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2002
function Npc_SetDynaNpcName(sName,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcName �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(sName) ~= "string" then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcName �� sName ֻ�ܴ��ַ���ֵ")
		return
	end

	return SetNpcStr(nDynaNpcId,G_NPC_Name,sName,1)
end

--����DynaNPC��OwnerID�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2003200
function Npc_SetDynaNpcOwnerId(nOwnerId,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcOwnerId �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nOwnerId) ~= "number" or nOwnerId%1 ~= 0  or nOwnerId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcOwnerId �� nOwnerId ֻ�ܴ�����0������")
		return
	end
	
	return SetNpcInt(nDynaNpcId,G_NPC_OwnerID,nOwnerId,1)
end

--����DynaNPC��Type�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2005
function Npc_SetDynaNpcType(nType,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcType �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nType) ~= "number" or nType%1 ~= 0  or nType < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcType �� nType ֻ�ܴ�����0������")
		return
	end

	return SetNpcInt(nDynaNpcId,G_NPC_Type,nType,1)
end

--����DynaNPC��LookFace�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2006
function Npc_SetDynaNpcLookFace(nLookFace,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcLookFace �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nLookFace) ~= "number" or nLookFace%1 ~= 0  or nLookFace < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcLookFace �� nLookFace ֻ�ܴ�����0������")
		return
	end
	
	return SetNpcInt(nDynaNpcId,G_NPC_LookFace,nLookFace,1)
end

--����DynaNPC��MapId�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2007
function Npc_SetDynaNpcMapId(nMapId,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcMapId �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcMapId �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	return SetNpcInt(nDynaNpcId,G_NPC_MapID,nMapId,1)
end

--����DynaNPC��Cellx�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2008
function Npc_SetDynaNpcCellx(nCellx,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcCellx �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nCellx) ~= "number" or nCellx%1 ~= 0  or nCellx < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcCellx �� nCellx ֻ�ܴ�����0������")
		return
	end

	return SetNpcInt(nDynaNpcId,G_NPC_PosX,nCellx,1)
end

--����DynaNPC��Celly�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2009
function Npc_SetDynaNpcCelly(nCelly,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcCelly �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nCelly) ~= "number" or nCelly%1 ~= 0  or nCelly < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcCelly �� nCelly ֻ�ܴ�����0������")
		return
	end

	return SetNpcInt(nDynaNpcId,G_NPC_PosY,nCelly,1)
end

--����DynaNPC��Data0�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2010
function Npc_SetDynaNpcData0(nData0,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcData0 �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nData0) ~= "number" or nData0%1 ~= 0  or nData0 < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcData0 �� nData0 ֻ�ܴ�����0������")
		return
	end

	return SetNpcInt(nDynaNpcId,G_NPC_Data0,nData0,1)
end

--����DynaNPC��Data1�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2011
function Npc_SetDynaNpcData1(nData1,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcData1 �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nData1) ~= "number" or nData1%1 ~= 0  or nData1 < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcData1 �� nData1 ֻ�ܴ�����0������")
		return
	end

	return SetNpcInt(nDynaNpcId,G_NPC_Data1,nData1,1)
end

--����DynaNPC��Data2�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2012
function Npc_SetDynaNpcData2(nData2,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcData2 �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nData2) ~= "number" or nData2%1 ~= 0  or nData2 < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcData2 �� nData2 ֻ�ܴ�����0������")
		return
	end

	return SetNpcInt(nDynaNpcId,G_NPC_Data2,nData2,1)
end


--����DynaNPC��Data3�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2013
function Npc_SetDynaNpcData3(nData3,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcData3 �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nData3) ~= "number" or nData3%1 ~= 0  or nData3 < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcData3 �� nData3 ֻ�ܴ�����0������")
		return
	end

	return SetNpcInt(nDynaNpcId,G_NPC_Data3,nData3,1)
end

--����DynaNPC��DataStr�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2014
function Npc_SetDynaNpcDataStr(sDataStr,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcDataStr �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	sDataStr = tostring(sDataStr) or "null"
	return SetNpcStr(nDynaNpcId,G_NPC_DataStr,sDataStr,1)
end

--����DynaNPC��MaxLife�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2015
function Npc_SetDynaNpcMaxLife(nMaxLife,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcMaxLife �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nMaxLife) ~= "number" or nMaxLife%1 ~= 0  or nMaxLife < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcMaxLife �� nMaxLife ֻ�ܴ�����0������")
		return
	end
	
	return SetNpcInt(nDynaNpcId,G_NPC_MaxLife,nMaxLife,1)
end

--����DynaNPC��Life�ֶ�(��Ҫ��̬npc����)
--NPC��ID  =  2016
function Npc_SetDynaNpcLife(nLife,nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcLife �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nLife) ~= "number" or nLife%1 ~= 0  or nLife < 0 then
		Sys_SaveAbnormalLog("���� Npc_SetDynaNpcLife �� nLife ֻ�ܴ�����0������")
		return
	end

	return SetNpcInt(nDynaNpcId,G_NPC_Life,nLife,1)
end

--��NPC�ƶ���ָ����ͼ��ָ��λ��
--����˵����idNpcָҪ�ƶ���NPCID��idMapָҪ�ƶ����ĵ�ͼID��nPosXָX���꣬nPosYָY���ꡣע�⣺NPCҪΪ�̶�NPC
function Npc_MoveNpcPos(nNpcId,nMapId,nPosX,nPosY)
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId%1 ~= 0 or nNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_MoveNpcPos �� nNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId < 0 then
		Sys_SaveAbnormalLog("���� Npc_MoveNpcPos �� nMapId ֻ�ܴ�����0������")
		return
	end

	if type(nPosX) ~= "number" or nPosX%1 ~= 0  or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Npc_MoveNpcPos �� nPosX ֻ�ܴ�����0������")
		return
	end

	if type(nPosY) ~= "number" or nPosY%1 ~= 0  or nPosY < 0 then
		Sys_SaveAbnormalLog("���� Npc_MoveNpcPos �� nPosY ֻ�ܴ�����0������")
		return
	end

	return NpcMove(nNpcId,nMapId,nPosX,nPosY)
end

--ɾ��ָ����NPC,����˵����idNpcָҪɾ����NPCID��ע�⣺ɾ���󣬲�Ҫ�ٶԴ�NPC���в�����
--ɾ�����ɹ�������ʹ��Del_DynaNpcɾ��
--NpcDelByID(OBJID idNpc)
function Npc_DelDynaByID(nDynaNpcId)
	if nDynaNpcId == nil then
		nDynaNpcId = 0
	elseif type(nDynaNpcId) ~= "number" or nDynaNpcId%1 ~= 0 or nDynaNpcId < 0 then
		Sys_SaveAbnormalLog("���� Npc_DelDynaByID �� nDynaNpcId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return NpcDelByID(nDynaNpcId)
end

--2011��ɾ��ָ��NPC���޶�̬NPC��ע�⣺ɾ���󣬲�Ҫ�ٶԴ���NPC���в�����param="idMap field data"��Field=��id��������id������name��������npc�����֣�����type�������ͣ���data=Ҫͳ�Ƶ�id�����ֻ�����ֵ��
--bool Npc_DeleteSynNPC(OBJID idMap, const char* pszField, const char* pszData);
function Npc_DelDynaNpc(nMapId,sField,sData)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId < 0 then
		Sys_SaveAbnormalLog("���� Npc_DelDynaNpc �� nMapId ֻ�ܴ�����0������")
		return
	end

	if (sField == "id" or sField == "name" or sField == "type") then
	
	else
		Sys_SaveAbnormalLog("���� Npc_DelDynaNpc �� sField ֻ�ܴ�id��name��type")
		return
	end

	if sData == nil or sData == "" then
		Sys_SaveAbnormalLog("���� Npc_DelDynaNpc �� sData ����Ϊ��")
		return
	end

	return DeleteSynNPC(nMapId,sField,sData)
end

--2007,����һ��NPC��param="name type sort lookface ownertype ownerid mapid posx posy life base linkid  task0 task0 ... task7  data0 data1 data2 data3 datastr"������9��������
function Npc_CreateDynaNpc(sName,nType,nSort,nLookFace,nOwnerType,nOwnerId,nMapId,nPosX,nPosY,nLife,nBase,nLinkid,nTask0,nTask1,nTask2,nTask3,nTask4,nTask5,nTask6,nTask7,nData0,nData1,nData2,nData3,sDataStr)
	if type(sName) ~= "string" or sName == "" then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� sName ֻ�ܴ��ַ���ֵ���Ҳ�Ϊ���ַ���")
		return
	end

	if type(nType) ~= "number" or nType%1 ~= 0  or nType < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nType ֻ�ܴ�����0������")
		return
	end

	if type(nSort) ~= "number" or nSort%1 ~= 0  or nSort < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nSort ֻ�ܴ�����0������")
		return
	end

	if type(nLookFace) ~= "number" or nLookFace%1 ~= 0  or nLookFace < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nLookFace ֻ�ܴ�����0������")
		return
	end

	if nOwnerType == nil then
		nOwnerType = 0
	elseif type(nOwnerType) ~= "number" or nOwnerType%1 ~= 0 or nOwnerType < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nOwnerType ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nOwnerId == nil then
		nOwnerId = 0
	elseif type(nOwnerId) ~= "number" or nOwnerId%1 ~= 0 or nOwnerId < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nOwnerId ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nMapId ֻ�ܴ�����0������")
		return
	end

	if type(nPosX) ~= "number" or nPosX%1 ~= 0  or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nPosX ֻ�ܴ�����0������")
		return
	end

	if type(nPosY) ~= "number" or nPosY%1 ~= 0  or nPosY < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nPosY ֻ�ܴ�����0������")
		return
	end

	if nLife == nil then
		nLife = 0
	elseif type(nLife) ~= "number" or nLife%1 ~= 0 or nLife < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nLife ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nBase == nil then
		nBase = 0
	elseif type(nBase) ~= "number" or nBase%1 ~= 0 or nBase < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nBase ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nLinkid == nil then
		nLinkid = 0
	elseif type(nLinkid) ~= "number" or nLinkid%1 ~= 0 or nLinkid < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nLinkid ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask0 == nil then
		nTask0 = 0
	elseif type(nTask0) ~= "number" or nTask0%1 ~= 0 or nTask0 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nTask0 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask1 == nil then
		nTask1 = 0
	elseif type(nTask1) ~= "number" or nTask1%1 ~= 0 or nTask1 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nTask1 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask2 == nil then
		nTask2 = 0
	elseif type(nTask2) ~= "number" or nTask2%1 ~= 0 or nTask2 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nTask2 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask3 == nil then
		nTask3 = 0
	elseif type(nTask3) ~= "number" or nTask3%1 ~= 0 or nTask3 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nTask3 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask4 == nil then
		nTask4 = 0
	elseif type(nTask4) ~= "number" or nTask4%1 ~= 0 or nTask4 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nTask4 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask5 == nil then
		nTask5 = 0
	elseif type(nTask5) ~= "number" or nTask5%1 ~= 0 or nTask5 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nTask5 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask6 == nil then
		nTask6 = 0
	elseif type(nTask6) ~= "number" or nTask6%1 ~= 0 or nTask6 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nTask6 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask7 == nil then
		nTask7 = 0
	elseif type(nTask7) ~= "number" or nTask7%1 ~= 0 or nTask7 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nTask7 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nData0 == nil then
		nData0 = 0
	elseif type(nData0) ~= "number" or nData0%1 ~= 0 or nData0 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nData0 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nData1 == nil then
		nData1 = 0
	elseif type(nData1) ~= "number" or nData1%1 ~= 0 or nData1 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nData1 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nData2 == nil then
		nData2 = 0
	elseif type(nData2) ~= "number" or nData2%1 ~= 0 or nData2 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nData2 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nData3 == nil then
		nData3 = 0
	elseif type(nData3) ~= "number" or nData3%1 ~= 0 or nData3 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreateDynaNpc �� nData3 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	sDataStr = tostring(sDataStr) or "null"
	return CreateNewNPC(sName,nType,nSort,nLookFace,nOwnerType,nOwnerId,nMapId,nPosX,nPosY,nLife,nBase,nLinkid,nTask0,nTask1,nTask2,nTask3,nTask4,nTask5,nTask6,nTask7,nData0,nData1,nData2,nData3,sDataStr)
end

-- //������ɴ���NPC�������ڰ��ɴ���NPC�����������һ��ACTION�����治���ٽ�����ACTION��ע�⣺�ɹ�ʱ������NPC��OWNER_ID(���Ƚ�OWNER_ID��Ϊ0)��ͬʱ�Զ�ɾ����һ������NPC��ʧ��ʱ�ô���NPC���Զ�ɾ����
-- //����˵����nTransNpcIdΪ��������NPC����ID��nMapIdΪҪ���͵ĵ�ͼID��nPosXΪҪ���͵�X����, nPosYΪҪ���͵�Y���ꡣ
function Npc_ActiveSynTrans(nTransNpcId,nMapId,nPosX,nPoxY)
	if type(nTransNpcId) ~= "number" or nTransNpcId%1 ~= 0 or nTransNpcId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_ActiveSynTransNpc ���� nTransNpcId ֻ�ܴ�����0������")
		return
	end
	
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_ActiveSynTransNpc ���� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPosX) ~= "number" or nPosX%1 ~= 0 or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Sys_ActiveSynTransNpc ���� nPosX ֻ�ܴ������0������")
		return
	end
	
	if type(nPoxY) ~= "number" or nPoxY%1 ~= 0 or nPoxY < 0 then
		Sys_SaveAbnormalLog("���� Sys_ActiveSynTransNpc ���� nPoxY ֻ�ܴ������0������")
		return
	end
	
	return ActiveSynTransNpc(nTransNpcId,nMapId,nPosX,nPoxY)
end

-- //��ָ����ͼ��ָ�����͵�NPC�Ƶ�ָ����λ����ȥ������˵����sParam֧�ֶ������������������ò��� actiontype = 223�� action���á�
function Npc_ChangePos(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Npc_ChangePos ���� sParam ֻ�ܴ��ַ�")
		return
	end
	
	return ChangeNpcPos(sParam)
end


-- //NPCʩ��һ��ħ��Ч��������˵����idSourceʩ���ߣ�nMgcTypeħ�����ͣ�nMgcLevelħ���ȼ���idTargetʩ��Ŀ�꣬nDataħ���˺�
function Npc_MgcEffect(nSourceId,nMgcType,nMgcLevel,nTargetId,nData)
	if type(nSourceId) ~= "number" or nSourceId%1 ~= 0 or nSourceId < 0 then
		Sys_SaveAbnormalLog("���� Npc_MgcEffect ���� nSourceId ֻ�ܴ������0������")
		return
	end
	
	if type(nMgcType) ~= "number" or nMgcType%1 ~= 0 or nMgcType < 0 then
		Sys_SaveAbnormalLog("���� Npc_MgcEffect ���� nMgcType ֻ�ܴ������0������")
		return
	end
	
	if type(nMgcLevel) ~= "number" or nMgcLevel%1 ~= 0 or nMgcLevel < 0 then
		Sys_SaveAbnormalLog("���� Npc_MgcEffect ���� nMgcLevel ֻ�ܴ������0������")
		return
	end
	
	if type(nTargetId) ~= "number" or nTargetId%1 ~= 0 or nTargetId < 0 then
		Sys_SaveAbnormalLog("���� Npc_MgcEffect ���� nTargetId ֻ�ܴ������0������")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Npc_MgcEffect ���� nData ֻ�ܴ������0������")
		return
	end
	
	return NpcMgcEffect(nSourceId,nMgcType,nMgcLevel,nTargetId,nData)
end

-- //NPCʩ��һ����Чħ��Ч��������˵����idSourceʩ���ߣ�nMgcTypeħ�����ͣ�nMgcLevelħ���ȼ���nPosXʩ����X����, nPosYʩ����Y���꣬idTargetʩ��Ŀ�꣬nDataħ���˺�
function Npc_GroundMgcEffect(nSourceId,nMgcType,nMgcLevel,nPosX,nPosY,nTargetId,nData)
	if type(nSourceId) ~= "number" or nSourceId%1 ~= 0 or nSourceId < 0 then
		Sys_SaveAbnormalLog("���� Npc_GroundMgcEffect ���� nSourceId ֻ�ܴ������0������")
		return
	end
	
	if type(nMgcType) ~= "number" or nMgcType%1 ~= 0 or nMgcType < 0 then
		Sys_SaveAbnormalLog("���� Npc_GroundMgcEffect ���� nMgcType ֻ�ܴ������0������")
		return
	end
	
	if type(nMgcLevel) ~= "number" or nMgcLevel%1 ~= 0 or nMgcLevel < 0 then
		Sys_SaveAbnormalLog("���� Npc_GroundMgcEffect ���� nMgcLevel ֻ�ܴ������0������")
		return
	end
	
	if type(nPosX) ~= "number" or nPosX%1 ~= 0 or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Npc_GroundMgcEffect ���� nPosX ֻ�ܴ������0������")
		return
	end
	
	if type(nPosY) ~= "number" or nPosY%1 ~= 0 or nPosY < 0 then
		Sys_SaveAbnormalLog("���� Npc_GroundMgcEffect ���� nPosY ֻ�ܴ������0������")
		return
	end
	
	if type(nTargetId) ~= "number" or nTargetId%1 ~= 0 or nTargetId < 0 then
		Sys_SaveAbnormalLog("���� Npc_GroundMgcEffect ���� nTargetId ֻ�ܴ������0������")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Npc_GroundMgcEffect ���� nData ֻ�ܴ������0������")
		return
	end
	
	return NpcGroundMgcEffect(nSourceId,nMgcType,nMgcLevel,nPosX,nPosY,nTargetId,nData)
end


---------------------------------2015.03.02-----------------------------------
--����type = 401 �� 403 �����Ҿ�npc�� ��װ����

--�Ҿ߽ӿڷ�װ -- 401
--//֪ͨ�ͻ��˷���һ��NPC, ��1��idUserָ����NPC�����ID����2��nRegion��ʾcq_region��type, ��3��nType��ʾNPC����, ��4��nLookFace��ʾNPC������, ��5��szCallFunc��ʾ�������Ҫ���õ�LUA����
--this->LuaScript()->ExportCFunc(fn_RequestLayNpcByItem,		"RequestLayNpcByItem");
--401	
function Npc_RequestLayNpcByItem(sCallFunc,nType,nLookFace,nRegion,nUserId)

	if sCallFunc == nil then
		sCallFunc = "NULL"
	elseif type(sCallFunc) ~= "string"  then
		Sys_SaveAbnormalLog("���� Npc_RequestLayNpcByItem �� sCallFunc ֻ��Ϊ�ַ�������")
		return
	end
	
	if type(nType) ~= "number" or nType%1 ~= 0  or nType < 0 then
		Sys_SaveAbnormalLog("���� Npc_RequestLayNpcByItem �� nType ֻ�ܴ�����0����")
		return
	end
	
	if type(nLookFace) ~= "number" or nLookFace%1 ~= 0  or nLookFace < 0 then
		Sys_SaveAbnormalLog("���� Npc_RequestLayNpcByItem �� nLookFace ֻ�ܴ�����0������")
		return
	end
	
	if nRegion == nil then
		nRegion = 0
	elseif type(nRegion) ~= "number" or nRegion%1 ~= 0  or nRegion < 0 then
		Sys_SaveAbnormalLog("���� Npc_RequestLayNpcByItem �� nRegion ֻ�ܴ����ڵ���0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0  or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Npc_RequestLayNpcByItem �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return RequestLayNpcByItem(nUserId,nRegion,nType,nLookFace,string.format("</F>%s",sCallFunc))
end

--403
-- // ����һ��NPC�������ɹ��󣬸�NPC���ǵ�ǰ����NPC��owner_id���Զ�����Ϊ����ID�����ID��
-- // ��1��name����2��type����3��sort����4��lookface����5��ownertype����6��life����7��nRegionType����8��base����9��linkid����10-��17��task0 - task7
-- // ��18-��21��Data0 - Data3����22��szData�����ӵĵȼ�����data3�С�
-- this->LuaScript()->ExportCFunc(fn_LayNpcByItem,				"LayNpcByItem");	
	
--403

function Npc_CreatLayNpcByItem(sName,nType,nSort,nLookFace,nOwnertype,nLife,nRegionType,nBase,nLinkid,nTask0,nTask1,nTask2,nTask3,nTask4,nTask5,nTask6,nTask7,nData0,nData1,nData2,nData3,sDataStr)

	if type(sName) ~= "string" or sName == "" then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� sName ֻ�ܴ��ַ���ֵ���Ҳ�Ϊ���ַ���")
		return
	end

	if type(nType) ~= "number" or nType%1 ~= 0  or nType < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nType ֻ�ܴ�����0������")
		return
	end

	if type(nSort) ~= "number" or nSort%1 ~= 0  or nSort < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nSort ֻ�ܴ�����0������")
		return
	end

	if type(nLookFace) ~= "number" or nLookFace%1 ~= 0  or nLookFace < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nLookFace ֻ�ܴ�����0������")
		return
	end

	if nOwnerType == nil then
		nOwnerType = 0
	elseif type(nOwnerType) ~= "number" or nOwnerType%1 ~= 0 or nOwnerType < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nOwnerType ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end


	if nLife == nil then
		nLife = 0
	elseif type(nLife) ~= "number" or nLife%1 ~= 0 or nLife < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nLife ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nRegionType == nil then
		nRegionType = 0
	elseif type(nRegionType) ~= "number" or nRegionType%1 ~= 0 or nRegionType < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nRegionType ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nBase == nil then
		nBase = 0
	elseif type(nBase) ~= "number" or nBase%1 ~= 0 or nBase < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nBase ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nLinkid == nil then
		nLinkid = 0
	elseif type(nLinkid) ~= "number" or nLinkid%1 ~= 0 or nLinkid < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nLinkid ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask0 == nil then
		nTask0 = 0
	elseif type(nTask0) ~= "number" or nTask0%1 ~= 0 or nTask0 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nTask0 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask1 == nil then
		nTask1 = 0
	elseif type(nTask1) ~= "number" or nTask1%1 ~= 0 or nTask1 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nTask1 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask2 == nil then
		nTask2 = 0
	elseif type(nTask2) ~= "number" or nTask2%1 ~= 0 or nTask2 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nTask2 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask3 == nil then
		nTask3 = 0
	elseif type(nTask3) ~= "number" or nTask3%1 ~= 0 or nTask3 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nTask3 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask4 == nil then
		nTask4 = 0
	elseif type(nTask4) ~= "number" or nTask4%1 ~= 0 or nTask4 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nTask4 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask5 == nil then
		nTask5 = 0
	elseif type(nTask5) ~= "number" or nTask5%1 ~= 0 or nTask5 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nTask5 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask6 == nil then
		nTask6 = 0
	elseif type(nTask6) ~= "number" or nTask6%1 ~= 0 or nTask6 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nTask6 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nTask7 == nil then
		nTask7 = 0
	elseif type(nTask7) ~= "number" or nTask7%1 ~= 0 or nTask7 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nTask7 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nData0 == nil then
		nData0 = 0
	elseif type(nData0) ~= "number" or nData0%1 ~= 0 or nData0 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nData0 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nData1 == nil then
		nData1 = 0
	elseif type(nData1) ~= "number" or nData1%1 ~= 0 or nData1 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nData1 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nData2 == nil then
		nData2 = 0
	elseif type(nData2) ~= "number" or nData2%1 ~= 0 or nData2 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nData2 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nData3 == nil then
		nData3 = 0
	elseif type(nData3) ~= "number" or nData3%1 ~= 0 or nData3 < 0 then
		Sys_SaveAbnormalLog("���� Npc_CreatLayNpcByItem �� nData3 ֻ��Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	sDataStr = tostring(sDataStr) or "null"
	return LayNpcByItem(sName,nType,nSort,nLookFace,nOwnertype,nLife,nRegionType,nBase,nLinkid,nTask0,nTask1,nTask2,nTask3,nTask4,nTask5,nTask6,nTask7,nData0,nData1,nData2,nData3,sDataStr)
end






