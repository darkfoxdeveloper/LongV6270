----------------------------------------------------------------------------
--Name:		[����][���ú���]��Ʒ����.lua
--Purpose:	��Ʒ�����ӿ�
--Creator: 	�ֽ�
--Created:	2014/06/26
----------------------------------------------------------------------------
---------------------------------�����淶----------------------------------
------------------------------actiontype�ķ���------------------------------
--Sys  ��Ʒ����
--Send ��Ϣ����
--Get  �������
--Set  �޸�����
--Chk  �������
--Del  ɾ������
--Add  �������
------------------------------------------------------------------------------
-- ��Ʒ��������ǰ׺�ʣ�Item_
--���ӣ�
--(fn_DeleteItem, "DeleteItem");//ɾ����Ʒ����1:���ID, ��2:��Ʒ����ID, ��3:����, ��4:�Ƿ��ж���ƷΪǬ����

--function Item_DelItem(nUserId,nItemtypeId,nNum,bSash)
--
--end

------------------------------------------------------------------------------

--(fn_DeleteTaskItem, "DeleteTaskItem");		//ɾ��������Ʒ  		��1:���ID, ��2:��ƷID
--nItemId --��Ӧcq_item���id
function Item_DelTaskItem(nItemId,nUserId)
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then
	    Sys_SaveAbnormalLog("����Item_DelTaskItem��nItemId����Ϊ�����Ҵ���0��")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("����Item_DelTaskItem��nUserId����Ϊ�����Ҳ�С��0��")
		return
	end
	
	local nItemTypeId = Get_ItemType(nItemId)
	
	if Item_ChkItem(nItemTypeId) then
		return DeleteTaskItem(nUserId,nItemId)
	else
		Sys_SaveAbnormalLog(string.format("����Item_DelTaskItem�����IDΪ%d������IDλ%d����Ʒ��",nUserId,nItemTypeId))
		return
	end
end

--(fn_DeleteItem, "DeleteItem");			//ɾ����Ʒ  			��1:���ID, ��2:��Ʒ����ID, ��3:�Ƿ�Ϊ��Ʒ, ��4:�Ƿ��ж���ƷΪǬ����
--nItemNum,nSashΪ��ѡ������Ĭ��ֵ0
function Item_DelItem(nItemId,nMonopoly,nSash,nUserId)
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then
	    Sys_SaveAbnormalLog("���� Item_DelItem ��nItemId����Ϊ�����Ҵ���0��")
		return
	end
	
	if nMonopoly == nil then 
	   nMonopoly = 1
	elseif type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Item_DelItem ��nMonopoly����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("���� Item_DelItem ��nSash����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("���� Item_DelItem ��nUserId����Ϊ�����Ҳ�С��0��")
		return
	end

	if Item_ChkItem(nItemId,nMonopoly,nSash,nUserId) then
		return DeleteItem(nUserId,nItemId,nMonopoly,nSash)
	else
		Sys_SaveAbnormalLog(string.format("����DeleteItem�����IDΪ%d������û����Ʒ%d��",nUserId,nItemId))
		return
	end
end

--(fn_DeleteMultiItem, "DeleteMultiItem");	//ɾ�������Ʒ			��1:���ID, ��2:��Ʒ1����ID, ��3:��Ʒ2����ID, ��4:��Ʒ����, ��5:�ܷ�ʹ����Ʒ, ��6:�Ƿ��ж���ƷΪǬ����
--nMonopoly,nSashΪ��ѡ������Ĭ��ֵ0
function Item_DelMulItem(nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash,nUserId)
	if type(nStartItemId) ~= "number" or nStartItemId <= 0 or nStartItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_DelMulItem��nStartItemId����Ϊ�����Ҵ���0��")
		return
	end
	
	if type(nEndItemId) ~= "number" or nEndItemId <= 0 or  tonumber(nEndItemId) < tonumber(nStartItemId) or nEndItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_DelMulItem��nEndItemId����Ϊ����0������,��Ҫ����nStartItemId��")
		return
	end
	
	if type(nItemNum) ~= "number" or nItemNum <= 0 or nItemNum%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_DelMulItem��nItemNum����Ϊ�����Ҵ���0��")
		return
	end
	
	if nMonopoly == nil then 
	   nMonopoly = 1
	elseif type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_DelMulItem��nMonopoly����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_DelMulItem��nSash����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("����Item_DelMulItem��nUserId����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if Item_ChkMulItem(nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash,nUserId) then
		return DeleteMultiItem(nUserId,nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash)
	else
		Sys_SaveAbnormalLog(string.format("����DeleteMultiItem�����IDΪ%d������û��%d��IDΪ%d��%d����Ʒ��",nUserId,nItemNum,nStartItemId,nEndItemId))
		return
	end
end

--(fn_DelAllItemByType, "DelAllItemByType");	//ɾ������ĳ������Ʒ		��1:���ID, ��2:��Ʒ����,		ʧ�ܷ���false�����򷵻�true
--����˵���� nItemId ����ʾ��ƷID�� nUserId ����ʾ���ID
function Item_DelAllItemByType(nItemId,nUserId)
	if type(nItemId) ~= "number" then
		Sys_SaveAbnormalLog("���� Item_DelAllItemByType �� nItemId ֻ�ܴ�����0������")
		return
	end
	
	if nUserId == nil then
		nUserId = 0
	elseif type(nUserId) ~= "number" then
		Sys_SaveAbnormalLog("���� Item_DelAllItemByType �� nUserId ֻ�ܴ�����0������")
		return
	end
	
	if Item_ChkItem(nItemId) then
		return DelAllItemByType(nUserId,nItemId)
	else
		Sys_SaveAbnormalLog(string.format("����DelAllItemByType�����IDΪ%d������û��IDΪ%d����Ʒ��",nUserId,nItemId))
		return
	end
end


--(fn_CheckItem, "CheckItem");			//�����Ʒ  			��1:���ID, ��2:��Ʒ����ID, ��3:�ܷ�ʹ����Ʒ, ��4:�Ƿ��ж���ƷΪǬ����
--nMonopoly,nSashΪ��ѡ������Ĭ��ֵ0
function Item_ChkItem(nItemId,nMonopoly,nSash,nUserId)
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_ChkItem��nItemId����Ϊ�����Ҵ���0��")
		return
	end
	
	if nMonopoly == nil then 
	   nMonopoly = 1
	elseif type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_ChkItem��nMonopoly����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_ChkItem��nSash����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("����Item_ChkItem��nUserId����Ϊ�����Ҳ�С��0��")
		return
	end
	
	return CheckItem(nUserId,nItemId,nMonopoly,nSash)
end

--(fn_CheckMultiItem, "CheckMultiItem");		//�������Ʒ			��1:���ID, ��2:��Ʒ1����ID, ��3:��Ʒ2����ID, ��4:��Ʒ����, ��5:�ܷ�ʹ����Ʒ, ��6:�Ƿ��ж���ƷΪǬ����
--nMonopoly,nSashΪ��ѡ������Ĭ��ֵ0
function Item_ChkMulItem(nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash,nUserId)
	if type(nStartItemId) ~= "number" or nStartItemId <= 0 or nStartItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_ChkMulItem��nStartItemId����Ϊ�����Ҵ���0��")
		return
	end
	
	if type(nEndItemId) ~= "number" or nEndItemId <= 0 or nEndItemId%1 ~= 0 or tonumber(nEndItemId) < tonumber(nStartItemId) then
		Sys_SaveAbnormalLog("����Item_ChkMulItem��nEndItemId����Ϊ����0������,��Ҫ����nStartItemId��")
		return
	end
	
	if type(nItemNum) ~= "number" or nItemNum <= 0 or nItemNum%1 ~= 0 then
	Sys_SaveAbnormalLog("����Item_ChkMulItem��nItemNum����Ϊ�����Ҵ���0��")
		return
	end

	if nMonopoly == nil then 
	   nMonopoly = 1
	elseif type(nMonopoly) ~= "number" or nMonopoly < 0 or nMonopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_ChkMulItem��nMonopoly����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_ChkMulItem��nSash����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("����Item_ChkMulItem��nUserId����Ϊ�����Ҳ�С��0��")
		return
	end
	
	return CheckMultiItem(nUserId,nStartItemId,nEndItemId,nItemNum,nMonopoly,nSash)
end

--(fn_CheckAccumulate, "CheckAccumulate");	//�����Ʒ����			��1:���ID, ��2:��Ʒ����ID, ��3:����, ��4:�Ƿ��ж���ƷΪǬ����
--nItemNum,nSashΪ��ѡ������nItemNumĬ��ֵ1,nSashĬ��ֵ0
function Item_ChkAccItem(nItemId,nItemNum,nSash,nUserId)
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_ChkAccItem��nItemId����Ϊ�����Ҵ���0��")
		return
	end
	
	if nItemNum == nil then 
	   nItemNum = 1
	elseif type(nItemNum) ~= "number" or nItemNum < 0 or nItemNum%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_ChkAccItem����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nSash == nil then 
	   nSash = 0
	elseif type(nSash) ~= "number" or nSash < 0 or nSash%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_ChkAccItem��nSash����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if nUserId == nil then 
       nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
	    Sys_SaveAbnormalLog("����Item_ChkAccItem��nUserId����Ϊ�����Ҳ�С��0��")
		return
	end

	return CheckAccumulate(nUserId,nItemId,nItemNum,nSash)
end

--(fn_AddNewItem, "AddNewItem");			//������Ʒ
--						// �����Ʒ�����Զ������Ƿ���ӡ�data=itemtype_id,param="flag addamount monopoly save_time active onlinetime data reduce_dmg add_life addlevel_exp magic3 gem1 gem2 magic1 magic2 amount amount_limit anti_monster ident color",
--						// param��ʡ�ԣ�����ȱʡֵΪ0(��ʾ���޸�), flag��ʾ��ʶλ,��־λ��0λΪ0�򲻼�鱳����Ʒ��ӷ�����,��־λ��1λΪ0�򲻼̳���Ʒ������Ʒ��ӣ�����̳�;
--						// addamount��ʾ�����Ʒ�ĸ�����Ϊ0ֻ���һ��,monopoly��ʾ��Ʒװ��Ʒ��,save_time��ʾ��Ʒ����Чʱ�䣨��λΪ���ӣ�,active��ʾ����,onlinetime��ʾʱЧ����Ʒ��ɾ��ʱ��
--						// data��ʾ������ƥ��Ʒ�Ŀͻ��˱�����ɫ�ļ�¼����ֵ��R*65536+G*256+B���ӵĽ��,reduce_dmg��ʾװ���������ԣ�1~7��,add_life��ʾװ���ӳ�����,addlevel_exp��ʾ׷����������,
--						// magic3��ʾװ��׷����ֵ��1~12��,gem1��ʾ��һ���������������û����Ƕ��ʯ�Ķ�������д255�ͺ��ˣ������Ҫ����Ƕ��ָ����ʯ�Ķ��������Ҫд��ʯ��ţ�,gem2��ʾ�ڶ�����
--						// magic1��ʾװ�������ĵ�һ��ħ��Ч��,magic2��ʾװ�������ĵڶ���ħ��Ч��,amount��ʾ��ǰ�;�,amount_limit��ʾ�;�����,anti_monster��ʾװ�����ƹ�������
--						// ident��ʾ�Ƿ����,color��ʾװ����ɫ

function Item_AddItem(nItemId,flag,addamount,monopoly,save_time,active,onlinetime,data,reduce_dmg,add_life,addlevel_exp,magic3,gem1,gem2,magic1,magic2,amount,amount_limit,anti_monster,ident,color,nUserId)
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then 
		Sys_SaveAbnormalLog("����Item_AddItem��nItemId����Ϊ�����Ҵ���0��")
		return
	end	
	
	if flag == nil then 
	   flag = 0
	elseif flag~= 0 and flag~= 1 then
		Sys_SaveAbnormalLog("����Item_AddItem��flag����Ϊ0��1��")
		return
	end

	if addamount == nil then 
		addamount = 0
	elseif type(addamount) ~= "number" or addamount < 0 or addamount%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��addamount������ڵ���0��")
		return
	end
	
	if monopoly == nil then 
		monopoly = 0
	elseif type(monopoly) ~= "number" or monopoly < 0 or monopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��monopoly����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if save_time == nil then 
		save_time = 0
	elseif type(save_time) ~= "number" or save_time < 0 or save_time%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��save_time������ڵ���0��")
		return
	end
	
	if active == nil then 
		active = 0
	elseif type(active) ~= "number" or active < 0 or active%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��active������ڵ���0��")
		return
	end
	
	if onlinetime == nil then 
		onlinetime = 0
	elseif type(onlinetime) ~= "number" or onlinetime < 0 or onlinetime%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��onlinetime������ڵ���0��")
		return
	end	
	
	if data == nil then 
		data = 0
	elseif type(data) ~= "number" or data < 0 or data%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem�ĵ�data������ڵ���0��")
		return
	end

	if reduce_dmg == nil then 
		reduce_dmg = 0
	elseif type(reduce_dmg) ~= "number" or reduce_dmg < 0 or reduce_dmg%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��reduce_dmg����Ϊ����0��������")
		return
	end	
	
	if add_life == nil then 
		add_life = 0
	elseif type(add_life) ~= "number" or add_life < 0 or add_life%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��add_life����Ϊ���ڵ���0��������")
		return
	end		   
	
	if addlevel_exp == nil then 
		addlevel_exp = 0
	elseif type(addlevel_exp) ~= "number" or addlevel_exp < 0 or addlevel_exp%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��addlevel_exp����Ϊ���ڵ���0��������")
		return
	end	
	
	if magic3 == nil then 
		magic3 = 0
	elseif type(magic3) ~= "number" or magic3 < 0 or magic3%1 ~= 0 or magic3 > 12 then
		Sys_SaveAbnormalLog("����Item_AddItem��magic3����Ϊ0~12֮���������")
		return
	end	
	
	if gem1 == nil then 
		gem1 = 0
	elseif type(gem1) ~= "number" or gem1 < 0 or gem1%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��gem1����Ϊ����0��������")
		return
	end	
	
	if gem2 == nil then 
		gem2 = 0
	elseif type(gem2) ~= "number" or gem2 < 0 or gem2%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��gem2����Ϊ����0��������")
		return
	end	
	
	if magic1 == nil then 
		magic1 = 0
	elseif type(magic1) ~= "number" or magic1 < 0 or magic1%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��magic1����Ϊ����0��������")
		return
	end	
	
	if magic2 == nil then 
		magic2 = 0
	elseif type(magic2) ~= "number" or magic2 < 0 or magic2%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��magic2����Ϊ����0��������")
		return
	end	
	
	if amount == nil then 
		amount = 0
	elseif type(amount) ~= "number" or amount < 0 or amount%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��amount����Ϊ����0��������")
		return
	end		
	
	if amount_limit == nil then 
		amount_limit = 0
	elseif type(amount_limit) ~= "number" or amount_limit < 0 or amount_limit%1~= 0 or amount_limit < amount then
		Sys_SaveAbnormalLog("����Item_AddItem��amount_limit����Ϊ���ڵ���0��������Ҫ���ڵ���amount��")
		return
	end		
	
	if anti_monster == nil then 
		anti_monster = 0
	elseif type(anti_monster) ~= "number" or anti_monster < 0 or anti_monster%1~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��anti_monster������ڵ���0��")
		return
	end		
	
	if ident == nil then 
		ident = 0
	elseif type(ident) ~= "number" or ident < 0 or ident%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��ident������ڵ���0��")
		return
	end		
	
	if color == nil then 
		color = 0
	elseif type(color) ~= "number" or (color < 0 or color > 9) or color%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��color���������0-9֮�䡣")
		return
	end		
	
	if nItemId == 300000 then 
	   local color1 = tonumber(reduce_dmg) * 65536
	   local color2 = tonumber(add_life) * 256
	   local color3 = tonumber(anti_monster)
	   local ndata = tonumber(data)
		if color1 + color2 + color3 ~= ndata then
			Sys_SaveAbnormalLog("����Item_AddItem�ĵ�data����Ϊreduce_dmg*65536+add_life*256+anti_monster��")
			return
		end
	end
	
	if nUserId == nil then 
		nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddItem��nUserId����Ϊ�����Ҳ�С��0��")
		return
	end
	
	return AddNewItem(nUserId,nItemId,flag,addamount,monopoly,save_time,active,onlinetime,data,reduce_dmg,add_life,addlevel_exp,magic3,gem1,gem2,magic1,magic2,amount,amount_limit,anti_monster,ident,color)
end

--(fn_AddNewItem, "AddNewItem");			//������Ʒ
--������ĺ���������ͬ�������÷���ͬ
--sItemAttr ����action param�÷�������������������ڱ�����ԱȽ�һĿ��Ȼ��
--���ӣ�Item_AddNewItem(1000000,"0 5 3")
function Item_AddNewItem(nItemId,sItemAttr,nUserId) 
	local tItemAttr = Sys_Split(sItemAttr," ")
	local flag  = tonumber(tItemAttr[1])
	local addamount = tonumber(tItemAttr[2])
	local monopoly = tonumber(tItemAttr[3])
	local save_time = tonumber(tItemAttr[4])
	local active = tonumber(tItemAttr[5])
	local onlinetime = tonumber(tItemAttr[6])
	local data = tonumber(tItemAttr[7])
	local reduce_dmg = tonumber(tItemAttr[8])
	local add_life = tonumber(tItemAttr[9])
	local addlevel_exp = tonumber(tItemAttr[10])
	local magic3 = tonumber(tItemAttr[11])
	local gem1 = tonumber(tItemAttr[12])
	local gem2 = tonumber(tItemAttr[13])
	local magic1 = tonumber(tItemAttr[14])
	local magic2 = tonumber(tItemAttr[15])
	local amount = tonumber(tItemAttr[16])
	local amount_limit = tonumber(tItemAttr[17])
	local anti_monster = tonumber(tItemAttr[18])
	local ident = tonumber(tItemAttr[19])
	local color = tonumber(tItemAttr[20])
	
	if type(nItemId) ~= "number" or  nItemId <= 0 or nItemId%1 ~= 0 then 
		Sys_SaveAbnormalLog("����Item_AddNewItem��nItemId����Ϊ�����Ҵ���0��")
		return
	end	
	
	if flag == nil then 
		flag = 0
	elseif flag~= 0 and flag~= 1 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��flag����Ϊ0��1��")
		return
	end

	if addamount == nil then 
		addamount = 0
	elseif type(addamount) ~= "number" or addamount < 0 or addamount%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��addamount������ڵ���0��")
		return
	end
	
	if monopoly == nil then 
		monopoly = 0
	elseif type(monopoly) ~= "number" or monopoly < 0 or monopoly%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��monopoly����Ϊ�����Ҳ�С��0��")
		return
	end
	
	if save_time == nil then 
		save_time = 0
	elseif type(save_time) ~= "number" or save_time < 0 or save_time%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��save_time������ڵ���0��")
		return
	end
	
	if active == nil then 
		active = 0
	elseif type(active) ~= "number" or active < 0 or active%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��active������ڵ���0��")
		return
	end
	
	if onlinetime == nil then 
		onlinetime = 0
	elseif type(onlinetime) ~= "number" or onlinetime < 0 or onlinetime%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��onlinetime������ڵ���0��")
		return
	end	
	
	if data == nil then 
		data = 0
	elseif type(data) ~= "number" or data < 0 or data%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem�ĵ�data������ڵ���0��")
		return
	end

	if reduce_dmg == nil then 
		reduce_dmg = 0
	elseif type(reduce_dmg) ~= "number" or reduce_dmg < 0 or reduce_dmg%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��reduce_dmg����Ϊ����0��������")
		return
	end	
	
	if add_life == nil then 
		add_life = 0
	elseif type(add_life) ~= "number" or add_life < 0 or add_life%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��add_life����Ϊ���ڵ���0��������")
		return
	end		   
	
	if addlevel_exp == nil then 
		addlevel_exp = 0
	elseif type(addlevel_exp) ~= "number" or addlevel_exp < 0 or addlevel_exp%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��addlevel_exp����Ϊ���ڵ���0��������")
		return
	end	
	
	if magic3 == nil then 
		magic3 = 0
	elseif type(magic3) ~= "number" or magic3 < 0 or magic3%1 ~= 0 or magic3 > 12 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��magic3����Ϊ0~12֮���������")
		return
	end	
	
	if gem1 == nil then 
		gem1 = 0
	elseif type(gem1) ~= "number" or gem1 < 0 or gem1%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��gem1����Ϊ����0��������")
		return
	end	
	
	if gem2 == nil then 
		gem2 = 0
	elseif type(gem2) ~= "number" or gem2 < 0 or gem2%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��gem2����Ϊ����0��������")
		return
	end	
	
	if magic1 == nil then 
		magic1 = 0
	elseif type(magic1) ~= "number" or magic1 < 0 or magic1%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��magic1����Ϊ����0��������")
		return
	end	
	
	if magic2 == nil then 
		magic2 = 0
	elseif type(magic2) ~= "number" or magic2 < 0 or magic2%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��magic2����Ϊ����0��������")
		return
	end	
	
	if amount == nil then 
		amount = 0
	elseif type(amount) ~= "number" or amount < 0 or amount%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��amount����Ϊ����0��������")
		return
	end		
	
	if amount_limit == nil then 
		amount_limit = 0
	elseif type(amount_limit) ~= "number" or amount_limit < 0 or amount_limit%1~= 0 or amount_limit < amount then
		Sys_SaveAbnormalLog("����Item_AddNewItem��amount_limit����Ϊ���ڵ���0��������Ҫ���ڵ���amount��")
		return
	end		
	
	if anti_monster == nil then 
		anti_monster = 0
	elseif type(anti_monster) ~= "number" or anti_monster < 0 or anti_monster%1~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��anti_monster������ڵ���0��")
		return
	end		
	
	if ident == nil then 
		ident = 0
	elseif type(ident) ~= "number" or ident < 0 or ident%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��ident������ڵ���0��")
		return
	end		
	
	if color == nil then 
		color = 0
	elseif type(color) ~= "number" or (color < 0 or color > 9) or color%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��color���������0-9֮�䡣")
		return
	end		
	
	if nItemId == 300000 then 
	   local color1 = tonumber(reduce_dmg) * 65536
	   local color2 = tonumber(add_life) * 256
	   local color3 = tonumber(anti_monster)
	   local ndata = tonumber(data)
		if color1 + color2 + color3 ~= ndata then
			Sys_SaveAbnormalLog("����Item_AddNewItem�ĵ�data����Ϊreduce_dmg*65536+add_life*256+anti_monster��")
			return
		end
	end
	
	if nUserId == nil then 
		nUserId = 0
	elseif type(nUserId) ~= "number" or  nUserId < 0 or nUserId%1 ~= 0 then
		Sys_SaveAbnormalLog("����Item_AddNewItem��nUserId����Ϊ�����Ҳ�С��0��")
		return
	end
	
	return AddNewItem(nUserId,nItemId,flag,addamount,monopoly,save_time,active,onlinetime,data,reduce_dmg,add_life,addlevel_exp,magic3,gem1,gem2,magic1,magic2,amount,amount_limit,anti_monster,ident,color)
end
-----------20140822---------

