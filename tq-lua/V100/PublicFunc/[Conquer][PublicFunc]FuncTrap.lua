----------------------------------------------------------------------------
--Name:		[����][���ú���]���庯��.lua
--Purpose:	���庯���ӿ�
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
-- ���庯������ǰ׺�ʣ�Trap_
--���ӣ�


------------------------------------------------------------------------------
--bug��������type=330�����õ�action�޷����������Ժ��������õĴ���ִ�еĺ���Ҳ�޷�����
--����������
--CreateTransportor
--����˵��:��1:��ʾ���id��Npc id,��2:Ϊ0ʱ��ʾ����λ�ô���������ָ�����괴����, Ϊ1ʱ��ʾ���λ�ô��������վ�������򴴽������,��3:��ͼid,��4:x����,��5:y����,��6:�뾶,��7:������Ĺ�Ч,��8:�����ĺ���
--�ɹ�����true����������ʧ�ܷ���false

-- function Trap_CreateTransportor(nRole,nFlag,nMapId,nPosX,nPosY,nRadius,sEffectTile,fLuaFunc)		
	-- if type(nRole) ~= "number" or nRole%1 ~= 0 or nRole < 0 then
		-- Sys_SaveAbnormalLog("���� Trap_CreateTransportor �� nRole ֻ�ܴ����ڵ���0������")
		-- return
	-- end
	
	-- if nFlag ~= 0 and nFlag ~= 1 then
		-- Sys_SaveAbnormalLog("���� Trap_CreateTransportor �� nFlag ֻ��ȡ0��1")
		-- return
	-- end
	
	-- if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId < 0 then
		-- Sys_SaveAbnormalLog("���� Trap_CreateTransportor �� nMapId ֻ�ܴ����ڵ���0������")
		-- return
	-- end
	
	-- if type(nPosX) ~= "number" or nPosX%1 ~= 0 or nPosX < 0 then
		-- Sys_SaveAbnormalLog("���� Trap_CreateTransportor �� nPosX ֻ�ܴ����ڵ���0������")
		-- return
	-- end
	
	-- if type(nPosY) ~= "number" or nPosY%1 ~= 0 or nPosY < 0 then
		-- Sys_SaveAbnormalLog("���� Trap_CreateTransportor �� nPosY ֻ�ܴ����ڵ���0������")
		-- return
	-- end
	
	-- if type(nRadius) ~= "number" or nRadius%1 ~= 0 or nRadius < 0 then
		-- Sys_SaveAbnormalLog("���� Trap_CreateTransportor �� nRadius ֻ�ܴ����ڵ���0������")
		-- return
	-- end
	
	-- if type(sEffectTile) ~= "string" then
		-- Sys_SaveAbnormalLog("���� Trap_CreateTransportor �� sEffectTile ֻ�����ַ���")
		-- return
	-- end
		
	-- if type(fLuaFunc) ~= "string" then
		-- Sys_SaveAbnormalLog("���� Trap_CreateTransportor �� fLuaFunc ֻ�����ַ���")
		-- return
	-- end

	-- return CreateTransportor(nRole,nFlag,nMapId,nPosX,nPosY,nRadius,sEffectTile,string.format("</F>%s",fLuaFunc))
-- end

--ɾ���������˱���վ�ڴ������Ϸ���ɾ����ʧ�ܣ���վ�ڴ�����Χ����ȡ�����������ID����
--DelTransportor
--����˵��: ��1:���ID��0Ϊ��ǰ���ID��
--����ɹ�����trueɾ��������,ʧ�ܷ���false

function Trap_DelTransportor(nUserId)	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Trap_DelTransportor �� nUserId ֻ���Ǵ��ڵ���0������")
		return
	end

	local nTransportorId = Get_TransferId(nUserId)
	return DelTransportor(nTransportorId)
end


--��������
--CreateMapTrap
--����˵��: ��1:��������,��2:���,��3:������;��4:��ͼid,��5:x����,��6:y����,nData:��δʹ��(Ĭ����Ϊ0);��7,��8:��ʾ��Χ.
--���ʧ�ܷ���false, �ɹ�����true.

function Trap_CreateMapTrap(nType,nLook,nOwnerId,nMapId,nPosX,nPosY,nPosCX,nPosCY)	

	if type(nType) ~= "number" or  nType%1 ~= 0 or nType <= 0 then
		Sys_SaveAbnormalLog("���� Trap_CreateMapTrap �� nType ֻ�ܴ�����0������")
		return
	end
	
	if type(nLook) ~= "number" or nLook%1 ~= 0 or nLook < 0 then
		Sys_SaveAbnormalLog("���� Trap_CreateMapTrap �� nLook ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nOwnerId) ~= "number" or nOwnerId%1 ~= 0 or nOwnerId < 0 then
		Sys_SaveAbnormalLog("���� Trap_CreateMapTrap �� nOwnerId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Trap_CreateMapTrap �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nPosX) ~= "number" or nPosX%1 ~= 0 or nPosX <= 0 then
		Sys_SaveAbnormalLog("���� Trap_CreateMapTrap �� nPosX ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nPosY) ~= "number" or nPosY%1 ~= 0 or nPosY <= 0 then
		Sys_SaveAbnormalLog("���� Trap_CreateMapTrap �� nPosY ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nPosCX) ~= "number" or nPosCX%1 ~= 0 or nPosCX < 0 then
		Sys_SaveAbnormalLog("���� Trap_CreateMapTrap �� nPosCX ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nPosCY) ~= "number" or nPosCY%1 ~= 0 or nPosCY < 0 then
		Sys_SaveAbnormalLog("���� Trap_CreateMapTrap �� nPosCY ֻ�ܴ����ڵ���0������")
		return
	end
	
	return CreateMapTrap(nType,nLook,nOwnerId,nMapId,nPosX,nPosY,0,nPosCX,nPosCY)
end

--ɾ��һ������.  
--EraseMapTrap
--����˵��:��1:��ʾ����id.������Ǵ�����ʽ���ǿ��Դ�0.����Ϊ0ʱ��ʾɾ�������Ǵ�����ʽ��Ҫָ�������id��
--�ɹ�����trueɾ������,���ʧ�ܷ���false

function Trap_EraseMapTrap(nTrapId)
	if nTrapId == nil then
		nTrapId = 0
	elseif type(nTrapId) ~= "number" or nTrapId%1 ~= 0 or nTrapId < 0 then
		Sys_SaveAbnormalLog("���� Trap_EraseMapTrap �� nTrapId ֻ���Ǵ��ڵ���0������")
		return
	end
	
	return EraseMapTrap(nTrapId)
end



--ɾ��ͬ���͵�����
--DelMapTrap
--����˵��: ��1:��ͼid,��2:��������.
--�ɹ�����trueɾ��ͬ���͵�����,ʧ�ܷ���false

function Trap_DelMapTrap(nMapId,nType)	
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Trap_DelMapTrap �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nType) ~= "number" or nType%1 ~= 0 or nType <= 0 then
		Sys_SaveAbnormalLog("���� Trap_DelMapTrap �� nType ֻ�ܴ�����0������")
		return
	end
	
	return DelMapTrap(nMapId,nType)
end




--Ŀǰֻ�����޸�type ��look ��ʱ��������
--�޸ĵ�����������Ҫ����뿪����һ�����ٻ���,�޸ĵ����ԲŻᱻˢ�£����ûˢ��:���޸���۾���,�޸ĺ����ۻ���޸�ǰ��ͬʱ���ڣ�

--�޸������type���ԣ������̣�
--ChangeMapTrapAttr
--����˵��:��1:����ID,��2:�޸ĵ�ֵ����ָ��id���޸Ķ�Ӧ���������ԣ�
--�ɹ�����true���޸�type����,���ʧ�ܷ���false

function Trap_ChangeTrapType(nTrapId,nData)
	if type(nTrapId) ~= "number" or nTrapId%1 ~= 0 or nTrapId <= 0 then
		Sys_SaveAbnormalLog("���� Trap_ChangeTrapType �� nTrapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData%1 ~= 0 or nData <= 0 then
		Sys_SaveAbnormalLog("���� Trap_ChangeTrapType �� nData ֻ�ܴ�����0������")
		return
	end
	
	return ChangeMapTrapAttr(nTrapId,G_TRAP_TYPE,nData)
end


--�޸������look���ԣ�����ۣ��������̣�
--ChangeMapTrapAttr
--����˵��:��1:����ID,��2:�޸ĵ�ֵ����ָ��id���޸Ķ�Ӧ���������ԣ�
--�ɹ�����true���޸�look����,���ʧ�ܷ���false

function Trap_ChangeTrapLook(nTrapId,nData)
	if type(nTrapId) ~= "number" or nTrapId%1 ~= 0 or nTrapId <= 0 then
		Sys_SaveAbnormalLog("���� Trap_ChangeTrapLook �� nTrapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Trap_ChangeTrapLook �� nData ֻ�ܴ����ڵ���0������")
		return
	end

	return ChangeMapTrapAttr(nTrapId,G_TRAP_LOOK,nData)
end
