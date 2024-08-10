----------------------------------------------------------------------------
--Name:		[����][���ú���]������.lua
--Purpose:	�������ӿ�
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
-- ����������ǰ׺�ʣ�Task_
--���ӣ�
--// �ж������Ƿ����. ����˵��: idUser��ʾ�û�ID, idTask��ʾ����ID. ��������ڷ���false, ���ڷ���true.
--bool IsExistTaskDetail(int idUser, int idTask);

--function Task_ChkTaskDetailExist(nUserId,nTsakid)
--
--end

------------------------------------------------------------------------------

--�����û�ͳ������
--nUserId ���id Ĭ��Ϊ0
--nType Ŀǰֻ��Ϊ1
--nSubType Ŀǰֻ��Ϊ1-3
--nData ���õ�ֵ ���ڵ���0
--nSave �Ƿ�ʱд�⣬0��1
--�������óɹ���ʧ�� bool��
function Task_SetStatisticDaily(nType,nSubType,nData,nSave,nUserId)
	if nType ~= 1 then
		Sys_SaveAbnormalLog("���� Task_SetStatisticDaily ��һ������nTypeֻ��Ϊ 1")
		return
	end
	
	if nSubType ~= 1 and nSubType ~= 2 and nSubType ~= 3 then
		Sys_SaveAbnormalLog("���� Task_SetStatisticDaily �ڶ�������nSubTypeֻ��Ϊ 1-3")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetStatisticDaily ����������nDataֻ�ܴ��ڵ��� 0")
		return
	end
	
	if nSave ~= 0 and nSave ~= 1 then
		Sys_SaveAbnormalLog("���� Task_SetStatisticDaily ���ĸ�����nSaveֻ��Ϊ 0-1")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetStatisticDaily ���������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return SetUserStatisticDaily(nUserId,nType,nSubType,nData,nSave);
end

--ɾ���û�ͳ������
--nUserId ���id Ĭ��Ϊ0
--nType Ŀǰֻ��Ϊ1
--nSubType Ŀǰֻ��Ϊ1-3
--����ɾ���ɹ���ʧ�� bool��
function Task_DelStatisticDaily(nType,nSubType,nUserId)
	if nType ~= 1 then
		Sys_SaveAbnormalLog("���� Task_DelStatisticDaily ��һ������ֻ��Ϊ 1")
		return
	end
	
	if nSubType ~= 1 and nSubType ~= 2 and nSubType ~= 3 then
		Sys_SaveAbnormalLog("���� Task_DelStatisticDaily �ڶ�������ֻ��Ϊ 1-3")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_DelStatisticDaily ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return DeleteUserStatisticDaily(nUserId,nType,nSubType);
end

--����û�ͳ�������Ƿ����
--nUserId ���id Ĭ��Ϊ0
--nType Ŀǰֻ��Ϊ1
--nSubType Ŀǰֻ��Ϊ1-3
--���ؼ��ɹ���ʧ�� bool��
function Task_ChkStatisticDaily(nType,nSubType,nUserId)
	if nType ~= 1 then
		Sys_SaveAbnormalLog("���� Task_ChkStatisticDaily ��һ������nTypeֻ��Ϊ 1")
		return
	end
	
	if nSubType ~= 1 and nSubType ~= 2 and nSubType ~= 3 then
		Sys_SaveAbnormalLog("���� Task_ChkStatisticDaily �ڶ�������nSubTypeֻ��Ϊ 1-3")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_ChkStatisticDaily ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return IsexitUserStatisticDaily(nType,nSubType,nUserId);
end

--�����û�stc����
--nUserId ���id Ĭ��Ϊ0
--nEvent �¼�id,����0
--nType Type,����0
--nData ���õ�ֵ,���ڵ���0
--nSave �Ƿ�ʱд�⣬0��1
--���������û�stc����ɹ���ʧ�� bool��
function Task_SetStatistic(nEvent,nType,nData,nSave,nUserId)
	if type(nEvent) ~= "number" or nEvent%1 ~= 0 or nEvent <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetStatistic ��һ������nEventΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nType) ~= "number" or nType%1 ~= 0 or nType < 0 then
		Sys_SaveAbnormalLog("���� Task_SetStatistic �ڶ�������nTypeΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetStatistic ����������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nSave ~= 0 and nSave ~= 1 then
		Sys_SaveAbnormalLog("���� Task_SetStatistic ���ĸ�����nSaveֻ��Ϊ 0-1")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetStatistic ���������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return SetUserStatistic(nUserId,nEvent,nType,nData,nSave);
end

--�����û�stc����ʱ���
--nUserId ���id Ĭ��Ϊ0
--nEvent �¼�id,����0
--nType Type,����0
--nData ʱ���,���ڵ���0
--���������û�stc����ʱ����ɹ���ʧ�� bool��
function Task_SetStcTimestamp(nEvent,nType,nData,nUserId)
	if type(nEvent) ~= "number" or nEvent%1 ~= 0 or nEvent <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetStcTimestamp ��һ������nEventΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nType) ~= "number" or nType%1 ~= 0 or nType < 0 then
		Sys_SaveAbnormalLog("���� Task_SetStcTimestamp �ڶ�������nTypeΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetStcTimestamp ����������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetStcTimestamp ���ĸ�����nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	return SetUserStcTimestamp(nUserId,nEvent,nType,nData);
end

--ɾ��stc�û�����
--nUserId ���id Ĭ��Ϊ0
--nEvent �¼�id,����0
--nType Type,����0
--����ɾ���û�stc����ɹ���ʧ�� bool��
function Task_DelStatistic(nEvent,nType,nUserId)
	if type(nEvent) ~= "number" or nEvent%1 ~= 0 or nEvent <= 0 then
		Sys_SaveAbnormalLog("���� Task_DelStatistic ��һ������nEventΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nType) ~= "number" or nType%1 ~= 0 or nType < 0 then
		Sys_SaveAbnormalLog("���� Task_DelStatistic �ڶ�������nTypeΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_DelStatistic ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return DeleteUserStatistic(nUserId,nEvent,nType);
end

--����û�stc�����Ƿ����
--nUserId ���id Ĭ��Ϊ0
--nEvent �¼�id,����0
--nType Type,����0
--���ؼ���û�stc�����Ƿ���ڳɹ���ʧ�� bool��
function Task_ChkStatistic(nEvent,nType,nUserId)
	if type(nEvent) ~= "number" or nEvent%1 ~= 0 or nEvent <= 0 then
		Sys_SaveAbnormalLog("���� Task_ChkStatistic ��һ������nEventΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nType) ~= "number" or nType%1 ~= 0 or nType < 0 then
		Sys_SaveAbnormalLog("���� Task_ChkStatistic �ڶ�������nTypeΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_ChkStatistic ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return IsexitUserStatistic(nUserId,nEvent,nType);
end

--�����û����������Ӧ�ֶ�ֵ
--����ֵ���ձ����£�
--task_detail��
--SCRIPT_PARAM_TASKDETAIL_ID				= 2251,���������ã�
--SCRIPT_PARAM_TASKDETAIL_Task_ID			= 2252,���������ã�
--SCRIPT_PARAM_TASKDETAIL_TASK_ID			= 2253,���������ã�
--SCRIPT_PARAM_TASKDETAIL_COMPLETE_FLAG	= 2254,
--SCRIPT_PARAM_TASKDETAIL_NOTIFY_FLAG		= 2255,
--SCRIPT_PARAM_TASKDETAIL_DATA1			= 2256,
--SCRIPT_PARAM_TASKDETAIL_DATA2			= 2257,
--SCRIPT_PARAM_TASKDETAIL_DATA3			= 2258,
--SCRIPT_PARAM_TASKDETAIL_DATA4			= 2259,
--SCRIPT_PARAM_TASKDETAIL_DATA5			= 2260,
--SCRIPT_PARAM_TASKDETAIL_DATA6			= 2261,
--SCRIPT_PARAM_TASKDETAIL_DATA7			= 2262,
--SCRIPT_PARAM_TASKDETAIL_TASK_OVERTIME	= 2263,
--SCRIPT_PARAM_TASKDETAIL_TYPE			= 2264,���������ã�
--������Ը����������з�װ

--�����û���������CompleteFlag
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailCompleteFlag(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailCompleteFlag ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailCompleteFlag �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailCompleteFlag ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_COMPLETE_FLAG,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailCompleteFlag ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--�����û���������NotifyFlag
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailNotifyFlag(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailNotifyFlag ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailNotifyFlag �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailNotifyFlag ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_NOTIFY_FLAG,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailNotifyFlag ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--�����û���������Data1
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailData1(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData1 ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData1 �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData1 ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_DATA1,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailData1 ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--�����û���������Data2
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailData2(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData2 ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData2 �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData2 ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_DATA2,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailData2 ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--�����û���������Data3
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailData3(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData3 ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData3 �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData3 ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_DATA3,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailData3 ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--�����û���������Data4
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailData4(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData4 ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData4 �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData4 ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_DATA4,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailData4 ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--�����û���������Data5
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailData5(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData5 ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData5 �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData5 ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_DATA5,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailData5 ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--�����û���������Data6
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailData6(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData6 ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData6 �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData6 ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_DATA6,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailData6 ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--�����û���������Data7
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailData7(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData7 ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData7 �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailData7 ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_DATA7,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailData7 ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--�����û���������Overtime
--nTaskId Taskid,����0
--nData ���õ�ֵ,���ڵ���0
--nUserId ���id Ĭ��Ϊ0
--�������óɹ���ʧ�� bool��
function Task_SetTaskDetailTaskOvertime(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailTaskOvertime ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailTaskOvertime �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetTaskDetailTaskOvertime ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_TASKDETAIL_TASK_OVERTIME,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetTaskDetailTaskOvertime ���������û������IDΪ%d������",nTaskId))
		return
	end
end


--Task_detail ʱ�������졢�룩�жϺ���

--�ж�Task_Detai����ʱ����Ƿ񳬹�����ʱ��
--nQuestId����id
--nDelay����ʱʱ��
--nTimeType����ʱ���ͣ�Ĭ��0��0:�룻1:���ӣ�2��Сʱ��3���죨����ʱ�䣩;4,�죨���ʱ�䣩��
--����������ture
--δ����������false
function Task_DetailInterval(nQuestId,nDelay,nTimeType,nUserId)
	local nTaskTime = Get_TaskDetailData7(nQuestId,nUserId)
	local nNow = os.time()
--nTaskTime����nil����ʾ����������󡣱�log��
	if nTaskTime == nil then
		Sys_SaveAbnormalLog("���� Task_DetailInterval ����Ĳ���:["..nQuestId.."]��ʽ�������Id��"..Get_UserId())
		return false
	end
--����0����ʾ��Ҹ�����δʹ�ù�������δ��ʱ���������ֱ�ӷ���true
	if nTaskTime == 0 then
		return true
	end

	if type(nDelay) ~= "number" or nDelay%1 ~= 0 or nDelay <= 0 then
		Sys_SaveAbnormalLog("���� Task_DetailInterval ���������� nDelay Ϊ���Ͳ��Ҵ���0")
		return
	end

	if nTimeType == nil then
		nTimeType = 0
	elseif type(nTimeType) ~= "number" or nTimeType < 0 or nTimeType > 4 or nTimeType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Task_DetailInterval �� nTimeType ֻ�ܴ�0~3������")
		return
	end
--�룬ֱ�Ӽ�
	if nTimeType == 0 then
		return nNow - nTaskTime >= nDelay
	end
--���ӣ��ȳ���60
	if nTimeType == 1 then
		return (nNow - nTaskTime)/60 >= nDelay
	end
--Сʱ���ȳ�3600=60*60
	if nTimeType == 2 then
		return (nNow - nTaskTime)/3600 >= nDelay
	end
--�죬�ȳ�86400=60*60*24 (����ʱ��)
	if nTimeType == 3 then
		return (nNow - nTaskTime)/86400 >= nDelay
	end
--��(���ʱ��)
	if nTimeType == 4 then
		local sYear
		local sMonth
		local sDay
		local sNowYear
		local sNowMonth
		local sNowDay
		local sNowTime
		local sTime
		sNowTime = os.date("%Y%m%d",nNow - (nDelay - 1)*86400)
		sTime = os.date("%Y%m%d",nTaskTime)
		
		sYear = string.sub(sTime,1,4)
		sMonth = string.sub(sTime,5,6)
		sDay = string.sub(sTime,7,8)
		sNowYear = string.sub(sNowTime,1,4)
		sNowMonth = string.sub(sNowTime,5,6)
		sNowDay = string.sub(sNowTime,7,8)
		
		if tonumber(sYear) < tonumber(sNowYear) then
			return true
		elseif tonumber(sYear) > tonumber(sNowYear) then
			return false
		elseif tonumber(sMonth) < tonumber(sNowMonth) then
			return true
		elseif tonumber(sMonth) > tonumber(sNowMonth) then
			return false
		elseif tonumber(sDay) < tonumber(sNowDay) then
			return true
		else
			return false
		end
	end
end


--�����û���������
--nUserId ���id Ĭ��Ϊ0
--nTaskId Taskid,����0
--nLimitTime ��ʱʱ�䣬��λ���롣0��ʾ����ʱ��
--���������û���������ɹ���ʧ�� bool��
function Task_AddTaskDetail(nTaskId,nLimitTime,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_AddTaskDetail ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if nLimitTime == nil then
		nLimitTime = 0
	elseif type(nLimitTime) ~= "number" or nLimitTime%1 ~= 0 or nLimitTime < 0 then
		Sys_SaveAbnormalLog("���� Task_AddTaskDetail �ڶ�������nLimitTimeΪ���Ͳ���>=0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_AddTaskDetail ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if Task_ChkTaskDetail(nTaskId,nUserId) then
		Sys_SaveAbnormalLog(string.format("���� Task_AddTaskDetail �����������������IDΪ%d������",nTaskId))
		return
	else
		return AddTaskDetail(nUserId,nTaskId,nLimitTime)
	end
end

--ɾ���û���������
--nUserId ���id Ĭ��Ϊ0
--nTaskId Taskid,����0
--����ɾ���û���������ɹ���ʧ�� bool��
function Task_DelTaskDetail(nTaskId,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_DelTaskDetail ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_DelTaskDetail �ڶ�������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return DeleteTaskDetail(nUserId,nTaskId)
	else
		Sys_SaveAbnormalLog(string.format("���� DeleteTaskDetail ���������û������IDΪ%d������",nTaskId))
		return
	end
end

--����û����������Ƿ����
--nUserId ���id Ĭ��Ϊ0
--nTaskId Taskid,����0
--���ؼ���û����������Ƿ���ڳɹ���ʧ�� bool��
function Task_ChkTaskDetail(nTaskId,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_ChkTaskDetail ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_ChkTaskDetail �ڶ�������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return IsExistTaskDetail(nUserId,nTaskId);
end


--�ж�stc����ʱ����Ƿ񳬹�����ʱ��
--nEvent,nType,stc����id
--nDelay����ʱʱ��
--nTimeType����ʱ���ͣ�Ĭ��0��0:�룻1:���ӣ�2��Сʱ��3���죨����ʱ�䣩;4,�죨���ʱ�䣩��
--����������ture
--δ����������false
function Task_StcInterval(nEvent,nType,nDelay,nTimeType)
	local nStcTime = Get_UserStcTimestampValue(nEvent,nType)
	local nNow = os.time()
--nStcTime����nil����ʾ����������󡣱�log��
	if nStcTime == nil then
		Sys_SaveAbnormalLog("���� Task_StcInterval ����Ĳ���[nEvent,nType]:["..nEvent..","..nType.."]��ʽ�������Id��"..Get_UserId())
		return false
	end
--����0����ʾ��Ҹ�����δʹ�ù�������δ��ʱ���������ֱ�ӷ���true
	if nStcTime == 0 then
		return true
	end

	if type(nDelay) ~= "number" or nDelay%1 ~= 0 or nDelay <= 0 then
		Sys_SaveAbnormalLog("���� Task_StcInterval ���������� nDelay Ϊ���Ͳ��Ҵ���0")
		return
	end

	if nTimeType == nil then
		nTimeType = 0
	elseif type(nTimeType) ~= "number" or nTimeType < 0 or nTimeType > 4 or nTimeType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Task_StcInterval �� nTimeType ֻ�ܴ�0~3������")
		return
	end
--�룬ֱ�Ӽ�
	if nTimeType == 0 then
		return nNow - nStcTime >= nDelay
	end
--���ӣ��ȳ���60
	if nTimeType == 1 then
		return (nNow - nStcTime)/60 >= nDelay
	end
--Сʱ���ȳ�3600=60*60
	if nTimeType == 2 then
		return (nNow - nStcTime)/3600 >= nDelay
	end
--�죬�ȳ�86400=60*60*24 (����ʱ��)
	if nTimeType == 3 then
		return (nNow - nStcTime)/86400 >= nDelay
	end
--��(���ʱ��)
	if nTimeType == 4 then
		local sYear
		local sMonth
		local sDay
		local sNowYear
		local sNowMonth
		local sNowDay
		local sNowTime
		local sTime
		sNowTime = os.date("%Y%m%d",nNow - (nDelay - 1)*86400)
		sTime = os.date("%Y%m%d",nStcTime)
		sYear = string.sub(sTime,1,4)
		sMonth = string.sub(sTime,5,6)
		sDay = string.sub(sTime,7,8)
		sNowYear = string.sub(sNowTime,1,4)
		sNowMonth = string.sub(sNowTime,5,6)
		sNowDay = string.sub(sNowTime,7,8)
		
		if tonumber(sYear) < tonumber(sNowYear) then
			return true
		elseif tonumber(sYear) > tonumber(sNowYear) then
			return false
		elseif tonumber(sMonth) < tonumber(sNowMonth) then
			return true
		elseif tonumber(sMonth) > tonumber(sNowMonth) then
			return false
		elseif tonumber(sDay) < tonumber(sNowDay) then
			return true
		else
			return false
		end
	end
end

--���û�stc������мӼ�
--nUserId ���id Ĭ��Ϊ0
--nEvent �¼�id,����0
--nType Type,����0
--nData �Ӽ���ֵ(���Ļ������ֵ�����������Ϳ�����)
--nSave �Ƿ�ʱд�⣬0��1
--���������û�stc����ɹ���ʧ�� bool��
function Task_AddStatistic(nEvent,nType,nData,nSave,nUserId)
	local nValue = Get_UserStatisticValue(nEvent,nType,nUserId)
	
	if nValue == nil then
		Sys_SaveAbnormalLog("���� Task_AddStatistic ����Ĳ���[nEvent,nType]:["..nEvent..","..nType.."]��ʽ�������Id��"..Get_UserId())
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Task_AddStatistic �� nData ֻ�ܴ�����")
		return
	end
	
	local sNewValue = nValue + nData
	local sReturnValue = Task_SetStatistic(nEvent,nType,sNewValue,nSave,nUserId)
	
	if sReturnValue == nil then
		Sys_SaveAbnormalLog("���� Task_AddStatistic ����Ĳ���[nnSave]:["..nSave.."]��ʽ�������Id��"..Get_UserId())
		return false
	else
		return true
	end
end

--���û�stc��������ж�
--nUserId ���id Ĭ��Ϊ0
--nEvent �¼�id,����0
--nType Type,����0
-- sOpt ������ ֻ�ܴ� ">=",">","<=","<","==","~=" �⼸��������
-- nData �жϵ�ֵ
function Task_ChkStcValue(nEvent,nType,sOpt,nData,nUserId)
	local nValue = Get_UserStatisticValue(nEvent,nType,nUserId)
	
	if nValue == nil then
		Sys_SaveAbnormalLog("���� Task_ChkStcValue ����Ĳ���[nEvent,nType]:["..nEvent..","..nType.."]��ʽ�������Id��"..Get_UserId())
		return
	end
	
	if sOpt == nil or type(sOpt) ~= "string" or (sOpt ~= ">=" and sOpt ~= ">" and sOpt ~= "<=" and sOpt ~= "<" and sOpt ~= "==" and sOpt ~= "~=") then
		Sys_SaveAbnormalLog("���� Task_ChkStcValue �� sOpt ����ĸ�ʽ�д�")
		return
	end
	
	if nData == nil or type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Task_ChkStcValue �� nData ֻ�ܴ�����")
		return
	end
	
	if sOpt == ">=" then
		return nValue >= nData
	end
	
	if sOpt == ">" then
		return nValue > nData
	end
	
	if sOpt == "<=" then
		return nValue <= nData
	end
	
	if sOpt == "<" then
		return nValue < nData
	end
	
	if sOpt == "==" then
		return nValue == nData
	end
	
	if sOpt == "~=" then
		return nValue ~= nData
	end
end

-- �ж��û���������ֵ
--nUserId ���id Ĭ��Ϊ0
-- nQuestId ��������ID
-- sPos ��Ӧ�������ֶ� ֻ�ܴ� "CompleteFlag"��"NotifyFlag"��"1"��"2"��"3"��"4"��"5"��"6"��"7"��"OverTime"��"OverTimeSec"
-- sOpt ������ ֻ�ܴ� ">=",">","<=","<","==","~=" �⼸��������
-- nData �жϵ�ֵ
function Task_ChkTaskDetailValue(nQuestId,sPos,sOpt,nData,nUserId)
	local nValue = Get_TaskDetail(nQuestId,sPos,nUserId)
	
	if nValue == nil then
		Sys_SaveAbnormalLog("���� Task_ChkTaskDetailValue ����Ĳ���[nQuestId,sPos]:["..nQuestId..","..sPos .."]��ʽ�������Id��"..Get_UserId())
		return
	end
	
	if sOpt == nil or type(sOpt) ~= "string" or (sOpt ~= ">=" and sOpt ~= ">" and sOpt ~= "<=" and sOpt ~= "<" and sOpt ~= "==" and sOpt ~= "~=") then
		Sys_SaveAbnormalLog("���� Task_ChkTaskDetailValue �� sOpt ����ĸ�ʽ�д�")
		return
	end
	
	if nData == nil or type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Task_ChkTaskDetailValue �� nData ֻ�ܴ�����")
		return
	end
	
	if sOpt == ">=" then
		return nValue >= nData
	end
	
	if sOpt == ">" then
		return nValue > nData
	end
	
	if sOpt == "<=" then
		return nValue <= nData
	end
	
	if sOpt == "<" then
		return nValue < nData
	end
	
	if sOpt == "==" then
		return nValue == nData
	end
	
	if sOpt == "~=" then
		return nValue ~= nData
	end
end

--2015.01.08
--����ӵ�����ҿ�������ۻ�����

--	// ���������ۻ��Ľ��棬�ɹ�����true�����򷵻�false
--	// ����1: ���ID,  ����2: ����ID,  

function Task_OpenTaskAccumulateWindow(nTaskId,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_CompleteOSTaskAmount �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	if type(nTaskId) ~= "number" or nTaskId <= 0 or nTaskId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_CompleteOSTaskAmount �� nTaskId ֻ�ܴ�����0������")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return OpenTaskAccumulateWindow(nUserId,nTaskId)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_OpenTaskAccumulateWindow ���������û������IDΪ%d������",nTaskId))
		return
	end
end


-- 2015.01.09
-- �������task_detail��max_accumulate_times ֵ
function Task_SetMaxAccumulateTimes(nTaskId,nData,nUserId)
	if type(nTaskId) ~= "number" or nTaskId%1 ~= 0 or nTaskId <= 0 then
		Sys_SaveAbnormalLog("���� Task_SetMaxAccumulateTimes ��һ������nTaskIdΪ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Task_SetMaxAccumulateTimes �ڶ�������nDataΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Task_SetMaxAccumulateTimes ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if Task_ChkTaskDetail(nTaskId,nUserId) then
		return SetTaskDetailData(nUserId,nTaskId,G_MAX_ACCUMULATE_TIMES,nData)
	else
		Sys_SaveAbnormalLog(string.format("���� Task_SetMaxAccumulateTimes ���������û������IDΪ%d������",nTaskId))
		return
	end
end
