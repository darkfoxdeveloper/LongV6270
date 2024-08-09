----------------------------------------------------------------------------
--Name:		[����][���ú���]��Һ���.lua
--Purpose:	��Һ����ӿ�
--Creator: 	�ֽ�
--Created:	2014/06/26
----------------------------------------------------------------------------
---------------------------------�����淶----------------------------------
------------------------------actiontype�ķ���------------------------------
--Sys  �������
--Send ��Ϣ����
--Get  �������
--Set  �޸�����
--Chk  �������
--Del  ɾ������
--Add  �������
--Dec  �۳�����
------------------------------------------------------------------------------
-- ��Һ�������ǰ׺�ʣ�User_
--���ӣ�
--(fn_CheckLeftSpace, "CheckLeftSpace");//�����ҿո���������1:���ID, ��2:�ո�����


--function User_ChkBagSpace(nUserId,nNum)
--
--end

------------------------------------------------------------------------------

--�����ҿո����� 
--(fn_CheckLeftSpace, "CheckLeftSpace");		
--����˵������1:���ID, ��2:�ո�����
--���أ��пռ� ture û�ռ�false
function User_CheckLeftSpace(nSpaceNum,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_CheckLeftSpace �ڶ�������nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end	
	
	if type(nSpaceNum) ~= "number" or nSpaceNum%1 ~= 0 or nSpaceNum <= 0 then
		Sys_SaveAbnormalLog("���� User_CheckLeftSpace �� nSpaceNum ֻ�ܴ�����0������")
		return
	end

	return CheckLeftSpace(nUserId,nSpaceNum)
end


--��ұ���
--TransformByItem		
--����˵������1:���ID, ��2:��������ID, ��3:���ܵȼ�, ��4:��������ID, ��5:����ʱ��
--����
function User_TransForm(nSkillType,nSkillLevel,nMonsterType,nTime,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TransForm �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end	
	
	if type(nSkillType) ~= "number" or nSkillType%1 ~= 0 or nSkillType <= 0 then
		Sys_SaveAbnormalLog("���� User_TransForm �� nSkillType ֻ�ܴ�����0������")
		return
	end
	
	if type(nSkillLevel) ~= "number" or nSkillLevel%1 ~= 0 or nSkillLevel < 0 then
		Sys_SaveAbnormalLog("���� User_TransForm �� nSkillLevel ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nMonsterType) ~= "number" or nMonsterType%1 ~= 0 or nMonsterType <= 0 then
		Sys_SaveAbnormalLog("���� User_TransForm �� nMonsterType ֻ�ܴ�����0������")
		return
	end
		
	if type(nTime) ~= "number" or nTime%1 ~= 0 or nTime <= 0 then
		Sys_SaveAbnormalLog("���� User_TransForm �� nTime ֻ�ܴ�����0������")
		return
	end	

	return TransformByItem(nUserId,nSkillType,nSkillLevel,nMonsterType,nTime)
end


--����е�ͼ
--(fn_ChgMap, "ChgMap");			
--����˵������1:���ID, ��2:��ͼID, ��3:����X, ��4:����Y, ��5:�Ƿ���Գ����� 	���� ACTION_USER_CHGMAP = 1003
--��������е�ͼ�������
function User_ChgMap(nMapId,nCellx,nCelly,nIsOutPrison,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_ChgMap  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end	
	
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� User_ChgMap �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nCellx) ~= "number" or nCellx%1 ~= 0 or nCellx <= 0 then
		Sys_SaveAbnormalLog("���� User_ChgMap �� nCellx ֻ�ܴ�����0������")
		return
	end
	
	if type(nCelly) ~= "number" or nCelly%1 ~= 0 or nCelly <= 0 then
		Sys_SaveAbnormalLog("���� User_ChgMap �� nCelly ֻ�ܴ�����0������")
		return
	end
	
	if nIsOutPrison == nil then
		nIsOutPrison = 0
	elseif type(nIsOutPrison) ~= "number" or nIsOutPrison%1 ~= 0 or nIsOutPrison < 0 or nIsOutPrison > 1  then
		Sys_SaveAbnormalLog("���� User_ChgMap �� nIsOutPrison ֻ�ܴ���0��1��������")
		return
	end	

	return ChgMap(nUserId,nMapId,nCellx,nCelly,nIsOutPrison)
end


--��¼�������	
--(fn_RecordPoint, "RecordPoint");	
--����˵������1:���ID, ��2:��ͼID, ��3:����X, ��4:����Y 			���� ACTION_USER_RECORDPOINT = 1004 
----���ؼ�¼�������
function User_RecordPoint(nMapId,nCellx,nCelly,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_RecordPoint  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� User_RecordPoint �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nCellx) ~= "number" or nCellx%1 ~= 0 or nCellx <= 0 then
		Sys_SaveAbnormalLog("���� User_RecordPoint �� nCellx ֻ�ܴ�����0������")
		return
	end
	
	if type(nCelly) ~= "number" or nCelly%1 ~= 0 or nCelly <= 0 then
		Sys_SaveAbnormalLog("���� User_RecordPoint �� nCelly ֻ�ܴ�����0������")
		return
	end
	
	return RecordPoint(nUserId,nMapId,nCellx,nCelly)
end

--��ҷ���֮2000Ƶ��	
--(fn_Talk, "Talk");
--����˵������1:���ID, ��2:Ƶ��, ��3:����  						���� ACTION_USER_TALK = 1010
--Ƶ��=2000;
--����2000Ƶ��	
function User_TalkChannel2000(sContent,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TalkChannel2002  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� User_TalkChannel2002 �� sContent ֻ�ܴ��ַ���")
		return
	end	
	
	return Talk(nUserId,2000,sContent)
end

--��ҷ���֮2002����Ƶ��	
--(fn_Talk, "Talk");
--����˵������1:���ID, ��2:Ƶ��, ��3:����  						���� ACTION_USER_TALK = 1010
--Ƶ��=2002;	 	����
--����2002����Ƶ��	
function User_TalkChannel2002(sContent,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TalkChannel2002  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� User_TalkChannel2002 �� sContent ֻ�ܴ��ַ���")
		return
	end	
	
	return Talk(nUserId,2002,sContent)
end



--��ҷ���֮2003����Ƶ��	
--(fn_Talk, "Talk");				
--����˵������1:���ID, ��2:Ƶ��, ��3:����  						���� ACTION_USER_TALK = 1010
--Ƶ��=2003;	 	����
--����2003����Ƶ���Ķ԰�
function User_TalkChannel2003(sContent,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TalkChannel2003  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� User_TalkChannel2003 �� sContent ֻ�ܴ��ַ���")
		return
	end	

	return Talk(nUserId,2003,sContent)
end


--��ҷ���֮2005ϵͳƵ��	
--(fn_Talk, "Talk");				
--����˵������1:���ID, ��2:Ƶ��, ��3:����  						���� ACTION_USER_TALK = 1010
--Ƶ��=2005;	 	ϵͳ
--����2005ϵͳƵ��
function User_TalkChannel2005(sContent,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TalkChannel2005  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� User_TalkChannel2005 �� sContent ֻ�ܴ��ַ���")
		return
	end	
	
	return Talk(nUserId,2005,sContent)
end



--��ҷ���֮2007��̸Ƶ��	
--(fn_Talk, "Talk");			
--����˵������1:���ID, ��2:Ƶ��, ��3:����  						���� ACTION_USER_TALK = 1010
--Ƶ��=2007;	 	��̸
--����2007��̸Ƶ��
function User_TalkChannel2007(sContent,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TalkChannel2007  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� User_TalkChannel2007 �� sContent ֻ�ܴ��ַ���")
		return
	end	
	
	return Talk(nUserId,2007,sContent)
end



--��ҷ���֮2011GMƵ��	
--(fn_Talk, "Talk");		
--����˵������1:���ID, ��2:Ƶ��, ��3:����  						���� ACTION_USER_TALK = 1010
--Ƶ��=2011;	 	GMƵ��
--����2011GMƵ��
function User_TalkChannel2011(sContent,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TalkChannel2011  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� User_TalkChannel2011 �� sContent ֻ�ܴ��ַ���")
		return
	end		

	return Talk(nUserId,2011,sContent)
end



--��������Ч
--(fn_Effect, "Effect");	
--����˵������1:���ID, ��2:szObj, ��3:szEffect, ��4:szOpt   		���� ACTION_USER_EFFECT = 1027,
--szObj֧��"self", "couple", "team", szEffectΪ��Ч����, szOpt֧��"add", "del"
--������������Ч
function User_EffectAdd(sSzObj,sEffect,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_EffectAdd  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(sEffect) ~= "string" then
		Sys_SaveAbnormalLog("���� User_EffectAdd �� sEffect ֻ�ܴ��ַ���")
		return
	end
	
	if type(sSzObj) ~= "string" then
		Sys_SaveAbnormalLog("���� User_EffectAdd �� sSzObj ֻ�ܴ��ַ���")
		return
	end		
	
	if sSzObj == "self" then
		return Effect(nUserId,"self",sEffect,"add")
	elseif 	sSzObj == "couple" then 
		return Effect(nUserId,"couple",sEffect,"add")
	elseif 	sSzObj == "team"	then
		return Effect(nUserId,"team",sEffect,"add")
	end

end



--���ɾ����Ч
--(fn_Effect, "Effect");	
--����˵������1:���ID, ��2:szObj, ��3:szEffect, ��4:szOpt   		���� ACTION_USER_EFFECT = 1027,
--szObj֧��"self", "couple", "team", szEffectΪ��Ч����, szOpt֧��"add", "del"
--�������ɾ����Ч
function User_EffectDel(sSzObj,sEffect,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_EffectDel  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(sEffect) ~= "string" then
		Sys_SaveAbnormalLog("���� User_EffectDel �� sEffect ֻ�ܴ��ַ���")
		return
	end
	
	if type(sSzObj) ~= "string" then
		Sys_SaveAbnormalLog("���� User_EffectDel �� sSzObj ֻ�ܴ��ַ���")
		return
	end		
	
	if sSzObj == "self" then
		return Effect(nUserId,"self",sEffect,"del")
	elseif 	sSzObj == "couple" then 
		return Effect(nUserId,"couple",sEffect,"del")
	elseif 	sSzObj == "team"	then
		return Effect(nUserId,"team",sEffect,"del")
	end
end



--�������ս������������ֵ
--SetExpControl	
--����˵������1:���ID, ��2:�ӳɰٷֱ�, ��3:ʱ��, 					���� ACTION_USER_PLUSEXP = 1048
--�����������ս������������ֵ(X������)
function User_SetExpControl(nPercent,nTime,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_SetExpControl  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nPercent) ~= "number" or nPercent%1 ~= 0 or nPercent <= 0 then
		Sys_SaveAbnormalLog("���� User_SetExpControl �� nPercent ֻ�ܴ�����0������")
		return
	end
	
	if type(nTime) ~= "number" or nTime%1 ~= 0 or nTime <= 0 then
		Sys_SaveAbnormalLog("���� User_SetExpControl �� nTime ֻ�ܴ�����0������")
		return
	end	

	return SetExpControl(nUserId,nPercent,nTime)
end



--���ڶ���Ƶ���й㲥һ����Ϣ
--(fn_BroadcastTeamMsg, "BroadcastTeamMsg");	
--����˵������1:���ID, ��2:����			���� ACTION_TEAM_BROADCAST = 1101,
--���ض���Ƶ���й㲥һ����Ϣ
function User_BroadcastTeamMsg(nContent,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_BroadcastTeamMsg  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nContent) ~= "string" then
		Sys_SaveAbnormalLog("���� User_BroadcastTeamMsg �� nContent ֻ�ܴ��ַ���")
		return
	end			
	
	return BroadcastTeamMsg(nUserId,nContent)
end

--�������
--(fn_TeamChgMap, "TeamChgMap");		
--����˵������1:���ID, ��2:��ͼID����3:X����, ��4:Y����				���� ACTION_TEAM_CHGMAP        = 1107
--�����������������ӳ�������
function User_TeamChgMap(nMapId,nCellx,nCelly,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TeamChgMap  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� User_TeamChgMap �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nCellx) ~= "number" or nCellx%1 ~= 0 or nCellx <= 0 then
		Sys_SaveAbnormalLog("���� User_TeamChgMap �� nCellx ֻ�ܴ�����0������")
		return
	end
	
	if type(nCelly) ~= "number" or nCelly%1 ~= 0 or nCelly <= 0 then
		Sys_SaveAbnormalLog("���� User_TeamChgMap �� nCelly ֻ�ܴ�����0������")
		return
	end	
	
	return TeamChgMap(nUserId,nMapId,nCellx,nCelly)
end

--����Ƿ�ӳ�
--(fn_IsTeamLeader, "IsTeamLeader");		
--����˵������1:���ID
--��������Ƿ�ӳ�
function User_IsTeamLeader(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_IsTeamLeader  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end	
	
	return IsTeamLeader(nUserId)
end

--ȫ��ִ��ĳ��LUA����(ֻ�жӳ����Դ���)	
--TeamExeFuncByLeader	
--����˵������1:���ID  ��2:��Χ(1:�����߸��� 2:����ͼ 3:���е�ͼ)  ��3:LUA����     ʧ�ܷ���false�����򷵻�true
--����ȫ��ִ��ĳ��LUA����(ֻ�жӳ����Դ���)	
function User_TeamExeFuncByLeader(nRange,sFunc,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TeamExeFuncByLeader  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nRange) ~= "number" or nRange%1 ~= 0 or nRange <= 0 or nRange > 3 then
		Sys_SaveAbnormalLog("���� User_TeamExeFuncByLeader �� nRange ֻ�ܴ�(1,2,3)������")
		return
	end
	
	if type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� User_TeamExeFuncByLeader �� sFunc ֻ�ܴ��ַ���")
		return
	end		
	
	return TeamExeFuncByLeader(nUserId,nRange,string.format("</F>%s",sFunc))
end

--ȫ��ִ��ĳ��LUA����(��Ա���Դ���)	
--TeamExeFuncByTeamer			
--����˵������1:���ID  ��2:��Χ(1:�����߸��� 2:����ͼ 3:���е�ͼ)  ��3:LUA����     ʧ�ܷ���false�����򷵻�true
--����ȫ��ִ��ĳ��LUA����(��Ա���Դ���)	
function User_TeamExeFuncByTeamer(nRange,sFunc,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TeamExeFuncByTeamer  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nRange) ~= "number" or nRange%1 ~= 0 or nRange <= 0 or nRange > 3 then
		Sys_SaveAbnormalLog("���� User_TeamExeFuncByTeamer �� nUserId ֻ�ܴ�(1,2,3)������")
		return
	end
	
	if type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� User_TeamExeFuncByTeamer �� sFunc ֻ�ܴ��ַ���")
		return
	end		
	
	return TeamExeFuncByTeamer(nUserId,nRange,string.format("</F>%s",sFunc))
end



--����Ҵ��͵���ͼ�������
--ACTION_USER_RAND_TRANS   = 1509,     
--bool UserRandTrans(int idUser, int idMap, int nCheck);            
--����˵��: idUser��ʾָ�����, ��0��ʾ��ǰ���, idMap��ʾָ���ĵ�ͼ, Ϊ0ʱ��ʾ��ҵ�ǰ���ڵ�ͼ, nCheck��ʾ����ͼ����, ��0��ʾҪ���. ���ʧ�ܷ���false, �ɹ�����true.
--���ؽ���Ҵ��͵���ͼ�������
function User_UserRandTrans(nMapId,nCheck,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_UserRandTrans  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId < 0 then
		Sys_SaveAbnormalLog("���� User_UserRandTrans �� nMapId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if nCheck == nil then
		nCheck = 0
	elseif type(nCheck) ~= "number" or nCheck%1 ~= 0 or nCheck < 0 then
		Sys_SaveAbnormalLog("���� User_UserRandTrans �� nCheck ֻ�ܴ�����0������")
		return
	end	

	return UserRandTrans(nUserId,nMapId,nCheck)
end

--����Ҵ��͵���ͼ��ָ������.
--bool UserRandBoundTrans(int idUser, int idMap, int nCheck�� int nBoundX, int nBoundY, int nBoundCX, int nBoundCY);
--����˵��: idUser��ʾָ�����, ��0��ʾ��ǰ���, idMap��ʾָ���ĵ�ͼ, Ϊ0ʱ��ʾ��ҵ�ǰ���ڵ�ͼ, nCheck��ʾ����ͼ���ԣ���0��ʾҪ���;
--nBoundX, nBoundY��ʾ�����������Ͻǵ�����, nBoundCX, nBoundCY��ʾ�������ķ�Χ. ���ʧ�ܷ���false, �ɹ�����true.
--���ؽ���Ҵ��͵���ͼ��ָ������.
function User_UserRandBoundTrans(nMapId,nBoundX,nBoundY,nBoundCX,nBoundCY,nCheck,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_UserRandBoundTrans  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� User_UserRandBoundTrans �� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if nCheck == nil then
		nCheck = 0
	elseif type(nCheck) ~= "number" or nCheck%1 ~= 0 or nCheck < 0 then
		Sys_SaveAbnormalLog("���� User_UserRandBoundTrans �� nCheck ֻ�ܴ����ڵ���0������")
		return
	end	
	
	if type(nBoundX) ~= "number" or nBoundX%1 ~= 0 or nBoundX < 0 then
		Sys_SaveAbnormalLog("���� User_UserRandBoundTrans �� nBoundX ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nBoundY) ~= "number" or nBoundY%1 ~= 0 or nBoundY < 0 then
		Sys_SaveAbnormalLog("���� User_UserRandBoundTrans �� nBoundY ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nBoundCX) ~= "number" or nBoundCX%1 ~= 0 or nBoundCX < 0 then
		Sys_SaveAbnormalLog("���� User_UserRandBoundTrans �� nBoundCX ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nBoundCY) ~= "number" or nBoundCY%1 ~= 0 or nBoundCY < 0 then
		Sys_SaveAbnormalLog("���� User_UserRandBoundTrans �� nBoundCY ֻ�ܴ����ڵ���0������")
		return
	end	
	
	return UserRandBoundTrans(nUserId,nMapId,nCheck,nBoundX,nBoundY,nBoundCX,nBoundCY)
end

-- 4. ���üĴ�������ֵ�ӿڣ�void  SetUserVarData(int UserId, int nInx, int nData);
-- ����1�����id������2������;3.�Ĵ�������ֵ
-- ����ֵ����
function User_SetVarData(nInx,nData,nUserId)
	if type(nInx) ~= "number" or nInx > 7 or nInx < 0 or nInx%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetVarData ���� nInx ����Ϊ���Ͳ�����0-7֮��")
		return
	end
	
	if type(nData) ~= "number" or nData < 0 or nData%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetVarData ���� nData ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetVarData ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return SetUserVarData(nUserId,nInx,nData)
end


-- 6. ���üĴ�������ֵ�ַ������ͣ��ӿڣ�void  SetUserVarStr(int UserId, int nInx, char* pData);
-- ����1�����id������2������;3.�Ĵ�������ֵ
-- ����ֵ����
function User_SetVarStr(nInx,sDataStr,nUserId)
	if type(nInx) ~= "number" or nInx > 7 or nInx < 0 or nInx%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetVarStr ���� nInx ����Ϊ���Ͳ�����0-7֮��")
		return
	end
	
	if type(sDataStr) ~= "string" then
		Sys_SaveAbnormalLog("���� User_SetVarStr ���� sDataStr ����Ϊ�ַ���")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetVarStr ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return SetUserVarStr(nUserId,nInx,sDataStr)
end

-- //ACTION_USER_CAL_EXP 1084  ACTION_USER_TIME_TO_EXP	1086
-- bool CalcUserExp(OBJID idUser, __int64 n64ExpAdd, DWORD dwIdxLev, DWORD dwIdxPercent);
-- bool CalcUserTimeToExp(OBJID idUser, DWORD dwTime, DWORD idx);
--1084	����ָ����ֵ��exp�Ե�ǰ�û���Ӱ��, ���Ŀ�꼶��Ͱٷֱ���ֵ��ָ���ļĴ�������
--// paramΪ"exp_add idx_lev idx_percent"
--// exp_addΪ��ӵ�expֵ, idx_levΪĿ�꼶������ļĴ�����������, idx_percentΪĿ��ٷֱ�����ļĴ�����������,
--// �Ĵ�����������Ϊ 0-7
-- bool CalcUserExp(OBJID idUser, __int64 n64ExpAdd, DWORD dwIdxLev, DWORD dwIdxPercent);
function User_CalcExp(nExpAdd,nUserId)
	if type(nExpAdd) ~= "number" or nExpAdd < 0 or nExpAdd%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CalcExp ���� nExpAdd ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CalcExp ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return Sys_Split(CalcUserExp(nUserId,nExpAdd)," ")
end


-- 1086 // ����һ��������ʱ�䵽��ǰ�û��ľ�������, �����ָ���ļĴ�������                                       
-- // paramΪ"time idx_exp", timeΪ����ʱ�䣬��λ��cq_levexp���е�uplevtime��ͬ��idx_expΪ�Ĵ������������� 
-- // �Ĵ�����������Ϊ 0-7                                                                                 
-- bool CalcUserTimeToExp(OBJID idUser, DWORD dwTime, DWORD idx);
function User_CalcTimeToExp(nTime,nUserId)
	if type(nTime) ~= "number" or nTime < 0 or nTime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CalcTimeToExp ���� nTime ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CalcTimeToExp ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return CalcUserTimeToExp(nUserId,nTime)
end


-- //user status
-- //ACTION_USER_STATUS 1082

--AddRoleStatus(objid idRole,int nType,int nPower,int nInterval,int ucLeaveTimes,int unRemainTime,int unEndTime,int ucRecordable,int usFrom,int unData)
--idRole ��ɫID  nType ״̬���� nInterval ״̬����ʱ�� ucLeaveTimes ״̬���� unRemainTime ʣ��ʱ�� unEndTime ��Чʱ�� ucRecordable �Ƿ���� usFrom ������Դ unData ��������(action��0)

-- bool DelRoleStatus(OBJID idUser, DWORD dwStatus);
-- bool ChkRoleStatus(OBJID idUser, DWORD dwStatus);
-- bool AddUserTeamStatus(OBJID idUser, DWORD dwStatus, int nPower , int nSecs, int nTimes);
-- bool DelUserTeamStatus(OBJID idUser, DWORD dwStatus);
-- bool ChkUserTeamStatus(OBJID idUser, DWORD dwStatus);
-- 1082,			// ���ӻ�ɾ��ָ����״̬��paramΪ"obj opr status power seconds times", 
-- // obj֧��"self", "mate", "couple", "team", ע��team�������Լ�, ���û�ж��飬����ʧ��
-- //		���⣬"mate"ѡ������Է������ߣ�����ʧ��
-- // opr֧��"add", "del", "chk"
-- // powerΪ״̬���Ȳ�����
-- // secondsΪ״̬����������
-- // timesΪ״̬�����Ĵ���, ֻ����һ�ε���0


--1000007--���idRole��Ϊ �û�id,ֱ�ӵ��ýӿڲ���
function User_AddRoleStatus(nStatus,nPower,nSecs,nTimes,nunRemainTime,nunEndTime,nucRecordable,nusFrom,nunData,nUserId)
	if type(nStatus) ~= "number" or nStatus <= 0 or nStatus%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nStatus ����Ϊ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nPower) ~= "number" or nPower < 0 or nPower%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nPower ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nSecs) ~= "number" or nSecs < 0 or nSecs%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nSecs ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nTimes) ~= "number" or nTimes < 0 or nTimes%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nTimes ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nunRemainTime) ~= "number" or nunRemainTime < 0 or nunRemainTime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nunRemainTime ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nunEndTime) ~= "number" or nunEndTime < 0 or nunEndTime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nunEndTime ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nucRecordable) ~= "number" or nucRecordable < 0 or nucRecordable%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nucRecordable ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nusFrom) ~= "number" or nusFrom < 0  or nusFrom%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nusFrom ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nunData) ~= "number" or nunData < 0  or nunData%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nunData ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nUserId) ~= "number" or nUserId <= 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRoleStatus ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return AddRoleStatus(nUserId,nStatus,nPower,nSecs,nTimes,nunRemainTime,nunEndTime,nucRecordable,nusFrom,nunData)
end

function User_DelRoleStatus(nStatus,nUserId)
	if type(nStatus) ~= "number" or nStatus <= 0 or nStatus%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelRoleStatus ���� nStatus ����Ϊ���Ͳ��Ҵ���0")
		return
	end
	
	if type(nUserId) ~= "number" or nUserId <= 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelRoleStatus ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return DelRoleStatus(nUserId,nStatus)
end

function User_ChkRoleStatus(nStatus,nUserId)
	if type(nStatus) ~= "number" or nStatus <= 0 or nStatus%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkRoleStatus ���� nStatus ����Ϊ���Ͳ��Ҵ���0")
		return
	end

	if type(nUserId) ~= "number" or nUserId <= 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkRoleStatus ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return ChkRoleStatus(nUserId,nStatus)
end

-- bool AddUserTeamStatus(OBJID idUser, DWORD dwStatus, int nPower , int nSecs, int nTimes);
function User_AddTeamStatus(nStatus,nPower,nSecs,nTimes,nUserId)
	if type(nStatus) ~= "number" or nStatus <= 0 or nStatus%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddTeamStatus ���� nStatus ����Ϊ���Ͳ��Ҵ���0")
		return
	end

	if type(nPower) ~= "number" or nPower < 0 or nPower%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddTeamStatus ���� nPower ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nSecs) ~= "number" or nSecs < 0 or nSecs%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddTeamStatus ���� nSecs ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nTimes) ~= "number" or nTimes < 0 or nTimes%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddTeamStatus ���� nTimes ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nUserId) ~= "number" or nUserId <= 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddTeamStatus ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return AddUserTeamStatus(nUserId,nStatus,nPower,nSecs,nTimes)
end

-- bool DelUserTeamStatus(OBJID idUser, DWORD dwStatus);
function User_DelTeamStatus(nStatus,nUserId)
	if type(nStatus) ~= "number" or nStatus <= 0 or nStatus%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelTeamStatus ���� nStatus ����Ϊ���Ͳ��Ҵ���0")
		return
	end

	if type(nUserId) ~= "number" or nUserId <= 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelTeamStatus ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return DelUserTeamStatus(nUserId,nStatus)
end

-- bool ChkUserTeamStatus(OBJID idUser, DWORD dwStatus);
function User_ChkTeamStatus(nStatus,nUserId)
	if type(nStatus) ~= "number" or nStatus <= 0 or nStatus%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkTeamStatus ���� nStatus ����Ϊ���Ͳ��Ҵ���0")
		return
	end

	if type(nUserId) ~= "number" or nUserId <= 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkTeamStatus ���� nUserId ����Ϊ���Ͳ��Ҵ���0")
		return
	end

	return ChkUserTeamStatus(nUserId,nStatus)
end


-----------20140822---------
--// ��¼����������书��־. ����˵��: idUser��ʾ���ID. ���ʧ�ܷ���false, �ɹ�����true.
--LUA_FUNC(GongfuAndFateValueLog)
--	OBJID idUser = Lua_GetParamUInt(1);
--�����ļ���gmlog/syn_templog
function User_GongfuAndFateValueLog(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_GongfuAndFateValueLog �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return GongfuAndFateValueLog(nUserId)
end




-- //��鱳��ʣ��ռ��Ƿ���data������С   	��1:���ID����2:����������	�ж�Ա�ռ�С��nData�ͷ���false�����򷵻�true
-- LUA_FUNC(TeamLeaveSpace)
	-- OBJID idUser		= Lua_GetParamUInt(1);
	-- int nData			= Lua_GetParamUInt(2);
--ֻ�ܶӳ����������ж�Ա����������false
function User_ChkTeamSpace(nSpace,nUserId)
	if type(nSpace) ~= "number" or nSpace <= 0 or nSpace%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkTeamSpace �� nSpace ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkTeamSpace �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return TeamLeaveSpace(nUserId,nSpace)
end


-- //�����Ա�����Ʒ(�ڵ��ô˽ӿڵ�ʱ������ȵ���TeamLeaveSpace���жϱ����ռ�)   	��1:���ID����2:��Ʒ����ID��		ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(TeamAddItem)
	-- OBJID idUser		= Lua_GetParamUInt(1);
	-- OBJID idItemType	= Lua_GetParamUInt(2);

function User_AddTeamItem(nItemtype,nUserId)
	if type(nItemtype) ~= "number" or nItemtype <= 0 or nItemtype%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddTeamItem �� nItemtype ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddTeamItem �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	if User_ChkTeamSpace(1) then
		return TeamAddItem(nUserId,nItemtype)
	else 
		Sys_SaveAbnormalLog("����������ҵı����ռ䲻�㣬�����Ѷ�Ա��������")
		return
	end

end



-- //�����Աɾ����Ʒ(�ڵ��ô˽ӿ�֮ǰ�����ȵ���TeamCheckItem�ӿ��ж��Ƿ�����Ʒ)   	��1:���ID����2:��Ʒ����ID��		ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(TeamDelItem)
	-- OBJID idUser		= Lua_GetParamUInt(1);
	-- OBJID idItemType	= Lua_GetParamUInt(2);
-- //�����Ա����Ƿ���ĳ��Ʒ   	��1:���ID����2:��Ʒ����ID��		ʧ�ܷ���false�����򷵻�true

function User_DelTeamItem(nItemtype,nUserId)

	if type(nItemtype) ~= "number" or nItemtype <= 0 or nItemtype%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelTeamItem �� nItemtype ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelTeamItem �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	if User_ChkTeamItem(nItemtype) then
		return TeamDelItem(nUserId,nItemtype)
	else 
		Sys_SaveAbnormalLog("�����������û�и���Ʒ�������Ѷ�Ա����Ƿ��и���Ʒ��")
		return
	end

end



-- LUA_FUNC(TeamCheckItem)
	-- OBJID idUser		= Lua_GetParamUInt(1);
	-- OBJID idItemType	= Lua_GetParamUInt(2);
--���г�Ա���в�ture�����򷵻�false
function User_ChkTeamItem(nItemtype,nUserId)
	if type(nItemtype) ~= "number" or nItemtype <= 0 or nItemtype%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkTeamItem �� nItemtype ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkTeamItem �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return TeamCheckItem(nUserId,nItemtype)
end

-- //����װ��   	��1:���ID��		ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(UnequipItem)
	-- OBJID idUser	= Lua_GetParamUInt(1);
	-- int nPosition	= Lua_GetParamUInt(2);

function User_UnequipItem(nPos,nUserId)
	if type(nPos) ~= "number" or nPos < 0 or nPos > 8 or nPos%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_UnequipItem �� nPos ֻ�ܴ�1~8������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_UnequipItem �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return UnequipItem(nUserId,nPos)
end

-- //�������ܵȼ����		��1: ���ID����2:��������ID����3���ȼ�	С��nLev����false�����򷵻�true
-- LUA_FUNC(SkillCheckLev)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);
	-- int	  nLev		= Lua_GetParamInt(3);

function User_SkillChkLev(nSkillType,nLev,nUserId)
	if type(nSkillType) ~= "number" or nSkillType <= 0 or nSkillType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillChkLev �� nSkillType ֻ�ܴ�����0������")
		return
	end

	if type(nLev) ~= "number" or nLev <= 0 or nLev%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillChkLev �� nTime ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillChkLev �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SkillCheckLev(nUserId,nSkillType,nLev)
end


-- //ѧϰ��������		��1: ���ID����2:��������ID����3���ȼ�	ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(LearnSkill)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);
	-- int	  nLev		= Lua_GetParamInt(3);
--�����ɼ���ֻҪ�������ܱ�Ŵ��ھͿ������á�
--ִ�гɹ���level�ֶε���nlev������
function User_SkillLearn(nSkillType,nLev,nUserId)
	if type(nSkillType) ~= "number" or nSkillType <= 0 or nSkillType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillLearn �� nSkillType ֻ�ܴ�����0������")
		return
	end

	if type(nLev) ~= "number" or nLev <= 0 or nLev%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillLearn �� nTime ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillLearn �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return LearnSkill(nUserId,nSkillType,nLev)
end

-- //�����������ܾ���		��1: ���ID����2:��������ID����3�����顣	ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(SkillAddExp)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);
	-- int	  nExp		= Lua_GetParamInt(3);
--�ͻ��˻�������ʾ�������ݿⲻ��ʱʱ���档
--δѧ�������������ȣ����ݿ���½����ݣ����ͻ��˿�������
function User_SkillAddExp(nSkillType,nExp,nUserId)
	if type(nSkillType) ~= "number" or nSkillType <= 0 or nSkillType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillAddExp �� nSkillType ֻ�ܴ�����0������")
		return
	end

	if type(nExp) ~= "number" or nExp <= 0 or nExp%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillAddExp �� nExp ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillAddExp �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SkillAddExp(nUserId,nSkillType,nExp)
end


-- //�����������ܾ���		��1: ���ID����2:��������ID����3��ʱ��(���򽫻���ɾ���)��	ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(SkillAddLevTime)
	-- OBJID idUser	= Lua_GetParamInt(1);
	-- OBJID idType	= Lua_GetParamInt(2);
	-- int	  nTime		= Lua_GetParamInt(3);
--�ͻ��˻�������ʾ�������ݿⲻ��ʱʱ���档
--δѧ�������������ȣ����ݿ���½����ݣ����ͻ��˿�������
function User_SkillAddExpByTime(nSkillType,nTime,nUserId)
	if type(nSkillType) ~= "number" or nSkillType <= 0 or nSkillType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillAddExpByTime �� nSkillType ֻ�ܴ�����0������")
		return
	end

	if type(nTime) ~= "number" or nTime <= 0 or nTime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillAddExpByTime �� nTime ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SkillAddExpByTime �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SkillAddExp(nUserId,nSkillType,nTime)
end


-- //�����ӷ�����Ʒ		��1:���ID����2:��Ʒ����ID����3����������(Ŀǰֻ��0��һ��)		ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(TeamDice)
	-- OBJID	idUser		= Lua_GetParamUInt(1);
	-- OBJID	idItemType	= Lua_GetParamUInt(2);
	-- int		nType		= Lua_GetParamUInt(3);
--��Ա�ӳ������Դ�����
function User_TeamDice(nItemtype,nUserId)
	if type(nItemtype) ~= "number" or nItemtype <= 0 or nItemtype%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_TeamDice �� nItemtype ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_TeamDice �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return TeamDice(nUserId,nItemtype,0)
end


-- //������һ������ʱ����ز���		��1:���ID����2:������ʽ����3����ȡ		ʧ�ܷ���false�����򷵻�true
-- LUA_FUNC(UserLastLoginOperator)
	-- OBJID	idUser		= Lua_GetParamUInt(1);
	-- OBJID	nType		= Lua_GetParamUInt(2);
	-- UINT	unParam		= Lua_GetParamUInt(3);

--nTime�ĸ�ʽΪ"yyyymmdd"�����磺"20070405"
--������һ������ʱ�䣬�������ʱ������磬�򷵻�false��
--��֮������ture��
function User_LastLoginOperatorByTime(nTime,nUserId)
	if nTime == nil then
		nTime = os.date("%Y%m%d")
	elseif type(nTime) ~= "number" or nTime <= 0 or nTime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_LastLoginOperatorByTime �� nTime ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_LastLoginOperatorByTime �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	BrocastMsg(2011,tostring(UserLastLoginOperator(nUserId,0,nTime)))
	return UserLastLoginOperator(nUserId,0,nTime)
end




-- //�ж���������Ƿ��й⻷������˵���� idUser���ID ,�й⻷�����棬�޹⻷���ؼ�
-- LUA_FUNC(IsExistHalo)
	-- OBJID idUser = Lua_GetParamUInt(1);

function User_IsExistHalo(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_IsExistHalo �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return IsExistHalo(nUserId)
end


-- // ɾ��������ϵĹ⻷������˵���� idUser���ID
-- LUA_FUNC(ClsHalo)
	-- OBJID idUser = Lua_GetParamUInt(1);
--�����Ƿ����޹⻷��ɾ������������й⻷������Զ����ture��
function User_DelHalo(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelHalo �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if User_IsExistHalo(nUserId) then
		return ClsHalo(nUserId)
	else
		return true
	end
end

-- //��ұ���ָ����Ϣ��gm log	����˵����szParam ָ��Ҫ�������Ϣ
-- LUA_FUNC(MsgToGMLog)
	-- const char* szParam= Lua_GetParamString(1);
--���ɵ�log��gmlog/�·�/action.log��
function User_GmLog(sLogParam)
	if type(sLogParam) ~= "string" then
		Sys_SaveAbnormalLog("���� User_GmLog �� sLogParam ֻ�ܴ��ַ������͵Ĳ���")
		return
	end

	return MsgToGMLog(sLogParam)
end

--SCRIPT_PARAM_PLAYER_LookFace,	1003	//���ͷ����	get 	set	
--������λ�ֱ�Ӹı�
function User_SetLookFace(nFace,nUserId)
	if type(nFace) ~= "number" or nFace <= 0 or nFace%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetLookFace �� nFace ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetLookFace �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SetUserInt(nUserId,G_PLAYER_LookFace,nFace,0)
end

--SCRIPT_PARAM_PLAYER_Profession,	1005	//��ҵ�ְҵ	get 	set	
--��ְҵ��Ų����ڣ���ִ�гɹ���������������ְҵ��������֣���
function User_SetProfession(nProfession,nUserId)
	if type(nProfession) ~= "number" or nProfession <= 0 or nProfession%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetProfession �� nProfession ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetProfession �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SetUserInt(nUserId,G_PLAYER_Profession,nProfession,0)
end

--ֻ�ܴ�0����ɳɳ�ʼ״̬��
--SCRIPT_PARAM_PLAYER_Transfrom,	1024	//����ID	get	set	
function User_SetTransform(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetTransform �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SetUserInt(nUserId,G_PLAYER_Transfrom,0,0)
end

--SCRIPT_PARAM_PLAYER_Crime,	1038	//����ʱ��	get	set	
--���ò�Ϊ0����ҽ���pk���������˸״̬
function User_SetCrime(nCrime,nUserId)
	if type(nCrime) ~= "number" or nCrime <= 0 or nCrime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetCrime �� nCrime ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetCrime �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SetUserInt(nUserId,G_PLAYER_Crime,nCrime,0)
end

--SCRIPT_PARAM_PLAYER_XP,	1041	//��ǰXPֵ	get	set	add
function User_SetXp(nXp,nUserId)
	if type(nXp) ~= "number" or nXp < 0 or nXp%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetXp �� nXp ֻ�ܴ����ڵ���0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetXp �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SetUserInt(nUserId,G_PLAYER_XP,nXp,0)
end

--SCRIPT_PARAM_PLAYER_EP,	1042	//����ֵ	get	set	add
function User_SetEp(nEp,nUserId)
	if type(nEp) ~= "number" or nEp < 0 or nEp%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetEp �� nEp ֻ�ܴ����ڵ���0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetEp �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SetUserInt(nUserId,G_PLAYER_EP,nEp,0)
end

--SCRIPT_PARAM_PLAYER_AddPoint,	1043	//������Ե�	get	set	add
function User_SetAddPoint(nAddPoint,nUserId)
	if type(nAddPoint) ~= "number" or nAddPoint < 0 or nAddPoint%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetAddPoint �� nAddPoint ֻ�ܴ����ڵ���0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetAddPoint �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SetUserInt(nUserId,G_PLAYER_AddPoint,nAddPoint,0)
end

--SCRIPT_PARAM_PLAYER_PKProtocol,	1054	//PKģʽ	get	set	
--�޸�cq_user���PKProtocol�ֶ�
--���µ�¼����Ч��
function User_SetPkProtocol(nPkProtocol,nUserId)
	if  nPkProtocol == 0 or nPkProtocol == 1 or nPkProtocol == 2 then
		Sys_SaveAbnormalLog("���� User_SetPkProtocol �� nPkProtocol ֻ�ܴ�0,1,2.")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetPkProtocol �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return SetUserInt(nUserId,G_PLAYER_PKProtocol,nPkProtocol,0)
end

--SCRIPT_PARAM_PLAYER_Level,	1006	//��ҵȼ�	get		add
function User_AddLevel(nAddLevel,nUserId)
	if type(nAddLevel) ~= "number" or nAddLevel <= 0 or nAddLevel%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddLevel �� nAddLevel ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddLevel �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_Level,nAddLevel,0)
end

--SCRIPT_PARAM_PLAYER_Life,	1019	//�������ֵ	get		add
function User_AddLife(nAddLife,nUserId)
	if type(nAddLife) ~= "number" or nAddLife%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddLife �� nAddLife ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddLife �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_Life,nAddLife,0)
end

--SCRIPT_PARAM_PLAYER_Mana,	1021	//��ҷ���ֵ	get		add
function User_AddMana(nAddMana,nUserId)
	if type(nAddMana) ~= "number" or nAddMana%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddMana �� nAddMana ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddMana �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_Mana,nAddMana,0)
end

--SCRIPT_PARAM_PLAYER_Mentor,	1023	//��ҵ㻯����	get		add
--100��=1�ε㻯����
function User_AddMentor(nAddMentor,nUserId)
	if type(nAddMentor) ~= "number" or nAddMentor <= 0 or nAddMentor%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddMentor �� nAddMentor ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddMentor �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_Mentor,nAddMentor,0)
end

--SCRIPT_PARAM_PLAYER_Money,	1025	//�����Ϸ��	get		add
function User_AddMoney(nAddMoney,nUserId)
	if type(nAddMoney) ~= "number" or nAddMoney%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddMoney �� nAddMoney ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddMoney �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_Money,nAddMoney,0)
end

--SCRIPT_PARAM_PLAYER_EMoney,	1027	//�����ʯ	get		add
function User_AddEMoney(nAddEMoney,nUserId)
	if type(nAddEMoney) ~= "number" or nAddEMoney%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddEMoney �� nAddEMoney ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddEMoney �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_EMoney,nAddEMoney,0)
end

--SCRIPT_PARAM_PLAYER_EMoneyMono,	1028	//�������	get		add
function User_AddEMoneyMono(nAddEMoneyMono,nUserId)
	if type(nAddEMoneyMono) ~= "number" or nAddEMoneyMono%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddEMoneyMono �� nAddEMoneyMono ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddEMoneyMono �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_EMoneyMono,nAddEMoneyMono,0)
end

--SCRIPT_PARAM_PLAYER_Exp,	1029	//��Ҿ���(add���������ӹ���)	get		add
function User_AddExp(nAddExp,nUserId)
	if type(nAddExp) ~= "number" or nAddExp <= 0 or nAddExp%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExp �� nAddExp ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExp �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_Exp,nAddExp,0)
end

--SCRIPT_PARAM_PLAYER_ExpContribute,	1030	//��Ҿ���(add�������ӹ���)			add
function User_AddExpContribute(nAddExpContribute,nUserId)
	if type(nAddExpContribute) ~= "number" or nAddExpContribute <= 0 or nAddExpContribute%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpContribute �� nAddExpContribute ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpContribute �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_ExpContribute,nAddExpContribute,0)
end


-- SCRIP_PARAM_PLAYER_ExpPercent	1065 //���ٷֱ����Ӿ���(�����ӹ���)��
function User_AddExpPercent(nAddPercent,nUserId)
	if type(nAddPercent) ~= "number" or nAddPercent < 0 or nAddPercent > 100 or nAddPercent%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpPercent �� nAddPercent ֻ�ܴ�0-100������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpPercent �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_ExpPercent,nAddPercent,0)
end


-- SCRIP_PARAM_PLAYER_ExpPercentContribute	1066 //���ٷֱ����Ӿ���(���ӹ���)
function User_AddExpPercentContribute(nAddPercentContribute,nUserId)
	if type(nAddPercentContribute) ~= "number" or nAddPercentContribute < 0 or nAddPercentContribute > 100 or nAddPercentContribute%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpPercentContribute �� nAddPercentContribute ֻ�ܴ�0-100������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpPercentContribute �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_ExpPercentContribute,nAddPercentContribute,0)
end

-- //������ҵľ���ʱ�䣨����һ��������ʱ�䵽��ǰ�û��ľ��飩
-- //ע�⣺nTimeΪ���Ӿ����ʱ�䡣��λ�Ƿ��ӣ�
-- //�õ��Ľӿڣ�	AddUserInt ����ֱ�ӼӾ���
-- //User_AddExpTime(30)��ʾ���ӵ�ǰ���30���Ӿ��顣
function User_AddExpTime(nTime,nUserId)
	if type(nTime) ~= "number" or nTime < 0 or nTime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpTime ���� nTime ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpTime ���� nUserId ����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	local nAddTime = nTime * 10

	return AddUserInt(nUserId,G_PLAYER_ExpTime,nAddTime,0)
end

--SCRIPT_PARAM_PLAYER_PK,	1031	//���PKֵ	get		add
--30��죬100���
function User_AddPk(nAddPk,nUserId)
	if type(nAddPk) ~= "number" or nAddPk%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddPk �� nAddPk ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddPk �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_PK,nAddPk,0)
end

--SCRIPT_PARAM_PLAYER_Strength,	1032	//�������ֵ	get		add
--���鲻Ҫʹ�ã�ԭ���ǣ�ִ����������ʣ�������ʾ����֡�
--������ֵʱ���������ڴ�״̬������ֱ�Ӽ�������ֵ������ʣ�������ʾ�����ϵĵ������Ҳ�����ּӵ㰴ť������л�����ʾ������
--������ֵʱ�����ͬ�ӷ���ֻ����ʣ����ֵ���ֻ���ʾ������
function User_AddStrength(nAddStrength,nUserId)
	if type(nAddStrength) ~= "number" or nAddStrength%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddStrength �� nAddStrength ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddStrength �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	if nAddStrength < 0 then
		local nStrength = Get_UserStrength()
		
		if nStrength + nAddStrength < 0 then
			Sys_SaveAbnormalLog(string.format("���� User_AddStrength ������ֵ����%d",math.abs(nAddStrength)))
			return
		end
		
		if AddUserInt(nUserId,G_PLAYER_Strength,nAddStrength,0) then
			return User_AddAddPoint(math.abs(nAddStrength),nUserId)
		end
	else
		return AddUserInt(nUserId,G_PLAYER_Strength,nAddStrength,0)
	end
end

--SCRIPT_PARAM_PLAYER_Speed,	1033	//�������ֵ	get		add
function User_AddSpeed(nAddSpeed,nUserId)
	if type(nAddSpeed) ~= "number" or nAddSpeed%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddSpeed �� nAddSpeed ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddSpeed �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if nAddSpeed < 0 then
		local nSpeed = Get_UserSpeed()
		
		if nSpeed + nAddSpeed < 0 then
			Sys_SaveAbnormalLog(string.format("���� User_AddSpeed ������ֵ����%d",math.abs(nAddSpeed)))
			return
		end
		
		if AddUserInt(nUserId,G_PLAYER_Speed,nAddSpeed,0) then
			return User_AddAddPoint(math.abs(nAddSpeed),nUserId)
		end
	else
		return AddUserInt(nUserId,G_PLAYER_Speed,nAddSpeed,0)
	end
end

--SCRIPT_PARAM_PLAYER_Health,	1034	//�������ֵ	get		add
function User_AddHealth(nAddHealth,nUserId)
	if type(nAddHealth) ~= "number" or nAddHealth%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddHealth �� nAddHealth ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddHealth �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	if nAddHealth < 0 then
		local nHealth = Get_UserHealth()
		
		if nHealth + nAddHealth < 0 then
			Sys_SaveAbnormalLog(string.format("���� User_AddHealth ������ֵ����%d",math.abs(nAddHealth)))
			return
		end
		
		if AddUserInt(nUserId,G_PLAYER_Health,nAddHealth,0) then
			return User_AddAddPoint(math.abs(nAddHealth),nUserId)
		end
	else
		return AddUserInt(nUserId,G_PLAYER_Health,nAddHealth,0)
	end
end

--SCRIPT_PARAM_PLAYER_Soul,	1035	//��Ҿ���ֵ	get		add
function User_AddSoul(nAddSoul,nUserId)
	if type(nAddSoul) ~= "number" or nAddSoul%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddSoul �� nAddSoul ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddSoul �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	if nAddSoul < 0 then
		local nSoul = Get_UserSoul()
		
		if nSoul + nAddSoul < 0 then
			Sys_SaveAbnormalLog(string.format("���� User_AddSoul �о���ֵ����%d",math.abs(nAddSoul)))
			return
		end
		
		if AddUserInt(nUserId,G_PLAYER_Soul,nAddSoul,0) then
			return User_AddAddPoint(math.abs(nAddSoul),nUserId)
		end
	else
		return AddUserInt(nUserId,G_PLAYER_Soul,nAddSoul,0)
	end
end

--SCRIPT_PARAM_PLAYER_XP,	1041	//��ǰXPֵ	get	set	add
--���븺����Ч
function User_AddXp(nAddXp,nUserId)
	if type(nAddXp) ~= "number" or nAddXp <= 0 or nAddXp%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddXp �� nAddXp ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddXp �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_XP,nAddXp,0)
end

--SCRIPT_PARAM_PLAYER_EP,	1042	//����ֵ	get	set	add
function User_AddEp(nAddEp,nUserId)
	if type(nAddEp) ~= "number" or nAddEp%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddEp �� nAddEp ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddEp �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_EP,nAddEp,0)
end

--SCRIPT_PARAM_PLAYER_AddPoint,	1043	//������Ե�	get	set	add
--�����븺������������ҵ�ǰʣ�����������ִ���ʣ��������65535-��̫��ĵ�����
--���ԣ��ɴ�Ѹ���������
function User_AddAddPoint(nAddAddPoint,nUserId)
	if type(nAddAddPoint) ~= "number" or nAddAddPoint <=0 or nAddAddPoint%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddAddPoint �� nAddAddPoint ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddAddPoint �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_AddPoint,nAddAddPoint,0)
end

--SCRIPT_PARAM_PLAYER_StorageMoney,	1049	//��Ҵ洢��Ǯ	get		add
--���۵���Ǯ������ҵ�ǰ�ֿ��Ǯ��ʱ����ִ�С�
function User_AddStorageMoney(nAddStorageMoney,nUserId)
	if type(nAddStorageMoney) ~= "number" or nAddStorageMoney%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddStorageMoney �� nAddStorageMoney ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddStorageMoney �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_StorageMoney,nAddStorageMoney,0)
end

--SCRIPT_PARAM_PLAYER_AddMount,	1052	//�����ƶ���			add
--���븺����Ч
function User_AddMount(nAddMount,nUserId)
	if type(nAddMount) ~= "number" or nAddMount <= 0 or nAddMount%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddMount �� nAddMount ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddMount �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_AddMount,nAddMount,0)
end

--SCRIPT_PARAM_PLAYER_Cultivation,	1053	//����ֵ	get		add
function User_AddCultivation(nAddCultivation,nUserId)
	if type(nAddCultivation) ~= "number" or nAddCultivation <= 0 or nAddCultivation%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddCultivation �� nAddCultivation ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddCultivation �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_Cultivation,nAddCultivation,0)
end

--SCRIPT_PARAM_PLAYER_StrengthValue,	1055	//����ֵ	get		add
function User_AddStrengthValue(nAddStrengthValue,nUserId)
	if type(nAddStrengthValue) ~= "number" or nAddStrengthValue <= 0 or nAddStrengthValue%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddStrengthValue �� nAddStrengthValue ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddStrengthValue �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_StrengthValue,nAddStrengthValue,0)
end

--SCRIPT_PARAM_PLAYER_GodBless,	1060	//���ף��ʣ��ʱ��	get		add
--��λСʱ��������Ч�����Խ�����
function User_AddBless(nAddBless,nUserId)
	if type(nAddBless) ~= "number" or nAddBless <=0 or nAddBless%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddBless �� nAddBless ֻ�ܴ�����0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddBless �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_GodBless,nAddBless,0)
end

-- /�����ӵ���״̬������˵���� idUser���ID , idProp״̬����ID, unRemainTime ʣ��ʱ��
-- LUA_FUNC(AddPropStatus)
	-- OBJID idUser		   = Lua_GetParamUInt(1);
	-- infoProps.idProp	   = Lua_GetParamULong(2);
	-- infoProps.unRemainTime = Lua_GetParamUInt(3);
function User_AddPropStatus(nPropId,nUnRemainTime,nUserId)
	if type(nPropId) ~= "number" or nPropId < 0 or nPropId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddPropStatus ��1������nPropId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nUnRemainTime) ~= "number" or nUnRemainTime < 0 or nUnRemainTime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddPropStatus ��2������nUnRemainTime����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddPropStatus ��3������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return AddPropStatus(nUserId,nPropId,nUnRemainTime)
end


-- //ɾ��������е��ﱩ����������������״̬������˵���� idUser���ID
-- LUA_FUNC(DelAllAttribStatus)
	-- OBJID idUser = Lua_GetParamUInt(1);
function User_DelAllAttribStatus(nUserId)
	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelAllAttribStatus ��1������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return DelAllAttribStatus(nUserId)
end

-- // ���������������ָ��������ͼ�ص�. ����˵��: idUser��ʾ���ID; idRebornMap��ʾ������ͼID; nPosX, nPosY��ʾ����. ���ʧ�ܷ���false, �ɹ�����true.
-- LUA_FUNC(UserDie)
	-- OBJID idUser = Lua_GetParamUInt(1);
	-- OBJID idRebornMap = Lua_GetParamUInt(2);
	-- int nPosX = Lua_GetParamInt(3);
	-- int nPosY = Lua_GetParamInt(4);
function User_Die(nRebornMap,nPosX,nPosY,nUserId)
	if type(nRebornMap) ~= "number" or nRebornMap < 0 or nRebornMap%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_Die ��1������nRebornMap����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nPosX) ~= "number" or nPosX < 0 or nPosX%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_Die ��2������nPosX����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nPosY) ~= "number" or nPosY < 0 or nPosY%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_Die ��3������nPosY����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_Die ��4������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return UserDie(nUserId,nRebornMap,nPosX,nPosY)
end

-- //������ҹ������Ե��������ԣ�����˵����idUserָҪ������USERID, nIdxָSCRIPT_PARAM_GONGFU_ATTR_BEGIN-SCRIPT_PARAM_GONGFU_ATTR_END��ö��ֵ��nData��ʾҪ���õ�ֵ���޷���ֵ��
-- LUA_FUNC(SetGongFuInt)
	-- int idUser	= Lua_GetParamInt(1);
	-- int nIdx	= Lua_GetParamInt(2);
	-- int nData	= Lua_GetParamInt(3);
function User_SetGongFuInt(nIdx,nData,nUserId)
	if type(nIdx) ~= "number" or nIdx < 0 or nIdx%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetGongFuInt ��1������nIdx����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nData) ~= "number" or nData < 0 or nData%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetGongFuInt ��2������nData����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetGongFuInt ��3������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if IsUserAlreadyCreateGongFu(nUserId) then
		return SetGongFuInt(nUserId,nIdx,nData)
	else
		Sys_SaveAbnormalLog("���� User_SetGongFuInt ����һ�û���Դ��书")
		return
	end
end

-- //������ҹ������Ե������������
-- nData��ʾҪ���õ�ֵ���޷���ֵ��
function User_SetGongFuFreePractNum(nData,nUserId)
	if type(nData) ~= "number" or nData < 0 or nData%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetGongFuFreePractNum ��1������nData����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetGongFuFreePractNum ��2������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if IsUserAlreadyCreateGongFu(nUserId) then
		return SetGongFuInt(nUserId,G_GONGFU_ATTR_FREE_CULTIVATE_PARAM,nData)
	else
		Sys_SaveAbnormalLog("���� User_SetGongFuFreePractNum ����һ�û���Դ��书")
		return
	end
end

-- //������ҹ������Ե������ȼ�
-- nData��ʾҪ���õ�ֵ���޷���ֵ��
function User_SetGongFuQiLeve(nData,nUserId)
	if type(nData) ~= "number" or nData < 0 or nData%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetGongFuQiLeve ��1������nData����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetGongFuQiLeve ��2������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if IsUserAlreadyCreateGongFu(nUserId) then
		return SetGongFuInt(nUserId,G_GONGFU_ATTR_GENUINEQI_LV,nData)
	else
		Sys_SaveAbnormalLog("���� User_SetGongFuQiLeve ����һ�û���Դ��书")
		return
	end
end

-- //������ҹ������Ե���������ֵ������˵����idUserָҪ������USERID, nIdxָSCRIPT_PARAM_GONGFU_ATTR_BEGIN-SCRIPT_PARAM_GONGFU_ATTR_END��ö��ֵ��nData��ʾҪ���õ�ֵ���޷���ֵ��
-- LUA_FUNC(AddGongFuInt)
	-- int idUser	= Lua_GetParamInt(1);
	-- int nIdx	= Lua_GetParamInt(2);
	-- int nData	= Lua_GetParamInt(3);
function User_AddGongFuInt(nIdx,nData,nUserId)
	if type(nIdx) ~= "number" or nIdx < 0 or nIdx%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddGongFuInt ��1������nIdx����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nData) ~= "number" or nData < 0 or nData%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddGongFuInt ��2������nData����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddGongFuInt ��3������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return AddGongFuInt(nUserId,nIdx,nData)
end

-- //������ҹ������Ե������������
-- nData��ʾҪ���ӵ�ֵ���޷���ֵ��
function User_AddGongFuFreePractNum(nData,nUserId)
	if type(nData) ~= "number" or nData < 0 or nData%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddGongFuFreePractNum ��1������nData����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddGongFuFreePractNum ��2������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if IsUserAlreadyCreateGongFu(nUserId) then
		return AddGongFuInt(nUserId,G_GONGFU_ATTR_FREE_CULTIVATE_PARAM,nData)
	else
		Sys_SaveAbnormalLog("���� User_AddGongFuFreePractNum ����һ�û���Դ��书")
		return
	end
end

-- //������ҹ������Ե������ȼ�
-- nData��ʾҪ���ӵ�ֵ���޷���ֵ��
function User_AddGongFuQiLeve(nData,nUserId)
	if type(nData) ~= "number" or nData < 0 or nData%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddGongFuQiLeve ��1������nData����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddGongFuQiLeve ��2������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	if IsUserAlreadyCreateGongFu(nUserId) then
		return AddGongFuInt(nUserId,G_GONGFU_ATTR_GENUINEQI_LV,nData)
	else
		Sys_SaveAbnormalLog("���� User_AddGongFuQiLeve ����һ�û���Դ��书")
		return
	end
end

-- //�ж��Ƿ��Ѿ����������򣬲���˵����idUser�û�ID�� ����ֵ���Ѿ���������true�����򷵻�false
-- LUA_FUNC(IsUserAlreadyCreateGongFu)
	-- OBJID idUser			= Lua_GetParamULong(1);
function User_IsAlreadyCreateGongFu(nUserId)
	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_IsAlreadyCreateGongFu ��1������nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return IsUserAlreadyCreateGongFu(nUserId)
end

-- //�ӳ������Χ��Ա״̬������˵����idUser��ɫID	nType ״̬����, nPower  ״̬Ч����nInterval ״̬����ʱ�䣬ucLeaveTimes״̬����, unRemainTime ʣ��ʱ��, unEndTime ��Чʱ�� , ucRecordable �Ƿ����, usFrom ������Դ , unData �������ݣ�action��0��
-- LUA_FUNC(AddUserAroundTeamerStatus)
	-- OBJID idUser			= Lua_GetParamULong(1);
	-- statusInfo.nType		= Lua_GetParamInt(2);
	-- statusInfo.nPower	    = Lua_GetParamInt(3);
	-- statusInfo.nInterval	= Lua_GetParamInt(4);
	-- statusInfo.ucLeaveTimes = (UCHAR)Lua_GetParamUInt(5);
	-- statusInfo.unRemainTime = Lua_GetParamUInt(6);
	-- statusInfo.unEndTime 	= Lua_GetParamUInt(7);
	-- statusInfo.ucRecordable = (UCHAR) Lua_GetParamUInt(8);
	-- USHORT usFrom		    = Lua_GetParamUInt(9);
	-- statusInfo.unData		= Lua_GetParamUInt(10);

function User_AddAroundTeamerStatus(nType,nPower,nInterval,nLeaveTimes,nRemainTime,nEndTime,nRecordable,nFrom,nData,nUserId)
	if type(nType) ~= "number" or nType%1 ~= 0 or nType <= 0 then
		Sys_SaveAbnormalLog("���� User_AddAroundTeamerStatus �� nMagicType ֻ�ܴ�����0������")
		return
	end
	
	if type(nPower) ~= "number" or nPower%1 ~= 0 or nPower < 0 then
		Sys_SaveAbnormalLog("���� User_AddAroundTeamerStatus �� nPower ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nInterval) ~= "number" or nInterval%1 ~= 0 or nInterval <= 0 then
		Sys_SaveAbnormalLog("���� User_AddAroundTeamerStatus �� nInterval ֻ�ܴ�����0������")
		return
	end
		
	if type(nLeaveTimes) ~= "number" or nLeaveTimes%1 ~= 0 or nLeaveTimes <= 0 then
		Sys_SaveAbnormalLog("���� User_AddAroundTeamerStatus �� nLeaveTimes ֻ�ܴ�����0������")
		return
	end	

	if type(nRemainTime) ~= "number" or nRemainTime%1 ~= 0 or nRemainTime <= 0 then
		Sys_SaveAbnormalLog("���� User_AddAroundTeamerStatus �� nRemainTime ֻ�ܴ�����0������")
		return
	end	

	if type(nEndTime) ~= "number" or nEndTime%1 ~= 0 or nEndTime <= 0 then
		Sys_SaveAbnormalLog("���� User_AddAroundTeamerStatus �� nEndTime ֻ�ܴ�����0������")
		return
	end	

	if type(nRecordable) ~= "number" or nRecordable%1 ~= 0 or nRecordable <= 0 then
		Sys_SaveAbnormalLog("���� User_AddAroundTeamerStatus �� nRecordable ֻ�ܴ�����0������")
		return
	end	

	if type(nFrom) ~= "number" or nFrom%1 ~= 0 or nFrom <= 0 then
		Sys_SaveAbnormalLog("���� User_AddAroundTeamerStatus �� nFrom ֻ�ܴ�����0������")
		return
	end	

	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddAroundTeamerStatus ��nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nData == nil then
		nData = 0
	elseif type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� User_TaskReward �� nData ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserAroundTeamerStatus(nUserId,nType,nPower,nInterval,nLeaveTimes,nRemainTime,nEndTime,nRecordable,nFrom,nData)
end

	
-- //�ӳ�ɾ����Χ�����Ա״̬������˵����idUser�û�ID��szParamΪ״̬���Ͳ����ַ��� �������15��״̬��������
-- LUA_FUNC(DelUserAroundTeamerStatus)
	-- OBJID idUser   = Lua_GetParamULong(1);
	-- const char* szParam = Lua_GetParamString(2);
function User_DelAroundTeamerStatus(sParam,nUserId)
	if type(sParam) ~= "string"  then
		Sys_SaveAbnormalLog("���� User_DelAroundTeamerStatus �� sParam ֻ�ܴ�����0������")
		return
	end
	
	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelAroundTeamerStatus ��nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end

	return DelUserAroundTeamerStatus(nUserId,sParam)
end

	
-- //�ӳ������Χ�����Ա״̬������˵����idUser�û�ID��szParamΪ״̬���Ͳ����ַ��� �������15��״̬��������
-- LUA_FUNC(ChkUserAroundTeamerStatus)
	-- OBJID idUser   = Lua_GetParamULong(1);
	-- const char* szParam = Lua_GetParamString(2);
function User_ChkAroundTeamerStatus(sParam,nUserId)
	if type(sParam) ~= "string"  then
		Sys_SaveAbnormalLog("���� User_ChkAroundTeamerStatus �� sParam ֻ�ܴ�����0������")
		return
	end
	
	if type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkAroundTeamerStatus ��nUserId����Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	return ChkUserAroundTeamerStatus(nUserId,sParam)
end

--�������̳齱����. 
--����˵��: idUser��ʾ���ID; idTask��ʾ����ID. ���ʧ�ܷ���false, �ɹ�����true.
--LUA_FUNC(UserTaskReward)
--OBJID idUser = Lua_GetParamUInt(1);
--OBJID idTask = Lua_GetParamUInt(2);
--����

function User_TaskReward(nTask,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_TaskReward �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end		
	if type(nTask) ~= "number" or nTask%1 ~= 0 or nTask < 0 then
		Sys_SaveAbnormalLog("���� User_TaskReward �� nTask ֻ�ܴ����ڵ���0������")
		return
	end	
	
	return UserTaskReward(nUserId,nTask)

end

--֪ͨ�ͻ��˴���ҳ
--����˵��: idUser��ʾ���ID, pszParam��ʾ��ַ. ���ʧ�ܷ���false, �ɹ�����true.
--LUA_FUNC(SendWebPage)
--OBJID idUser = Lua_GetParamUInt(1);
--const char* pszParam = Lua_GetParamString(2);
--����֪ͨ�ͻ��˴���ҳ
function User_SendWebPage(sPszParam,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_SendWebPage �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end		
	if type(sPszParam) ~= "string" then
		Sys_SaveAbnormalLog("���� User_SendWebPage �� sPszParam ֻ�ܴ��ַ���")
		return
	end		
	return SendWebPage(nUserId,sPszParam)
end

--֪ͨ�ͻ��˴򿪽���
--����˵��: ֪ͨ�ͻ��˴򿪽���. ��1: idUser��ʾ���ID, ��2��idNpc��ʾNPC��ID��Ĭ����0��ʾ�����NPC�� ��3��dwDialog��ʾ����ID. ���ʧ�ܷ���false, �ɹ�����true.
--LUA_FUNC(OpenDialog)
--OBJID idUser = Lua_GetParamUInt(1);

--DWORD dwDialog = Lua_GetParamUInt(2);
--����֪ͨ�ͻ��˴򿪽���
function User_OpenDialog(ndwDialog,nNpcID,nUserId)
	if ndwDialog == nil then
		ndwDialog = 0
	elseif type(ndwDialog) ~= "number" or ndwDialog%1 ~= 0 or ndwDialog < 0 then
		Sys_SaveAbnormalLog("���� User_OpenDialog �� ndwDialog ֻ�ܴ����ڵ���0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_OpenDialog �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if nNpcID == nil then
		nNpcID = 0
	elseif type(nNpcID) ~= "number" or nNpcID%1 ~= 0 or nNpcID < 0 then
		Sys_SaveAbnormalLog("���� User_OpenDialog �� nNpcID ֻ�ܴ����ڵ���0������")
		return
	end

	return OpenDialog(nUserId,nNpcID,ndwDialog)
end


--��ĻЧ��,������1,����2,�䰵����4,��DATA��ָ��,���Ե���. 
--����˵��: idUser��ʾ���ID, nData��ʾЧ��. ���ʧ�ܷ���false, �ɹ�����true.
--LUA_FUNC(Screffect)
--OBJID idUser = Lua_GetParamUInt(1);
--int nData = Lua_GetParamInt(2);
--������ĻЧ��
function User_Screffect(nData,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_Screffect �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end		
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� User_Screffect �� nData ֻ�ܴ����ڵ���0������")
		return
	end	
	return Screffect(nUserId,nData)
end


--��ҽ��븱��
--����˵���� idUser���ID ,idInstanceType ��������, nNumLimit������������ 0Ϊ����������. bIsInvite�Ƿ�������ѽ���, nTimeLimit���ö��ѽ���ʱ�� bIsInviteΪ��ʱ��ֵ����
--LUA_FUNC(EnterInstance)
--OBJID idUser = Lua_GetParamUInt(1);
--OBJID idInstanceType = Lua_GetParamUInt(2);
--int   nNumLimit = Lua_GetParamInt(3);
--int   nIsInvite = Lua_GetParamBool(4);
--int   nTimeLimit = Lua_GetParamInt(5);
--������ҽ��븱��
function User_EnterInstance(nInstanceType,nNumLimit,nIsInvite,nTimeLimit,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_EnterInstance �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end		
	if type(nInstanceType) ~= "number" or nInstanceType%1 ~= 0 or nInstanceType < 0 then
		Sys_SaveAbnormalLog("���� User_EnterInstance �� nInstanceType ֻ�ܴ����ڵ���0������")
		return
	end	
	if nNumLimit == nil then
		nNumLimit = 0
	elseif  type(nNumLimit) ~= "number" or nNumLimit%1 ~= 0 or nNumLimit < 0 then
		Sys_SaveAbnormalLog("���� User_EnterInstance �� nNumLimit ֻ�ܴ����ڵ���0������")
		return
	end		
	if nIsInvite == nil then
		nIsInvite = 0
	elseif type(nIsInvite) ~= "number" or nIsInvite%1 ~= 0 or nIsInvite < 0 then
		Sys_SaveAbnormalLog("���� User_EnterInstance �� nIsInvite ֻ�ܴ����ڵ���0������")
		return
	end	
	if nIsInvite == nil or nIsInvite == 0 then
		nTimeLimit = 0
	elseif type(nTimeLimit) ~= "number" or nTimeLimit%1 ~= 0 or nTimeLimit < 0 then
		Sys_SaveAbnormalLog("���� User_EnterInstance �� nTimeLimit ֻ�ܴ����ڵ���0������")
		return
	end	
	return EnterInstance(nUserId,nInstanceType,nNumLimit,nIsInvite,nTimeLimit)
end



--�������ֻ�. 
--����˵��: idUser��ʾ���ID, nFlowerTypeΪ1:��ɫ,2:��ɫ,3:õ��ɫ ,4:��ɫ�� ,5��ɫ��; pszWords��ʾ���͵Ļ�. ���ʧ�ܷ���false, �ɹ�����true.
--LUA_FUNC(WordsFlower)
--OBJID idUser = Lua_GetParamUInt(1);
--int nFlowerType = Lua_GetParamInt(2);
--const char* pszWords = Lua_GetParamString(3);
--�������ֻ���ֻ��4:��ɫ�� ���Բ���
function User_WordsFlower(nFlowerType,nPszWords,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_WordsFlower �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end		
	if type(nFlowerType) ~= "number" or nFlowerType%1 ~= 0 or nFlowerType < 0 or nFlowerType > 5 then
		Sys_SaveAbnormalLog("���� User_WordsFlower �� nFlowerType ֻ�ܴ�(1,2,3,4,5)������")
		return
	end	
	if type(nPszWords) ~= "string" then
		Sys_SaveAbnormalLog("���� User_WordsFlower �� nPszWords ֻ�ܴ��ַ���")
		return
	end		
	return WordsFlower(nUserId,nFlowerType,nPszWords)
end


--ִ��ָ����sql���, ȡ��ָ����һ�������ֶ�ֵ, ���ַ�����ʽ���뵽ָ���ļĴ�������. 
--����˵��: idUser��ʾ���ID; nIdx��ʾ�Ĵ�������; pszSQL��ʾSQL���. ���ʧ�ܷ���false, �ɹ�����true.
--LUA_FUNC(UserDbField)
--OBJID idUser = Lua_GetParamUInt(1);
--int nIdx = Lua_GetParamInt(2);
--const char* pszSQL = Lua_GetParamString(3);
--����
function User_DbField(nPszSQL,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_DbField �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end		
	
	if type(nPszSQL) ~= "string" then
		Sys_SaveAbnormalLog("���� User_DbField �� nPszSQL ֻ�ܴ��ַ���")
		return
	end		
	
	return UserDbField(nUserId,nPszSQL)
end

-- ��ҵȼ���ת�������ж�
function User_JudgeLevelAndMetempsychosis(nLevel,nMetempsychosis)
	if type(nLevel) ~= "number" or nLevel%1 ~= 0 or nLevel < 0 then
		Sys_SaveAbnormalLog("���� User_JudgeLevelAndMetempsychosis �� nLevel ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nMetempsychosis) ~= "number" or nMetempsychosis%1 ~= 0 or nMetempsychosis < 0 then
		Sys_SaveAbnormalLog("���� User_JudgeLevelAndMetempsychosis �� nMetempsychosis ֻ�ܴ����ڵ���0������")
		return
	end
	
	local nUserId = Get_UserId()
	local nUserMetempsychosis = Get_UserMetempsychosis(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	
	if nUserMetempsychosis < nMetempsychosis then
		return false
	end
	
	if nUserMetempsychosis > nMetempsychosis then
		return true
	end
	
	if nUserLev < nLevel then
		return false
	else
		return true
	end
end

-- actionType 3701 ������װ
-- nSecs ����������
-- sContent ��������ʾ������
-- nActionId ����ʱִ�еĶ���
-- sFunc �����ɹ�ʱִ�еĺ���
-- sFileFunc ����ʧ��ʱִ�еĺ���
function User_SetExplore(nSecs,sContent,nActionId,sFunc,sFileFunc,nUserId)
	if type(nSecs) ~= "number" or nSecs%1 ~= 0 or nSecs <= 0 then
		Sys_SaveAbnormalLog("���� User_SetExplore �� nSecs ֻ�ܴ�����0������")
		return
	end 
	
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� User_SetExplore �� sContent ֻ�ܴ��ַ������͵Ĳ���")
		return
	end
	
	if type(nActionId) ~= "number" or nActionId%1 ~= 0 or nActionId < 0 then
		Sys_SaveAbnormalLog("���� User_SetExplore �� nActionId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� User_SetExplore �� sFunc ֻ�ܴ��ַ�")
		return
	end
	
	if sFileFunc == nil then
		sFileFunc = "NULL"
	elseif type(sFileFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� User_SetExplore �� sFileFunc ֻ�ܴ��ַ�")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetExplore �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return UserSetExplore(nUserId,nSecs,sContent,nActionId,string.format("</F>%s",sFunc),string.format("</F>%s",sFileFunc))
end

------------------------------------2014.12.5
-- �������Ƿ�ѧϰָ�����͵��ڹ���
-- ����˵������1��idUser���ID�� ����ֵ���Ѿ�ѧϰ����true�����򷵻�false
function User_IsLearnInnerStrengthType(nType,nUserId)
	if type(nType) ~= "number" or nType%1 ~= 0 or nType <= 0 then
		Sys_SaveAbnormalLog("���� User_IsLearnInnerStrengthType �� nType ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_IsLearnInnerStrengthType �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return IsLearnedInnerStrengthType(nUserId,nType)
end

-- ���ѧϰָ�����͵��ڹ�
-- ����˵������1�����ID����2���ڹ����ͣ�����ֵ���ɹ�����true�����򷵻�false
function User_LearningInnerStrength(nType,nUserId)
	if type(nType) ~= "number" or nType%1 ~= 0 or nType <= 0 then
		Sys_SaveAbnormalLog("���� User_LearningInnerStrength �� nType ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_LearningInnerStrength �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if User_IsLearnInnerStrengthType(nType,nUserId) then
		Sys_SaveAbnormalLog("���� User_LearningInnerStrength ������Ѿ�ѧϰ���������ڹ�")
		return
	else
		return LearningInnerStrength(nUserId,nType)
	end
end

-- ��������Ϊֵ
function User_AddCultureValue(nValue,nUserId)
	if type(nValue) ~= "number" or nValue%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddCultureValue �� nValue ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddCultureValue �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_CultureValue,nValue,0)
end
--------------2014.12.17
-- �Ƿ�����ҽӿ�
-- ����true��ʾ�ǿ����ң�false��ʾ�������
function User_IsCross(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_IsCross �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return IsOSUser(nUserId)
end

-- ���ש����ʼִ��̽������
-- BeginMoveGoldBrick��int idUser, int nAction, const char* pszDescribe, int idNpc��
-- ����1�����id�������0�����Զ�ȡ��ǰ������id
-- ����2����ʾ̽������id
-- ����3����ʾ��������
-- ����4�������npc id

function User_BeginMoveGoldBrick(nActionId,sDesc,nNpcId,nUserId)
	if type(nActionId) ~= "number" or nActionId < 0 or nActionId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_BeginMoveGoldBrick �� nActionId ֻ�ܴ������0������")
		return
	end
	
	if type(sDesc) ~= "string" then
		Sys_SaveAbnormalLog("���� User_BeginMoveGoldBrick �� sDesc ֻ���ַ���")
		return
	end
	
	if type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_BeginMoveGoldBrick �� nNpcId ֻ�ܴ������0������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_BeginMoveGoldBrick �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return BeginMoveGoldBrick(nUserId,nActionId,sDesc,nNpcId)
end


--------------2014.12.19
-- ���¼����ӿ�ֻ����Event_Kill_User�¼���ʹ��
-- // �ж�Ŀ�����(��ɱ���)�Ƿ�Ϊ�����ң�  ����1��Ŀ�����ID����0ΪĬ��Ŀ����ң��� �ǿ����ҷ���true,���򷵻�false.
function User_TargetIsCross(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_TargetIsCross �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return IsTargetOSUser(nUserId)
end

--------------2015.01.13
-- //ͨ����Ҹı䣨���ӻ���٣������ʽ𣬲�1��idUser�û�ID����2��idSyn��ʾ����id��Ĭ��ȡ��ǰ��ҵİ���id����3��n64Data��ʾҪ�ı����ֵ ����ֵ���ɹ�����true�����򷵻�false
function User_ChgSynMoney(nGuildId,nMoneyNum,nUserId)
	if type(nGuildId) ~= "number" or nGuildId <= 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChgSynMoney �� nGuildId ֻ�ܴ���0������")
		return
	end
	
	if type(nMoneyNum) ~= "number" or nMoneyNum%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChgSynMoney �� nMoneyNum ֻ�ܴ�����")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChgSynMoney �� nUserId ֻ�ܴ�����0������")
		return
	end

	return ChgSynMoneyByUser(nUserId,nGuildId,nMoneyNum)
end

-- //ͨ����Ҹı䣨���ӻ���٣�������ʯ����1��idUser�û�ID����2��idSyn��ʾ����id��Ĭ��ȡ��ǰ��ҵİ���id����3��nData��ʾҪ�ı����ֵ ����ֵ���Ѿ���������true�����򷵻�false
function User_ChgSynEMoney(nGuildId,nEMoneyNum,nUserId)
	if type(nGuildId) ~= "number" or nGuildId <= 0 or nGuildId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChgSynMoney �� nGuildId ֻ�ܴ���0������")
		return
	end
	
	if type(nEMoneyNum) ~= "number" or nEMoneyNum%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChgSynMoney �� nEMoneyNum ֻ�ܴ�����")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChgSynMoney �� nUserId ֻ�ܴ�����0������")
		return
	end

	return ChgSynEMoneyByUser(nUserId,nGuildId,nEMoneyNum)
end

--------------2015.01.21
--�������Ƿ��ɴ���ɾ�
--nAchPos �ɾͱ�ʶλ
--nUserId ���ID
--���磺User_ChkAchByAchPosition(11002)
function User_ChkAchByAchPosition(nAchPos,nUserId)
	if type(nAchPos) ~= "number" or nAchPos <= 0 or nAchPos%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkAchByAchPosition �� nAchPos ֻ�ܴ���0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkAchByAchPosition �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return IsOwnAchByAchPositon(nUserId,nAchPos)
end

--������Ҵ�ɴ���ɾ�
--nAchPos �ɾͱ�ʶλ
--nUserId ���ID
--���磺User_AddAchByAchPosition(11002)
function User_AddAchByAchPosition(nAchPos,nUserId)
	if type(nAchPos) ~= "number" or nAchPos <= 0 or nAchPos%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddAchByAchPosition �� nAchPos ֻ�ܴ���0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddAchByAchPosition �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return SetAchByPosition(nUserId,nAchPos)
end

--ɾ����Ҵ���ɾ�
--nAchPos �ɾͱ�ʶλ
--nUserId ���ID
--���磺User_DelAchByAchPosition(11002)
function User_DelAchByAchPosition(nAchPos,nUserId)
	if type(nAchPos) ~= "number" or nAchPos <= 0 or nAchPos%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelAchByAchPosition �� nAchPos ֻ�ܴ���0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DelAchByAchPosition �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return ClsAchByPosition(nUserId,nAchPos)
end


--��������
--User_MediaPlay
--LUA�ӿڣ�UserMediaPlay
--����1��sPszMediaý���ļ����·����
--����2��nLoop�����Ϊ0����������ѭ��������ֻ����һ��
--����3��nBroadcast�Ƿ�Ϊ�㲥��Ϣ��0��ʾ���͸���ǰ���(play)����0��ʾ���͸��������(broadcasts)
--����4��5��"x, y"Ϊ��ͼ���꣬���������Ϊ0����Ϊ������Ч/���ֲ���
--����6��nUserId,�û�ID
--����ֵ���ɹ�����true��ʧ�ܷ���false
--type:1029
--���磺User_MediaPlay("sound/Piano_do.mp3") �� /callluafunc </F>User_MediaPlay</S>sound/Piano_do.mp3
function User_MediaPlay(sPszMedia,nLoop,nBroadcast,nCellx,nCelly,nUserId)
	if nBroadcast == nil then
		nBroadcast = 0
	elseif type(nBroadcast) ~= "number" or nBroadcast < 0 or nBroadcast%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_MediaPlay �� nBroadcast ֻ�ܴ����ڵ���0������")
		return
	end
	
	if nCellx == nil then
		nCellx = 0
	elseif type(nCellx) ~= "number" or nCellx%1 ~= 0 or nCellx < 0 then
		Sys_SaveAbnormalLog("���� User_MediaPlay �� nCellx ֻ�ܴ����ڵ���0������")
		return
	end
	
	if nCelly == nil then
		nCelly = 0
	elseif type(nCelly) ~= "number" or nCelly%1 ~= 0 or nCelly < 0 then
		Sys_SaveAbnormalLog("���� User_MediaPlay �� nCelly ֻ�ܴ����ڵ���0������")
		return
	end
	
	if nLoop == nil then
		nLoop = 1
	elseif type(nLoop) ~= "number" or nLoop%1 ~= 0 or nLoop < 0 then
		Sys_SaveAbnormalLog("���� User_MediaPlay �� nLoop ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(sPszMedia) ~= "string" then
		Sys_SaveAbnormalLog("���� User_MediaPlay �� sPszMedia ֻ�ܴ��ַ���")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_MediaPlay �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return UserMediaPlay(nUserId,nBroadcast,nCellx,nCelly,nLoop,sPszMedia)
end

--------------2015.03.12
-- 1.�ж��Ƿ���Է��뱳��һ�������Ľ��
-- CanPutMoney2Bag
-- ����1�����id
-- ����2�������,ֻ�ܷ�ΧΪ����21��֮�������
-- ����ֵ��true��ʾ���ԣ�false��ʾ�����ԣ��ᳬ�����ޡ�
function User_CanPutMoney2Bag(nBagMoneyNum,nUserId)
	if type(nBagMoneyNum) ~= "number" or nBagMoneyNum%1 ~= 0 or math.abs(nBagMoneyNum) > 2100000000  then
		Sys_SaveAbnormalLog("���� User_CanPutMoney2Bag �� nBagMoneyNum ֻ�ܷ�ΧΪ����21��֮�������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CanPutMoney2Bag �� nUserId ֻ�ܴ��������0������")
		return
	end
	
	return CanPutMoney2Bag(nUserId,nBagMoneyNum)
end

-- 2.�ж��Ƿ���Է���ֿ�һ�������Ľ��
-- CanPutMoney2Storage
-- ����1�����id
-- ����2�������,ֻ�ܷ�ΧΪ����21��֮�������
-- ����ֵ��true��ʾ���ԣ�false��ʾ�����ԣ��ᳬ�����ޡ�
function User_CanPutMoney2Storage(nStorageMoneyNum,nUserId)
	if type(nBagMoneyNum) ~= "number" or nStorageMoneyNum%1 ~= 0 or math.abs(nStorageMoneyNum) > 2100000000 then
		Sys_SaveAbnormalLog("���� User_CanPutMoney2Bag �� nBagMoneyNum ֻ�ܷ�ΧΪ����21��֮�������")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CanPutMoney2Bag �� nUserId ֻ�ܴ��������0������")
		return
	end
	
	return CanPutMoney2Storage(nUserId,nStorageMoneyNum)
end

-- ��Ҷ�ʱ��LUA�ӿ�
-- LUA�ӿڣ�User_SetTimer
-- ����1��nTimeDelay����ʱʱ��
-- ����2��sFunc��ʱʱ�䵽���õĽű�
-- ����3��nTypeΪ0�����ͻ��˱���
-- ����4��nUserId,�û�ID
-- ����ֵ���ɹ�����true��ʧ�ܷ���false
-- type:1071
-- ���磺/callluafunc </F>User_SetTimer</N>15</S></N>1
function User_SetTimer(nTimeDelay,sFunc,nType,nUserId)
	if type(nTimeDelay) ~= "number" or nTimeDelay%1 ~= 0 or nTimeDelay <= 0 then
		Sys_SaveAbnormalLog("���� User_SetTimer ��һ������nTimeDelayΪ�����Ҵ���0")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� User_SetTimer �ڶ�������sFuncΪ�ַ���")
		return
	end
	
	if nType == nil then
		nType = 0
	elseif type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetTimer �� nType ֻ�ܴ����ڵ���0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetTimer �� nUserId ֻ�ܴ��������0������")
		return
	end
	
	return UserSetTimer(nUserId,nType,string.format("</F>%s",sFunc),nTimeDelay)
end



--��������ѪLUA�ӿڣ���Ӧaction type=1510
--LUA�ӿڣ�UserDecLife
--����1��idUser,�û�ID
--����2��usType,Ϊ0��ʾ�۳������Ѫ���İٷֱȣ�Ϊ1��ʾ�۳���ҵ�ǰѪ���İٷֱ�
--����3��nPercent���ٷֱȣ�Ϊ0-100��ֵ
--����ֵ���ɹ�����true��ʧ�ܷ���false

function User_DecLifePercent(nPercent,nType,nUserId)
	if type(nPercent) ~= "number" or nPercent < 0 or nPercent > 100 or nPercent%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DecLifePercent �� nPercent ֻ�ܴ�0-100������")
		return
	end

	if type(nType) ~= "number" or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DecLifePercent �� nType ֻ�ܴ�0����1")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_DecLifePercent �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	UserDecLife(nUserId,nType,nPercent)
end

--���Ͷ���������ϢActionDefine(1075)
--����1��idUser,�û�ID
--����2��nBroadcast�Ƿ�Ϊ�㲥��Ϣ��0��ʾ���͸���ǰ���(send)����0��ʾ���͸��������(broadcast)
--����3��nTypeΪ����
--����4��nDataΪ����
--����ֵ���ɹ�����true��ʧ�ܷ���false
--PS:User_SendNetWorkMsg(0,1000,0) ������ͨɱ��ģʽ 0 1000 send
function User_SendNetWorkMsg(nData,nType,nBroadcast,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� User_SendNetWorkMsg  �� nUserId Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end	
	
	if nBroadcast == nil then
		nBroadcast = 0
	elseif type(nBroadcast) ~= "number" or nBroadcast%1 ~= 0 or nBroadcast < 0 then
		Sys_SaveAbnormalLog("���� User_SendNetWorkMsg  �� nBroadcast Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nType == nil then
		nType = 1000
	elseif type(nType) ~= "number" or nType%1 ~= 0 or nType < 0 then
		Sys_SaveAbnormalLog("���� User_SendNetWorkMsg  �� nType Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	if nData == nil then
		nData = 0
	elseif type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� User_SendNetWorkMsg  �� nData Ϊ���Ͳ��Ҵ��ڵ���0")
		return
	end
	return UserCustomMsg(nUserId,nBroadcast,nType,nData)
end

-- �ж�����Ƿ���������ˣ�����1�����id������ֵ��������������˷���ture�����򷵻�false
-- bool IsInLeague��int idUser��;
function User_IsInLeague(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_IsInLeague �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end

	return IsInLeague(nUserId)
end

--------------2015.7.6
-- �����޸Ļƽ��������ֵĽӿ�
function User_AddLeaguePoint(nPoint,nUserId)
	if type(nPoint) ~= "number" or nPoint%1 ~= 0 then 
		Sys_SaveAbnormalLog("���� User_AddLeaguePoint �� nPoint ֻ�ܴ�����")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddLeaguePoint �� nUserId ֻ�ܴ������0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_League_Point,nPoint,0)
end

-- // �ж�����Ƿ�����Ӷᵱǰ��ִ���ˡ�����1:���ID����������Ӷᣬ����true�����򷵻�false��
-- IsInPlunderWar
function User_IsInPlunderWar(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_IsInPlunderWar �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return IsInPlunderWar(nUserId)
end

-- IsLeagueLeader��int idUser��
-- ����Ƿ�����������
-- ����1�����id
-- ����ֵ������Ƿ���true�����򷵻�false
function User_IsLeagueLeader(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_IsLeagueLeader �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return IsLeagueLeader(nUserId)
end

-- CanAddLeagueMoney(int idLeague, int nMoney)
-- �ж����˻���
-- ����1������id
-- ����2����Ҫ���ӻ���ٵ��ʽ�,������ʾ���ӣ�������ʾ����
-- ����ֵ:�ɹ�����true��ʧ�ܷ���false
function User_CanAddLeagueMoney(nMoney,nUserId)
	if type(nMoney) ~= "number" or nMoney%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CanAddLeagueMoney �� nMoney ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CanAddLeagueMoney �� nUserId ֻ�ܴ������0������")
		return
	end
	
	-- ��ȡ����ID
	local nLeagueId = Get_UserLeagueId(nUserId)
	
	if type(nLeagueId) ~= "number" or nLeagueId < 0 or nLeagueId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLeagueId �з��ص� nLeagueId ֵ�д�")
		return
	end
	
	return CanAddLeagueMoney(nLeagueId,nMoney)
end

-- AddLeagueMoney(int idLeague, int nMoney)
-- �����˻���
-- ����1������id
-- ����2����Ҫ���ӻ���ٵ��ʽ�,������ʾ���ӣ�������ʾ����
-- ����ֵ���ɹ�����true,ʧ�ܷ���false
function User_AddLeagueMoney(nMoney,nUserId)
	if type(nMoney) ~= "number" or nMoney%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddLeagueMoney �� nMoney ֻ�ܴ�����")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddLeagueMoney �� nUserId ֻ�ܴ������0������")
		return
	end
	
	-- ��ȡ����ID
	local nLeagueId = Get_UserLeagueId(nUserId)
	
	if type(nLeagueId) ~= "number" or nLeagueId < 0 or nLeagueId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Get_UserLeagueId �з��ص� nLeagueId ֵ�д�")
		return
	end
	
	return AddLeagueMoney(nLeagueId,nMoney)
end

-- ���ս��ֵ
function User_AddServiceValue(nValue,nUserId)
	if type(nValue) ~= "number" or nValue < 0 or nValue%1 ~= 0 then 
		Sys_SaveAbnormalLog("���� User_AddServiceValue �� nValue ֻ�ܴ�����")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddServiceValue �� nUserId ֻ�ܴ������0������")
		return
	end

	return AddUserInt(nUserId,G_PLAYER_Service_Value,nValue,0)
end

-- ����һ��LUA�ӿڣ����ڻ�ȡ���ÿ��������ȡ�Ĵ���������N����ӦLUA�ӿ�˵�����£�
-- LUA�ӿڣ�UserGetSpeakerNumEveryDay
-- ����1�����ID����Ϊ0����Ϊ��ǰ���
-- ����ֵ�����ÿ��������ȡ�Ĵ���������������������ֵ����������͢�س������־�����Ϊ����ְλ�������ȡ����ӡ�
function User_GetSpeakerNumEveryDay(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_GetSpeakerNumEveryDay �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return UserGetSpeakerNumEveryDay(nUserId)
end

-- ������ʱ�佱���������ĳɸ�����ֵ
-- ����ֵ 0��ʾ���������ˣ�1��ʾ�Ӿ��飬2��ʾ������ֵ
function User_AddExpOrCultureValue(nExpTime,nCultivation)
	if type(nExpTime) ~= "number" or nExpTime < 0 or nExpTime%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpOrCultureValue �� nExpTime ֻ�ܴ������0������")
		return 0
	end
	
	if nCultivation == nil then
		nCultivation = nExpTime/2
	elseif type(nCultivation) ~= "number" or nCultivation < 0 or nCultivation%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddExpOrCultureValue �� nCultivation ֻ�ܴ������0������")
		return 0
	end
	
	local nUserId = Get_UserId()
	local nLevel = Get_UserLevel(nUserId)
	
	if nLevel < 140 then
		User_AddExpTime(nExpTime,nUserId)
		return 1
	else
		User_AddCultivation(nCultivation,nUserId)
		return 2
	end
end

------2015.07.24�����ӿ�

--�ж�����Ƿ���ִ�����У����ң�(ֻ�����ڵ���lua����ұ���)

function User_ChkUserInCountry(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChkUserInCountry �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return IsUserInCountry(nUserId)
end

-- ����lua�ӿڣ�
 -- IsConcubines��int idUser���Ƿ�������
-- ����1�����id
-- ����ֵ���ǣ�����true�����򷵻�false
function User_IsConcubines(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_IsConcubines �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return IsConcubines(nUserId)
end

-- HaveConcubines��int idUser���Ƿ�������
-- ����1�����id
-- ����ֵ���У�����true�����򷵻�false
function User_HaveConcubines(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_HaveConcubines �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return HaveConcubines(nUserId)
end

-- ��������Ա�
function User_SetSex(nSex,nUserId)
	if type(nSex) ~= "number" or (nSex ~= 1 and nSex ~= 2)then
		Sys_SaveAbnormalLog("���� User_SetSex �� nSex ֻ�ܴ�1����2")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_SetSex �� nUserId ֻ�ܴ������0������")
		return
	end

	return SetUserInt(nUserId,G_PLAYER_Sex,nSex,0)
end

-- ���������ֵĽӿ�
function User_AddRidingPoints(nAddRidingPoints,nUserId)
	if type(nAddRidingPoints) ~= "number" or nAddRidingPoints%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRidingPoints �� nAddRidingPoints ֻ�ܴ�����")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_AddRidingPoints �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return AddUserInt(nUserId,G_PLAYER_RidingPoints,nAddRidingPoints,0)
end

-- IsResistPlunderWar
-- �ж�������������Ƿ��ڱ��Ӷ�״̬�����Ҵ�ʱ����Ƿ��ڱ�������1: ���ID������Ƿ���true�����򷵻�false
function User_IsResistPlunderWar(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_IsResistPlunderWar �� nUserId ֻ�ܴ������0������")
		return
	end
	
	return IsResistPlunderWar(nUserId)
end

--2015��9��22��ӽӿ�

--//�ж���ҵ�ǰ���ڷ������Ƿ��ھ�����״̬������Ƿ���true�����򷵻�false
--LUA_FUNC(IsImmunePlunder)

function User_IsImmunePlunder()

	return IsImmunePlunder()
end



----- 2015.10.13 ----------
-- #�������Ƿ����ʦͽ��ϵ
-- ��ӦACTION:1206
-- LUA�ӿڣ�UserCheckGuide
-- ����1�����id
-- ����ֵ��true��ʾ����ʦͽ��ϵ false��ʾ������ʦͽ��ϵ
function User_CheckGuide(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CheckGuide �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	return UserCheckGuide(nUserId)
end

-- #�������Ƿ������ҵ����ϵ
-- ��ӦACTION:1207
-- LUA�ӿڣ�UserCheckTradeBuddy
-- ����1�����id
-- ����ֵ��true��ʾ������ҵ����ϵ false��ʾ��������ҵ����ϵ
function User_CheckTradeBuddy(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CheckTradeBuddy �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	return UserCheckTradeBuddy(nUserId)
end

-- #�������Ƿ������������Ʒ
-- ��ӦACTION:1210
-- LUA�ӿڣ�UserHasAuctionItem
-- ����1�����id
-- ����ֵ��true��ʾ������������Ʒ false��ʾ��������������Ʒ
function User_HasAuctionItem(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_HasAuctionItem �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	return UserHasAuctionItem(nUserId)
end

-- #�������Ƿ�����ʼ�
-- ��ӦACTION:1211
-- LUA�ӿڣ�UserHasMail
-- ����1�����id
-- ����ֵ��true��ʾ���ʼ� false��ʾû���ʼ�
function User_HasMail(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_HasMail �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	return UserHasMail(nUserId)
end

-- #��cq_pk_item��ļ��
-- ��ӦACTION:2205
-- LUA�ӿڣ�UserCheckPkItem
-- ����1�����id
-- ����2��Ϊ0����ʾ����Ѻ��װ������Ӧaction�е�target��Ϊ1��ʾ��Ѻ���˵���Ʒ����Ӧaction�е�hunter
-- ����ֵ��true��ʾ�ж�Ӧ��Ʒ false��ʾû�ж�Ӧ��Ʒ
function User_CheckPkItem(nNumber,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CheckPkItem �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nNumber) ~= "number" or nNumber%1 ~= 0 or nNumber < 0 or nNumber > 1 then
		Sys_SaveAbnormalLog("���� User_CheckPkItem ��һ������nNumberΪ�����ҷ�Χ��0--1")
		return
	end
	
	return UserCheckPkItem(nUserId,nNumber)
end

-- #�������Ƿ����δ����ʯ����һ��Ҫͬ��������������
-- ��ӦACTION:1209
-- LUA�ӿڣ�UserCheckCard
-- ����1�����id 
-- ����ֵ��true��ʾ��δ����ʯ�� false��ʾû��δ����ʯ��
function User_CheckCard(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_CheckCard �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	return UserCheckCard(nUserId)
end

-- #�η�����ת��Ҫ��
-- ��ӦACTION:1212
-- LUA�ӿڣ�UserChangeServer
-- ����1�����id
-- ����2��ת�����������
-- ����ֵ��true��ʾ�ɹ� false��ʾʧ��
function User_ChangeServer(sServerName,nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� User_ChangeServer �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	if type(sServerName) ~= "string" or sServerName == nil then
		Sys_SaveAbnormalLog("���� Sys_CheckServerName �� sServerName ֻ�ܴ��ַ�")
		return
	end
	return UserChangeServer(nUserId,sServerName)
end