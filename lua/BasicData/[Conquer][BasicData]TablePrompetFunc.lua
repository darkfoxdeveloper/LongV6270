----------------------------------------------------------------------------
--Name:		[����][��������]ϵͳ�Լ칦�ܱ�.lua
--Purpose:	����ϵͳ�Լ칦�ܱ�
--Creator: 	֣����
--Created:	2014/09/03
----------------------------------------------------------------------------
--ϵͳ�Լ칦�ܱ�
--tSystem_Prompet_Func={Ҫͨ���Լ�ʵ�ֵĺ���,...}
tSystem_Prompet_Func={}
tOntimerMin_M={}
tOntimerMin_HM={}
tOntimerMin_wHM={}
tOntimerMin_dHM={}


function System_Prompet()
	local nHour = tonumber(os.date("%H"))
	local nMinute = tonumber(os.date("%M"))
	local ndate = tonumber(os.date("%d"))
	local nweek = tonumber(os.date("%w"))
	local nHM = tonumber(os.date("%H%M"))
	local nwHM = tonumber(os.date("%w%H%M"))
	local ndHM = tonumber(os.date("%d%H%M"))
	--����
	if tOntimerMin_M[nMinute] ~= nil then
		for _,func in ipairs(tOntimerMin_M[nMinute]) do
			if func ~= nil and type(func) == "function" then
				func(nMinute)
			end
		end
	end
	--Сʱ/����
	if tOntimerMin_HM[nHM] ~= nil then
		for _,func in ipairs(tOntimerMin_HM[nHM]) do
			if func ~= nil and type(func) == "function" then
				func(nHour,nMinute)
			end
		end
	end
	--��/Сʱ/����
	if tOntimerMin_wHM[nwHM] ~= nil then
		for _,func in ipairs(tOntimerMin_wHM[nwHM]) do
			if func ~= nil and type(func) == "function" then
				func(nHour,nMinute,ndate,nweek)
			end
		end
	end
	--��/Сʱ/����
	if tOntimerMin_dHM[ndHM] ~= nil then
		for _,func in ipairs(tOntimerMin_dHM[ndHM]) do
			if func ~= nil and type(func) == "function" then
				func(nHour,nMinute,ndate,nweek)
			end
		end
	end
	
	--�汾��Ϣ��ʾ
	for _,func in ipairs(tSystem_Prompet_Func) do
		if func ~= nil and type(func) == "function" then
			func(nHour,nMinute,ndate,nweek)
		end
	end
end