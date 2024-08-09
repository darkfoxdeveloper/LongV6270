----------------------------------------------------------------------------
--Name:		[����][���ú���]���ﺯ��.lua
--Purpose:	���ﺯ���ӿ�
--Creator: 	�ֽ�
--Created:	2014/06/26
----------------------------------------------------------------------------
---------------------------------�����淶----------------------------------
------------------------------actiontype�ķ���------------------------------
--Sys  ��������
--Send ��Ϣ����
--Get  �������
--Set  �޸�����
--Chk  �������
--Del  ɾ������
--Add  �������
------------------------------------------------------------------------------
-- ���ﺯ������ǰ׺�ʣ�Monster_
--���ӣ�
--bool DeleteMonster(OBJID idMap,OBJID idType, int nData, const char* pszName);

--function Monster_DelMonster(nMapId,nMonsterTypeId,nData,sMonsterName)
--
--end

------------------------------------------------------------------------------
--bool killMonsterDropItem(OBJID idUser, DWORD dwData);
--ɱ�ֵ�����Ʒ
function Monster_SysDropItem(nItemtypeId,nUserId)
	if type(nItemtypeId) ~= "number" or nItemtypeId <= 0 or nItemtypeId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_SysDropItem �� nItemtypeId ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_SysDropItem �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return killMonsterDropItem(nUserId,nItemtypeId)
end

--bool killMonsterDropMoney(OBJID idUser, DWORD dwData);
--ɱ�ֵ�����
function Monster_SysDropMoney(nMoney,nUserId)
	if type(nMoney) ~= "number" or nMoney <= 0 or nMoney%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_SysDropMoney �� nMoney ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_SysDropMoney �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	return killMonsterDropMoney(nUserId,nMoney)
end


--bool killMonsterAddCulTation(OBJID idUser, int nLevFrom, int nLevTo ,__int64 i64AddCultivation);
function Monster_AddCultivation(nCultivation,nUserId)
	if type(nCultivation) ~= "number" or nCultivation <= 0 or nCultivation%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_AddCultivation �� nCultivation ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_AddCultivation �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return killMonsterAddCulTation(nUserId,0,0,nCultivation)
end


--bool CreateMonster(int nOwnerType,OBJID idOwner, OBJID idMap, int nPosX, int nPosY, OBJID idGen, OBJID idType, int nData, const char* pszName);
--��Ӧactiontype=2006������һ��MONSTER��
--nOwnerType��idOwner��nDataĬ��д0������Ҫ���Ρ�
--pszName�����������ǰ��Ч������Ҫ���Ρ�
function Monster_AddMonster(nMapId,nPosX,nPosY,nGenId,nMonsterId)
	if type(nMapId) ~= "number" or nMapId <= 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_AddMonster �� nMapId ֻ�ܴ�����0������")
		return
	end

	if type(nPosX) ~= "number" or nPosX <= 0 or nPosX%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_AddMonster �� nPosX ֻ�ܴ�����0������")
		return
	end

	if type(nPosY) ~= "number" or nPosY <= 0 or nPosY%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_AddMonster �� nPosY ֻ�ܴ�����0������")
		return
	end
	
	if type(nGenId) ~= "number" or nGenId <= 0 or nGenId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_AddMonster �� nGenId ֻ�ܴ�����0������")
		return
	end

	if type(nMonsterId) ~= "number" or nMonsterId <= 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_AddMonster �� nMonsterId ֻ�ܴ�����0������")
		return
	end

	return CreateMonster(0,0,nMapId,nPosX,nPosY,nGenId,nMonsterId,0,"")
end


--int GetCountMonster(OBJID idMap,const char* pszField,const char* pszData);
--��Ӧactiontype=2008�����ͬ��ͼ��MONSTER������
--��װΪ2��������һ�������ֲ�ѯ��һ����generatorid��ѯ��
function Monster_GetMonsterByName(nMapId,sMonsterName)
	if type(nMapId) ~= "number" or nMapId <= 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_GetMonsterByName �� nMapId ֻ�ܴ�����0������")
		return
	end

	if type(sMonsterName) ~= "string" then
		Sys_SaveAbnormalLog("���� Monster_GetMonsterByName �� sMonsterName ֻ�ܴ��ַ������͵Ĳ���")
		return
	end

	return GetCountMonster(nMapId,"name",sMonsterName)
end

function Monster_GetMonsterByGenId(nMapId,nGenId)
	if type(nMapId) ~= "number" or nMapId <= 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_GetMonsterByGenId �� nMapId ֻ�ܴ�����0������")
		return
	end

	if type(nGenId) ~= "number" or nGenId <= 0 or nGenId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_GetMonsterByGenId �� nGenId ֻ�ܴ�����0������")
		return
	end

	return GetCountMonster(nMapId,"gen_id",nGenId)
end


--bool DeleteMonster(OBJID idMap,OBJID idType, int nData, const char* pszName);
--��Ӧactiontype=2009��param�е�data��name�����ɲ��ã����ٷ�װ��
--����ֵΪ������
function Monster_DelMonster(nMapId,nMonsterId)
	if type(nMapId) ~= "number" or nMapId <= 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_DelMonster �� nMapId ֻ�ܴ�����0������")
		return
	end

	if type(nMonsterId) ~= "number" or nMonsterId <= 0 or nMonsterId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Monster_DelMonster �� nMonsterId ֻ�ܴ�����0������")
		return
	end

	return DeleteMonster(nMapId,nMonsterId,0,"")
end
