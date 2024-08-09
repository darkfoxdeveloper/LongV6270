----------------------------------------------------------------------------
--Name:		[����][���ú���]���ܺ���.lua
--Purpose:	���ܺ����ӿ�
--Creator: 	�ֽ�
--Created:	2014/08/22
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
-- ���ܺ�������ǰ׺�ʣ�Magic_
--���ӣ�


------------------------------------------------------------------------------
-- //��鼼�ܵȼ�		��1: ���ID����2:��������ID����3:�ȼ�		���ܵȼ�������nLev����false�����򷵻�true
-- LUA_FUNC(MagicCheckLev)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);
	-- int	  nLev		= Lua_GetParamInt(3);

function Magic_ChkLev(nMagicType,nMagicLev,nUserId)
	if type(nMagicType) ~= "number" or nMagicType <= 0 or nMagicType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_ChkLev �� nMagicType ֻ�ܴ�����0������")
		return
	end

	if type(nMagicLev) ~= "number" or nMagicLev < 0 or nMagicLev%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_ChkLev �� nMagicLev ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_ChkLev �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return MagicCheckLev(nUserId,nMagicType,nMagicLev)
end

-- //�����Ҽ�������		��1: ���ID����2:��������ID		ûѧ������ܷ���false�����򷵻�true
-- LUA_FUNC(MagicCheckType)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);

function Magic_ChkType(nMagicType,nUserId)
	if type(nMagicType) ~= "number" or nMagicType <= 0 or nMagicType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_ChkType �� nMagicType ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_ChkType �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return MagicCheckType(nUserId,nMagicType)
end


-- //ѧϰ����		��1: ���ID����2:��������ID		ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(LearnMagic)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);
--�������ܲ���ok���Ƿ��жϸü��ܸ�ְҵ�Ƿ��ѧ��
function Magic_Learn(nMagicType,nUserId)
	if type(nMagicType) ~= "number" or nMagicType <= 0 or nMagicType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_Learn �� nMagicType ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_Learn �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	if Magic_ChkType(nMagicType) then
		Sys_SaveAbnormalLog("���Ѿ�ѧ���ü��ܡ�")
		return
	else
		return LearnMagic(nUserId,nMagicType)
	end

end

-- //���ܵȼ�����		��1: ���ID����2:��������ID		ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(MagicUpLev)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);
--����Ҫ���Ƿ���ѧ��ü��ܵ��ж��ˣ����ûѧ���ü��ܣ���ֱ�ӷ���false��
--���Ѵﵽ�ȼ����ߣ��ٴ�ִ�У��᷵��false��
function Magic_UpLev(nMagicType,nUserId)
	if type(nMagicType) ~= "number" or nMagicType <= 0 or nMagicType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_UpLev �� nMagicType ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_UpLev �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return MagicUpLev(nUserId,nMagicType)
end

-- //���Ӽ��ܾ���		��1: ���ID����2:��������ID����3������		ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(MagicAddExp)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);
	-- int	  nExp		= Lua_GetParamInt(3);
--�����ж��Ƿ�ѧ����ûѧ���ļ��ܣ�����false��
function Magic_AddExp(nMagicType,nExp,nUserId)
	if type(nMagicType) ~= "number" or nMagicType <= 0 or nMagicType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_AddExp �� nMagicType ֻ�ܴ�����0������")
		return
	end

	if type(nExp) ~= "number" or nExp <= 0 or nExp%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_AddExp �� nExp ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_AddExp �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return MagicAddExp(nUserId,nMagicType,nExp)
end


-- //���Ӽ��ܾ���		��1: ���ID����2:��������ID����3��ʱ��(�����лỻ��ɾ���)		ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(MagicAddLevTime)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);
	-- int	  nExp		= Lua_GetParamInt(3);

function Magic_AddExpByTime(nMagicType,nTime,nUserId)
	if type(nMagicType) ~= "number" or nMagicType <= 0 or nMagicType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_AddExpByTime �� nMagicType ֻ�ܴ�����0������")
		return
	end

	if type(nTime) ~= "number" or nTime <= 0 or nTime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_AddExpByTime �� nTime ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Magic_AddExpByTime �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	return MagicAddLevTime(nUserId,nMagicType,nTime)
end

