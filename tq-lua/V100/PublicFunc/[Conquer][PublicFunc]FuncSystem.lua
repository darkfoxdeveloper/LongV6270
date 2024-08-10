----------------------------------------------------------------------------
--Name:		[征服][公用函数]系统函数.lua
--Purpose:	系统函数接口
--Creator: 	林锦
--Created:	2014/06/26
----------------------------------------------------------------------------
---------------------------------命名规范----------------------------------
------------------------------actiontype的分类------------------------------
--Sys  系统所有
--Send 消息发送
--Get  获得属性
--Set  修改属性
--Chk  检查属性
--Del  删除属性
--Add  添加属性
------------------------------------------------------------------------------
-- 系统函数命名前缀词：Sys_
--例子：
--// 对应type=101，菜单文本
--// 菜单文本。 参数说明：strText表示显示的文本内容，可包含空格，也可为空行。如果失败返回false, 成功返回true。
--bool MenuText(string strText);

--function Sys_MenuText(sText)
--
--end

------------------------------------------------------------------------------

-- 用于脚本制作过程测试使用的log接口
-- 参数说明： 存放在log文件里面的内容
function Sys_SaveAbnormalLog(sText)
	local sPath = "syslog/AbnormalLog"

	SaveCustomLog(sPath,tostring(sText))
end




--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--外怪监狱：410
--sText表示Log配置信息,例如："0,0,0,0,10002354,2,728596,3"
function Sys_SaveActionLog(sText,nNowUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveActionLog 中 sText 只能传字符")
		return
	end
	
	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId) 
	local nUserMapId = Get_UserMapId(nUserId)
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..'][' .. nUserMapId .. ']'

	local sLogFile = "gmlog/action_log"
	local sLogText = string.format("410,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end



--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--功能性脚本：340
--sText表示Log配置信息,例如："0,0,0,0,10002354,2,728596,3"
function Sys_SaveActionFuncLog(sText,nNowUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveActionFuncLog 中 sText 只能传字符")
		return
	end
	
	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId) 
	local nUserMapId = Get_UserMapId(nUserId)
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..'][' .. nUserMapId .. ']'

	local sLogFile = "gmlog/action_func_log"
	local sLogText = string.format("340,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end




--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--活动脚本：350
--sText表示Log配置信息,例如："0,0,0,0,10002354,2,728596,3"
function Sys_SaveActionFestivalLog(sText,nNowUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveActionFestivalLog 中 sText 只能传字符")
		return
	end

	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId) 
	local nUserMapId = Get_UserMapId(nUserId)
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..'][' .. nUserMapId .. ']'

	local sLogFile = "gmlog/action_festival_log"
	local sLogText = string.format("350,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end



--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--任务脚本：360
--sText表示Log配置信息,例如："0,0,0,0,10002354,2,728596,3"
function Sys_SaveActionTaskLog(sText,nNowUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveActionTaskLog 中 sText 只能传字符")
		return
	end
	
	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId)
	local nUserMapId = Get_UserMapId(nUserId)
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..'][' .. nUserMapId .. ']'

	local sLogFile = "gmlog/action_task_log"
	local sLogText = string.format("360,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end

-- 做一个专门存放龙灵log的文件夹
function Sys_SaveDragonSoulLog(sText,nNowUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveDragonSoulLog 中 sText 只能传字符")
		return
	end
	
	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId)
	local nUserMapId = Get_UserMapId(nUserId)
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..'][' .. nUserMapId .. ']'

	local sLogFile = "gmlog/action_DragonSoul_log"
	local sLogText = string.format("350,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end
-- 存放十八变的log
function Sys_SaveEighteenChangesLog(sText,nNowUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveMelterLog 中 sText 只能传字符")
		return
	end
	
	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId)
	local nUserMapId = Get_UserMapId(nUserId)
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..'][' .. nUserMapId .. ']'

	local sLogFile = "gmlog/action_EighteenChanges_log"
	local sLogText = string.format("350,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end

-- 存放排行榜玩家stc数据的Log
function Sys_SaveRankingListLog(nType,nSubType,nData,nNowUserId)
	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId)
	local nUserMapId = Get_UserMapId(nUserId)
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..'][' .. nUserMapId .. ']'
	local sText = nType .. "," .. nSubType .. ",0,0,20000000,0," .. nData .. ",0"

	local sLogFile = "gmlog/action_rank_log"
	local sLogText = string.format("350,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end

--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--sText表示Log配置信息,例如："0,0,0,0,10002354,2,728596,3"
--sLogFileName表示存储文件名,例如zypk 传入
function Sys_SaveActionParamLog(sLogFileName,sText,nNowUserId)
	if type(sLogFileName) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveActionParamLog 中 sText 只能传字符")
		return
	end

	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveActionParamLog 中 sText 只能传字符")
		return
	end
	
	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId) 
	local nUserAccountId = Get_UserAccountId(nUserId)
	local nUserMapId = Get_UserMapId(nUserId)
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..']['..nUserAccountId..'][' .. nUserMapId .. ']'

	local sLogFile = "gmlog/"..sLogFileName
	local sLogText = string.format("%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end

--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--sText表示Log配置信息,例如："250	8819	1599	"
function Sys_SaveEmoneyBuy(sText,nNowUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveEmoneyBuy 中 sText 只能传字符." .. tostring(sText))
		return
	end
	
	if not string.find(sText,'^%d+\t%d+\t--*%d+\t--*%d+\t--*%d+\t$') then
		Sys_SaveAbnormalLog("函数 Sys_SaveEmoneyBuy 中 log格式有误:" .. sText)
		return
	end

	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local sUserAccountId = Get_UserAccountId(nUserId)
	local sLogUserData = nUserId ..'	'.. sUserName ..'	'.. sUserAccountId
	
	local sLogFile = "gmlog/emoney_buy"
	local sLogText = string.format("%s	%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end

-- 自动打log记录，地图传送的log
function Sys_SetMapLog(nNowUserId,nMapId,nCellx,nCelly,nBoundCX,nBoundCY)
	local nUserId = nNowUserId
	if nUserId == 0 or nUserId == nil then
		nUserId = Get_UserId()
	end
	local sUserName = Get_UserName(nUserId)
	local nNowMapId = Get_UserMapId(nUserId)
	local nNowCellx = Get_UserPositionX(nUserId)
	local nNowCellY = Get_UserPositionY(nUserId)
	local nChgMapId = nMapId or nNowMapId
	local nChgCellx = nCellx or 0
	local nChgCelly = nCelly or 0
	local nChgBoundCX = nBoundCX or 0
	local nChgBoundCY = nBoundCY or 0
	local sLog = string.format("%d,%s,%d,%d,%d,传送的地图信息：%d,%d,%d,%d,%d",nUserId,sUserName,nNowMapId,nNowCellx,nNowCellY,nChgMapId,nChgCellx,nChgCelly,nChgBoundCX,nChgBoundCY)
	return sLog
end
-- 自动打log记录，stc掩码的log
function Sys_SetStcLog(nEvent,nType,nData,nNowUserId)
	-- 判断掩码段
	if nEvent <= 162 or nEvent >= 900 then
		return
	end
	local nUserId = nNowUserId or Get_UserId()
	if nUserId == 0 or nUserId == nil then
		nUserId = Get_UserId()
	end
	local sUserName = Get_UserName(nUserId)
	local sLog = string.format("%d,%s,掩码记录:%d,%d,%d",nUserId,sUserName,nEvent,nType,nData)
	Sys_SaveMapLog(sLog)
end
-- 自动打log记录，删除物品的log
function Sys_SetDelItemLog(nItemId,nNowUserId)
	local nUserId = nNowUserId or Get_UserId()
	if nUserId == 0 or nUserId == nil then
		nUserId = Get_UserId()
	end
	local sUserName = Get_UserName(nUserId)
	local sLog = string.format("%d,%s,删除物品记录:%d",nUserId,sUserName,nItemId)
	Sys_SaveMapLog(sLog)
end
function Sys_SaveMapLog(sLog)
	local sLogFile = "gmlog/automatic"
	-- return SaveCustomLog(sLogFile,sLog)
end

-- 获得金币，天石，赠点天石（或者扣除）时自动打log
function Sys_SetAutomatic(sType,nValues,nNowUserId)
	local nUserId = nNowUserId
	if nUserId == 0 or nUserId == nil then
		nUserId = Get_UserId()
	end
	
	local sUserName = Get_UserName(nUserId)
	local nMapId = Get_UserMapId(nUserId)
	local sLogFile = ""
	local sLog = ""
	
	if sType == "Money" then
		sLogFile = "gmlog/automatic_money"
		sLog = string.format("%d[%s][%d]操作金币数量:%d",nUserId,sUserName,nMapId,nValues)
	elseif sType == "EMoney" then
		sLogFile = "gmlog/automatic_emoney"
		sLog = string.format("%d[%s][%d]操作天石数量:%d",nUserId,sUserName,nMapId,nValues)
	elseif sType == "EMoneyMono" then
		sLogFile = "gmlog/automatic_emoneymono"
		sLog = string.format("%d[%s][%d]操作赠点天石数量:%d",nUserId,sUserName,nMapId,nValues)
	end

	SaveCustomLog(sLogFile,sLog)
end

-- 获取EMoneyBuyLog
function Sys_GetEMoneyBuyLog(sType,nValues,sEMoneyBuyId,nNowUserId)
	local nUserId = nNowUserId
	if nUserId == 0 or nUserId == nil then
		nUserId = Get_UserId()
	end
	
	-- 检测sEMoneyBuyId是否正确
	local sEmoney = sEMoneyBuyId
	if not string.find(sEmoney,'^%d+\t%d+$') then
		Sys_SaveAbnormalLog("函数 Sys_GetEMoneyBuyLog 中 log格式有误:" .. sEMoneyBuyId)
		return
	end
	
	if sType == "EMoney" then
		sEmoney = string.format("%s	%d	%d	1	",sEmoney,-nValues,-nValues)
	elseif sType == "EMoneyMono" then
		sEmoney = string.format("%s	0	0	%d	",sEmoney,-nValues)
	end
	
	Sys_SaveEmoneyBuy(sEmoney,nUserId)
end

--// 对应type=101，菜单文本
--// 菜单文本。 参数说明：strText表示显示的文本内容，可包含空格，也可为空行。如果失败返回false, 成功返回true。
--bool MenuText(string strText, int nline);
--sText是npc对话的内容
function Sys_DialogText(sText,nline,nUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_DialogText 中 sText 只能传字符. sText=" .. tostring(sText) .. ".")
		return
	end

	-- if Get_StringLenUtf8(sText) >= 255 then
		-- Sys_SaveAbnormalLog("函数 Sys_DialogText 中 sText 超过255个字符" .. Get_StringLenUtf8(sText))
		-- return
	-- end
	
	if nline == nil then
		nline = 0
	elseif type(nline) ~= "number" or nline < 0 then
		Sys_SaveAbnormalLog("函数 Sys_DialogText 中 nline 只能传大于等于0的整数")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DialogText [nUserId]:[".. nUserId .."]中 nUserId 只能传大于0的整数")
		return
	end
	
	-- 格式转换
	sText = CommonFunc_Conversion(sText)
	return MenuText(nUserId,sText,nline)
end

--// 对应type=102，菜单超链接
--// 菜单超链接，指玩家选项显示的内容。参数说明: strText表示所要显示的文字内容, nAlign表示对齐方式, strFunc表示执行的函数.如果失败返回false，成功返回true.
--bool MenuLink(string strText, int nAlign, string strFunc);
--sOptionText表示选项内容
--nAlign表示对齐方式，默认写0
--fFunc表示点击选项的时候出发的函数

function Sys_DialogOption(sOptionText,strFunc,nAlign,nUserId)
	if type(sOptionText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_DialogOption 中 sOptionText 只能传字符")
		return
	end
	
	if strFunc == nil then
		strFunc = "</F>NULL"
	elseif type(strFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_DialogOption 中 strFunc 只能传字符")
		return
	end

	if nAlign == nil then
		nAlign = 0
	elseif type(nAlign) ~= "number" or nAlign < 0 or nAlign%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DialogOption 中 nAlign 只能传大于0的整数")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DialogOption [nUserId]:[".. nUserId .."]中 nUserId 只能传大于0的整数")
		return
	end
	
	-- 格式转换
	sOptionText = CommonFunc_Conversion(sOptionText)
	return MenuLink(nUserId,sOptionText,nAlign,strFunc)
end


--// 对应type=103, 菜单输入框
--// 菜单输入框, 指可以让玩家输入内容的输入框. 参数说明: strText表示输入框上方的提示文字, nAcceptLen表示输入字符的长度, nPassword如果是非密码填0, pCallFunc表示执行的函数. 如果失败返回false, 成功返回true.
--bool MenuEdit(string strText, int nAcceptLen, int nPassword, int idTask, string strFunc);
--sText:表示输入框的提示文字
--nLen:表示输入字符的长度
--nPassword:表示输入的如果是非密码则写0
--fFunc：表示执行的函数

function Sys_DialogOptEdit(sText,nLen,sFunc,nPassword,nUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_DialogOptEdit 中 sText 只能传字符")
		return
	end
	
	if type(nLen) ~= "number" or nLen <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DialogOptEdit 中 nLen 只能传大于0的数")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_DialogOptEdit 中 sFunc 只能传字符")
		return
	end
	
	if nPassword == nil then
		nPassword = 0
	elseif type(nPassword) ~= "number" or (nPassword ~= 0 and  nPassword ~= 1) then
		Sys_SaveAbnormalLog("函数 Sys_DialogOptEdit 中 nPassword 只能传0或1")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DialogOptEdit [nUserId]:[".. nUserId .."]中 nUserId 只能传大于0的整数")
		return
	end
	
	-- 格式转换
	sText = CommonFunc_Conversion(sText)
	return MenuEdit(nUserId,sText,nLen,nPassword,"</F>" .. sFunc)
end

--// 对应type=104, 菜单图片(NPC使用)
--// 菜单图片. 参数说明: x, y 表示图片相对于整个对话框的x, y坐标; idPic表示这张图片在客户端下的npcface.ani文件中的编号, strFunc表示点击图片执行的函数. 如果失败返回false, 成功返回true.
--bool MenuPic(int x, int y, int idPic, int idTask, string strFunc);
--nFaceNum :npc头像编号
--x:默认写10
--y:默认写10

function Sys_DialogFace(nNpcID,nUserId)
	local nFaceNum
	if nNpcID == nil then
		nNpcID = 0
	end
	local nNpcLookFace=math.floor(Get_NpcLookface(nNpcID)/10)
	if tNpcFace[nNpcLookFace] ~= nil then		
		nFaceNum=tNpcFace[nNpcLookFace]
	else
	    return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DialogFace [nUserId]:[".. nUserId .."]中 nUserId 只能传大于0的整数")
		return
	end
	
	return MenuPic(nUserId,10,10,nFaceNum,"</F>NULL")
end

--// 对应type=104, 菜单图片(物品使用)
--// 菜单图片. 参数说明: x, y 表示图片相对于整个对话框的x, y坐标; idPic表示这张图片在客户端下的npcface.ani文件中的编号, strFunc表示点击图片执行的函数. 如果失败返回false, 成功返回true.
--bool MenuPic(int x, int y, int idPic, int idTask, string strFunc);
--nFaceNum :npc头像编号
--x:默认写10
--y:默认写10
function Sys_DialogItemFace(nItemId,nUserId)
	local nFaceNum
	if nItemId == nil then
		nItemId = 0
	end

	if tItemFace[nItemId] ~= nil then
		nFaceNum=tItemFace[nItemId]
	else
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DialogItemFace [nUserId]:[".. nUserId .."]中 nUserId 只能传大于0的整数")
		return
	end
	
	return MenuPic(nUserId,10,10,nFaceNum,"</F>NULL")
end

--// 对应type=120, 菜单创建
--// 菜单创建. 如果失败返回false, 成功返回true.
--bool MenuCreate(int idTask, string strFunc);
--nGlobalIdTask:执行的task_id
--fFunc:点击强行关闭的时候执行的函数

function Sys_DialogEnd(nUserId)
	-- if strFunc == nil then
		-- strFunc = "</F>NULL"
	-- elseif type(strFunc) ~= "string" then
		-- Sys_SaveAbnormalLog("函数 Sys_DialogEnd 中 strFunc 只能传字符")
		-- return
	-- end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DialogEnd [nUserId]:[".. nUserId .."]中 nUserId 只能传大于0的整数")
		return
	end
	
	return MenuCreate(nUserId)
end



--// 对应type=105, 弹出确认对话框
--// 弹出确认对话框. 参数说明: strText表示文字串，strFunc表示确认后执行的函数, pszFailFunc表示取消后执行的函数. 如果失败返回false, 成功返回true.
--bool MsgBox(string strText, string strFunc, string strFailFunc);
--sText:表示105提示内容
--fFunc:表示点击确认执行的函数
--fFailFunc:表示点击取消执行的函数
-- 新增参数4：玩家id
function Sys_MsgBox(sText,sFunc,sFailFunc,nUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_MsgBox 中 sText 只能传字符--[sText]:[".. tostring(sText) .."]")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_MsgBox 中 sFunc 只能传字符--[sText]:[".. tostring(sText) .."]")
		return
	end
	
	if sFailFunc == nil then
		sFailFunc = "NULL"
	elseif type(sFailFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_MsgBox 中 sFailFunc 只能传字符--[sText]:[".. tostring(sText) .."]")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_MsgBox 中 nUserId 只能传大于0的整数--[sText]:[".. tostring(sText) .."]")
		return
	end
	
	-- 格式转换
	sText = CommonFunc_Conversion(sText)
	return MsgBox(sText,"</F>" .. sFunc,"</F>" .. sFailFunc,nUserId)
end



--// 对应type=123, 检测服务器当前时间
--// 检查服务器当前时间格式. 参数说明: type表示指定所需要检测的时间类型, strParam表示时间格式. 如果失败返回false, 成功返回true.
--bool CheckTime(int type, string strParam);

--// 检测服务器当前时间.格式为:data指定所需要检测的时间类型 
--		//data=0-检查当前服务器详细时间param= "yy-mm-dd hh:mm yy-mm-dd hh:mm"; 
--		//data=1-检查年某天时间param="mm-dd hh:mm mm-dd hh:mm", 
--		//data=2-检查月某天时间param="dd hh:mm dd hh:mm", 
--		//data=3-检查周某天时间param="dd hh:mm dd hh:mm"(周一~周六为1~6,周日为0),
--		//data=4-检查日时间param="hh:mm hh:mm", 
--		//data=5-检查小时时间param="mm mm"(每个小时的第几分到底几分).
--		//★注意,该条action格式要求,param参数中,前面一个时间必须比后面一个要小.

--		//data=0-检查当前服务器详细时间param= "yy-mm-dd hh:mm yy-mm-dd hh:mm"; 
--sParam:表示时间段

function Sys_ChkFullTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ChkFullTime 中 sParam 只能传字符")
		return
	end

	return CheckTime(0,sParam)
end

--		//data=1-检查年某天时间param="mm-dd hh:mm mm-dd hh:mm", 
function Sys_ChkDateTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ChkDateTime 中 sParam 只能传字符")
		return
	end
	
	return CheckTime(1,sParam)
end

--		//data=2-检查月某天时间param="dd hh:mm dd hh:mm", 
function Sys_ChkMonthTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ChkMonthTime 中 sParam 只能传字符")
		return
	end
	
	return CheckTime(2,sParam)
end

--		//data=3-检查周某天时间param="dd hh:mm dd hh:mm"(周一~周六为1~6,周日为0),
function Sys_ChkWeedTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ChkWeedTime 中 sParam 只能传字符")
		return
	end
	
	return CheckTime(3,sParam)
end

--		//data=4-检查日时间param="hh:mm hh:mm", 
function Sys_ChkDayTime(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ChkDayTime 中 sParam 只能传字符")
		return
	end
	
	return CheckTime(4,sParam)
end

--		//data=5-检查小时时间param="mm mm"(每个小时的第几分到底几分).
function Sys_ChkMinute(sParam)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ChkMinute 中 sParam 只能传字符")
		return
	end
	
	return CheckTime(5,sParam)
end

--// 对应type=124, 向客户端发送界面命令
--// 向客户端发送界面命令. 参数说明: nData表示命令编号. 如果失败返回false, 成功返回true.
--bool PostCmd(int nData);

function Sys_PostCmd(nData)
	if type(nData) ~= "number" or nData%1 ~= 0 or nData < 0 then
		Sys_SaveAbnormalLog("函数 Sys_PostCmd 中 [nData]:[".. nData .."] 只能传大于0的整数")
		return
	end
	
	return PostCmd(nData)
end

--// 对应type=125, 全服务器广播文字消息
--// 全服务器广播文字消息. 参数说明: nData表示广播的频道, strParam表示广播的内容. 如果失败返回false, 成功返回true.
--bool BrocastMsg(int nData, string strParam);

--// 	const unsigned short _TXTATR_NORMAL		=2000;
--// 	const unsigned short _TXTATR_ACTION		=_TXTATR_NORMAL+2=2002;	// 动作
--//	 	const unsigned short _TXTATR_TEAM			=_TXTATR_NORMAL+3=2003;	// 队伍
--// 	const unsigned short _TXTATR_SYSTEM		=_TXTATR_NORMAL+5=2005;	// 系统——显示在屏幕左上角
--// 	const unsigned short _TXTATR_TALK				=_TXTATR_NORMAL+7=2007;	// 交谈——显示在屏幕左下角
--// 	const unsigned short _TXTATR_GM 				=_TXTATR_NORMAL+11=2011;	// GM频道——显示在屏幕中央



--// 	const unsigned short _TXTATR_NORMAL		=2000;
function Sys_NormalBroadcast(sContent)
	local sColor, nRange, nFontSize
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_NormalBroadcast 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_NormalBroadcast 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_NormalBroadcast 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_NormalBroadcast 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	-- 格式转换
	sContent = CommonFunc_Conversion(sContent)
	return BrocastMsg(2000,sContent, sColor, nRange, nFontSize)
end

--// 	const unsigned short _TXTATR_ACTION		=_TXTATR_NORMAL+2=2002;	// 动作
function Sys_ActionBroadcast(sContent)
	local sColor, nRange, nFontSize
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ActionBroadcast 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ActionBroadcast 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_ActionBroadcast 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_ActionBroadcast 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	-- 格式转换
	sContent = CommonFunc_Conversion(sContent)
	return BrocastMsg(2002,sContent, sColor, nRange, nFontSize)
end

--//	 	const unsigned short _TXTATR_TEAM			=_TXTATR_NORMAL+3=2003;	// 队伍
function Sys_TeamBroadcast(sContent)
	local sColor, nRange, nFontSize
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_TeamBroadcast 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_TeamBroadcast 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_TeamBroadcast 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_TeamBroadcast 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	-- 格式转换
	sContent = CommonFunc_Conversion(sContent)
	return BrocastMsg(2003,sContent, sColor, nRange, nFontSize)
end

--// 	const unsigned short _TXTATR_SYSTEM		=_TXTATR_NORMAL+5=2005;	// 系统——显示在屏幕左上角
function Sys_SystemBroadcast(sContent)
	local sColor, nRange, nFontSize
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SystemBroadcast 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SystemBroadcast 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SystemBroadcast 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SystemBroadcast 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	-- 格式转换
	sContent = CommonFunc_Conversion(sContent)
	return BrocastMsg(2005,sContent, sColor, nRange, nFontSize)
end

--// 	const unsigned short _TXTATR_TALK				=_TXTATR_NORMAL+7=2007;	// 交谈——显示在屏幕左下角
function Sys_TalkBroadcast(sContent)
	local sColor, nRange, nFontSize
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_TalkBroadcast 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_TalkBroadcast 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_TalkBroadcast 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_TalkBroadcast 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	-- 格式转换
	sContent = CommonFunc_Conversion(sContent)
	return BrocastMsg(2007,sContent, sColor, nRange, nFontSize)
end

--// 	const unsigned short _TXTATR_GM 				=_TXTATR_NORMAL+11=2011;	// GM频道——显示在屏幕中央
function Sys_GmBroadcast(sContent)
	local sColor, nRange, nFontSize
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_GmBroadcast 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_GmBroadcast 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_GmBroadcast 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_GmBroadcast 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	-- 格式转换
	sContent = CommonFunc_Conversion(sContent)
	return BrocastMsg(2011,sContent, sColor, nRange, nFontSize)
end


--// 对应type=131, 自动寻路部分
--// 自动寻路. 参数说明: idUser表示玩家id,填0表示当前玩家; nPosX, nPosY表示x、y坐标. idNpc表示寻路所要找的npc, 如果写0的话，则不会弹出对话, idMap表示npc所在的地图. 如果失败返回false, 成功返回true.
--bool GotoSomeWhere(int idUser, int nPosX, int nPosY, int idNpc, int idMap);
--nUserId:玩家id，当前玩家默认值为0
--nPosX：X坐标
--nPosY：Y坐标
--nNpcId：寻路所要找的npcId，写0则寻路后不弹出弹框
--nMapId：寻路中npc所在的地图id
-- sFunc 参6：寻路结束后出发的LUA;失败返回false，成功返回trueps:寻路结束后触发的LUA接口后有接玩家ID参数
function Sys_GotoSomeWhere(nPosX,nPosY,nMapId,nNpcId,nUserId,sFunc)
	if type(nPosX) ~= "number" or nPosX < 0 then
		Sys_SaveAbnormalLog("函数 Sys_GotoSomeWhere 中 [nMapId,nNpcId]:[".. nMapId ..",".. nNpcId .."] 的 nPosX 只能传大等于0的数")
		return
	end
	
	if type(nPosY) ~= "number" or nPosY < 0 then
		Sys_SaveAbnormalLog("函数 Sys_GotoSomeWhere 中 [nMapId,nNpcId]:[".. nMapId ..",".. nNpcId .."] 的 nPosY 只能传大等于0的数")
		return
	end
	
	if type(nMapId) ~= "number" or nMapId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_GotoSomeWhere 中 [nMapId,nNpcId]:[".. nMapId ..",".. nNpcId .."] 的 nMapId 只能传大于0的数")
		return
	end
	
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_GotoSomeWhere 中 [nMapId,nNpcId]:[".. nMapId ..",".. nNpcId .."] 的 nNpcId 只能传大于0的整数")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_GotoSomeWhere 中 [nMapId,nNpcId]:[".. nMapId ..",".. nNpcId .."] 的 nUserId 只能传大于0的整数")
		return
	end
	
	if sFunc == nil then
		sFunc = ""
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_GotoSomeWhere 中 sFunc 只能传字符--[nMapId,nNpcId]:[".. nMapId ..",".. nNpcId .."]")
		return
	else
		sFunc = "</F>" .. sFunc
	end

	return GotoSomeWhere(nUserId,nPosX,nPosY,nNpcId,nMapId,sFunc)
end
----= 1650			//发消息通知客户端点选目标,data=后面操作的action_id，param=[鼠标图片id，对应客户端Cursor.ini的记录]
--
----//发消息通知客户端点选目标，参数说明：idUser指玩家ID，idMouseType指鼠标点选的类型，pszCallLuaFunc指点选完后要调查的LUA函数，如果失败返回false，否则返回true。
----MouseWaitClick(OBJID idUser, OBJID idMouseType, LPCTSTR pszCallLuaFunc)

--nMouseType:表示鼠标点选的类型--如玫瑰"22"，详细见Cursor.ini  -->   玫瑰鼠标（22-23-1010）
--sFunc:表示点选完后要调查的LUA函数--如"Func_Next"
--nUserId:表示玩家的ID--默认0为当前玩家

function Sys_MouseWaitClick(nMouseType,sFunc,nUserId)
	if type(nMouseType) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_MouseWaitClick 中 [sFunc]:[".. sFunc .."] 的 nMouseType 只能传大于0的整数")
		return
	end

	if type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_MouseWaitClick 中 [sFunc]:[".. sFunc .."] 的 sFunc 只能传字符")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_MouseWaitClick 中 [sFunc]:[".. sFunc .."] 的 nUserId 只能传大于0的整数")
		return
	end

	return MouseWaitClick(nUserId,nMouseType,"</F>" .. sFunc)
end

----	= 1651			//判断点选目标的类型 data：1表示点npc，param=‘npc名字’;data：2表示点怪物param=‘怪物id’;data：3表示判断点选玩家性别判断param=‘性别id’ 1男，2女
--
----//判断点选目标的类型，参数说明：idUser指玩家ID,nTargetType指点先的类型，对应CHOSEN_TYPE，szParam指点选后的操作参数，如果失败返回false，否则返回true。
----MouseJudgeType(OBJID idUser, OBJID idChosenTarget, int nTargetType, const char* szParam)

----npc:1
--sParam：表示点选NPC的名字 "我是NPC"
--nUserId：表示玩家的ID--默认0为当前玩家

function Sys_NpcMouseType(sParam,nUserId)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_NpcMouseType 中 [sParam]:[".. sParam .."] 只能传字符")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_NpcMouseType 中 [sParam]:[".. sParam .."] 的 nUserId 只能传大于0的整数")
		return
	end
	return MouseJudgeType(nUserId,1,sParam)
end

----monstertype:2
function Sys_MonsterMouseType(sParam,nUserId)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_NpcMouseType 中 [sParam]:[".. sParam .."] 只能传字符")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_NpcMouseType 中 [sParam]:[".. sParam .."] 的 nUserId 只能传大于0的整数")
		return
	end
	return MouseJudgeType(nUserId,2,sParam)
end

----usersex:3
function Sys_UserSexMouseType(sParam,nUserId)
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_NpcMouseType 中 [sParam]:[".. sParam .."] 只能传字符")
		return
	end

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_NpcMouseType 中 [sParam]:[".. sParam .."] 的 nUserId 只能传大于0的整数")
		return
	end
	return MouseJudgeType(nUserId,3,sParam)
end


----= 1652			//清除玩家当前指针选取状态 服务器新增清除玩家当前指针选取状态的action，服务器执行该action后，下发消息给客户端
--
----//清除玩家当前鼠标选取状态，参数说明：idUser指玩家ID，如果失败返回false，否则返回true。
----MouseClearStatus(OBJID idUser)

function Sys_MouseClearStatus(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_MouseClearStatus 中 nUserId 只能传大于0的整数")
		return
	end
	
	return MouseClearStatus(nUserId)
end

--
----= 1653			//点选目标的状态检查和修改	 该action的param的格式为“status [空格]操作符[空格]具体数值”
--
----//所点选目标的状态检查，参数说明：idUser指玩家ID，nStatus指所要检查的状态，如果失败返回false，否则返回true。
----bool MouseCheckStatus(OBJID idUser, int nStatus)
--
--function Sys_MouseCheckStatus(nUserId,nStatus)
--	nUserId = nUserId or 0
--	if nStatus then
--		return MouseCheckStatus(nUserId,nStatus)
--	end
--end
--
----//设置所点选目标的状态，参数说明：idUser指玩家ID，nStatus指所要设置的状态，如果失败返回false，否则返回true。
----bool MouseSetStatus(OBJID idUser, int nStatus)
--
--function Sys_MouseSetStatus(nUserId,nStatus)
--	nUserId = nUserId or 0
--	if nStatus then
--		return MouseSetStatus(nUserId,nStatus)
--	end
--end

--删除当前所点选的NPC或怪物，
--nUserId表示用户id.
--如果失败返回false，否则返回true。
function Sys_MouseDeleteChosen(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_MouseDeleteChosen 第一个参数nUserId为整型并且大于等于0")
		return
	end
	
	return MouseDeleteChosen(nUserId)
end




--// 重置cq_dyna_global_data的data0-data5字段值. 参数说明: id表示表中的id字段值
--失败返回false,否则返回true。
function Sys_ResetAllSynaGlobalData(nGlobalId)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ResetSynaGlobalData 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	return ResetAllSynaGlobalData(nGlobalId)
end

--// 重置cq_dyna_global_data的datastr0-datastr5字段值. 参数说明: id表示表中的id字段值
--失败返回false,否则返回true。
function Sys_ResetAllSynaGlobalDataStr(nGlobalId)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ResetAllSynaGlobalDataStr 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	return ResetAllSynaGlobalDataStr(nGlobalId)
end

--// 重置cq_dyna_global_data的time0-time5字段值. 参数说明: id表示表中的id字段值
--失败返回false,否则返回true。
function Sys_ResetAllSynaGlobalTime(nGlobalId)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ResetAllSynaGlobalTime 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	return ResetAllSynaGlobalTime(nGlobalId)
end



--// 设置cq_dyna_global_data的data0-data5字段值. 参数说明: id表示表中的id字段值, idx表示SCRIPT_PARAM_DYNA_GLOBAL_DATA0的枚举值， nData表示设置的值. 如果失败返回false，成功返回true.
--bool SetSynaGlobalData(int id, int nPos, int nData);
--data 0
function Sys_SetSynaGlobalData0(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData0 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData0 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA0,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA1 		= 2203;
function Sys_SetSynaGlobalData1(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData1 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData1 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA1,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA2		= 2204;
function Sys_SetSynaGlobalData2(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData2 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData2 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA2,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA3		= 2205;
function Sys_SetSynaGlobalData3(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData3 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData3 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA3,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA4		= 2206;
function Sys_SetSynaGlobalData4(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData4 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData4 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA4,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATA5		= 2207;
function Sys_SetSynaGlobalData5(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData5 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData5 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalData(nGlobalId,G_DYNA_GLOBAL_DATA5,nData)
end

--// 设置cq_dyna_global_data的datastr0-datastr5字段值. 参数说明: id表示表中的id字段值, idx表示SCRIPT_PARAM_DYNA_GLOBAL_DATASTR0的枚举值，strData表示设置的串. 如果失败返回false，成功返回true.
--bool SetSynaGlobalDataStr(int id, int nPos, string strData);
--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR0	= 2208;
function Sys_SetSynaGlobalDataStr0(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr0 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr0 中 [nGlobalId]:[".. nGlobalId .."] 的 sText 只能传字符")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR0,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR1	= 2209;
function Sys_SetSynaGlobalDataStr1(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr1 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr1 中 [nGlobalId]:[".. nGlobalId .."] 的 sText 只能传字符")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR1,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR2	= 2210;
function Sys_SetSynaGlobalDataStr2(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr2 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr2 中 [nGlobalId]:[".. nGlobalId .."] 的 sText 只能传字符")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR2,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR3	= 2211;
function Sys_SetSynaGlobalDataStr3(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr3 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr3 中 [nGlobalId]:[".. nGlobalId .."] 的 sText 只能传字符")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR3,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR4	= 2212;
function Sys_SetSynaGlobalDataStr4(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr4 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr4 中 [nGlobalId]:[".. nGlobalId .."] 的 sText 只能传字符")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR4,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_DATASTR5	= 2213;
function Sys_SetSynaGlobalDataStr5(nGlobalId,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr5 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr5 中 s[nGlobalId]:[".. nGlobalId .."] 的 Text 只能传字符")
		return
	end
	
	return SetSynaGlobalDataStr(nGlobalId,G_DYNA_GLOBAL_DATASTR5,sText)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME0		= 2214;
--// 设置cq_dyna_global_data的time0-time5字段值. 参数说明: id表示表中的id字段值, idx表示SCRIPT_PARAM_DYNA_GLOBAL_TIME0的枚举值， nData表示设置的值. 如果失败返回false，成功返回true.
--bool SetSynaGlobalTime(int id, int nPos, int nData);
function Sys_SetSynaGlobalTime0(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime0 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime0 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME0,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME1		= 2215;
function Sys_SetSynaGlobalTime1(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime1 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime1 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME1,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME2		= 2216;
function Sys_SetSynaGlobalTime2(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime2 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime2 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME2,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME3		= 2217;
function Sys_SetSynaGlobalTime3(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime3 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime3 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME3,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME4		= 2218;
function Sys_SetSynaGlobalTime4(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime4 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime4 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME4,nData)
end

--SCRIPT_PARAM_DYNA_GLOBAL_TIME5		= 2219;
function Sys_SetSynaGlobalTime5(nGlobalId,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime5 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime5 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	return SetSynaGlobalTime(nGlobalId,G_DYNA_GLOBAL_TIME5,nData)
end

-- 设置cq_dyna_global_data的data0-data5字段值
function Sys_SetSynaGlobalData(nGlobalId,nPos,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	if type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 or nPos > 5 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalData 中 [nGlobalId]:[".. nGlobalId .."] 的 nPos 只能传0~5之间的整数")
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

-- 设置cq_dyna_global_data的datastr0-datastr5字段值
function Sys_SetSynaGlobalDataStr(nGlobalId,nPos,sText)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr 中 [nGlobalId]:[".. nGlobalId .."] 的 sText 只能传字符")
		return
	end
	
	if type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 or nPos > 5 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalDataStr 中 [nGlobalId]:[".. nGlobalId .."] 的 nPos 只能传0~5之间的整数")
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

-- 设置cq_dyna_global_data的time0-time5字段值
function Sys_SetSynaGlobalTime(nGlobalId,nPos,nData)
	if type(nGlobalId) ~= "number" or nGlobalId%1 ~= 0 or nGlobalId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime 中 [nGlobalId]:[".. nGlobalId .."] 只能传大于0的整数")
		return
	end
	
	if type(nData) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime 中 [nGlobalId]:[".. nGlobalId .."] 的 nData 只能传数字")
		return
	end
	
	if type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 or nPos > 5 then
		Sys_SaveAbnormalLog("函数 Sys_SetSynaGlobalTime 中 [nGlobalId]:[".. nGlobalId .."] 的 nPos 只能传0~5之间的整数")
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



--设置定时器，倒数记时完成后触发指定的函数
-- 玩家下线由程序清除此玩家添加的所有lua触发函数
-- // 设置定时执行lua接口，参1：玩家ID，参2：活动类型，参3：结束时间戳，参4：时间到执行的lua接口。如果添加失败返回false，成功返回true。
-- bool SetLuaTimer(OBJID idUser, int nType， DWORD dwEndStamp, const char* pszLuaFunc);
--nInterval 记时时长，单位：秒
--sFunc 计时完成后执行的函数
--例：Sys_SetLuaTimer(10,"</F>sFunc")
function Sys_SetLuaTimer(nInterval,sFunc,nType,nUserId)
	if type(nInterval) ~= "number" or nInterval%1 ~= 0 or nInterval <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetLuaTimer 第一个参数nInterval为整型且大于0--[sFunc]:[".. sFunc .."]")
		return
	end
	
	if sFunc == nil then
		sFunc = "NULL"
	elseif type(sFunc) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SetLuaTimer 第二个参数[sFunc]:[".. sFunc .."]为字符串")
		return
	end
	
	if type(nType) ~= "number" or nType%1 ~= 0 or nType <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetLuaTimer 第一个参数 nType 为整型且大于0 -- " .. nType)
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetLuaTimer 第二个参数 nUserId 为整型并且大于等于0")
		return
	end
	
	local nTime = os.time() + nInterval
	return SetLuaTimer(nUserId,nType,nTime,"</F>" .. sFunc)
end

-- // 检查玩家是否添加了此类型的定时器，参1：玩家ID，参2：活动类型。如果没有返回false，有返回true。
-- bool ChkLuaTimer(OBJID idUser, int nType);
function Sys_ChkLuaTimer(nType,nUserId)
	if type(nType) ~= "number" or nType%1 ~= 0 or nType <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ChkLuaTimer 第一个参数 nType 为整型且大于0 -- " .. nType)
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_ChkLuaTimer 第二个参数 nUserId 为整型并且大于等于0")
		return
	end	
	
	return ChkLuaTimer(nUserId,nType)
end

-- // 删除玩家指定类型的定时器，参1：玩家ID，参2：活动类型。如果失败返回false，成功返回true。
-- bool KillLuaTimer(OBJID idUser, int nType)
function Sys_KillLuaTimer(nType,nUserId)
	if type(nType) ~= "number" or nType%1 ~= 0 or nType <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_KillLuaTimer 第一个参数 nType 为整型且大于0 -- " .. nType)
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_KillLuaTimer 第二个参数 nUserId 为整型并且大于等于0")
		return
	end	
	
	return KillLuaTimer(nUserId,nType)
end

--设置定时器，设置指定id定时器。
--nTimerId 定时器id.
--nInterval 记时时长，单位：秒.
--例：Sys_SetLuaEventTimer(1000,10)
function Sys_SetLuaEventTimer(nTimerId,nInterval)
	if type(nTimerId) ~= "number" or nTimerId%1 ~= 0 or nTimerId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetLuaEventTimer 第一个参数[nTimerId,nInterval]:[".. nTimerId ..",".. nInterval .."]中nTimerId为整型且大于0")
		return
	end
	
	if type(nInterval) ~= "number" or nInterval%1 ~= 0 or nInterval <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetLuaEventTimer 第二个参数[nTimerId,nInterval]:[".. nTimerId ..",".. nInterval .."]中nInterval为整型且大于0")
		return
	end
	
	return SetLuaEventTimer(nTimerId,nInterval)
end

--检查定时器是否存在。
--nTimerId 定时器id.
--例：Sys_ChkLuaEventTimer(1000)
function Sys_ChkLuaEventTimer(nTimerId)
	if type(nTimerId) ~= "number" or nTimerId%1 ~= 0 or nTimerId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ChkLuaEventTimer 第一个参数[nTimerId]:[".. nTimerId .."]为整型且大于0")
		return
	end

	return ChkLuaEventTimer(nTimerId)
end

--删除定时器。
--nTimerId 定时器id.
--例：Sys_DelLuaEventTimer(1000)
function Sys_DelLuaEventTimer(nTimerId)
	if type(nTimerId) ~= "number" or nTimerId%1 ~= 0 or nTimerId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_KillLuaEventTimer 第一个参数[nTimerId]:[".. nTimerId .."]为整型且大于0")
		return
	end

	return KillLuaEventTimer(nTimerId)
end

--公告更新.
--nNumber 一段公告的序号 0开始，1中间语句，2结束。只有一条，就用2.
--sText 每行公告内容
--nUserId 用户id 可缺省
--例：Sys_SetMenuNotice(0,"第一行",0)||Sys_MenuNotice(0,"第一行")
function Sys_SetMenuNotice(nNumber,sText,nUserId)
	if type(nNumber) ~= "number" or nNumber%1 ~= 0 or nNumber < 0 or nNumber > 2 then
		Sys_SaveAbnormalLog("函数 Sys_SetMenuNotice 第一个参数nNumber为整型且范围在0--2")
		return
	end
	
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SetMenuNotice 第二个参数sText为字符串")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetMenuNotice 第三个参数nUserId为整型并且大于等于0")
		return
	end
	
	return MenuNotice(nUserId,nNumber,sText)
end

--在BBS公告板中，添加一条SYSTEM频道的消息，留言人为“SYSTEM”. 
--sParam是消息内容. 
--如果失败返回false, 成功返回true.
-- function Sys_SetEventBBS(sParam)
	-- if type(sParam) ~= "string" then
		-- Sys_SaveAbnormalLog("函数 Sys_SetEventBBS 第一个参数sParam为字符串")
		-- return
	-- end
	
	-- return EventBBS(sParam)
-- end

-- //全服邀请对象筛选。 参数说明：idInvite为标识编号（限1~6）， param="attr opt data"，attr可选，要求支持一下类型的条件检查："pk" (==,>=,<=) // "profession" (==,>=,<=) "level" (==,>=,<=)"rankshow" (==,>=,<=)
-- //"metempsychosis" (==,>=,<=) "battlelev" (==,>=,<=)进行符合条件筛选的时候，只需在param最前面加一个标识编号就好了，如：'level >= 60 level <= 90'即标示筛选60~90级别的玩家
-- ACTION_SYS_INVITE_FILTER			= 129,			// 全服邀请对象筛选。
function Sys_InviteFilter(nInivteId,sParam,nInivteType)
	if type(nInivteId) ~= "number" or nInivteId%1 ~= 0 or nInivteId < 1 or nInivteId > 6 then
		Sys_SaveAbnormalLog("函数 Sys_InviteFilter 参数 nInivteId 只能传1到6的整数")
		return
	end
	
	if type(sParam) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_InviteFilter 参数 sParam 只能传字符")
		return
	end
	
	if nInivteType == nil then
		nInivteType = 0
	elseif type(nInivteType) ~= "number" or nInivteType%1 ~= 0 or nInivteType < 0 then
		Sys_SaveAbnormalLog("函数 Sys_InviteFilter 参数 nInivteType 只能传大于等于0的整数")
		return
	end

	return InviteFilter(nInivteId,sParam,nInivteType)
end

-- //删除全服邀请对象。参数说明：idInvite为标识编号（限1~6）
-- ACTION_SYS_INVITE_FILTER			= 129,			// 全服邀请对象筛选。
function Sys_DelInvite(nInivteId)
	if type(nInivteId) ~= "number" or nInivteId%1 ~= 0 or nInivteId < 1 or nInivteId > 6 then
		Sys_SaveAbnormalLog("函数 Sys_DelInvite 参数 [nInivteId]:[".. nInivteId .."] 只能传1到6的整数")
		return
	end
	
	return DelInvite(nInivteId)
end

-- // 全服邀请传送，参数说明：idMap nTransPosx1 nTransPosy1 nTransPosx2 nTransPosy2 nTransPosx3 nTransPosy3 nTransPosx4 nTransPosy4 nTransPosx5 nTransPosy5 nTransPosx6 nTransPosy6 nTransPosx7 nTransPosy7 nTransPosx8 nTransPosy8
-- // 对应记录地图id及8个落脚点坐标,服务端在该action执行时，先内存中记录全服邀请对象发送传送邀请,idStrSendInvite服务端在收到客户端提交的接受邀请的消息后，检查改玩家是否在内存记录的邀请列表中,
-- // 若该玩家在邀请列表中，则先保存玩家当前坐标，再根据配置的地图id及落脚点坐标，随机选取其中一个坐标，将该玩家传送到该坐标上，并将idStrTransOK下传给该玩家,idInvite为标识编号（限1~6）,nCloseSecs(秒)：全服邀请的关闭倒计时设置
-- tTransPosx 为坐标点的表 格式为 tTransPosx[1]["X"],tTransPosx[1]["Y"]
-- ACTION_SYS_INVITE_TRANS			 = 130,		// 全服邀请传送
function Sys_InviteTrans(nMapId,tTransPosx,nStrSendInviteId,nStrTransOKId,nInviteId,nCloseSecs)
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_InviteTrans 参数 [nMapId]:[".. nMapId .."] 只能传大于0的整数")
		return
	end
	
	if type(nStrSendInviteId) ~= "number" or nStrSendInviteId%1 ~= 0 or nStrSendInviteId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_InviteTrans 参数 nStrSendInviteId 只能传大于等于0的整数--[nMapId]:[".. nMapId .."]")
		return
	end
	
	if type(nStrTransOKId) ~= "number" or nStrTransOKId%1 ~= 0 or nStrTransOKId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_InviteTrans 参数 nStrTransOKId 只能传大于等于0的整数--[nMapId]:[".. nMapId .."]")
		return
	end
	
	if type(nInviteId) ~= "number" or nInviteId%1 ~= 0 or nInviteId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_InviteTrans 参数 nInviteId 只能传大于等于0的整数--[nMapId]:[".. nMapId .."]")
		return
	end
	
	if type(nCloseSecs) ~= "number" or nCloseSecs%1 ~= 0 or nCloseSecs < 0 then
		Sys_SaveAbnormalLog("函数 Sys_InviteTrans 参数 nCloseSecs 只能传大于等于0的整数--[nMapId]:[".. nMapId .."]")
		return
	end
	
	if type(tTransPosx) ~= "table" then
		Sys_SaveAbnormalLog("函数 Sys_InviteTrans 参数 tTransPosx 只能传表进去--[nMapId]:[".. nMapId .."]")
		return
	end
	
	for i,v in pairs(tTransPosx) do
		if type(v["X"]) ~= "number" or v["X"]%1 ~= 0 or v["X"] < 0 then
			local str = string.format("函数 Sys_InviteTrans 参数 tTransPosx 中 第%d组的X 只能传大等于0的整数",i)
			Sys_SaveAbnormalLog(str)
			return
		end
		
		if type(v["Y"]) ~= "number" or v["Y"]%1 ~= 0 or v["Y"] < 0 then
			local str = string.format("函数 Sys_InviteTrans 参数 tTransPosx 中 第%d组的Y 只能传大等于0的整数",i)
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
-- 新增lua接口函数：
-- FirstCreateCountry(unsigned int idSyn)
-- 参数1:获胜帮派id
-- 无返回值

-- 该接口用于帮派战胜利后自动创建联盟并升级为国家。接口内有进行一系列判断，只需要在帮派战后调用即可。
function Sys_FirstCreateCountry(nSynId)
	if type(nSynId) ~= "number" or nSynId%1 ~= 0 or nSynId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_FirstCreateCountry 参数 [nSynId]:[".. nSynId .."] 只能传大于0的整数")
		return
	end 

	return FirstCreateCountry(nSynId)
end

-- 判断本服是否有国家（执政盟）。无参数。返回值：如果存在执政盟返回ture，否则返回false
-- bool HaveCountry()
function Sys_HaveCountry()
	return HaveCountry()
end

--------------------------------非程序接口函数封装-------------------------------------
--用于把一个字符串分割成字符串数组，存储于表中。
--sFullString 被分割的完整字符串
--sSeparator 分割符
--例：local a = Sys_Split("123,12,abc",",") ,返回a = {"123","12","abc"}。
function Sys_Split(sFullString, sSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	local nCalLoop = 0
	while true do
		if nCalLoop > G_CalculateLoop then
			Sys_SaveAbnormalLog("函数 Sys_Split 中 [while]循环超过1000次！")
			break
		end
		nCalLoop = nCalLoop + 1
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

--简单的随机概率函数
--"nStartNum,nEndNum"。"10 100"表示有1/10的机会是true。
function Sys_Random(nStartNum,nEndNum)
	local nNum = math.random(1,nEndNum)
	if nNum <= nStartNum then
		return true
	else
		return false
	end
end

--解析数字包含函数,类似我们的地图属性
--nConNum 单个地图属性
--nTotalNum 总的地图属性值
function Sys_ParseNumbersContain(nConNum,nTotalNum)
	local nPow = 0
	local nTemp = 0
	local bBool = false
	local nCalLoop = 0
	while nTotalNum ~= 0 and nTotalNum ~= nil do
		if nCalLoop > G_CalculateLoop then
			Sys_SaveAbnormalLog("函数 Sys_ParseNumbersContain 中 [while]循环超过1000次！")
			break
		end
		nCalLoop = nCalLoop + 1
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

-- 对应actiontype = 113
-- 清除对话框Task计数
-- 参数1：idUser表示玩家ID, 填0表示自己。如果失败返回false，成功返回true.
-- bool MenuTaskClear(UINT idUser);
function Sys_DialogTaskClear()
	return MenuTaskClear(0)
end


----- 2015.10.13 ----------
-- #判断是否打开二级密码
-- 对应ACTION:1053
-- LUA接口：IsOpenSecondPWD
-- 参数1：玩家id
-- 返回值：true表示打开二级密码 false表示没有打开二级密码
function Sys_IsOpenSecondPWD(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_IsOpenSecondPWD 中 nUserId 只能传大于等于0的整数")
		return
	end
	return IsOpenSecondPWD(nUserId)
end

-- #判断帐号服务器是否正常连接
-- 对应ACTION:1215
-- LUA接口：IsAccountServerNormal
-- 参数：无
-- 返回值：true表示链接正常 false表示链接断开
function Sys_IsAccountServerNormal()
	return IsAccountServerNormal()
end

-- #判断当前是否在该服务器
-- 对应ACTION:1213
-- LUA接口：CheckServerName
-- 参数：服务器名称
-- 返回值：true表示当前服务器名称与传入服务器名称相同 false表示当前服务器名称与传入服务器名称不同
function Sys_CheckServerName(sServerName)
	if type(sServerName) ~= "string" or sServerName == nil then
		Sys_SaveAbnormalLog("函数 Sys_CheckServerName 中 [sServerName]:[".. sServerName .."] 只能传字符")
		return
	end
	return CheckServerName(sServerName)
end

-- #判断转服服务器是否连接上
-- 对应ACTION:1205
-- LUA接口：IsChangeServerEnable
-- 参数：无
-- 返回值：true表示转服服务器已连接 false表示转服服务器未连接
function Sys_IsChangeServerEnable()
	return IsChangeServerEnable()
end

-- #判断转服服务器是否空闲
-- 对应ACTION:1214
-- LUA接口：IsChangeServerIdle
-- 参数：无
-- 返回值：true表示转服服务器空闲 false转服服务器忙
function Sys_IsChangeServerIdle()
	return IsChangeServerIdle()
end

---------------------2015.11.10
-- 1、广播左上角系统提示：
-- LUA接口：UpperLeftCornerTalkMsg
-- 参数1：nOpt 为0表示本服广播，为1表示同组服务器广播
-- 参数2：要广播的内容
-- 返回值：成功返回true 失败返回false
function Sys_UpperLeftCornerTalkMsg(nOpt,sContent)
	if nOpt ~= 0 and nOpt ~= 1 then
		Sys_SaveAbnormalLog("函数 Sys_UpperLeftCornerTalkMsg 中 nOpt 只能传0或者1 --[sContent]:[".. sContent .."]")
		return
	end
	
	if type(sContent) ~= "string" or sContent == nil then
		Sys_SaveAbnormalLog("函数 Sys_UpperLeftCornerTalkMsg 中 sContent 只能传字符 --[sContent]:[".. sContent .."]")
		return
	end
	
	return UpperLeftCornerTalkMsg(nOpt,sContent)
end

-- 2、外置聊天窗口系统提示：
-- LUA接口：ChatDilogSysTalkMsg
-- 参数1：nOpt 为0表示本服广播，为1表示同组服务器广播
-- 参数2：玩家名字，可通过左键拾取该参数
-- 参数3：要广播的内容
-- 返回值：成功返回true 失败返回false
-- 要广播如下内容：
-- 我的名字七个半1福缘深厚，在桃园仙境获得金刚坚钻。
-- 其中 我的名字七个半1 为可左键摄取的名字，
-- 则参数2传："我的名字七个半1"
-- 参数3传：福缘深厚，在桃园仙境获得金刚坚钻。
function Sys_ChatDilogSysTalkMsg(nOpt,sContent,sUserName)
	if nOpt ~= 0 and nOpt ~= 1 then
		Sys_SaveAbnormalLog("函数 Sys_ChatDilogSysTalkMsg 中 nOpt 只能传0或者1--[sContent]:[".. sContent .."]")
		return
	end
	
	if sUserName == nil then
		sUserName = ""
	elseif type(sUserName) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ChatDilogSysTalkMsg 中 sUserName 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if type(sContent) ~= "string" or sContent == nil then
		Sys_SaveAbnormalLog("函数 Sys_ChatDilogSysTalkMsg 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	return ChatDilogSysTalkMsg(nOpt,sUserName,sContent)
end

-------------2015.11.30
-- 新增lua接口 原action type=9005
-- FlyToGameServer
-- 参数1：玩家id
-- 参数2：服务器id
-- 返回值：是否成功
function Sys_FlyToGameServer(nServerId,nUserId)
	if type(nServerId) ~= "number" or nServerId <= 0 or nServerId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_FlyToGameServer 中 [nServerId]:[".. nServerId .."] 只能传大于0的整数")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_FlyToGameServer 中 [nServerId]:[".. nServerId .."] 的 nUserId 只能传大于等于0的整数")
		return
	end
	
	return FlyToGameServer(nUserId,nServerId)
end

-- CheckInPlunderWar  原type=1729
-- 参数1：玩家id
-- 返回值：如果玩家在掠夺战中返回true，否则返回false
function Sys_CheckInPlunderWar(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_CheckInPlunderWar 中 nUserId 只能传大于等于0的整数")
		return
	end
	
	return CheckInPlunderWar(nUserId)
end

-- 2016.01.19
-- SetSysTempData
-- 参数1(USHORT)：数据类型（1:统计怪物）
-- 参数2(UINT):数据子类型1（如果数据类型为1，则子类型代表地图id）
-- 参数3(UINT):数据子类型2（如果数据类型为1，则子类型代表怪物id）
-- 参数4(UINT)：存储的数据
-- 返回值：是否成功

function Sys_SetTempData(nParNodeType,nChilNodeType1,nChilNodeType2,nData)
	if type(nParNodeType) ~= "number" or nParNodeType <= 0 or nParNodeType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetTempData 中 nParNodeType 只能传大于0的整数")
		return
	end
	if type(nChilNodeType1) ~= "number" or nChilNodeType1 <= 0 or nChilNodeType1%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetTempData 中 nChilNodeType1 只能传大于0的整数")
		return
	end
	if type(nChilNodeType2) ~= "number" or nChilNodeType2 <= 0 or nChilNodeType2%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetTempData 中 nChilNodeType2 只能传大于0的整数")
		return
	end	
	if type(nData) ~= "number" or nData < 0 or nData%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetTempData 中 nData 只能传大于等于0的整数")
		return
	end

	return SetSysTempData(nParNodeType,nChilNodeType1,nChilNodeType2,nData)
end


-- 2016.04.07
-- //邮件发送接口 
-- 参数1：接收者id 参数2：征服币数 参数3：天石数  参数4：action id 
-- 参数5：天石来源类型（具体功能请询问相关服务端程序猿） 参数6：邮件持续天数 
-- 参数7：发送者名称 参数8：邮件标题 参数9：邮件内容 返回值：成功返回true，否则false
-- SendMail
function Sys_SendMail(nUserId,nMoney,nEmoney,nActionId,nEmoneyType,nExistDay,sSender,sTitle,sContent,serverid)
	if type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 nUserId 为整型并且大于0--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end

	if type(nMoney) ~= "number" or nMoney%1 ~= 0 or nMoney < 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 nMoney 为整型并且大于等于0--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end
	
	if type(nEmoney) ~= "number" or nEmoney%1 ~= 0 or nEmoney < 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 nEmoney 为整型并且大于等于0--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end
	
	if type(nActionId) ~= "number" or nActionId%1 ~= 0 or nActionId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 nActionId 为整型并且大于等于0--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end

	if type(nEmoneyType) ~= "number" or nEmoneyType%1 ~= 0 or nEmoneyType < 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 nEmoneyType 为整型并且大于等于0--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end
	
	if type(nExistDay) ~= "number" or nExistDay%1 ~= 0 or nExistDay < 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 nExistDay 为整型并且大于等于0--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end

	if type(sSender) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 sSender 只能传字符串--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end	
	
	if type(sTitle) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 sTitle 只能传字符串--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end	
	
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 sContent 只能传字符串--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end	

	if serverid == nil then
		serverid = 0
	elseif type(serverid) ~= "number" or serverid < 0 or serverid%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendMail 中 serverid 只能传大于等于0的整数--[nActionId,sContent]:[".. nActionId ..",".. sContent .."]")
		return
	end
	
	
	return SendMail(nUserId,nMoney,nEmoney,nActionId,nEmoneyType,nExistDay,sSender,sTitle,sContent,serverid)
end

------2016.5.9
--//ACTION_USER_CUSTOM_LOG 1085
--bool SaveCustomLog(const char * pszLogFile, const char * pszText);
--活动脚本：350
--sText表示Log配置信息,例如："0,0,0,0,10002354,2,728596,3"
function Sys_SaveActionRewardLog(sText,nNowUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveActionRewardLog 中 sText 只能传字符")
		return
	end

	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId) 
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..']'

	local sLogFile = "gmlog/action_reward_log"
	local sLogText = string.format("350,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end

--// 开始智力竞赛. 参1：idUser表示玩家ID
--bool BeginCompetion(OBJID idUser);

function Sys_BeginCompetion(nUserId)
	if nUserId == nil then
		nUserId = 0
	end
	
	return BeginCompetion(nUserId)
end

-- 德州盒子提示框（注：仅限德州盒子使用）
-- BoxDialogTips 参数1：idUser表示玩家ID，填0表示自己。参数2：Title表示标题。参数3：Content表示内容。如果失败返回false,成功返回true
function Sys_BoxDialogTips(sTitle,sContent,nUserId)
	if type(sTitle) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BoxDialogTips 中 sTitle 只能传字符")
		return
	end
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BoxDialogTips 中 sContent 只能传字符")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	end
	
	BoxDialogTips(nUserId,sTitle,sContent)
end


-- //通知游服设置邀请filter，参数1：邀请类型() 返回值：成功返回true。否则返回false
-- FrontierSetInviteFilter
-- 通知组内游服设置邀请filter 
-- 参数1：邀请类型(INVITE_FRONTIER_HORSE_RACE) （跨服赛马邀请为2）
-- 返回值：成功返回true，否则返回false

function Sys_FrontierSetInviteFilter(nType)

	if type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_FrontierSetInviteFilter 中 nType 只能传大于等于0的整数")
		return
	end
	
	return FrontierSetInviteFilter(nType)
end


-- //通知游服发出邀请 参数1：邀请类型  返回值：成功返回true，否则返回false
-- FrontierSendInvite 
function Sys_FrontierSendInvite(nType)

	if  type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_FrontierSendInvite 中 nType 只能传大于等于0的整数")
		return
	end
	
	return FrontierSendInvite(nType)
end


--跨服马赛结束
--FrontierHorseRaceOver
function Sys_FrontierHorseRaceOver(nType)

	if  type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_FrontierHorseRaceOver 中 nType 只能传大于等于0的整数")
		return
	end
	
	return FrontierHorseRaceOver(nType)

end



-- //向全体游服广播系统消息(原action125) 参数1：广播内容 参数2：data（原action中存在data中的内容） 返回值：成功返回true，否则返回false
-- BroadcastTalkMsgToAllServer
--// 	const unsigned short _TXTATR_SYSTEM		=_TXTATR_NORMAL+5=2005;	// 系统——显示在屏幕左上角
function Sys_SystemBroadcastToOS(sContent)
	local sColor, nRange, nFontSize
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SystemBroadcastToOS 中 sContent 只能传字符")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SystemBroadcastToOS 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SystemBroadcastToOS 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_SystemBroadcastToOS 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	return BroadcastTalkMsgToAllServer(sContent,2005, sColor, nRange, nFontSize)
end

-- //赛马开始(原action3601) 参数1：赛马持续时间 参数2：倒计时 参数3：地图id 返回值：成功返回true，否则返回false
-- HorseRaceBegin
function Sys_HorseRaceBegin(nDuration,nCloseSecs,nMapId)

	if type(nDuration) ~= "number" or nDuration%1 ~= 0 or nDuration < 0 then
		Sys_SaveAbnormalLog("函数 Sys_HorseRaceBegin 参数 nDuration 只能传大于等于0的整数--[nMapId]:[".. nMapId .."]")
		return
	end
	
	if type(nCloseSecs) ~= "number" or nCloseSecs%1 ~= 0 or nCloseSecs < 0 then
		Sys_SaveAbnormalLog("函数 Sys_HorseRaceBegin 参数 nCloseSecs 只能传大于等于0的整数--[nMapId]:[".. nMapId .."]")
		return
	end
	
	if type(nMapId) ~= "number" or nMapId%1 ~= 0 or nMapId < 0 then
		Sys_SaveAbnormalLog("函数 Sys_HorseRaceBegin 参数 nMapId 只能传大于等于0的整数--[nMapId]:[".. nMapId .."]")
		return
	end
	
	return HorseRaceBegin(nDuration,nCloseSecs,nMapId)
end

-- //设置当前赛马场次 参数1：赛马场次 返回值：成功返回true 否则返回false
-- SetHorseRaceTimes
function Sys_SetHorseRaceTimes(nTimes)

	if nTimes == nil then
		nTimes = 0
	elseif type(nTimes) ~= "number" or nTimes < 0 or nTimes%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SetHorseRaceTimes 中 nTimes 只能传大于0的整数")
		return
	end
	
	return SetHorseRaceTimes(nTimes)
end

-- //离开当前服，回到玩家所属服务器  参数1：玩家id，若传0，则默认当前玩家 返回值：返回值：成功返回true，否则返回false
-- ExitOS
function Sys_ExitOS(nUserId)

	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ExitOS 中 nUserId 只能传大于0的整数")
		return
	end
	
	return ExitOS(nUserId,1)
end

-- //进入其他服 参数1：玩家id 参数2：服务器id  参数3：进入其他服的类型（1：跨服赛马） 返回值：成功ture，失败false
-- EnterServer 
function Sys_EnterServer(nServerId,nType,nUserId,nConfigMapFlag)

	if  type(nServerId) ~= "number" or nServerId < 0 or nServerId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_EnterServer 中 nServerId 只能传大于等于0的整数")
		return
	end
	
	if  type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_EnterServer 中 nType 只能传大于等于0的整数")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_EnterServer 中 nUserId 只能传大于0的整数")
		return
	end
	
	if nConfigMapFlag == nil then
		nConfigMapFlag = 0	
	elseif  type(nConfigMapFlag) ~= "number" or nConfigMapFlag < 0 or nConfigMapFlag%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_EnterServer 中 nConfigMapFlag 只能传大于等于0的整数")
		return
	end
	
	return EnterServer(nUserId,nServerId,nType,nConfigMapFlag)
end

--装备位检测
function Sys_ChkEquip(nPos,nUserId)
	if  type(nPos) ~= "number" or nPos < 0 or nPos%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ChkEquip 中 [nPos]:[".. nPos .."] 只能传大于等于0的整数")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ChkEquip 中 [nPos]:[".. nPos .."] 的 nUserId 只能传大于0的整数")
		return
	end
	
	return IsEquipExist(nUserId,nPos)
end


-- 字符串替换（用于替换玩家名称中带有“<”，“>”字符的情况）
-- sOriginalStr      传入字符串
function Sys_StringGSubTip(sOriginalStr)
	if type(sOriginalStr) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_StringGSubTip 中 sOriginalStr 只能传字符")
		return
	end
	-- 替换字符串
	sOriginalStr = string.gsub(sOriginalStr, "<", "")
	sOriginalStr = string.gsub(sOriginalStr, ">", "")
	return sOriginalStr
end


-- 字符串检测（默认数据是按照玩家名来检测的，可以用于截取其他字符串）
-- sStrIn      传入字符串
-- nMaxCount   最大长度
function Sys_ChkStrLen(sStrIn,nMaxCount)
	if type(sStrIn) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_ChkStrLen 中 sStrIn 只能传字符")
		return
	end
	-- 设置初始值
	if nMaxCount == nil then
		nMaxCount = 16
	end
	if type(nMaxCount) ~= "number" or nMaxCount <= 0 or nMaxCount%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ChkEquip 中 [nMaxCount]:[".. nMaxCount .."] 只能传大于0的整数")
		return
	end
	local nCount = 0
	local nCurIndex = 0;
	local nIndex = 1;
	local nByteCount = 1;
	repeat 
		nByteCount = Sys_SubStringGetByteCount(sStrIn, nIndex)
		nIndex = nIndex + nByteCount;
		nCurIndex = nCurIndex + 1;
	until(nCurIndex >= nMaxCount + 1);
	nCount = nIndex - nByteCount - 1;
	
	return string.sub(sStrIn, 1, nCount);
end

--返回当前字符实际占用的字符数
function Sys_SubStringGetByteCount(sStr, nIndex)
	local nCurByte = string.byte(sStr, nIndex)
	local nByteCount = 1;
	if nCurByte == nil then
		nByteCount = 0
	elseif nCurByte > 0 and nCurByte <= 127 then
		nByteCount = 1
	elseif nCurByte>=192 and nCurByte<=223 then
		nByteCount = 2
	elseif nCurByte>=224 and nCurByte<=239 then
		nByteCount = 3
	elseif nCurByte>=240 and nCurByte<=247 then
		nByteCount = 4
	end
	return nByteCount;
end


-- 对白对齐
-- nLeft	左边对齐的间隔
-- sLeft    左边的文字
-- nMiddle  中间对齐的间隔
-- sMiddle  中间的文字
-- nRight   右边对齐的间隔
-- sRight   右边的文字
function Sys_Alignment(sLeft,nLeft,sMiddle,nMiddle,sRight,nRight,sLast,nLast)
	if nLeft == nil then
		nLeft = 0
	elseif type(nLeft) ~= "number" or nLeft < 0 or nLeft%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_Alignment 中 nLeft 只能传大于等于0的整数")
		return
	end
	
	if nMiddle == nil then
		nMiddle = 0
	elseif type(nMiddle) ~= "number" or nMiddle < 0 or nMiddle%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_Alignment 中 nMiddle 只能传大于等于0的整数")
		return
	end
	
	if nRight == nil then
		nRight = 0
	elseif type(nRight) ~= "number" or nRight < 0 or nRight%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_Alignment 中 nRight 只能传大于等于0的整数")
		return
	end
	
	if nLast == nil then
		nLast = 0
	elseif type(nLast) ~= "number" or nLast < 0 or nLast%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_Alignment 中 nLast 只能传大于等于0的整数")
		return
	end
	
	sLeft = sLeft or ""
	sMiddle = sMiddle or ""
	sRight = sRight or ""
	sLast = sLast or ""

	local str = ""
	local nLen = 0
	
	local sLeftStr = tGlobalFormat[5]
	
	if nLeft > 0 then
		nLen = nLeft
		sLeftStr = Sys_AlignmentSpace(nLen)
	end

	local sMiddleStr = tGlobalFormat[5]
	if nMiddle > 0 then
		nLen = nMiddle - Get_StringLenNew(sLeft) - nLeft
		if nLen > 0 then
			sMiddleStr = Sys_AlignmentSpace(nLen)
		end
	end

	local sRightStr = tGlobalFormat[5]
	if nRight > 0 then
		nLen = nRight - Get_StringLenNew(sMiddle) - nMiddle

		if nLen > 0 then
			sRightStr = Sys_AlignmentSpace(nLen)
		end
	end

	local sLastStr = tGlobalFormat[5]
	if nLast > 0 then
		nLen = nLast - Get_StringLenNew(sRight) - nRight

		if nLen > 0 then
			sLastStr = Sys_AlignmentSpace(nLen)
		end
	end
	
	-- if string.find(sLast,"STR_") ~= nil then
		-- sLast = "<" .. sLast .. ">"
	-- end

	str = string.format(tLuaRes[10024],sLeftStr,sLeft,sMiddleStr,sMiddle,sRightStr,sRight,sLastStr,sLast)
	return str
end

function Sys_AlignmentSpace(nLen)
	if nLen <= 0 then
		return ""
	end
	
	local sSpace = " "
	local str = ""
	
	local nCalLoop = 0
	while string.len(str) < nLen do
		if nCalLoop > G_CalculateLoop then
			Sys_SaveAbnormalLog("函数 Sys_AlignmentSpace 中 [while]循环超过1000次！")
			break
		end
		nCalLoop = nCalLoop + 1
		str = str .. sSpace
	end

	return str
end

----2016.10.09新增记录一些重要接口log的函数
function Sys_SaveRwbRecordLog(sText,nNowUserId)
	if type(sText) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SaveActionLog 中 sText 只能传字符")
		return
	end
	
	local nUserId = nNowUserId or Get_UserId()
	local sUserName = Get_UserName(nUserId)
	local nUserLev = Get_UserLevel(nUserId)
	local nUserPro = Get_UserProfession(nUserId)
	local nUserMeto = Get_UserMetempsychosis(nUserId) 
	local sLogUserData = sUserName..'['.. nUserId ..']['.. nUserLev ..']['.. nUserPro ..']['.. nUserMeto ..']'

	local sLogFile = "gmlog/rwb_logrecord"
	local sLogText = string.format("350,%s,%s",sLogUserData,sText)
	return SaveCustomLog(sLogFile,sLogText)
end
----2017.1.11新增系统发红包 
-- 参数1：红包类型，
-- enum RED_ENVELOPS_SEND_TYPE
-- {
    -- RED_ENVELOPS_SEND_TYPE_BEGIN = 0,
    -- RED_ENVELOPS_SEND_TYPE_FAMILY,        // 家族
    -- RED_ENVELOPS_SEND_TYPE_SYNDICATE,    // 帮派
    -- RED_ENVELOPS_SEND_TYPE_LEAGUE,        // 联盟
    -- RED_ENVELOPS_SEND_TYPE_WORLD,        // 世界
    -- RED_ENVELOPS_SEND_TYPE_FRIEND,        // 好友        目前系统红包不支持这种类型
    -- RED_ENVELOPS_SEND_TYPE_END,
-- };
-- 参数2：帮派/家族/联盟ID，
-- 参数3：金钱类型，
-- enum RED_ENVELOPS_MONEY_TYPE
-- {
    -- RED_ENVELOPS_MONEY_TYPE_BEGIN = 0,
    -- RED_ENVELOPS_MONEY_TYPE_EMONEY,        // 天石
    -- RED_ENVELOPS_MONEY_TYPE_MONEY,        // 金币
    -- RED_ENVELOPS_MONEY_TYPE_MONEY_MONO,    // 赠点
    -- RED_ENVELOPS_MONEY_TYPE_END,
-- };
-- 参数4：金钱总额，
-- 参数5：分成多少份，
-- 参数6：发红包者名字，
-- 参数7：祝福语。 
-- 参数8：口令
-- 成功返回true否则返回false

function Sys_SendRedEnvelops(nRedType,nType,nMoneyType,nMoneyNum,nManyNum,sRedName,sBless,sPassword)
	if type(nRedType) ~= "number" or nRedType%1 ~= 0 or nRedType <=0 or nRedType > 5 then
		Sys_SaveAbnormalLog("函数 Sys_SendRedEnvelops 中 nRedType 只能传0~5之间的整数")
		return
	end
	
	if type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendRedEnvelops 中 nType 只能传大于等于0的整数")
		return
	end
	
	if type(nMoneyType) ~= "number" or nMoneyType%1 ~= 0 or nMoneyType <=0 or nMoneyType > 3 then
		Sys_SaveAbnormalLog("函数 Sys_SendRedEnvelops 中 nMoneyType 只能传0~3之间的整数")
		return
	end
	
	if type(nMoneyNum) ~= "number" or nMoneyNum <= 0 or nMoneyNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendRedEnvelops 中 nMoneyNum 只能传大于0的整数")
		return
	end
	
	if type(nManyNum) ~= "number" or nManyNum <= 0 or nManyNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendRedEnvelops 中 nManyNum 只能传大于0的整数")
		return
	end
	
	if type(sRedName) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SendRedEnvelops 中 sRedName 只能传字符")
		return
	end
	
	if type(sBless) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SendRedEnvelops 中 sBless 只能传字符")
		return
	end
	
	if type(sPassword) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_SendRedEnvelops 中 sPassword 只能传字符")
		return
	end
	
	return SysSendRedEnvelops(nRedType,nType,nMoneyType,nMoneyNum,nManyNum,sRedName,sBless,sPassword)
end

----------------2017.4.11
-- 判断该地图是否可以添加经验
-- true表示该地图有禁止添加经验的type，false表示没有
function Sys_ChkAccessExp(nMapId)
	if type(nMapId) ~= "number" or nMapId < 0 or nMapId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ChkAccessExp 中 nMapId 只能传大于等于0的整数")
		return
	end
	
	local nType = Get_MapType(nMapId)
	return Sys_ParseNumbersContain(G_Sys_ProhibitAccessExp,nType)
end


------------2017.07.04
-- // 广播交互消息, 参1：action, 参2：idKieer击杀者, 参3：idBeKiller被击杀击, 返回值：成功返回true, 失败返回false。
-- bool BrocastInteractMsg(USHORT usAction, OBJID idKiller, OBJID idBeKiller);
-- 注：usAction填59表示夺宝层数光效
function Sys_BrocastInteractMsg(nAction,nKillerId,nBeKillerId)
	if type(nAction) ~= "number" or nAction < 0 or nAction%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_BrocastInteractMsg 中 nAction 只能传大于等于0的整数")
		return
	end
	
	if type(nKillerId) ~= "number" or nKillerId < 0 or nKillerId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_BrocastInteractMsg 中 nKillerId 只能传大于等于0的整数")
		return
	end
	
	if type(nBeKillerId) ~= "number" or nBeKillerId < 0 or nBeKillerId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_BrocastInteractMsg 中 nBeKillerId 只能传大于等于0的整数")
		return
	end
	
	return BrocastInteractMsg(nAction,nKillerId,nBeKillerId)
end


-- 对白居中接口
-- sLeft 	左居中文字
-- nLeft 	左居中间隔（节点）
-- sMiddle 	中居中文字
-- nMiddle 	中居中间隔（节点）
-- sRight 	右居中文字
-- nRight 	右居中间隔（节点）
-- sLast 	最后居中文字
-- nLast 	最后居中间隔（节点）
function Sys_CenterAline(sLeft,nLeft,sMiddle,nMiddle,sRight,nRight,sLast,nLast)
	if nLeft == nil then
		nLeft = 0
	elseif type(nLeft) ~= "number" or nLeft < 0 or nLeft%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_CenterAline 中 nLeft 只能传大于等于0的整数")
		return
	end
	if nMiddle == nil then
		nMiddle = 0
	elseif type(nMiddle) ~= "number" or nMiddle < 0 or nMiddle%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_CenterAline 中 nMiddle 只能传大于等于0的整数")
		return
	end
	if nRight == nil then
		nRight = 0
	elseif type(nRight) ~= "number" or nRight < 0 or nRight%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_CenterAline 中 nRight 只能传大于等于0的整数")
		return
	end
	if nLast == nil then
		nLast = 0
	elseif type(nLast) ~= "number" or nLast < 0 or nLast%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_CenterAline 中 nLast 只能传大于等于0的整数")
		return
	end
	sLeft = sLeft or ""
	sMiddle = sMiddle or ""
	sRight = sRight or ""
	sLast = sLast or ""
	local str = ""
	local nLen = 0
	local nStrLen = 0
	local sLeftStr = tGlobalFormat[5]
	local sMiddleStr = tGlobalFormat[5]
	local sRightStr = tGlobalFormat[5]
	local sLastStr = tGlobalFormat[5]
	
	if nLeft > 0 then
		local nNewLen = Get_StringLenNew(sLeft)
		nLen = nLeft - math.ceil(nNewLen/2)
		nStrLen = nLeft + math.floor(nNewLen/2)
		sLeftStr = Sys_AlignmentSpace(nLen)
	end
	
	if nMiddle > 0 then
		local nNewLen = Get_StringLenNew(sMiddle)
		nLen = nMiddle - (nStrLen + math.ceil(nNewLen/2))
		nStrLen = nMiddle + math.floor(nNewLen/ 2)
		sMiddleStr = Sys_AlignmentSpace(nLen)
	end
	
	if nRight > 0 then
		local nNewLen = Get_StringLenNew(sRight)
		nLen = nRight - (nStrLen + math.ceil(nNewLen/ 2))
		nStrLen = nRight + math.floor(nNewLen/ 2)
		sRightStr = Sys_AlignmentSpace(nLen)
	end
	
	if nLast > 0 then
		local nNewLen = Get_StringLenNew(sLast)
		nLen = nLast - (nStrLen + math.ceil(nNewLen/ 2))
		nStrLen = nLast + math.floor(nNewLen/ 2)
		sLastStr = Sys_AlignmentSpace(nLen)
	end
	
	str = string.format(tLuaRes[10024],sLeftStr,sLeft,sMiddleStr,sMiddle,sRightStr,sRight,sLastStr,sLast)
	return str
end


-- 获取字符串长度（针对悬浮对白）
function Sys_GetStrLen(sStr)
	local m = string.find(sStr,"<tip ")
	local _,n = string.find(sStr,"</tip>")
	local nSubLen = 0
	if m ~= nil and n ~= nil then
		local sSubStr = string.sub(sStr,m,n)
		local nl1 = string.find(sStr,">")
		local nl2 = string.find(sStr,"</")
		local sTipStr = string.sub(sSubStr,nl1,nl2)
		nSubLen = string.len(sSubStr) - string.len(sTipStr)
	end
	
	local nOldLen = string.len(sStr)
	local nLen = nOldLen - nSubLen

	return nLen
end


-- 2018.7.25
-- //大都市的邮件发送接口 
-- SendKOKMail
-- 发送邮件 参数1：接收者id 参数2：征服币数量 参数3：天石数 参数4：尼玛 参数5：邮件持续天数 参数6：发送者名称 参数7：邮件标题 参数8：邮件内容 
-- 返回值：成功返回true 否则返回false
function Sys_SendKOKMail(nUserId,nMoney,nEmoney,nBean,nExistDay,sSender,sTitle,sContent)
	if type(nUserId) ~= "number" or nUserId%1 ~= 0 or nUserId <= 0 then
		-- Sys_SaveAbnormalLog("函数 Sys_SendKOKMail 中 nUserId 为整型并且大于0")
		return
	end

	if type(nMoney) ~= "number" or nMoney%1 ~= 0 or nMoney < 0 then
		-- Sys_SaveAbnormalLog("函数 Sys_SendKOKMail 中 nMoney 为整型并且大于等于0")
		return
	end
	
	if type(nEmoney) ~= "number" or nEmoney%1 ~= 0 or nEmoney < 0 then
		-- Sys_SaveAbnormalLog("函数 Sys_SendKOKMail 中 nEmoney 为整型并且大于等于0")
		return
	end
	
	if type(nBean) ~= "number" or nBean%1 ~= 0 or nBean < 0 then
		-- Sys_SaveAbnormalLog("函数 Sys_SendKOKMail 中 nBean 为整型并且大于等于0")
		return
	end
	
	if type(nExistDay) ~= "number" or nExistDay%1 ~= 0 or nExistDay < 0 then
		-- Sys_SaveAbnormalLog("函数 Sys_SendKOKMail 中 nExistDay 为整型并且大于等于0")
		return
	end

	if type(sSender) ~= "string" then
		-- Sys_SaveAbnormalLog("函数 Sys_SendKOKMail 中 sSender 只能传字符串")
		return
	end	
	
	if type(sTitle) ~= "string" then
		-- Sys_SaveAbnormalLog("函数 Sys_SendKOKMail 中 sTitle 只能传字符串")
		return
	end	
	
	if type(sContent) ~= "string" then
		-- Sys_SaveAbnormalLog("函数 Sys_SendKOKMail 中 sContent 只能传字符串")
		return
	end	
	
	return SendKOKMail(nUserId,nMoney,nEmoney,nBean,nExistDay,sSender,sTitle,sContent)
end


-- 是否玩家登陆的客户端是否是征服端, 参1:玩家ID; 是返回true, 否返回false.
-- bool IsUserNormalClient(OBJID idUser)
function Sys_ChkUserNormalClient(nUserId)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_ChkUserNormalClient 中的 nUserId 只能传大于0的整数")
		return
	end
	
	return IsUserNormalClient(nUserId)
end

-- //增加贵重物品统计数量，参1：统计类型 (LUA从>300开始)，参2：物品类型，参3：个数，如果失败返回false，否则返回true。
-- 统计类型
-- =301，//重铸活动获得
-- =302，//融合活动获得
-- =303，//冶炼活动获得
-- =304，//灵珠塔活动获得
-- =305，//龙冢试炼获得
-- =306，//熔炼炉获得
-- =307，//其他LUA获得
-- =310，//灵珠锻造轮盘玩法
function Sys_IncNosuchStatisticCount(nType,nItemType,nItemNum)
	if type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_IncNosuchStatisticCount 中 nType 只能传大于等于0的整数")
		return
	end

	if type(nItemType) ~= "number" or nItemType < 0 or nItemType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_IncNosuchStatisticCount 中 nItemType 只能传大于等于0的整数")
		return
	end

	if type(nItemNum) ~= "number" or nItemNum < 0 or nItemNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_IncNosuchStatisticCount 中 nItemNum 只能传大于等于0的整数")
		return
	end

	-- 判断是否灵珠物品
	if not (nItemType >= 4200001 and nItemType <= 4200019) then
		return
	end

	return IncNosuchStatisticCount(nType,nItemType,nItemNum)
end

-- //减少贵重物品统计数量，参1：统计类型 (LUA从>300开始)，参2：物品类型，参3：个数，如果失败返回false，否则返回true。
-- 统计类型
-- =351，//重铸活动消耗
-- =352，//融合活动消耗
-- =353，//冶炼活动消耗
-- =354，//灵珠塔活动消耗
-- =355，//龙冢试炼消耗
-- =356，//熔炼炉消耗
-- =357，//其他LUA消耗
-- =360，//灵珠锻造轮盘玩法消耗
function Sys_DecNosuchStatisticCount(nType,nItemType,nItemNum)
	if type(nType) ~= "number" or nType < 0 or nType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DecNosuchStatisticCount 中 nType 只能传大于等于0的整数")
		return
	end

	if type(nItemType) ~= "number" or nItemType < 0 or nItemType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DecNosuchStatisticCount 中 nItemType 只能传大于等于0的整数")
		return
	end

	if type(nItemNum) ~= "number" or nItemNum < 0 or nItemNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_DecNosuchStatisticCount 中 nItemNum 只能传大于等于0的整数")
		return
	end

	-- 判断是否灵珠物品
	if not (nItemType >= 4200001 and nItemType <= 4200019) then
		return
	end

	return DecNosuchStatisticCount(nType,nItemType,nItemNum)
end


-- 检测是否贵重服
function Sys_IsLocalNosuchItemServer()
	return IsLocalNosuchItemServer()
end
-- 1、本服接口，同旧有接口 BrocastMsg
-- // 全服务器广播文字信息. 
-- 参1: nData表示广播的频道, 
-- 参2: pszParam表示广播的内容.
-- 参数3：弹幕聊天广播内容颜色，
-- 参数4：弹幕聊天区域， 0-中间显示区 1-上方显示区 2-下方显示区
-- 参数5：弹幕聊字号 常用的14号字体，如果不够大就再写大一点，一般是偶数
-- 如果失败返回false, 成功返回true. 
-- 本服弹幕频道：2029
function Sys_BarrageToHomeServer(sContent, sColor, nRange, nFontSize)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToHomeServer 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToHomeServer 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToHomeServer 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToHomeServer 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	return BrocastMsg(2029, sContent, sColor, nRange, nFontSize)
end

-- 2、跨服接口，同旧有接口BroadcastTalkMsgToAllServer
-- //服务器组全服广播MsgTalk消息 
-- 参数1：广播内容。
-- 参数2：data（原action中存在data中的值） 
-- 参数3：弹幕聊天广播内容颜色，
-- 参数4：弹幕聊天区域，
-- 参数5： 弹幕聊字号  
-- 返回值：成功返回true，否则返回false
-- BroadcastTalkMsgToAllServer
-- 跨服弹幕频道：2030
function Sys_BarrageToAllServer(sContent, sColor, nRange, nFontSize)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToAllServer 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToAllServer 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToAllServer 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToAllServer 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	return BroadcastTalkMsgToAllServer(sContent, 2030, sColor, nRange, nFontSize)
end

-- 3、世界服接口
-- //服务器世界服广播弹幕消息 
-- 参数1：广播内容。 
-- 参数2：弹幕聊天广播内容颜色
-- 参数3：弹幕聊天区域，
-- 参数4： 弹幕聊字号
-- 返回值：成功返回true，否则返回false
-- BroadcastTalkMsgToAllServer
-- 世界服弹幕频道：2031 -- 暂时没有用到这个频道
function Sys_BarrageToWorldServer(sContent, sColor, nRange, nFontSize)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToWorldServer 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffff0000"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToWorldServer 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToWorldServer 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToWorldServer 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	return BroadcastTalkMsgToAllServer(sContent, 2031, sColor, nRange, nFontSize)
end


-- 1、本服接口，同旧有接口 BrocastMsg，灵珠升级
-- // 全服务器广播文字信息. 
-- 参1: nData表示广播的频道, 
-- 参2: pszParam表示广播的内容.
-- 参数3：弹幕聊天广播内容颜色，
-- 参数4：弹幕聊天区域， 0-中间显示区 1-上方显示区 2-下方显示区
-- 参数5：弹幕聊字号 常用的14号字体，如果不够大就再写大一点，一般是偶数
-- 如果失败返回false, 成功返回true. 
-- 本服弹幕频道：2029
function Sys_DragonSoulUpLevToHomeServer(sContent, sColor, nRange, nFontSize)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToHomeServer 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffffffff"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToHomeServer 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 1
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToHomeServer 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToHomeServer 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	
	
	return BrocastMsg(2032, sContent, sColor, nRange, nFontSize)
end

-- 2、跨服接口，同旧有接口BroadcastTalkMsgToAllServer,灵珠升级
-- //服务器组全服广播MsgTalk消息 
-- 参数1：广播内容。
-- 参数2：data（原action中存在data中的值） 
-- 参数3：弹幕聊天广播内容颜色，
-- 参数4：弹幕聊天区域，
-- 参数5： 弹幕聊字号  
-- 返回值：成功返回true，否则返回false
-- BroadcastTalkMsgToAllServer
-- 跨服弹幕频道：2030
function Sys_DragonSoulUpLevToAllServer(sContent, sColor, nRange, nFontSize)
	if type(sContent) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToAllServer 中 sContent 只能传字符--[sContent]:[".. sContent .."]")
		return
	end
	
	if sColor == nil then
		sColor = "0xffffffff"
	elseif type(sColor) ~= "string" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToAllServer 中 sColor 只能传字符--[sColor]:[".. sColor .."]")
		return
	end
	
	if nRange == nil then
		nRange = 0
	elseif type(nRange) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToAllServer 中 nRange 只能传字符--[nRange]:[".. nRange .."]")
		return
	end
	
	if nFontSize == nil then
		nFontSize = 14
	elseif type(nFontSize) ~= "number" then
		Sys_SaveAbnormalLog("函数 Sys_BarrageToAllServer 中 nFontSize 只能传字符--[nFontSize]:[".. nFontSize .."]")
		return
	end
	
	return BroadcastTalkMsgToAllServer(sContent, 2032, sColor, nRange, nFontSize)
end


-- 副本功能 计算当前副本刷新了多少波怪 返回true/false
-- nMapId 当前副本的动态地图ID
function Sys_IncInstanceRefreshTimes(nMapId)
	if type(nMapId) ~= "number" or nMapId <= 0 then
		Sys_SaveAbnormalLog("函数 Sys_IncInstanceRefreshTimes 中 [nMapId]:[".. nMapId .."] 的nMapId 只能传大于0的数")
		return
	end
	
	return IncInstanceRefreshTimes(nMapId)
end
-- 判断是否是全球服
-- 增加程序暴露的LUA接口   // 本服是否世界服。 返回值，是返回true，否返回false
-- this->LuaScript()->ExportCFunc(fn_IsWorldGlobalServer, "IsWorldGlobalServer");
function Sys_IsWorldGlobalServer()	
	return IsWorldGlobalServer()
end


-- 开启类型3的地宫 开启之后在时间结束前才能进入 
-- // 开启全服地宫, 参1:地宫类型ID对应cq_sealed_treasure_type表的ID 只能开类型为2的全服地宫, 返回值:返回是否开始成功
function Sys_OpenServerUndergroundPalace(nTreasureId)
	if nTreasureId == nil then
		nTreasureId = 0
	elseif type(nTreasureId) ~= "number" or nTreasureId < 0 or nTreasureId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 User_EnterUndergroundPalace [nTreasureId]:[".. nTreasureId .."]中 nTreasureId 只能传大等于于0的整数")
		return
	end
	return OpenServerSealedTreasure(nTreasureId)
end 
-- nGroup 地宫分组
-- nFloor 地宫层数
-- nType 是否直接破禁 1表示直接破禁 0表示非直接破禁
-- nUserId 玩家id
-- 记录地宫破禁的数据(测试接口)
function Sys_SaveSealTreasureLog(nUserId,nGroup,nFloor,nType)
	local sUserName = Get_UserName(nUserId)
	local sSituation 
	if nType == 1 then 
		sSituation = "直接破禁"
	elseif nType == 0 then 
		sSituation = "破禁"
	else
		sSituation = "情况不明"
	end
	local sLogFile = "gmlog/sealtreasure_log"
	local sLogText = string.format("%s玩家（%d），在%d类地宫，%d层，%s",sUserName,nUserId,nGroup,nFloor,sSituation)
	return SaveCustomLog(sLogFile,sLogText)
end


-- 通知客户端弹出指定商店指定物品
-- 参1：玩家ID，参2,：商店NPCid，参3：物品Type，参4：物品个数。成功返回true 否则返回false,新增参数5：币种（1：天石 2：赠品天石）参6 倒计时(秒) 
-- SendShopItem
function Sys_SendShopItem(nNpcId,nItemId,nItemNum,nCostType,nTime,nUserId,nGuiStyle)
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" or nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendShopItem 第4个参数nUserId必须为整型并且大于等于0")
		return
	end
	
	if nNpcId == nil then
		nNpcId = 0
	elseif type(nNpcId) ~= "number" or nNpcId < 0 or nNpcId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendShopItem 的 [nNpcId]:[".. nNpcId .."] 必须为整数且大于0。")
		return
	end
	
	if nItemId == nil then
		nItemId = 0
	elseif type(nItemId) ~= "number" or nItemId <= 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendShopItem 的 [nItemId]:[".. nItemId .."] 必须为整数且大于0。")
		return
	end
	
	if nItemNum == nil then 
	   nItemNum = 1
	elseif type(nItemNum) ~= "number" or nItemNum < 0 or nItemNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendShopItem 中 [nItemId]:[".. nItemId .."] 的 nItemNum 必须为整数且不小于0。")
		return
	end
	
	if type(nCostType) ~= "number" or  nCostType < 0 or nCostType%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendShopItem 中 [nCostType]:[".. nCostType .."] 必须为整数且大于等于0。")
		return
	end
	
	if type(nTime) ~= "number" or  nTime < 0 or nTime%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendShopItem 中 [nTime]:[".. nTime .."] 必须为整数且大于等于0。")
		return
	end
	
	if nGuiStyle == nil then
		nGuiStyle = 0
	elseif type(nGuiStyle) ~= "number" or nItemNum < 0 or nItemNum%1 ~= 0 then
		Sys_SaveAbnormalLog("函数 Sys_SendShopItem 中 [nGuiStyle]:[".. nGuiStyle .."] 的 nGuiStyle 必须为整数且不小于0。")
		return
	end

	
	return SendShopItem(nUserId,nNpcId,nItemId,nItemNum,nCostType,nTime,nGuiStyle)
end

-- // 返回当前是否开启全服地宫, 返回值:返回是否有开启
-- 全服地宫同一时间只有一个
function Sys_IsServerSealedTreasureOpen()
	return IsServerSealedTreasureOpen()
end 

