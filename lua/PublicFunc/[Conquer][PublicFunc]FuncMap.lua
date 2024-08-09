----------------------------------------------------------------------------
--Name:		[����][���ú���]��ͼ����.lua
--Purpose:	��ͼ�����ӿ�
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
-- ��ͼ��������ǰ׺�ʣ�Map_
--���ӣ�
--(fn_CountMapUser, "CountMapUser");//ָ����ͼ�е��������,��1:��ͼID, ��2:�Ƿ����������,���� ACTION_MAP_MAPUSER  = 302

--function Map_CountMapUser(nMapId,nUserSurvival)
--
--end

------------------------------------------------------------------------------

--//ACTION_MAP_FIREWORKS 314,
--bool MapFireWorks(OBJID idUser);
--����˵����	�����
--����˵����	���ID
--����ֵ�� ����ֵ���ɹ� true��ʧ�� false
function Map_FireWorks(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Map_FireWorks ��һ������ nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return MapFireWorks(nUserId)
end

	
--(fn_CountMapUser, "CountMapUser");		//ָ����ͼ�е��������				��1:��ͼID, ��2:�Ƿ����������, 										���� ACTION_MAP_MAPUSER  = 302
--����˵����	ָ����ͼ�е��������
--����˵����	��1:��ͼID, ��2:�Ƿ����������, ����2ֻ����0��1
--����ֵ�� ���ص�ͼ�е��������
function Map_GetUserNum(nMapId, nUserSurvival)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_GetUserNum �� nMapId ֻ�ܴ�����0������")
		return
	end

	if type(nUserSurvival) ~= "number" or (nUserSurvival ~= 0 and nUserSurvival ~= 1) then
		Sys_SaveAbnormalLog("���� Map_GetUserNum �� nUserSurvival ��ֵֻ��Ϊ0��1")
		return
	end
	
	return CountMapUser(nMapId,nUserSurvival)
end

--(fn_BroadcastMapMsg, "BroadcastMapMsg");	//��ͼ�㲥��Ϣ						��1:��ͼID, ��2:����,  														���� ACTION_MAP_BROCASTMSG  = 303
--����˵����	��ͼ�㲥��Ϣ
--����˵����	��1:��ͼID, ��2:����
--����ֵ�� ����ֵ���ɹ� true��ʧ�� false
function Map_SendBroadcastMsg(nMapId, sMsg)
	if type(nMapId) ~= "number"  or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_SendBroadcastMsg �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(sMsg) ~= "string" then
		Sys_SaveAbnormalLog("���� Map_SendBroadcastMsg �� sMsg ֻ��Ϊ�ַ�������")
		return
	end
	
	return BroadcastMapMsg(nMapId, sMsg)
end

--(fn_DropMapItem, "DropMapItem");		//��ͼָ���������ָ����Ʒ			��1:��ͼID, ��2:X����, ��3:Y����, ��4:��Ʒ����ID,							���� ACTION_MAP_DROPITEM = 304
--����˵����	��ͼָ���������ָ����Ʒ
--����˵����	��1:��ͼID, ��2:X����, ��3:Y����, ��4:��Ʒ����ID,
--����ֵ�� ����ֵ���ɹ� true��ʧ�� false
function Map_DropItem(nMapId, nPosX, nPosY, nItemId)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_DropItem �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPosX) ~= "number" or nPosX%1 ~= 0  or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Map_DropItem �� nPosX ֻ�ܴ�����0������")
		return
	end
	
	if type(nPosY) ~= "number" or nPosY%1 ~= 0  or nPosY < 0 then
		Sys_SaveAbnormalLog("���� Map_DropItem �� nPosY ֻ�ܴ�����0������")
		return
	end
	
	if type(nItemId) ~= "number" or nItemId%1 ~= 0  or nItemId <= 0 then
		Sys_SaveAbnormalLog("���� Map_DropItem �� nItemId ֻ�ܴ�����0������")
		return
	end
	
	return DropMapItem(nMapId, nPosX, nPosY, nItemId)
end

--(fn_CountMapMonster, "CountMapMonster");	//ָ����ͼ��ǰ��ͼ��ĳ�����ڹ������� ��1:��ͼID, ��2:��������ID, ��3:X����, ��4:Y����, ��5:X������, ��6:Y������   ���� ACTION_MAP_REGION_MONSTER= 307
--����˵����	���ָ����ͼ��ǰ��ͼ��ĳ�����ڹ�������
--����˵����	��1:��ͼID, ��2:��������ID, ��3:X����, ��4:Y����, ��5:X������, ��6:Y������
--����ֵ�� ����ָ����ͼ��ǰ��ͼ��ĳ�����ڹ�������
function Map_GetMonsterNum(nMapId, nMonsterId, nPosX, nPosY, nCellx, nCelly)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_GetMonsterNum �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nMonsterId) ~= "number" or nMonsterId%1 ~= 0  or nMonsterId < 0 then
		Sys_SaveAbnormalLog("���� Map_GetMonsterNum �� nMonsterId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPosX) ~= "number" or nPosX%1 ~= 0   or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Map_GetMonsterNum �� nPosX ֻ�ܴ�����0������")
		return
	end
	
	if  type(nPosY) ~= "number" or nPosY%1 ~= 0  or nPosY < 0 then
		Sys_SaveAbnormalLog("���� Map_GetMonsterNum �� nPosY ֻ�ܴ�����0������")
		return
	end
	
	if type(nCellx) ~= "number" or nCellx%1 ~= 0   or nCellx < 0 then
		Sys_SaveAbnormalLog("���� Map_GetMonsterNum �� nCellx ֻ�ܴ�����0������")
		return
	end
	
	if type(nCelly) ~= "number" or nCelly%1 ~= 0  or nCelly < 0 then
		Sys_SaveAbnormalLog("���� Map_GetMonsterNum �� nCelly ֻ�ܴ�����0������")
		return
	end
	
	return CountMapMonster(nMapId, nMonsterId, nPosX, nPosY, nCellx, nCelly)
end

--(fn_DropMultiItems, "DropMultiItems");		//��ͼ��������ָ����Ʒ				��1:��ͼID, ��2:��Ʒ����ID, ��3:X����, ��4:Y����, ��5:X������, ��6:Y������, ��7:����, ��8:����ʱ��   ���� ACTION_MAP_DROP_MULTI_ITEMS = 308
--����˵����	��ͼ��������ָ����Ʒ
--����˵����	��1:��ͼID, ��2:��Ʒ����ID, ��3:X����, ��4:Y����, ��5:X������, ��6:Y������, ��7:����, ��8:����ʱ��(��λ����)
--����ֵ�� ����ֵ���ɹ� true��ʧ�� false
function Map_DropMultiItems(nMapId, nItemId, nPosX, nPosY, nCellx, nCelly, nItemNum, nExistTime)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_DropMultiItems �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nItemId) ~= "number" or nItemId%1 ~= 0  or nItemId <= 0 then
		Sys_SaveAbnormalLog("���� Map_DropMultiItems �� nItemId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPosX) ~= "number" or nPosX%1 ~= 0   or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Map_DropMultiItems �� nPosX ֻ�ܴ�����0������")
		return
	end
	
	if  type(nPosY) ~= "number" or nPosY%1 ~= 0  or nPosY < 0 then
		Sys_SaveAbnormalLog("���� Map_DropMultiItems �� nPosY ֻ�ܴ�����0������")
		return
	end
	
	if type(nCellx) ~= "number" or nCellx%1 ~= 0   or nCellx < 0 then
		Sys_SaveAbnormalLog("���� Map_DropMultiItems �� nCellx ֻ�ܴ�����0������")
		return
	end
	
	if type(nCelly) ~= "number" or nCelly%1 ~= 0  or nCelly < 0 then
		Sys_SaveAbnormalLog("���� Map_DropMultiItems �� nCelly ֻ�ܴ�����0������")
		return
	end
	
	if type(nItemNum) ~= "number" or nItemNum%1 ~= 0  or nItemNum < 0 then
		Sys_SaveAbnormalLog("���� Map_DropMultiItems �� nItemNum ֻ�ܴ�����0������")
		return
	end
	
	if type(nExistTime) ~= "number" or nExistTime%1 ~= 0  or nExistTime < 0 then
		Sys_SaveAbnormalLog("���� Map_DropMultiItems �� nExistTime ֻ�ܴ�����0������")
		return
	end
	
	return DropMultiItems(nMapId, nItemId, nPosX, nPosY, nCellx, nCelly, nItemNum, nExistTime)
end

--(fn_MapEffect, "MapEffect");			//��ָ����ͼ��ָ���ص���ʾ��ͼ��Ч	��1:��ͼID, ��2:X����, ��3:Y����, ��4:��Ч									���� ACTION_MAP_MAPEFFECT = 312
--����˵����	��ָ����ͼ��ָ���ص���ʾ��ͼ��Ч
--����˵����	��1:��ͼID, ��2:X����, ��3:Y����, ��4:��Ч
--����ֵ�� ����ֵ���ɹ� true��ʧ�� false
function Map_Effect(nMapId, nPosX, nPosY, sEffectName)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_Effect �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPosX) ~= "number" or nPosX%1 ~= 0   or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Map_Effect �� nPosX ֻ�ܴ�����0������")
		return
	end
	
	if  type(nPosY) ~= "number" or nPosY%1 ~= 0  or nPosY < 0 then
		Sys_SaveAbnormalLog("���� Map_Effect �� nPosY ֻ�ܴ�����0������")
		return
	end
	
	if type(sEffectName) ~= "string" then
		Sys_SaveAbnormalLog("���� Map_Effect �� sEffectName ֻ��Ϊ�ַ�������")
		return
	end
	
	return MapEffect(nMapId, nPosX, nPosY, sEffectName)
end

--// ��Ӧ ACTION_EVENT_MAPUSER_CHGMAP  = 2012,    // ��ָ����ͼ�е���������л���ָ����ͼ��ָ���ص�, param="idOrgMap idTargetMap posx posy"
--// ��ָ����ͼ�е���������л���ָ����ͼ��ָ���ص�. ����˵��: idMap��ʾ���ڵ�ͼ, idTargetMap��ʾĿ���ͼ, nPosX, nPosY��ʾĿ���ͼ��x��y����. ���ʧ�ܷ���false, �ɹ�����true.
--bool MapUserChgMap(int idMap, int idTargetMap, int nPosX, int nPosY);

--����˵����	��ָ����ͼ�е���������л���ָ����ͼ��ָ���ص�
--����˵����	����˵��: idMap��ʾ���ڵ�ͼ, idTargetMap��ʾĿ���ͼ, nPosX, nPosY��ʾĿ���ͼ��x��y����. 
--����ֵ�� ����ֵ�����ʧ�ܷ���false, �ɹ�����true.
function Map_ChgUserPos(nMapId, nTargetMapId, nPosX, nPosY)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_ChgUserPos �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nTargetMapId) ~= "number" or nTargetMapId%1 ~= 0  or nTargetMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_ChgUserPos �� nTargetMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPosX) ~= "number" or nPosX%1 ~= 0   or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Map_ChgUserPos �� nPosX ֻ�ܴ�����0������")
		return
	end
	
	if  type(nPosY) ~= "number" or nPosY%1 ~= 0  or nPosY < 0 then
		Sys_SaveAbnormalLog("���� Map_ChgUserPos �� nPosY ֻ�ܴ�����0������")
		return
	end
	
	return MapUserChgMap(nMapId, nTargetMapId, nPosX, nPosY)
end


--// ��Ӧ ACTION_EVENT_MAPUSER_EXEACTION  = 2013, // ��ͼ��ָ�������������ѡ����һ�ִ��ָ���� ACTION, param = "idMap idAction data", data Ϊִ��action�����������data Ϊ -1 ʱ���������
--// ��ͼ��ָ����������һ�ִ��ָ���ĺ���. ����˵��: idMap��ʾ���ڵ�ͼ, nData��ʾ�������, -1ʱ���������, strLineFunc��ʾִ�еĺ���. ���ʧ�ܷ���false, �ɹ�����true.
--bool MapUserExeFunc(int idMap, int nData, string strLineFunc);

--����˵����	��ͼ��ָ�������������ѡ����һ�ִ��ָ����
--����˵��: idMap��ʾ���ڵ�ͼ, nData��ʾ�������, -1ʱ���������, strLineFunc��ʾִ�еĺ���
--����ֵ�� ����ֵ���ɹ� true��ʧ�� false
function Map_UserExeFunc(nMapId, nData, sFuncName)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_UserExeFunc �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0  then
		Sys_SaveAbnormalLog("���� Map_UserExeFunc �� nData ֻ�ܴ�����")
		return
	end
	
	if type(sFuncName) ~= "string" then
		Sys_SaveAbnormalLog("���� Map_UserExeFunc �� sFuncName ֻ��Ϊ�ַ�������")
		return
	end
	
	return MapUserExeFunc(nMapId,nData,string.format("</F>%s",sFuncName))
end

--// ��ͼ���, ��Ӧ type = 311, type = 315, type = 332.
--// �޸���ҵ�ͼ������. ����˵��: idMap��ʾ��ͼID, dwRGB��ʾ����(FFFFFFFF��ʾ�ָ�). ���ʧ�ܷ���false, �ɹ�����true.
--bool MapChangeLight(int idMap, int dwRGB);
--����˵����	�޸���ҵ�ͼ������
--����˵����	idMap��ʾ��ͼID, dwRGB��ʾ����(FFFFFFFF��ʾ�ָ�) ��ע��FΪ16����������Ҫת��10���������������
--����ֵ�� ����ֵ���ɹ� true��ʧ�� false
function Map_ChangeLight(nMapId, nDwRGB)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0  or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Map_ChangeLight �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nDwRGB) ~= "number" or nDwRGB%1 ~= 0  then
		Sys_SaveAbnormalLog("���� Map_ChangeLight �� nDwRGB ֻ�ܴ�����")
		return
	end

	return MapChangeLight(nMapId, nDwRGB)
end

--// ���������. ����˵��: idUser��ʾ���ID, pszWords��ʾ����. ���ʧ�ܷ���false, �ɹ�����true.
--bool MapFireWorks2(int idUser, string pszWords);
--����˵����	���������
--����˵����	idUser��ʾ���ID, pszWords��ʾ����
--����ֵ�� ����ֵ���ɹ� true��ʧ�� false
function Map_FireWorks2(sEffectWords,nUserId)	
	if type(sEffectWords) ~= "string" then
		Sys_SaveAbnormalLog("���� Map_FireWorks2 �� sEffectWords ֻ��Ϊ�ַ�������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Map_FireWorks2 ��һ������ nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return MapFireWorks2(nUserId, sEffectWords)
end