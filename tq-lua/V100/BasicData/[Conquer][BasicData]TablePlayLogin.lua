----------------------------------------------------------------------------
--Name:		[����][��������]���ߺ�����.lua
--Purpose:	�������ߺ������÷�
--Creator: 	֣����
--Created:	2014/09/03
----------------------------------------------------------------------------
--���ÿ�����ߴ���������
--tSystem_PlayLogin_Func={func1,...}
--Actionl.id=1000000(���ÿ�����߶��ᴥ��)
tSystem_PlayLogin_Func = {}

--ÿ�����ߴ�������
function System_PlayLogin()
	local nHour=tonumber(os.date("%H"))
	local nMinute=tonumber(os.date("%M"))
	local ndate=tonumber(os.date("%d"))
	local nweek=tonumber(os.date("%w"))
	for _,func in ipairs(tSystem_PlayLogin_Func) do
		if func ~= nil and type(func) == "function" then
			func(ndate,nweek,nHour,nMinute)
		end
	end
end

--�״����ߴ���������
--tSystem_PlayLoginFirst_Func={func1,...}
--Action.id=1000500(����½��ŵ�һ�����߲Żᴥ��)
tSystem_PlayLoginFirst_Func = {}

--�״����ߴ�������
function System_PlayLoginFirst()
	local nHour=tonumber(os.date("%H"))
	local nMinute=tonumber(os.date("%M"))
	local ndate=tonumber(os.date("%d"))
	local nweek=tonumber(os.date("%w"))
	for _,func in ipairs(tSystem_PlayLoginFirst_Func) do
		func(ndate,nweek,nHour,nMinute)
	end
end