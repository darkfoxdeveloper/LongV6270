----------------------------------------------------------------------------
--Name:		[����][��������]NPC���ı�.lua
--Purpose:	NPC���ı�
--Creator: 	֣����
--Created:	2014/08/28
----------------------------------------------------------------------------

--NPC���ı�,֧�ֶ���������ʾ����ͨ����NPC������NPC��
--tNpcGossip[NPCID]["Text"]={"����1","����2",...}
--tNpcGossip[NPCID]["Option"]={"����ѡ��1","����ѡ��2",...}
--tNpcGossip[NPCID]["Function"]=����NPC�ӵĺ���
tNpcGossip={}

--[[
NPC���ı�,֧�ֶ���������ʾ����ͨ����NPC������NPC��
tNpcGossip[NPCID]["Text"]							--��������
tNpcGossip[NPCID]["Option"]							--����ѡ��
tNpcGossip[NPCID]["Function"]						--����NPC�ӵĺ���
tNpcGossip[nNpcId]["OptionHidden"]					--Ϊ1����ʾtNpcGossip[nNpcId]["Option"]��Ĭ�ϵġ���ǡ�ѡ�����Ϊ��ʾ

--������NPC����ģ������˵��
tNpcGossip[44622]["Text1"] = "ChkFunc1Ϊfalse������϶�����ʾ��"
tNpcGossip[44622]["ChkFunc1"] = function () return false end
tNpcGossip[44622]["Text2"] = "ChkFunc2Ϊtrue����ʾ�԰�2��֮��Ĳ��ټ�⡣"
tNpcGossip[44622]["ChkFunc2"] = function () return true end
tNpcGossip[44622]["Text3"] = "ChkFunc3Ϊtrue�����ѳ��԰�2���˶԰ײ������ˡ�"
tNpcGossip[44622]["ChkFunc3"] = function () return true end

tNpcGossip[44622]["Option1"] = "Option1"
tNpcGossip[44622]["OptionChkFunc1"] = function () return true end --�Ӻ�������Ϊnil��������trueʱ��ʾOption1
tNpcGossip[44622]["OptionFunc1"] = "SysFunc_TheFirstPetBattle_SysMsg" --���Զ������Ӻ���
tNpcGossip[44622]["Option2"] = "Option2"
tNpcGossip[44622]["OptionChkFunc2"] = nil
tNpcGossip[44622]["OptionFunc2"] = "" --���Զ������Ӻ�����Ϊ""��nilʱ����

--�ڶ���
--tNpcGossip[44622]["Text"..sIndex..j] --��Ϊ����һ�����ÿ�����ݹ�����sIndexΪ��һ�㴫���ѡ��ֵ��jΪ��һ��Ĳ������ã�����һ���
tNpcGossip[44622]["Text21"] = "ChkFunc21Ϊfalse������϶�����ʾ��"
tNpcGossip[44622]["ChkFunc21"] = function () return false end
tNpcGossip[44622]["Text22"] = "ChkFunc22Ϊtrue����ʾ�԰�22��֮��Ĳ��ټ�⡣"
tNpcGossip[44622]["ChkFunc22"] = function () return true end
tNpcGossip[44622]["Text23"] = "ChkFunc23Ϊtrue�����ѳ��԰�22���˶԰ײ������ˡ�"
tNpcGossip[44622]["ChkFunc23"] = function () return true end

tNpcGossip[44622]["Option21"] = "Option21"
tNpcGossip[44622]["OptionChkFunc21"] = function () return true end --�Ӻ�������Ϊnil��������trueʱ��ʾOption1
tNpcGossip[44622]["Option22"] = "Option22"
tNpcGossip[44622]["OptionChkFunc22"] = nil
tNpcGossip[44622]["OptionFunc22"] = "" --���Զ������Ӻ�����Ϊ""��nilʱ����

--������
--tNpcGossip[44622]["Text"..sIndex..j] --��Ϊ����һ�����ÿ�����ݹ�����sIndexΪ��һ�㴫���ѡ��ֵ��jΪ��һ��Ĳ������ã�����һ���
tNpcGossip[44622]["Text211"] = "ChkFunc211Ϊfalse������϶�����ʾ��"
tNpcGossip[44622]["ChkFunc211"] = function () return false end
tNpcGossip[44622]["Text212"] = "ChkFunc212Ϊtrue����ʾ�԰�212��֮��Ĳ��ټ�⡣"
tNpcGossip[44622]["ChkFunc212"] = function () return true end
tNpcGossip[44622]["Text213"] = "ChkFunc213Ϊtrue�����ѳ��԰�212���˶԰ײ������ˡ�"
tNpcGossip[44622]["ChkFunc213"] = function () return true end

tNpcGossip[44622]["Option211"] = "Option211"
tNpcGossip[44622]["OptionChkFunc211"] = function () return true end --�Ӻ�������Ϊnil��������trueʱ��ʾOption1
tNpcGossip[44622]["OptionFunc211"] = "SysFunc_TheFirstPetBattle_SysMsg" --���Զ������Ӻ���
tNpcGossip[44622]["Option212"] = "Option212"
tNpcGossip[44622]["OptionChkFunc212"] = nil
tNpcGossip[44622]["OptionFunc212"] = "" --���Զ������Ӻ�����Ϊ""��nilʱ����
--]]
