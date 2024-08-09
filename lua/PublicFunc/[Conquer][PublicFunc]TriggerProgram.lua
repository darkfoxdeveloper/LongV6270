----------------------------------------------------------------------------
--Name:		[����][���ú���]���򴥷�.lua
--Purpose:	���򴥷�
--Creator: 	֣����
--Created:	2014/12/18

--�����������
function Event_Kill_User()
	local nKillerId = Get_UserId()

	--���Ի�������������߼���װ�ɺ���������С�
	if type(tUserKilled["tFunction"]) == "table" then
		for _,func in ipairs(tUserKilled["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func(nKillerId)
			end
		end
	end
end

-- ���ʹ�ø����
function Event_Save_User()
	if type(tUserSave["tFunction"]) == "table" then
		for _,func in ipairs(tUserSave["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func()
			end
		end
	end
end

-- ���ʹ�����˴���
function Event_KeepGhost()
	if type(tKeepGhost["tFunction"]) == "table" then
		for _,func in ipairs(tKeepGhost["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func()
			end
		end
	end
end

-- ���ʹ�ý���
function Event_ClearKeepGhost()
	if type(tClearKeepGhost["tFunction"]) == "table" then
		for _,func in ipairs(tClearKeepGhost["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func()
			end
		end
	end
end

-- ������λ����	Ӯ����
-- ��1�����id����2������
function UserArenicWins(nUserId,nFieldNum)
	if type(tArenicWins["tFunction"]) == "table" then
		for _,func in ipairs(tArenicWins["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFieldNum)
			end
		end
	end
end

-- ������λ����	��������
-- ��1�����id����2������
function UserArenicCompetes(nUserId,nFieldNum)
	if type(tArenicCompetes["tFunction"]) == "table" then
		for _,func in ipairs(tArenicCompetes["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFieldNum)
			end
		end
	end
end

-- �����λ����	Ӯ����
-- ��1�����id����2������
function TeamArenicWins(nUserId,nFieldNum)
	if type(tTeamArenicWins["tFunction"]) == "table" then
		for _,func in ipairs(tTeamArenicWins["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFieldNum)
			end
		end
	end
end

-- �����λ����	��������
-- ��1�����id����2������
function TeamArenicCompetes(nUserId,nFieldNum)
	if type(tTeamArenicCompetes["tFunction"]) == "table" then
		for _,func in ipairs(tTeamArenicCompetes["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func(nUserId,nFieldNum)
			end
		end
	end
end

-- ��裬��ҳ���յ��Ǵ���
-- ����1�����ID
function RideArriveTerminal(nUserId)
	if type(tRideArrive["tFunction"]) == "table" then
		for _,func in ipairs(tRideArrive["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func(nUserId)
			end
		end
	end
end

-- �书��ÿ������ʱ������
-- ����1�����id ����2����ҵ�����������
function TrainingGongfu(nUserId,nTrainNum)
	if type(tTrainGongFu["tFunction"]) == "table" then
		for _,func in ipairs(tTrainGongFu["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func(nUserId,nTrainNum)
			end
		end
	end
end

-- �������������
function Event_Server_Start()
	if type(tServerStart["tFunction"]) == "table" then
		for _,func in ipairs(tServerStart["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func()
			end
		end
	end
end

-- ����ڹ�ת��
-- ��һ��������Ŀ�����ID
function InnerStrength_Exchange(nChangeUserId)
	local nUserId = Get_UserId()
	if type(tStrengthExchange["tFunction"]) == "table" then
		for _,func in ipairs(tStrengthExchange["tFunction"]) do
			if func ~= nil and type(func) == "function" then
				func(nUserId,nChangeUserId)
			end
		end
	end
end