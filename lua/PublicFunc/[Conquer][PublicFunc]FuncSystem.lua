----------------------------------------------------------------------------
--Name:		[����][���ú���]ϵͳ����.lua
--Purpose:	ϵͳ�����ӿ�
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
-- ϵͳ��������ǰ׺�ʣ�Sys_
--���ӣ�
--// ��Ӧtype=101���˵��ı�
--// �˵��ı��� ����˵����strText��ʾ��ʾ���ı����ݣ��ɰ����ո�Ҳ��Ϊ���С����ʧ�ܷ���false, �ɹ�����true��
--bool MenuText(string strText);

--function Sys_MenuText(sText)
--
--end

------------------------------------------------------------------------------

-- ���ڽű��������̲���ʹ�õ�log�ӿ�
-- ����˵���� �����log�ļ����������
function Sys_SaveAbnormalLog(sText)
	local sPath = "syslog/AbnormalLog"

	SaveCustomLog(sPath,tostring(sText))
end




--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--��ּ�����410
--sText��ʾLog������Ϣ,���磺"0,0,0,0,10002354,2,728596,3"
function Sys_SaveActionLog(sText)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SaveActionLog �� sText ֻ�ܴ��ַ�")
		return
	end
	
	local sUserName = Get_UserName()
	local sUserId = Get_UserId()
	local sUserLev = Get_UserLevel()
	local sUserPro = Get_UserProfession()
	local sUserMeto = Get_UserMetempsychosis() 
	local sLogUserData = sUserName..'['.. sUserId ..']['.. sUserLev ..']['.. sUserPro ..']['.. sUserMeto ..']'

	local sLogFile = "gmlog/action_log"
	local sLogText = string.format("410,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end



--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--�����Խű���340
--sText��ʾLog������Ϣ,���磺"0,0,0,0,10002354,2,728596,3"
function Sys_SaveActionFuncLog(sText)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SaveActionFuncLog �� sText ֻ�ܴ��ַ�")
		return
	end
	
	local sUserName = Get_UserName()
	local sUserId = Get_UserId()
	local sUserLev = Get_UserLevel()
	local sUserPro = Get_UserProfession()
	local sUserMeto = Get_UserMetempsychosis() 
	local sLogUserData = sUserName..'['.. sUserId ..']['.. sUserLev ..']['.. sUserPro ..']['.. sUserMeto ..']'

	local sLogFile = "gmlog/action_func_log"
	local sLogText = string.format("340,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end




--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--��ű���350
--sText��ʾLog������Ϣ,���磺"0,0,0,0,10002354,2,728596,3"
function Sys_SaveActionFestivalLog(sText)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SaveActionFestivalLog �� sText ֻ�ܴ��ַ�")
		return
	end
	
	local sUserName = Get_UserName()
	local sUserId = Get_UserId()
	local sUserLev = Get_UserLevel()
	local sUserPro = Get_UserProfession()
	local sUserMeto = Get_UserMetempsychosis() 
	local sLogUserData = sUserName..'['.. sUserId ..']['.. sUserLev ..']['.. sUserPro ..']['.. sUserMeto ..']'

	local sLogFile = "gmlog/action_festival_log"
	local sLogText = string.format("350,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end



--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--����ű���360
--sText��ʾLog������Ϣ,���磺"0,0,0,0,10002354,2,728596,3"
function Sys_SaveActionTaskLog(sText)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SaveActionTaskLog �� sText ֻ�ܴ��ַ�")
		return
	end
	
	local sUserName = Get_UserName()
	local sUserId = Get_UserId()
	local sUserLev = Get_UserLevel()
	local sUserPro = Get_UserProfession()
	local sUserMeto = Get_UserMetempsychosis() 
	local sLogUserData = sUserName..'['.. sUserId ..']['.. sUserLev ..']['.. sUserPro ..']['.. sUserMeto ..']'

	local sLogFile = "gmlog/action_task_log"
	local sLogText = string.format("360,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end

--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--sText��ʾLog������Ϣ,���磺"0,0,0,0,10002354,2,728596,3"
--sLogFileName��ʾ�洢�ļ���,����zypk ����
function Sys_SaveActionParamLog(sLogFileName,sText)

	if type(sLogFileName) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SaveActionParamLog �� sText ֻ�ܴ��ַ�")
		return
	end

	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SaveActionParamLog �� sText ֻ�ܴ��ַ�")
		return
	end
	
	local sUserName = Get_UserName()
	local sUserId = Get_UserId()
	local sUserLev = Get_UserLevel()
	local sUserPro = Get_UserProfession()
	local sUserMeto = Get_UserMetempsychosis() 
	local sUserAccountId = Get_UserAccountId()
	local sLogUserData = sUserName..'['.. sUserId ..']['.. sUserLev ..']['.. sUserPro ..']['.. sUserMeto ..']['..sUserAccountId..']'

	local sLogFile = "gmlog/"..sLogFileName
	local sLogText = string.format("%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end

--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--sText��ʾLog������Ϣ,���磺"250	8819	1599	"
function Sys_SaveEmoneyBuy(sText)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SaveEmoneyBuy �� sText ֻ�ܴ��ַ�")
		return
	end

	local sUserId = Get_UserId()
	local sUserName = Get_UserName()
	local sUserAccountId = Get_UserAccountId()
	local sLogUserData = sUserId ..'	'.. sUserName ..'	'.. sUserAccountId
	
	local sLogFile = "gmlog/emoney_buy"
	local sLogText = string.format("%s	%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end

--// ��Ӧtype=101���˵��ı�
--// �˵��ı��� ����˵����strText��ʾ��ʾ���ı����ݣ��ɰ����ո�Ҳ��Ϊ���С����ʧ�ܷ���false, �ɹ�����true��
--bool MenuText(string strText, int nline);
--sText��npc�Ի�������
function Sys_DialogText(sText,nline)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_DialogText �� sText ֻ�ܴ��ַ�")
		return
	end

	if string.len(sText) >= 255 then
		Sys_SaveAbnormalLog("���� Sys_DialogText �� sText ����255���ַ�")
		return
	end
	
	if nline == nil then
		nline = 0
	elseif type(nline) ~= "number" or nline < 0 then
		Sys_SaveAbnormalLog("���� Sys_DialogText �� nline ֻ�ܴ����ڵ���0������")
		return
	end

	return MenuText(sText,nline)
end

--// ��Ӧtype=102���˵�������
--// �˵������ӣ�ָ���ѡ����ʾ�����ݡ�����˵��: strText��ʾ��Ҫ��ʾ����������, nAlign��ʾ���뷽ʽ, strFunc��ʾִ�еĺ���.���ʧ�ܷ���false���ɹ�����true.
--bool MenuLink(string strText, int nAlign, string strFunc);
--sOptionText��ʾѡ������
--nAlign��ʾ���뷽ʽ��Ĭ��д0
--fFunc��ʾ���ѡ���ʱ������ĺ���

function Sys_DialogOption(sOptionText,strFunc,nAlign)
	if type(sOptionText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_DialogOption �� sOptionText ֻ�ܴ��ַ�")
		return
	end
	
	if strFunc == nil then
		strFunc = "</F>NULL"
	elseif type(strFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_DialogOption �� strFunc ֻ�ܴ��ַ�")
		return
	end

	if nAlign == nil then
		nAlign = 0
	elseif type(nAlign) ~= "number" or nAlign < 0 or nAlign%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Sys_DialogOption �� nAlign ֻ�ܴ�����0������")
		return
	end

	return MenuLink(sOptionText,nAlign,strFunc)
end


--// ��Ӧtype=103, �˵������
--// �˵������, ָ����������������ݵ������. ����˵��: strText��ʾ������Ϸ�����ʾ����, nAcceptLen��ʾ�����ַ��ĳ���, nPassword����Ƿ�������0, pCallFunc��ʾִ�еĺ���. ���ʧ�ܷ���false, �ɹ�����true.
--bool MenuEdit(string strText, int nAcceptLen, int nPassword, int idTask, string strFunc);
--sText:��ʾ��������ʾ����
--nLen:��ʾ�����ַ��ĳ���
--nPassword:��ʾ���������Ƿ�������д0
--fFunc����ʾִ�еĺ���

function Sys_DialogOptEdit(sText,nLen,sFunc,nPassword)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_DialogOptEdit �� sText ֻ�ܴ��ַ�")
		return
	end
	
	if type(nLen) ~= "number" or nLen <= 0 then
		Sys_SaveAbnormalLog("���� Sys_DialogOptEdit �� nLen ֻ�ܴ�����0����")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_DialogOptEdit �� sFunc ֻ�ܴ��ַ�")
		return
	end
	
	if nPassword == nil then
		nPassword = 0
	elseif type(nPassword) ~= "number" or (nPassword ~= 0 and  nPassword ~= 1) then
		Sys_SaveAbnormalLog("���� Sys_DialogOptEdit �� nPassword ֻ�ܴ�0��1")
		return
	end

	return MenuEdit(sText,nLen,nPassword,string.format("</F>%s",sFunc))
end

--// ��Ӧtype=104, �˵�ͼƬ(NPCʹ��)
--// �˵�ͼƬ. ����˵��: x, y ��ʾͼƬ����������Ի����x, y����; idPic��ʾ����ͼƬ�ڿͻ����µ�npcface.ani�ļ��еı��, strFunc��ʾ���ͼƬִ�еĺ���. ���ʧ�ܷ���false, �ɹ�����true.
--bool MenuPic(int x, int y, int idPic, int idTask, string strFunc);
--nFaceNum :npcͷ����
--x:Ĭ��д10
--y:Ĭ��д10

function Sys_DialogFace(nNpcID)
	local nFaceNum
	if nNpcID == nil then
		nNpcID = 0
	end
	local nNpcLookFace=math.floor(Get_NpcLookface(nNpcID)/10)
	if tNpcFace[nNpcLookFace] ~= nil then		
		nFaceNum=tNpcFace[nNpcLookFace]
	else
	    nFaceNum=9999
	end

	return MenuPic(10,10,nFaceNum,"</F>NULL")
end

--// ��Ӧtype=104, �˵�ͼƬ(��Ʒʹ��)
--// �˵�ͼƬ. ����˵��: x, y ��ʾͼƬ����������Ի����x, y����; idPic��ʾ����ͼƬ�ڿͻ����µ�npcface.ani�ļ��еı��, strFunc��ʾ���ͼƬִ�еĺ���. ���ʧ�ܷ���false, �ɹ�����true.
--bool MenuPic(int x, int y, int idPic, int idTask, string strFunc);
--nFaceNum :npcͷ����
--x:Ĭ��д10
--y:Ĭ��д10
function Sys_DialogItemFace(nItemId)
	local nFaceNum
	if nItemId == nil then
		nItemId = 0
	end

	if tItemFace[nItemId] ~= nil then
		nFaceNum=tItemFace[nItemId]
	else
		nFaceNum=9999
	end
	
	return MenuPic(10,10,nFaceNum,"</F>NULL")
end

--// ��Ӧtype=120, �˵�����
--// �˵�����. ���ʧ�ܷ���false, �ɹ�����true.
--bool MenuCreate(int idTask, string strFunc);
--nGlobalIdTask:ִ�е�task_id
--fFunc:���ǿ�йرյ�ʱ��ִ�еĺ���

function Sys_DialogEnd(strFunc)
	if strFunc == nil then
		strFunc = "</F>NULL"
	elseif type(strFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_DialogEnd �� strFunc ֻ�ܴ��ַ�")
		return
	end
	
	return MenuCreate(0,strFunc)
end



--// ��Ӧtype=105, ����ȷ�϶Ի���
--// ����ȷ�϶Ի���. ����˵��: strText��ʾ���ִ���strFunc��ʾȷ�Ϻ�ִ�еĺ���, pszFailFunc��ʾȡ����ִ�еĺ���. ���ʧ�ܷ���false, �ɹ�����true.
--bool MsgBox(string strText, string strFunc, string strFailFunc);
--sText:��ʾ105��ʾ����
--fFunc:��ʾ���ȷ��ִ�еĺ���
--fFailFunc:��ʾ���ȡ��ִ�еĺ���

function Sys_MsgBox(sText,sFunc,sFailFunc)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_MsgBox �� sText ֻ�ܴ��ַ�")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_MsgBox �� sFunc ֻ�ܴ��ַ�")
		return
	end
	
	if sFailFunc == nil then
		sFailFunc = "NULL"
	elseif type(sFailFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_MsgBox �� sFailFunc ֻ�ܴ��ַ�")
		return
	end

	return MsgBox(sText,string.format("</F>%s",sFunc),string.format("</F>%s",sFailFunc))
end



--// ��Ӧtype=123, ����������ǰʱ��
--// ����������ǰʱ���ʽ. ����˵��: type��ʾָ������Ҫ����ʱ������, strParam��ʾʱ���ʽ. ���ʧ�ܷ���false, �ɹ�����true.
--bool CheckTime(int type, string strParam);

--// ����������ǰʱ��.��ʽΪ:dataָ������Ҫ����ʱ������ 
--		//data=0-��鵱ǰ��������ϸʱ��param= "yy-mm-dd hh:mm yy-mm-dd hh:mm"; 
--		//data=1-�����ĳ��ʱ��param="mm-dd hh:mm mm-dd hh:mm", 
--		//data=2-�����ĳ��ʱ��param="dd hh:mm dd hh:mm", 
--		//data=3-�����ĳ��ʱ��param="dd hh:mm dd hh:mm"(��һ~����Ϊ1~6,����Ϊ0),
--		//data=4-�����ʱ��param="hh:mm hh:mm", 
--		//data=5-���Сʱʱ��param="mm mm"(ÿ��Сʱ�ĵڼ��ֵ��׼���).
--		//��ע��,����action��ʽҪ��,param������,ǰ��һ��ʱ�����Ⱥ���һ��ҪС.

--		//data=0-��鵱ǰ��������ϸʱ��param= "yy-mm-dd hh:mm yy-mm-dd hh:mm"; 
--sParam:��ʾʱ���

function Sys_ChkFullTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_ChkFullTime �� sParam ֻ�ܴ��ַ�")
		return
	end

	return CheckTime(0,sParam)
end

--		//data=1-�����ĳ��ʱ��param="mm-dd hh:mm mm-dd hh:mm", 
function Sys_ChkDateTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_ChkDateTime �� sParam ֻ�ܴ��ַ�")
		return
	end
	
	return CheckTime(1,sParam)
end

--		//data=2-�����ĳ��ʱ��param="dd hh:mm dd hh:mm", 
function Sys_ChkMonthTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_ChkMonthTime �� sParam ֻ�ܴ��ַ�")
		return
	end
	
	return CheckTime(2,sParam)
end

--		//data=3-�����ĳ��ʱ��param="dd hh:mm dd hh:mm"(��һ~����Ϊ1~6,����Ϊ0),
function Sys_ChkWeedTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_ChkWeedTime �� sParam ֻ�ܴ��ַ�")
		return
	end
	
	return CheckTime(3,sParam)
end

--		//data=4-�����ʱ��param="hh:mm hh:mm", 
function Sys_ChkDayTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_ChkDayTime �� sParam ֻ�ܴ��ַ�")
		return
	end
	
	return CheckTime(4,sParam)
end

--		//data=5-���Сʱʱ��param="mm mm"(ÿ��Сʱ�ĵڼ��ֵ��׼���).
function Sys_ChkMinute(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_ChkMinute �� sParam ֻ�ܴ��ַ�")
		return
	end
	
	return CheckTime(5,sParam)
end

--// ��Ӧtype=124, ��ͻ��˷��ͽ�������
--// ��ͻ��˷��ͽ�������. ����˵��: nData��ʾ������. ���ʧ�ܷ���false, �ɹ�����true.
--bool PostCmd(int nData);

function Sys_PostCmd(nData)
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("���� Sys_PostCmd �� nData ֻ�ܴ�����0������")
		return
	end
	
	return PostCmd(nData)
end

--// ��Ӧtype=125, ȫ�������㲥������Ϣ
--// ȫ�������㲥������Ϣ. ����˵��: nData��ʾ�㲥��Ƶ��, strParam��ʾ�㲥������. ���ʧ�ܷ���false, �ɹ�����true.
--bool BrocastMsg(int nData, string strParam);

--// 	const unsigned short _TXTATR_NORMAL		=2000;
--// 	const unsigned short _TXTATR_ACTION		=_TXTATR_NORMAL+2=2002;	// ����
--//	 	const unsigned short _TXTATR_TEAM			=_TXTATR_NORMAL+3=2003;	// ����
--// 	const unsigned short _TXTATR_SYSTEM		=_TXTATR_NORMAL+5=2005;	// ϵͳ������ʾ����Ļ���Ͻ�
--// 	const unsigned short _TXTATR_TALK				=_TXTATR_NORMAL+7=2007;	// ��̸������ʾ����Ļ���½�
--// 	const unsigned short _TXTATR_GM 				=_TXTATR_NORMAL+11=2011;	// GMƵ��������ʾ����Ļ����



--// 	const unsigned short _TXTATR_NORMAL		=2000;
function Sys_NormalBroadcast(sContent)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_NormalBroadcast �� sContent ֻ�ܴ��ַ�")
		return
	end
	
	return BrocastMsg(2000,sContent)
end

--// 	const unsigned short _TXTATR_ACTION		=_TXTATR_NORMAL+2=2002;	// ����
function Sys_ActionBroadcast(sContent)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_ActionBroadcast �� sContent ֻ�ܴ��ַ�")
		return
	end
	
	return BrocastMsg(2002,sContent)
end

--//	 	const unsigned short _TXTATR_TEAM			=_TXTATR_NORMAL+3=2003;	// ����
function Sys_TeamBroadcast(sContent)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_TeamBroadcast �� sContent ֻ�ܴ��ַ�")
		return
	end
	
	return BrocastMsg(2003,sContent)
end

--// 	const unsigned short _TXTATR_SYSTEM		=_TXTATR_NORMAL+5=2005;	// ϵͳ������ʾ����Ļ���Ͻ�
function Sys_SystemBroadcast(sContent)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SystemBroadcast �� sContent ֻ�ܴ��ַ�")
		return
	end
	
	return BrocastMsg(2005,sContent)
end

--// 	const unsigned short _TXTATR_TALK				=_TXTATR_NORMAL+7=2007;	// ��̸������ʾ����Ļ���½�
function Sys_TalkBroadcast(sContent)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_TalkBroadcast �� sContent ֻ�ܴ��ַ�")
		return
	end
	
	return BrocastMsg(2007,sContent)
end

--// 	const unsigned short _TXTATR_GM 				=_TXTATR_NORMAL+11=2011;	// GMƵ��������ʾ����Ļ����
function Sys_GmBroadcast(sContent)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_GmBroadcast �� sContent ֻ�ܴ��ַ�")
		return
	end
	
	return BrocastMsg(2011,sContent)
end

--// ��Ӧtype=131, �Զ�Ѱ·����
--// �Զ�Ѱ·. ����˵��: idUser��ʾ���id,��0��ʾ��ǰ���; nPosX, nPosY��ʾx��y����. idNpc��ʾѰ·��Ҫ�ҵ�npc, ���д0�Ļ����򲻻ᵯ���Ի�, idMap��ʾnpc���ڵĵ�ͼ. ���ʧ�ܷ���false, �ɹ�����true.
--bool GotoSomeWhere(int idUser, int nPosX, int nPosY, int idNpc, int idMap);
--nUserId:���id����ǰ���Ĭ��ֵΪ0
--nPosX��X����
--nPosY��Y����
--nNpcId��Ѱ·��Ҫ�ҵ�npcId��д0��Ѱ·�󲻵�������
--nMapId��Ѱ·��npc���ڵĵ�ͼid

function Sys_GotoSomeWhere(nPosX,nPosY,nMapId,nNpcId,nUserId)
	if type(nPosX) ~= "number" or nPosX < 0 then
		Sys_SaveAbnormalLog("���� Sys_GotoSomeWhere �� nPosX ֻ�ܴ������0����")
		return
	end
	
	if type(nPosY) ~= "number" or nPosY < 0 then
		Sys_SaveAbnormalLog("���� Sys_GotoSomeWhere �� nPosY ֻ�ܴ������0����")
		return
	end
	
	if type(nMapId) ~= "number" or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_GotoSomeWhere �� nMapId ֻ�ܴ�����0����")
		return
	end
	
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Sys_GotoSomeWhere �� nNpcId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Sys_GotoSomeWhere �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return GotoSomeWhere(nUserId,nPosX,nPosY,nNpcId,nMapId)
end
----= 1650			//����Ϣ֪ͨ�ͻ��˵�ѡĿ��,data=���������action_id��param=[���ͼƬid����Ӧ�ͻ���Cursor.ini�ļ�¼]
--
----//����Ϣ֪ͨ�ͻ��˵�ѡĿ�꣬����˵����idUserָ���ID��idMouseTypeָ����ѡ�����ͣ�pszCallLuaFuncָ��ѡ���Ҫ�����LUA���������ʧ�ܷ���false�����򷵻�true��
----MouseWaitClick(OBJID idUser, OBJID idMouseType, LPCTSTR pszCallLuaFunc)

--nMouseType:��ʾ����ѡ������--��õ��"22"����ϸ��Cursor.ini  -->   õ����꣨22-23-1010��
--sFunc:��ʾ��ѡ���Ҫ�����LUA����--��"Func_Next"
--nUserId:��ʾ��ҵ�ID--Ĭ��0Ϊ��ǰ���

function Sys_MouseWaitClick(nMouseType,sFunc,nUserId)
	if type(nMouseType) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_MouseWaitClick �� nMouseType ֻ�ܴ�����0������")
		return
	end

	if type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_MouseWaitClick �� sFunc ֻ�ܴ��ַ�")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_MouseWaitClick �� nUserId ֻ�ܴ�����0������")
		return
	end

	return MouseWaitClick(nUserId,nMouseType,string.format("</F>%s",sFunc))
end

----	= 1651			//�жϵ�ѡĿ������� data��1��ʾ��npc��param=��npc���֡�;data��2��ʾ�����param=������id��;data��3��ʾ�жϵ�ѡ����Ա��ж�param=���Ա�id�� 1�У�2Ů
--
----//�жϵ�ѡĿ������ͣ�����˵����idUserָ���ID,nTargetTypeָ���ȵ����ͣ���ӦCHOSEN_TYPE��szParamָ��ѡ��Ĳ������������ʧ�ܷ���false�����򷵻�true��
----MouseJudgeType(OBJID idUser, OBJID idChosenTarget, int nTargetType, const char* szParam)

----npc:1
--sParam����ʾ��ѡNPC������ "����NPC"
--nUserId����ʾ��ҵ�ID--Ĭ��0Ϊ��ǰ���

function Sys_NpcMouseType(sParam,nUserId)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_NpcMouseType �� sParam ֻ�ܴ��ַ�")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_NpcMouseType �� nUserId ֻ�ܴ�����0������")
		return
	end
	return MouseJudgeType(nUserId,1,sParam)
end

----monstertype:2
function Sys_MonsterMouseType(sParam,nUserId)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_NpcMouseType �� sParam ֻ�ܴ��ַ�")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_NpcMouseType �� nUserId ֻ�ܴ�����0������")
		return
	end
	return MouseJudgeType(nUserId,2,sParam)
end

----usersex:3
function Sys_UserSexMouseType(sParam,nUserId)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_NpcMouseType �� sParam ֻ�ܴ��ַ�")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_NpcMouseType �� nUserId ֻ�ܴ�����0������")
		return
	end
	return MouseJudgeType(nUserId,3,sParam)
end


----= 1652			//�����ҵ�ǰָ��ѡȡ״̬ ���������������ҵ�ǰָ��ѡȡ״̬��action��������ִ�и�action���·���Ϣ���ͻ���
--
----//�����ҵ�ǰ���ѡȡ״̬������˵����idUserָ���ID�����ʧ�ܷ���false�����򷵻�true��
----MouseClearStatus(OBJID idUser)

function Sys_MouseClearStatus(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_MouseClearStatus �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	return MouseClearStatus(nUserId)
end

--
----= 1653			//��ѡĿ���״̬�����޸�	 ��action��param�ĸ�ʽΪ��status [�ո�]������[�ո�]������ֵ��
--
----//����ѡĿ���״̬��飬����˵����idUserָ���ID��nStatusָ��Ҫ����״̬�����ʧ�ܷ���false�����򷵻�true��
----bool MouseCheckStatus(OBJID idUser, int nStatus)
--
--function Sys_MouseCheckStatus(nUserId,nStatus)
--	nUserId = nUserId or 0
--	if nStatus then
--		return MouseCheckStatus(nUserId,nStatus)
--	end
--end
--
----//��������ѡĿ���״̬������˵����idUserָ���ID��nStatusָ��Ҫ���õ�״̬�����ʧ�ܷ���false�����򷵻�true��
----bool MouseSetStatus(OBJID idUser, int nStatus)
--
--function Sys_MouseSetStatus(nUserId,nStatus)
--	nUserId = nUserId or 0
--	if nStatus then
--		return MouseSetStatus(nUserId,nStatus)
--	end
--end

--ɾ����ǰ����ѡ��NPC����
--nUserId��ʾ�û�id.
--���ʧ�ܷ���false�����򷵻�true��
function Sys_MouseDeleteChosen(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Sys_MouseDeleteChosen ��һ������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return MouseDeleteChosen(nUserId)
end




--// ����cq_dyna_global_data��data0-data5�ֶ�ֵ. ����˵��: id��ʾ���е�id�ֶ�ֵ
--ʧ�ܷ���false,���򷵻�true��
function Sys_ResetAllSynaGlobalData(nGlobalId)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_ResetSynaGlobalData �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	return ResetAllSynaGlobalData(nGlobalId)
end

--// ����cq_dyna_global_data��datastr0-datastr5�ֶ�ֵ. ����˵��: id��ʾ���е�id�ֶ�ֵ
--ʧ�ܷ���false,���򷵻�true��
function Sys_ResetAllSynaGlobalDataStr(nGlobalId)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_ResetAllSynaGlobalDataStr �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	return ResetAllSynaGlobalDataStr(nGlobalId)
end

--// ����cq_dyna_global_data��time0-time5�ֶ�ֵ. ����˵��: id��ʾ���е�id�ֶ�ֵ
--ʧ�ܷ���false,���򷵻�true��
function Sys_ResetAllSynaGlobalTime(nGlobalId)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_ResetAllSynaGlobalTime �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	return ResetAllSynaGlobalTime(nGlobalId)
end



--// ����cq_dyna_global_data��data0-data5�ֶ�ֵ. ����˵��: id��ʾ���е�id�ֶ�ֵ, idx��ʾSCRIPT_PARAM_DYNA_GLOBAL_DATA0��ö��ֵ�� nData��ʾ���õ�ֵ. ���ʧ�ܷ���false���ɹ�����true.
--bool SetSynaGlobalData(int id, int nPos, int nData);
--data 0
function Sys_SetSynaGlobalData0(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData0 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData0 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA0,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA1 		= 2203;
function Sys_SetSynaGlobalData1(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData1 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData1 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA1,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA2		= 2204;
function Sys_SetSynaGlobalData2(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData2 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData2 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA2,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA3		= 2205;
function Sys_SetSynaGlobalData3(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData3 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData3 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA3,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA4		= 2206;
function Sys_SetSynaGlobalData4(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData4 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData4 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA4,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA5		= 2207;
function Sys_SetSynaGlobalData5(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData5 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData5 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA5,nData)
end

--// ����cq_dyna_global_data��datastr0-datastr5�ֶ�ֵ. ����˵��: id��ʾ���е�id�ֶ�ֵ, idx��ʾSCRIPT_PARAM_DYNA_GLOBAL_DATASTR0��ö��ֵ��strData��ʾ���õĴ�. ���ʧ�ܷ���false���ɹ�����true.
--bool SetSynaGlobalDataStr(int id, int nPos, string strData);
--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR0	= 2208;
function Sys_SetSynaGlobalDataStr0(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr0 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr0 �� sText ֻ�ܴ��ַ�")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR0,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR1	= 2209;
function Sys_SetSynaGlobalDataStr1(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr1 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr1 �� sText ֻ�ܴ��ַ�")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR1,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR2	= 2210;
function Sys_SetSynaGlobalDataStr2(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr2 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr2 �� sText ֻ�ܴ��ַ�")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR2,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR3	= 2211;
function Sys_SetSynaGlobalDataStr3(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr3 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr3 �� sText ֻ�ܴ��ַ�")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR3,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR4	= 2212;
function Sys_SetSynaGlobalDataStr4(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr4 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr4 �� sText ֻ�ܴ��ַ�")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR4,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR5	= 2213;
function Sys_SetSynaGlobalDataStr5(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr5 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr5 �� sText ֻ�ܴ��ַ�")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR5,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME0		= 2214;
--// ����cq_dyna_global_data��time0-time5�ֶ�ֵ. ����˵��: id��ʾ���е�id�ֶ�ֵ, idx��ʾSCRIPT_PARAM_DYNA_GLOBAL_TIME0��ö��ֵ�� nData��ʾ���õ�ֵ. ���ʧ�ܷ���false���ɹ�����true.
--bool SetSynaGlobalTime(int id, int nPos, int nData);
function Sys_SetSynaGlobalTime0(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime0 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime0 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME0,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME1		= 2215;
function Sys_SetSynaGlobalTime1(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime1 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime1 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME1,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME2		= 2216;
function Sys_SetSynaGlobalTime2(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime2 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime2 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME2,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME3		= 2217;
function Sys_SetSynaGlobalTime3(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime3 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime3 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME3,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME4		= 2218;
function Sys_SetSynaGlobalTime4(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime4 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime4 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME4,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME5		= 2219;
function Sys_SetSynaGlobalTime5(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime5 �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime5 �� nData ֻ�ܴ�����")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME5,nData)
end

-- ����cq_dyna_global_data��data0-data5�ֶ�ֵ
function Sys_SetSynaGlobalData(nGlobalId,nPos,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData �� nData ֻ�ܴ�����")
		return
	end
	
	if type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 or nPos > 5 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalData �� nPos ֻ�ܴ�0~5֮�������")
		return
	end
	
	local nIndex = 0
	
	if nPos == 0 then
		nIndex = G_DYNA_GLOBAL_DATA0
	elseif nPos == 1 then
		nIndex = G_DYNA_GLOBAL_DATA1
	elseif nPos == 2 then
		nIndex = G_DYNA_GLOBAL_DATA2
	elseif nPos == 3 then
		nIndex = G_DYNA_GLOBAL_DATA3
	elseif nPos == 4 then
		nIndex = G_DYNA_GLOBAL_DATA4
	elseif nPos == 5 then
		nIndex = G_DYNA_GLOBAL_DATA5
	end

	return SetSynaGlobalData(nGlobalId,nIndex,nData)
end

-- ����cq_dyna_global_data��datastr0-datastr5�ֶ�ֵ
function Sys_SetSynaGlobalDataStr(nGlobalId,nPos,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr �� sText ֻ�ܴ��ַ�")
		return
	end
	
	if type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 or nPos > 5 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalDataStr �� nPos ֻ�ܴ�0~5֮�������")
		return
	end
	
	local nIndex = 0
	
	if nPos == 0 then
		nIndex = G_DYNA_GLOBAL_DATASTR0
	elseif nPos == 1 then
		nIndex = G_DYNA_GLOBAL_DATASTR1
	elseif nPos == 2 then
		nIndex = G_DYNA_GLOBAL_DATASTR2
	elseif nPos == 3 then
		nIndex = G_DYNA_GLOBAL_DATASTR3
	elseif nPos == 4 then
		nIndex = G_DYNA_GLOBAL_DATASTR4
	elseif nPos == 5 then
		nIndex = G_DYNA_GLOBAL_DATASTR5
	end

	return SetSynaGlobalDataStr(nGlobalId,nIndex,sText)
end

-- ����cq_dyna_global_data��time0-time5�ֶ�ֵ
function Sys_SetSynaGlobalTime(nGlobalId,nPos,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime �� nGlobalId ֻ�ܴ�����0������")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime �� nData ֻ�ܴ�����")
		return
	end
	
	if type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 or nPos > 5 then
		Sys_SaveAbnormalLog("���� Sys_SetSynaGlobalTime �� nPos ֻ�ܴ�0~5֮�������")
		return
	end
	
	local nIndex = 0
	
	if nPos == 0 then
		nIndex = G_DYNA_GLOBAL_TIME0
	elseif nPos == 1 then
		nIndex = G_DYNA_GLOBAL_TIME1
	elseif nPos == 2 then
		nIndex = G_DYNA_GLOBAL_TIME2
	elseif nPos == 3 then
		nIndex = G_DYNA_GLOBAL_TIME3
	elseif nPos == 4 then
		nIndex = G_DYNA_GLOBAL_TIME4
	elseif nPos == 5 then
		nIndex = G_DYNA_GLOBAL_TIME5
	end

	return SetSynaGlobalTime(nGlobalId,nIndex,nData)
end



--���ö�ʱ����������ʱ��ɺ󴥷�ָ���ĺ���
--nInterval ��ʱʱ������λ����
--sFunc ��ʱ��ɺ�ִ�еĺ���
--����Sys_SetLuaTimer(10,"</F>sFunc")
function Sys_SetLuaTimer(nInterval,sFunc)
	if type(nInterval) ~= "number" or nInterval%1 ~= 0 or nInterval <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetLuaTimer ��һ������nIntervalΪ�����Ҵ���0")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetLuaTimer �ڶ�������sFuncΪ�ַ���")
		return
	end
	
	return SetLuaTimer(nInterval,string.format("</F>%s",sFunc))
end

--���ö�ʱ��������ָ��id��ʱ����
--nTimerId ��ʱ��id.
--nInterval ��ʱʱ������λ����.
--����Sys_SetLuaEventTimer(1000,10)
function Sys_SetLuaEventTimer(nTimerId,nInterval)
	if type(nTimerId) ~= "number" or nTimerId%1 ~= 0 or nTimerId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetLuaEventTimer ��һ������nTimerIdΪ�����Ҵ���0")
		return
	end
	
	if type(nInterval) ~= "number" or nInterval%1 ~= 0 or nInterval <= 0 then
		Sys_SaveAbnormalLog("���� Sys_SetLuaEventTimer �ڶ�������nIntervalΪ�����Ҵ���0")
		return
	end
	
	return SetLuaEventTimer(nTimerId,nInterval)
end

--��鶨ʱ���Ƿ���ڡ�
--nTimerId ��ʱ��id.
--����Sys_ChkLuaEventTimer(1000)
function Sys_ChkLuaEventTimer(nTimerId)
	if type(nTimerId) ~= "number" or nTimerId%1 ~= 0 or nTimerId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_ChkLuaEventTimer ��һ������nTimerIdΪ�����Ҵ���0")
		return
	end

	return ChkLuaEventTimer(nTimerId)
end

--ɾ����ʱ����
--nTimerId ��ʱ��id.
--����Sys_DelLuaEventTimer(1000)
function Sys_DelLuaEventTimer(nTimerId)
	if type(nTimerId) ~= "number" or nTimerId%1 ~= 0 or nTimerId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_KillLuaEventTimer ��һ������nTimerIdΪ�����Ҵ���0")
		return
	end

	return KillLuaEventTimer(nTimerId)
end

--�������.
--nNumber һ�ι������� 0��ʼ��1�м���䣬2������ֻ��һ��������2.
--sText ÿ�й�������
--nUserId �û�id ��ȱʡ
--����Sys_SetMenuNotice(0,"��һ��",0)||Sys_MenuNotice(0,"��һ��")
function Sys_SetMenuNotice(nNumber,sText,nUserId)
	if type(nNumber) ~= "number" or nNumber%1 ~= 0 or nNumber < 0 or nNumber > 2 then
		Sys_SaveAbnormalLog("���� Sys_SetMenuNotice ��һ������nNumberΪ�����ҷ�Χ��0--2")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetMenuNotice �ڶ�������sTextΪ�ַ���")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("���� Sys_SetMenuNotice ����������nUserIdΪ���Ͳ��Ҵ��ڵ���0")
		return
	end
	
	return MenuNotice(nUserId,nNumber,sText)
end

--��BBS������У����һ��SYSTEMƵ������Ϣ��������Ϊ��SYSTEM��. 
--sParam����Ϣ����. 
--���ʧ�ܷ���false, �ɹ�����true.
function Sys_SetEventBBS(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_SetEventBBS ��һ������sParamΪ�ַ���")
		return
	end
	
	return EventBBS(sParam)
end

-- //ȫ���������ɸѡ�� ����˵����idInviteΪ��ʶ��ţ���1~6���� param="attr opt data"��attr��ѡ��Ҫ��֧��һ�����͵�������飺"pk" (==,>=,<=) // "profession" (==,>=,<=) "level" (==,>=,<=)"rankshow" (==,>=,<=)
-- //"metempsychosis" (==,>=,<=) "battlelev" (==,>=,<=)���з�������ɸѡ��ʱ��ֻ����param��ǰ���һ����ʶ��žͺ��ˣ��磺'level >= 60 level <= 90'����ʾɸѡ60~90��������
-- ACTION_SYS_INVITE_FILTER			= 129,			// ȫ���������ɸѡ��
function Sys_InviteFilter(nInivteId,sParam)
	if type(nInivteId) ~= "number" or nInivteId%1 ~= 0 or nInivteId < 1 or nInivteId > 6 then
		Sys_SaveAbnormalLog("���� Sys_InviteFilter ���� nInivteId ֻ�ܴ�1��6������")
		return
	end
	
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("���� Sys_InviteFilter ���� sParam ֻ�ܴ��ַ�")
		return
	end
	
	return InviteFilter(nInivteId,sParam)
end

-- //ɾ��ȫ��������󡣲���˵����idInviteΪ��ʶ��ţ���1~6��
-- ACTION_SYS_INVITE_FILTER			= 129,			// ȫ���������ɸѡ��
function Sys_DelInvite(nInivteId)
	if type(nInivteId) ~= "number" or nInivteId%1 ~= 0 or nInivteId < 1 or nInivteId > 6 then
		Sys_SaveAbnormalLog("���� Sys_DelInvite ���� nInivteId ֻ�ܴ�1��6������")
		return
	end
	
	return DelInvite(nInivteId)
end

-- // ȫ�����봫�ͣ�����˵����idMap nTransPosx1 nTransPosy1 nTransPosx2 nTransPosy2 nTransPosx3 nTransPosy3 nTransPosx4 nTransPosy4 nTransPosx5 nTransPosy5 nTransPosx6 nTransPosy6 nTransPosx7 nTransPosy7 nTransPosx8 nTransPosy8
-- // ��Ӧ��¼��ͼid��8����ŵ�����,������ڸ�actionִ��ʱ�����ڴ��м�¼ȫ����������ʹ�������,idStrSendInvite��������յ��ͻ����ύ�Ľ����������Ϣ�󣬼�������Ƿ����ڴ��¼�������б���,
-- // ��������������б��У����ȱ�����ҵ�ǰ���꣬�ٸ������õĵ�ͼid����ŵ����꣬���ѡȡ����һ�����꣬������Ҵ��͵��������ϣ�����idStrTransOK�´��������,idInviteΪ��ʶ��ţ���1~6��,nCloseSecs(��)��ȫ������Ĺرյ���ʱ����
-- tTransPosx Ϊ�����ı� ��ʽΪ tTransPosx[1]["X"],tTransPosx[1]["Y"]
-- ACTION_SYS_INVITE_TRANS			 = 130,		// ȫ�����봫��
function Sys_InviteTrans(nMapId,tTransPosx,nStrSendInviteId,nStrTransOKId,nInviteId,nCloseSecs)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_InviteTrans ���� nMapId ֻ�ܴ�����0������")
		return
	end
	
	if type(nStrSendInviteId) ~= "number" or nStrSendInviteId%1 ~= 0 or nStrSendInviteId < 0 then
		Sys_SaveAbnormalLog("���� Sys_InviteTrans ���� nStrSendInviteId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nStrTransOKId) ~= "number" or nStrTransOKId%1 ~= 0 or nStrTransOKId < 0 then
		Sys_SaveAbnormalLog("���� Sys_InviteTrans ���� nStrTransOKId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nInviteId) ~= "number" or nInviteId%1 ~= 0 or nInviteId < 0 then
		Sys_SaveAbnormalLog("���� Sys_InviteTrans ���� nInviteId ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(nCloseSecs) ~= "number" or nCloseSecs%1 ~= 0 or nCloseSecs < 0 then
		Sys_SaveAbnormalLog("���� Sys_InviteTrans ���� nCloseSecs ֻ�ܴ����ڵ���0������")
		return
	end
	
	if type(tTransPosx) ~= "table" then
		Sys_SaveAbnormalLog("���� Sys_InviteTrans ���� tTransPosx ֻ�ܴ����ȥ")
		return
	end
	
	for i,v in pairs(tTransPosx) do
		if type(v["X"]) ~= "number" or v["X"]%1 ~= 0 or v["X"] < 0 then
			local str = string.format("���� Sys_InviteTrans ���� tTransPosx �� ��%d���X ֻ�ܴ������0������",i)
			Sys_SaveAbnormalLog(str)
			return
		end
		
		if type(v["Y"]) ~= "number" or v["Y"]%1 ~= 0 or v["Y"] < 0 then
			local str = string.format("���� Sys_InviteTrans ���� tTransPosx �� ��%d���Y ֻ�ܴ������0������",i)
			Sys_SaveAbnormalLog(str)
			return
		end
	end
	
	local nTransPosx1 = tTransPosx[1]["X"]
	local nTransPosy1 = tTransPosx[1]["Y"]
	
	local nTransPosx2 = tTransPosx[2]["X"]
	local nTransPosy2 = tTransPosx[2]["Y"]
	
	local nTransPosx3 = tTransPosx[3]["X"]
	local nTransPosy3 = tTransPosx[3]["Y"]
	
	local nTransPosx4 = tTransPosx[4]["X"]
	local nTransPosy4 = tTransPosx[4]["Y"]
	
	local nTransPosx5 = tTransPosx[5]["X"]
	local nTransPosy5 = tTransPosx[5]["Y"]
	
	local nTransPosx6 = tTransPosx[6]["X"]
	local nTransPosy6 = tTransPosx[6]["Y"]
	
	local nTransPosx7 = tTransPosx[7]["X"]
	local nTransPosy7 = tTransPosx[7]["Y"]
	
	local nTransPosx8 = tTransPosx[8]["X"]
	local nTransPosy8 = tTransPosx[8]["Y"]
	
	return InviteTrans(nMapId,nTransPosx1,nTransPosy1,nTransPosx2,nTransPosy2,nTransPosx3,nTransPosy3,nTransPosx4,nTransPosy4,nTransPosx5,nTransPosy5,nTransPosx6,nTransPosy6,nTransPosx7,nTransPosy7,nTransPosx8,nTransPosy8,nStrSendInviteId,nStrTransOKId,nInviteId,nCloseSecs)
end

--------------------------------2015.5.25-------------------------------------
-- ����lua�ӿں�����
-- FirstCreateCountry(unsigned int idSyn)
-- ����1:��ʤ����id
-- �޷���ֵ

-- �ýӿ����ڰ���սʤ�����Զ��������˲�����Ϊ���ҡ��ӿ����н���һϵ���жϣ�ֻ��Ҫ�ڰ���ս����ü��ɡ�
function Sys_FirstCreateCountry(nSynId)
	if type(nSynId) ~= "number" or nSynId%1 ~= 0 or nSynId <= 0 then
		Sys_SaveAbnormalLog("���� Sys_FirstCreateCountry ���� nSynId ֻ�ܴ�����0������")
		return
	end 

	return FirstCreateCountry(nSynId)
end

-- �жϱ����Ƿ��й��ң�ִ���ˣ����޲���������ֵ���������ִ���˷���ture�����򷵻�false
-- bool HaveCountry()
function Sys_HaveCountry()
	return HaveCountry()
end

--------------------------------�ǳ���ӿں�����װ-------------------------------------
--���ڰ�һ���ַ����ָ���ַ������飬�洢�ڱ��С�
--sFullString ���ָ�������ַ���
--sSeparator �ָ��
--����local a = Sys_Split("123,12,abc",",") ,����a = {"123","12","abc"}��
function Sys_Split(sFullString, sSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
		local nFindLastIndex = string.find(sFullString, sSeparator, nFindStartIndex)
		if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(sFullString, nFindStartIndex, string.len(sFullString))
			break
		end
	nSplitArray[nSplitIndex] = string.sub(sFullString, nFindStartIndex, nFindLastIndex - 1)
	nFindStartIndex = nFindLastIndex + string.len(sSeparator)
	nSplitIndex = nSplitIndex + 1
	end
	
	return nSplitArray
end

--�򵥵�������ʺ���
--"nStartNum,nEndNum"��"10 100"��ʾ��1/10�Ļ�����true��
function Sys_Random(nStartNum,nEndNum)
	local nNum = math.random(1,nEndNum)
	if nNum <= nStartNum then
		return true
	else
		return false
	end
end

--�������ְ�������,�������ǵĵ�ͼ����
--nConNum ������ͼ����
--nTotalNum �ܵĵ�ͼ����ֵ
function Sys_ParseNumbersContain(nConNum,nTotalNum)
	local nPow = 0
	local nTemp = 0
	local bBool = false
	while nTotalNum ~= 0 and nTotalNum ~= nil do
		nTemp = nTotalNum % 2
		
		if nTemp ~= 0 then
			if nConNum == 2 ^ nPow then
				bBool = true
				break
			end
		end

		nPow = nPow + 1
		nTotalNum = (nTotalNum - nTemp) / 2
	end
	return bBool
end

-- ��Ӧactiontype = 113
-- ����Ի���Task����
-- ����1��idUser��ʾ���ID, ��0��ʾ�Լ������ʧ�ܷ���false���ɹ�����true.
-- bool MenuTaskClear(UINT idUser);
function Sys_DialogTaskClear()
	return MenuTaskClear(0)
end

----- 2015.10.13 ----------
-- #�ж��Ƿ�򿪶�������
-- ��ӦACTION:1053
-- LUA�ӿڣ�IsOpenSecondPWD
-- ����1�����id
-- ����ֵ��true��ʾ�򿪶������� false��ʾû�д򿪶�������
function Sys_IsOpenSecondPWD(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Sys_IsOpenSecondPWD �� nUserId ֻ�ܴ����ڵ���0������")
		return
	end
	return IsOpenSecondPWD(nUserId)
end

-- #�ж��ʺŷ������Ƿ���������
-- ��ӦACTION:1215
-- LUA�ӿڣ�IsAccountServerNormal
-- ��������
-- ����ֵ��true��ʾ�������� false��ʾ���ӶϿ�
function Sys_IsAccountServerNormal()
	return IsAccountServerNormal()
end

-- #�жϵ�ǰ�Ƿ��ڸ÷�����
-- ��ӦACTION:1213
-- LUA�ӿڣ�CheckServerName
-- ����������������
-- ����ֵ��true��ʾ��ǰ�����������봫�������������ͬ false��ʾ��ǰ�����������봫����������Ʋ�ͬ
function Sys_CheckServerName(sServerName)
	if type(sServerName) ~= "string" or sServerName == nil then
		Sys_SaveAbnormalLog("���� Sys_CheckServerName �� sServerName ֻ�ܴ��ַ�")
		return
	end
	return CheckServerName(sServerName)
end

-- #�ж�ת���������Ƿ�������
-- ��ӦACTION:1205
-- LUA�ӿڣ�IsChangeServerEnable
-- ��������
-- ����ֵ��true��ʾת�������������� false��ʾת��������δ����
function Sys_IsChangeServerEnable()
	return IsChangeServerEnable()
end

-- #�ж�ת���������Ƿ����
-- ��ӦACTION:1214
-- LUA�ӿڣ�IsChangeServerIdle
-- ��������
-- ����ֵ��true��ʾת������������ falseת��������æ
function Sys_IsChangeServerIdle()
	return IsChangeServerIdle()
end