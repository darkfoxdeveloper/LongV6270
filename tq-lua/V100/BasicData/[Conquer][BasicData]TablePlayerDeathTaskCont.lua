----------------------------------------------------------------------------
--Name:		[����][��������]�����������������.lua
--Purpose:	�����������������
--Creator: 	֣����
--Created:	2014/12/18
----------------------------------------------------------------------------
--�����������������
tUserKilled = {}

--����
--tUserKilled["tFunction"] = tUserKilled["tFunction"] or {}
--table.insert(tUserKilled["tFunction"],func)

-- ��Ҹ����������
tUserSave = {}
--����
--tUserSave["tFunction"] = tUserSave["tFunction"] or {}
--table.insert(tUserSave["tFunction"],func)

-- ������괥��������
tKeepGhost = {}
--����
--tKeepGhost["tFunction"] = tKeepGhost["tFunction"] or {}
--table.insert(tKeepGhost["tFunction"],func)

-- ��ҽ�������������
tClearKeepGhost = {}
--����
--tClearKeepGhost["tFunction"] = tClearKeepGhost["tFunction"] or {}
--table.insert(tClearKeepGhost["tFunction"],func)

-- ������λ����	Ӯ����
tArenicWins = {}
--����
--tArenicWins["tFunction"] = tArenicWins["tFunction"] or {}
--table.insert(tArenicWins["tFunction"],func)

-- ������λ����	������
tArenicCompetes = {}
--����
--tArenicCompetes["tFunction"] = tArenicCompetes["tFunction"] or {}
--table.insert(tArenicCompetes["tFunction"],func)

-- �����λ����	Ӯ����
tTeamArenicWins = {}
--����
--tTeamArenicWins["tFunction"] = tTeamArenicWins["tFunction"] or {}
--table.insert(tTeamArenicWins["tFunction"],func)

-- �����λ����	������
tTeamArenicCompetes = {}
--����
--tTeamArenicCompetes["tFunction"] = tTeamArenicCompetes["tFunction"] or {}
--table.insert(tTeamArenicCompetes["tFunction"],func)

-- ��裬��ҳ���յ��Ǵ���
tRideArrive = {}
--����
--tRideArrive["tFunction"] = tRideArrive["tFunction"] or {}
--table.insert(tRideArrive["tFunction"],func)

-- �书��ÿ������ʱ������
tTrainGongFu = {}
--����
--tTrainGongFu["tFunction"] = tTrainGongFu["tFunction"] or {}
--table.insert(tTrainGongFu["tFunction"],func)

-- ������������ɴ�����
tServerStart = {}
--����
--tServerStart["tFunction"] = tServerStart["tFunction"] or {}
--table.insert(tServerStart["tFunction"],func)

-- ����ڹ�ת��
tStrengthExchange = {}
--����
--tStrengthExchange["tFunction"] = tStrengthExchange["tFunction"] or {}
--table.insert(tStrengthExchange["tFunction"],func)

--??????????????????????????????
tCheckInItemToCoatStorage = {}
--??
--tCheckInItemToCoatStorage["tFunction"] = tCheckInItemToCoatStorage["tFunction"] or {}
--table.insert(tCheckInItemToCoatStorage["tFunction"],func)

--?????????????LUA????????????????????
tCheckOutItemFromCoatStorage = {}
--??
--tCheckOutItemFromCoatStorage["tFunction"] = tCheckOutItemFromCoatStorage["tFunction"] or {}
--table.insert(tCheckOutItemFromCoatStorage["tFunction"],func)

--??????lua??
-- //????????
tProcessTrainingVitality = {}
--??
--tProcessTrainingVitality["tFunction"] = tProcessTrainingVitality["tFunction"] or {}
--table.insert(tProcessTrainingVitality["tFunction"],func)

-- //???????????????
tReplaceGongfuValue = {}
--??
--tReplaceGongfuValue["tFunction"] = tReplaceGongfuValue["tFunction"] or {}
--table.insert(tReplaceGongfuValue["tFunction"],func)

--//?????????
tAfterVexillum = {}
--??
--tAfterVexillum["tFunction"] = tAfterVexillum["tFunction"] or {}
--table.insert(tAfterVexillum["tFunction"],func)

--//???????????
tAfterCrossVexillum = {}
--??
--tAfterCrossVexillum["tFunction"] = tAfterCrossVexillum["tFunction"] or {}
--table.insert(tAfterCrossVexillum["tFunction"],func)

-- ???????????LUA??UserAchivementCount?????????????????
tAchivementCount = {}
--??
--tAchivementCount["tFunction"] = tAchivementCount["tFunction"] or {}
--table.insert(tAchivementCount["tFunction"],func)

-- ???????????
tDelUserItemFromCoatStorage = {}
--??
--tDelUserItemFromCoatStorage = tDelUserItemFromCoatStorage["tFunction"] or {}
--table.insert(tDelUserItemFromCoatStorage["tFunction"],func)

-- ????????
tQuizPersonalReward = {}
--??
--tQuizPersonalReward = tQuizPersonalReward["tFunction"] or {}
--table.insert(tQuizPersonalReward["tFunction"],func)

-- ?????????
tQuizRankingsReward = {}
--??
--tQuizRankingsReward = tQuizRankingsReward["tFunction"] or {}
--table.insert(tQuizRankingsReward["tFunction"],func)

-- BossRewardEnd ????
tBossRewardEnd = {}

-- BossDamageBonus ??????
tBossDamageBonus = {}

-- BossLastKnifeAward ??????
tBossLastKnifeAward ={}

--??????
tAwardHorseRace = {}

-- //???? (??InviteFilter????) ??? ???????true???false ????action ??129?
-- SetInviteFilter
tSetInviteFilter = {}

-- //???? (??InviteTrans????) ??? ???????true???false????action ??130?
-- SendInvite
tSendInvite = {}

-- ????PK???
tAwardCrossElite = {}


-- ??????
tCardsLotteryAgainCost = {}

-- ?????
tSendDivorceMail = {}

-- ??????????
tProcessMonsterDie = {}

-- ??????
tCardsLotteryRecordCost = {}

-- ??????
tGlobalLotteryRecordCost = {}

-- ????PK???
tUserAwardCrossClanPKPrize = {}

-- ?????????LUA??
tBloodTriggerLua = {}
-- ??????????ID
tProcessDelInstance = {}

-- ?????? ??
-- ????????????????
-- </F>GetBonusByAction</N>%lu</N>%lu
-- ?????????ID?actionID
-- GetBonusByAction
tGetKOKBonusByAction = {}