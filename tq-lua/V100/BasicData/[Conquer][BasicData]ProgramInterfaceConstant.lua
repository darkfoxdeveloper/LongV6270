----------------------------------------------------------------------------
--Name:		[征服][基础数据]程序接口常量.lua
--Purpose:	程序接口常量
--Creator: 	郑江文
--Created:	2014/09/01
----------------------------------------------------------------------------
G_PLAYER_BEGIN 						=	1000
G_PLAYER_ID 						=	1001	--当前玩家ID				支持操作:	get
G_PLAYER_Name 						=	1002	--玩家名字         				get
G_PLAYER_LookFace					=	1003	--玩家头像编号						get set
G_PLAYER_Hair 						=	1004	--玩家发型编号						get
G_PLAYER_Profession					=	1005	--玩家的职业						get set
G_PLAYER_Level						=	1006	--玩家等级							get		 add
G_PLAYER_MapID						=	1007	--玩家所在地图ID  					get
G_PLAYER_PosX						=	1008	--玩家所在地图X坐标  				get
G_PLAYER_PosY						=	1009	--玩家所在地图Y坐标				get
G_PLAYER_Virtue						=	1010	--玩家功德值						get
G_PLAYER_Meto						=	1011	--玩家转世							get
G_PLAYER_Sex						=	1012	--玩家性别							get
G_PLAYER_TeamMemberNum				=	1013	--玩家队伍成员数量，没有队伍为0	get
G_PLAYER_HomeID						=	1014	--玩家房子id						get
G_PLAYER_AccountId					=	1015	--玩家账号id						get
G_PLAYER_BattleEffect				=	1016	--玩家战斗力						get
G_PLAYER_MateName					=	1017	--玩家伴侣名称						get
G_PLAYER_RidingPoints				=	1018	--玩家骑宠积分						get
G_PLAYER_Life						=	1019	--玩家生命值						get		 add
G_PLAYER_MaxLife					=	1020	--玩家最大生命值					get
G_PLAYER_Mana						=	1021	--玩家法力值						get		 add
G_PLAYER_MaxMana					=	1022	--玩家最大法力值					get
G_PLAYER_Mentor						=	1023	--玩家点化机会						get		 add
G_PLAYER_Transfrom					=	1024	--变身ID							get	set
G_PLAYER_Money						=	1025	--玩家游戏币						get		 add
G_PLAYER_MoneyTrial					=	1026	--试炼窟天石操作							 add
G_PLAYER_EMoney						=	1027	--玩家天石							get		 add
G_PLAYER_EMoneyMono					=	1028	--玩家赠点							get		 add
G_PLAYER_Exp						=	1029	--玩家经验(add操作不增加贡献)		get		 add
G_PLAYER_ExpContribute				=	1030	--玩家经验(add操作增加贡献)				 add
G_PLAYER_PK							=	1031	--玩家PK值							get		 add
G_PLAYER_Strength					=	1032	--玩家力量值						get		 add
G_PLAYER_Speed						=	1033	--玩家灵巧值		 				get		 add
G_PLAYER_Health						=	1034	--玩家体力值						get		 add
G_PLAYER_Soul						=	1035	--玩家精神值						get		 add
G_PLAYER_SynRank					=	1036	--玩家帮派里排名					get
G_PLAYER_Iterator					=	1037	--用于在任务系统中叠代			get	set	 add
G_PLAYER_Crime						=	1038	--犯罪时间							get	set
G_PLAYER_GameCard					=	1039	--cq_card记录数量					get
G_PLAYER_GameCard2					=	1040	--cq_card2记录数量					get
G_PLAYER_XP							=	1041	--当前XP值							get	set	 add
G_PLAYER_EP							=	1042	--体力值							get	set	 add
G_PLAYER_AddPoint					=	1043	--玩家属性点						get	set	 add
G_PLAYER_ClientVersion				=	1044	--客户的版本						get
G_PLAYER_Peerage					=	1045	--玩家爵位							get
G_PLAYER_Businness					=	1046	--玩家商人状态						get	set
G_PLAYER_VIP						=	1047	--玩家VIP等级						get
G_PLAYER_VIPValue					=	1048	--玩家VIP值							get	set	 add
G_PLAYER_StorageMoney				=	1049	--玩家存储的钱						get		 add
G_PLAYER_FirstPro					=	1050	--职业								get
G_PLAYER_OldPro						=	1051	--前世职业							get
G_PLAYER_AddMount					=	1052	--坐骑移动力								 add
G_PLAYER_Cultivation				=	1053	--修行值							get		 add
G_PLAYER_PKProtocol					=	1054	--PK模式							get	set
G_PLAYER_StrengthValue				=	1055	--气力值							get		 add
G_PLAYER_SynID						=	1056	--帮派ID							get
G_PLAYER_FamilyID					=	1057	--家族ID							get
G_PLAYER_LevupExp					=	1058	--升级到下一级所需经验			get
G_PLAYER_MateID						=	1059	--获得配偶ID						get
G_PLAYER_GodBless					=	1060	--获得祝福剩余时间				get		 add
G_PLAYER_TransferDragon20			=	1061	--玩家转服龙珠20的数量			get
G_PLAYER_TransferDragon100			=	1062	--玩家转服龙珠100的数量			get
G_PLAYER_BusinessManDays			=	1063	--商人转正剩余天数				get
G_PLAYER_GodBlessTime				=	1064	--玩家祝福账号的到期时间		get
G_PLAYER_ExpPercent					=	1065	--玩家百分比经验(add操作不增加贡献)	get		add
G_PLAYER_ExpPercentContribute		=	1066	--玩家百分比经验(add操作增加贡献)		add
G_PLAYER_CultureValue    			=	1067		--获取玩家修为值				get add
G_PLAYER_League_Point    			=	1068		--获取玩家黄金联赛积分 		get add
G_PLAYER_League_ID    				=	1069		--获取玩家联盟id 		get
G_PLAYER_Service_Value    			=	1070		--玩家战功 		get add
G_PLAYER_League_Official     		=	1071		--获取玩家官职 		get
G_PLAYER_ExpTime					=	1072	--通过exptime绐玩家加经验	add
G_PLAYER_Golden_Limit				=	1073	--获取玩家仓库增加的黄金联赛积分
SCRIPT_PARAM_PLAYER_GONGFU_TOTAL_POWER = 1074   --获取玩家自创武功总分
G_PLAYER_ServerID					=	1077	--获取玩家原服务器ID
G_PLAYER_Beans = 1079   						--获取金豆数量
SCRIPT_PARAM_PLAYER_SPECIAL_EXP_TIME = 1080 	--特殊经验(无每日上限限制,60分钟要传600) add
SCRIPT_PARAM_PLAYER_SPECIAL_EXP_PERCENT = 1081 	--按百分比增加特殊的玩家经验(不增加贡献) add
SCRIPT_PARAM_PLAYER_EXP_POOL = 1082 			--经验池经验                        get
SCRIPT_PARAM_PLAYER_EXP_Surplus = 1083 			--获取玩家身上剩余经验（包含人物经验以及经验池经验）                        get
SCRIPT_PARAM_PLAYER_EMONEY_TIANMEN = 1085 			--活动通过AddUserInt接口对玩家天石的操作改为用新增的子类型
SCRIPT_PARAM_PLAYER_Wing_Type = 1086 			--获取玩家当前翅膀皮肤数据                        get
SCRIPT_PARAM_PLAYER_Title_Type = 1087 			--获取玩家当前称号数据type id                        get
G_PLAYER_EMONEY_RECYCLE = 1089 				--表示对玩家天石的回收，对应e_money记录类型为110
G_PLAYER_EMONEY_DRAGONSOUL = 1088 			--灵珠通过AddUserInt接口对玩家天石的操作改为用新增的子类型
G_SCRIPT_PARAM_PLAYER_PROF_EXP = 1090 				--表示增加或获得玩家的职业经验
G_SCRIPT_PARAM_PLAYER_PK = 1091 				--读取和设置PK模式状态
G_SCRIPT_PARAM_PLAYER_EMONEY_GM_RECYCLE = 1092			--表示GM回收天石对玩家的天石操作
G_PLAYER_ATTRIBUTE_LIMIT = 1093 				--读取和设置玩家属性削弱状态接口
G_PLAYER_LAST 						=	1999

G_NPC_BEGIN 						=	2000
G_NPC_ID 							=	2001	--取当前NPC的ID			=id=0
G_NPC_Name 							=	2002	--取NPC的姓名
G_NPC_OwnerID 						=	2003	--取NPC的OwnerID
G_NPC_OwnerType 					=	2004	--取NPC的OwnerType
G_NPC_Type 							=	2005	--取NPC的类型
G_NPC_LookFace 						=	2006	--取NPC的Lookface
G_NPC_MapID 						=	2007	--取NPC所在的地图编号
G_NPC_PosX 							=	2008	--取NPC所在地图的X坐标
G_NPC_PosY 							=	2009	--取NPC所在地图的Y坐标
G_NPC_Data0 						=	2010	--取NPC身上的Data0值
G_NPC_Data1 						=	2011	--取NPC身上的Data1值
G_NPC_Data2 						=	2012	--取NPC身上的Data2值
G_NPC_Data3 						=	2013	--取NPC身上的Data3值
G_NPC_DataStr 						=	2014	--取NPC身上的DataStr值
G_NPC_MaxLife 						=	2015	--取NPC最大血值
G_NPC_Life 							=	2016	--取NPC当前血值
G_NPC_LAST 							=	2099


G_MAP_BEGIN 						=	2100	--2101，2103-2107 要用GetMapInt获取，2103，2108-2111要用GetMapIntEx获取
G_MAP_ID 							=	2101	--取当前地图的ID			=ID=0
G_MAP_Name 							=	2102	--取地图的名称
G_MAP_Type 							=	2103	--取地图的属性
G_MAP_OwnerID 						=	2104	--取地图主人ID
G_MAP_RebornMap						=	2105	--取地图重生地图ID
G_MAP_PosX 							=	2106	--取地图重生点X坐标
G_MAP_PosY 							=	2107	--取地图重生点Y坐标
G_MAP_SYNID 						=	2108	--帮派地图
G_MAP_RES_LEV 						=	2109	--资源等级
G_MAP_DOC 							=	2110	--mapdoc
G_MAP_STATUS 						=	2111	--设置状态
G_MAP_RESET_STATUS					=	2112	--重置状态
G_MAP_PORTAL_X 						=	2113	--取地图入口点X坐标
G_MAP_PORTAL_Y   					=	2114	--取地图入口点Y坐标
G_MAP_LAST  						=	2199


G_DYNA_GLOBAL_BEGIN 				=	2200
G_DYNA_GLOBAL_ID					=	2201	-- cq_dyna_global_data (与表顺序对应=id在lua中无接口)
G_DYNA_GLOBAL_DATA0					=	2202
G_DYNA_GLOBAL_DATA1					=	2203
G_DYNA_GLOBAL_DATA2					=	2204
G_DYNA_GLOBAL_DATA3					=	2205
G_DYNA_GLOBAL_DATA4					=	2206
G_DYNA_GLOBAL_DATA5					=	2207
G_DYNA_GLOBAL_DATASTR0				=	2208
G_DYNA_GLOBAL_DATASTR1				=	2209
G_DYNA_GLOBAL_DATASTR2				=	2210
G_DYNA_GLOBAL_DATASTR3				=	2211
G_DYNA_GLOBAL_DATASTR4				=	2212
G_DYNA_GLOBAL_DATASTR5				=	2213
G_DYNA_GLOBAL_TIME0					=	2214
G_DYNA_GLOBAL_TIME1					=	2215
G_DYNA_GLOBAL_TIME2					=	2216
G_DYNA_GLOBAL_TIME3					=	2217
G_DYNA_GLOBAL_TIME4					=	2218
G_DYNA_GLOBAL_TIME5					=	2219
G_DYNA_GLOBAL_LAST					=	2249

G_TASKDETAIL_BEGIN					=	2250
G_TASKDETAIL_ID						=	2251	-- task_detail (与表顺序对应			=id在lua中无接口)
G_TASKDETAIL_USER_ID				=	2252
G_TASKDETAIL_TASK_ID				=	2253
G_TASKDETAIL_COMPLETE_FLAG			=	2254
G_TASKDETAIL_NOTIFY_FLAG			=	2255
G_TASKDETAIL_DATA1					=	2256
G_TASKDETAIL_DATA2					=	2257
G_TASKDETAIL_DATA3					=	2258
G_TASKDETAIL_DATA4					=	2259
G_TASKDETAIL_DATA5					=	2260
G_TASKDETAIL_DATA6					=	2261
G_TASKDETAIL_DATA7					=	2262
G_TASKDETAIL_TASK_OVERTIME			=	2263
G_TASKDETAIL_TASK_OVERTIME_SEC		=	2264
G_TASKDETAIL_TYPE			 	 	=	2265
G_MAX_ACCUMULATE_TIMES	         	=	2266
G_TASKDETAIL_LAST			 	 	=	2299


G_ITEM_BEGIN			 				=	2300
G_ITEM_ID			 				=	2301	--物品的ID			=ID=0
G_ITEM_Type			 				=	2302	--物品类型
G_ITEM_OwnerID			 			=	2303	--OwnerID
G_ITEM_PlayerID			 			=	2304	--PlayerID
G_ITEM_Amount			 			=	2305	--当前耐久
G_ITEM_AmountLimit			 	 	=	2306	--耐久上限
G_ITEM_Ident						=	2307	--是否鉴定
G_ITEM_Position						=	2308	--位置
G_ITEM_Gem1							=	2309	--第一个洞
G_ITEM_Gem2							=	2310	--第二个洞
G_ITEM_Magic1						=	2311	--第一种魔法效果
G_ITEM_Magic2						=	2312	--第二种魔法效果
G_ITEM_Addition						=	2313	--追加数值			--这个就是G_ITEM_Magic3
G_ITEM_Data							=	2314	--物品Data字段值
G_ITEM_ReduceDmg					=	2315	--神佑
G_ITEM_AddLife						=	2316	--生命加持
G_ITEM_AntiMonster					=	2317	--克制怪物
G_ITEM_Name							=	2318	--名字
G_ITEM_Color						=	2319	--颜色
G_ITEM_Monopoly						=	2320	--赠品装备属性
G_ITEM_AddExp						=	2321	--追加经验
G_ITEM_DelTime						=	2322	--时效性物品删除时间
G_ITEM_SaveTime						=	2323	--物品有效时间
-- G_ITEM_AcutionDeposit				=	2324	--拍卖行保证金
G_ITEM_ITEM_VALUE					=	2330	--获取物品价值
G_ITEM_LAST							=	2399

G_TEAM_BEGIN						=	2400
G_TEAM_ID							=	2401	--队伍的ID
G_TEAM_Amount						=	2402	--队伍人数
G_TEAM_MinLev						=	2403	--组员最低等级
G_TEAM_MaxLev						=	2404	--组员最高等级
G_TEAM_MinMoney						=	2405	--组员最少金币
G_TEAM_Mate							=	2406	--组员是否为伴侣
G_TEAM_Friend						=	2407	--组员是否为朋友
G_TEAM_Alive						=	2408	--组员是否都活着
G_TEAM_LAST							=	2499
G_ITEM_Data1						=	2325	--物品data1字段值
G_ITEM_Data2						=	2326	--物品data2字段值
G_ITEM_Data3						=	2327	--物品data3字段值
G_ITEM_Data4						=	2328	--物品data4字段值
G_ITEM_Data5						=	2329	--物品data5字段值

G_TRAP_BEGIN						=	2500	-- cq_trap表
G_TRAP_ID							=	2501
G_TRAP_TYPE							=	2502
G_TRAP_LOOK							=	2503
G_TRAP_OWNER_ID						=	2504    --暂未实现
G_TRAP_MAPID						=	2505
G_TRAP_PosX							=	2506
G_TRAP_PosY							=	2507
G_TRAP_DATA							=	2508	--暂未实现
G_TRAP_BOUND_CX						=	2509	--暂未实现
G_TRAP_BOUND_CY						=	2510	--暂未实现
G_TRAP_LAST							=	2599

G_EMONEY_CARD_BEGIN					=	2600	-- 天石卡表
G_EMONEY_CARD1						=	2601	-- emoney_card
G_EMONEY_CARD2						=	2602	-- emoney_card2
G_EMONEY_CARD3						=	2603	-- emoney_card3
G_EMONEY_CARD4						=	2604	-- emoney_card4
G_EMONEY_CARD_END					=	2699

G_ITEMTYPE_BEGIN					=	2700	--cq_itemtype属性
G_ITEMTYPE_Name						=	2701	--名字
G_ITEMTYPE_Profession				=	2702	--职业限制
G_ITEMTYPE_Skill					=	2703	--武器限制
G_ITEMTYPE_Level					=	2704	--等级限制
G_ITEMTYPE_Sex						=	2705	--性别限制
G_ITEMTYPE_Monopoly					=	2706	--独占性
G_ITEMTYPE_Mask						=	2707	--(贵重物品之类的属性)
G_ITEMTYPE_EmoneyPrice				=	2708	--天石价格
G_ITEMTYPE_EmoneyMonoPrice			=	2709	--赠点价格
G_ITEMTYPE_SaveTime					=	2710	--保持时间
G_ITEMTYPE_TypeDesc					=	2711	--类型说明
G_ITEMTYPE_ItemDesc					=	2712	--物品说明
G_ITEMTYPE_AccumulateLimit			=	2713	--物品叠加数
G_ITEMTYPE_LAST						=	2799

G_NPC_COUNT_BEGIN					=	2800
G_NPC_COUNT_ALL						=	2801	--取玩家地图上所有NPC的数量
G_NPC_COUNT_FURNITURE				=	2802	--取玩家地图上所有家具的数量
G_NPC_COUNT_NAME					=	2803	--取玩家地图上所有指定名字的NPC数量
G_NPC_COUNT_TYPE					=	2804	--取玩家地图上所有指定类型的NPC数量
G_NPC_COUNT_LAST					=	2899

G_SYNDICATE_BEGIN					=	2800
G_SYNDICATE_ALLY_SYN0				=	2801	--同盟帮派1
G_SYNDICATE_ALLY_SYN1				=	2802	--同盟帮派2
G_SYNDICATE_ALLY_SYN2				=	2803	--同盟帮派3
G_SYNDICATE_ALLY_SYN3				=	2804	--同盟帮派4
G_SYNDICATE_ALLY_SYN4				=	2805	--同盟帮派5
G_SYNDICATE_ALLY_SYN5				=	2806	--同盟帮派6
G_SYNDICATE_ALLY_SYN6				=	2807	--同盟帮派7
G_SYNDICATE_ALLY_SYN7				=	2808	--同盟帮派8
G_SYNDICATE_ALLY_SYN8				=	2809	--同盟帮派9
G_SYNDICATE_ALLY_SYN9				=	2810	--同盟帮派10
G_SYNDICATE_ALLY_SYN10				=	2811	--同盟帮派11
G_SYNDICATE_ALLY_SYN11				=	2812	--同盟帮派12
G_SYNDICATE_ALLY_SYN12				=	2813	--同盟帮派13
G_SYNDICATE_ALLY_SYN13				=	2814	--同盟帮派14
G_SYNDICATE_ALLY_SYN14				=	2815	--同盟帮派15
G_SYNDICATE_ENEMY_SYN0				=	2816	--敌对帮派1
G_SYNDICATE_ENEMY_SYN1				=	2817	--敌对帮派2
G_SYNDICATE_ENEMY_SYN2				=	2818	--敌对帮派3
G_SYNDICATE_ENEMY_SYN3				=	2819	--敌对帮派4
G_SYNDICATE_ENEMY_SYN4				=	2820	--敌对帮派5
G_SYNDICATE_ENEMY_SYN5				=	2821	--敌对帮派6
G_SYNDICATE_ENEMY_SYN6				=	2822	--敌对帮派7
G_SYNDICATE_ENEMY_SYN7				=	2823	--敌对帮派8
G_SYNDICATE_ENEMY_SYN8				=	2824	--敌对帮派9
G_SYNDICATE_ENEMY_SYN9				=	2825	--敌对帮派10
G_SYNDICATE_ENEMY_SYN10				=	2826	--敌对帮派11
G_SYNDICATE_ENEMY_SYN11				=	2827	--敌对帮派12
G_SYNDICATE_ENEMY_SYN12				=	2828	--敌对帮派13
G_SYNDICATE_ENEMY_SYN13				=	2829	--敌对帮派14
G_SYNDICATE_ENEMY_SYN14				=	2830	--敌对帮派15
G_SYNDICATE_NAME					=	2831	--帮派名称
G_SYNDICATE_LEADER_NAME				=	2832	--帮派帮主名称
G_SYNDICATE_MONEY					=	2833	--帮派基金
G_SYNDICATE_MEMBER_AMOUNT			=	2834	--帮派成员数量
G_SYNDICATE_EMONEY					=	2835	--帮派天石
G_SYNDICATE_LEVEL					=	2837	--帮派等级
SCRIPT_PARAM_SYNDICATE_LEADER_ID	=	2838	--获取帮主id

G_SYNDICATE_END						=	2899

G_SYN_MEMBER_ATTR_BEGIN				=	2900
G_SYN_MEMBER_ATTR_RANK				=	2901	--帮派玩家的帮派内等级(指帮主，长老这种)
G_SYN_MEMBER_ATTR_PROFFER			=	2902	--帮派玩家的游戏币贡献值
G_SYN_MEMBER_ATTR_END				=	2999


G_GONGFU_ATTR_BEGIN				 	=	3000
G_GONGFU_ATTR_REALM				 	=	3001	--玩家的功力境界		get
G_GONGFU_ATTR_FREE_CULTIVATE_PARAM	=	3002	--玩家免费修炼参数		get	set	add
G_GONGFU_ATTR_GENUINEQI_LV		 	=	3003	--玩家真气等级			get	set	add
G_GONGFU_ATTR_END				 	=	3099

G_MONSTER_BEGIN						=	3100	--怪物
G_MONSTER_ID						=	3101
G_MONSTER_Name						=	3102
G_MONSTER_Type						=	3103
G_MONSTER_MapID						=	3104
G_MONSTER_PosX						=	3105
G_MONSTER_PosY						=	3106
G_MONSTER_MaxLife					=	3107
G_MONSTER_Life						=	3108
G_MONSTER_Level						=	3109
G_MONSTER_LAST				 		=	3199



----------------------------------------------------------征服里面常用到的一些上限
G_User_MaxLev = 140								--玩家等级上限
G_User_Maxmoney = 99999999999					--玩家金币上限
G_User_MaxEmoney = 999999999					--玩家天石上限
G_User_MaxEmoneyMono = 999999999				--玩家赠品天石上限
G_User_FreePractice = 1000000					--玩家免费修炼次数上限
G_User_MaxZhenQi = 5							--真气上限
G_User_RepairValue = 9999999999					--修为上限
G_User_GoldenLeague = 343700					--黄金联赛积分上限
G_User_AttrPoint = 900							--属性点上限
G_Item_Additional = 12							--追加上限
G_Item_GodBless = 7								--神佑上限
G_Item_MinGemstone = 1							--给装备时直接添加宝石时的最小ID
G_Item_MaxGemstone = 123						--给装备时直接添加宝石时的最大ID
G_Item_Gemstone = 255							--给装备时直接无宝石时的值
G_Sys_ProhibitAccessExp = 1099511627776			--不能获得经验地图的属性type
G_Gold_DynaGlobal = 75							--金币服的动态存储表ID
G_Sys_GoldServer = 0							--金币服的标识位

----------------------------------------------------------玩家职业编号
-- 勇士（10-15）
G_PRO_Trojan0					=	10		--见习勇士
G_PRO_Trojan1					=	11		--勇士
G_PRO_Trojan2					=	12		--百战勇士
G_PRO_Trojan3					=	13		--虎威勇士
G_PRO_Trojan4					=	14		--擒龙勇士
G_PRO_Trojan5					=	15		--武神
-- 战士（20-25）
G_PRO_Warrior0					=	20		--见习战士
G_PRO_Warrior1					=	21		--战士
G_PRO_Warrior2					=	22		--铜盔战士
G_PRO_Warrior3					=	23		--银铠战士
G_PRO_Warrior4					=	24		--金甲战士
G_PRO_Warrior5					=	25		--战神
-- 射手（40-45）
G_PRO_Archer0					=	40		--见习箭手
G_PRO_Archer1					=	41		--箭手
G_PRO_Archer2					=	42		--黑雕射手
G_PRO_Archer3					=	43		--白虎射手
G_PRO_Archer4					=	44		--金龙射手
G_PRO_Archer5					=	45		--金弓射手
-- 忍者（50-55）
G_PRO_Ninja0					=	50		--见习忍者
G_PRO_Ninja1					=	51		--忍者
G_PRO_Ninja2					=	52		--暗刃中忍
G_PRO_Ninja3					=	53		--弑杀上忍
G_PRO_Ninja4					=	54		--秘杀影忍
G_PRO_Ninja5					=	55		--雾隐忍王
-- 武僧（60-65）
G_PRO_Monk0						=	60		--见习武僧
G_PRO_Monk1						=	61		--武僧
G_PRO_Monk2						=	62		--伏虎武僧
G_PRO_Monk3						=	63		--灭魔武僧
G_PRO_Monk4						=	64		--伽蓝武僧
G_PRO_Monk5						=	65		--大梵圣僧
-- 海盗（70-75）
G_PRO_Pirate0					=	70		--见习男海盗
G_PRO_Pirate1					=	71		--海盗
G_PRO_Pirate2					=	72		--佩枪海盗
G_PRO_Pirate3					=	73		--海盗精英
G_PRO_Pirate4					=	74		--海盗船长
G_PRO_Pirate5					=	75		--海盗王
-- 拳师（80-85）
G_PRO_Dragon0					=	80		--见习男海盗
G_PRO_Dragon1					=	81		--海盗
G_PRO_Dragon2					=	82		--佩枪海盗
G_PRO_Dragon3					=	83		--海盗精英
G_PRO_Dragon4					=	84		--海盗船长
G_PRO_Dragon5					=	85		--海盗王
-- 道士（100-145）
G_PRO_Taoist0					=	100		--见习道士
G_PRO_Taoist1					=	101		--道士
-- 水道（132-135）
G_PRO_WaterTaoist2				=	132		--水道士
G_PRO_WaterTaoist3				=	133		--水法师
G_PRO_WaterTaoist4				=	134		--水天师
G_PRO_WaterTaoist5				=	135		--水真人
-- 火道（142-145）
G_PRO_FireTaoist2				=	142		--火道士
G_PRO_FireTaoist3				=	143		--火法师
G_PRO_FireTaoist4				=	144		--火天师
G_PRO_FireTaoist5				=	145		--火真人

-- 铁扇门
G_PRO_IroFan0					=	160		--见习铁扇门
G_PRO_IroFan1					=	161		--铁扇门
G_PRO_IroFan2					=	162		--银扇门
G_PRO_IroFan3					=	163		--金扇门
G_PRO_IroFan4					=	164		--白金扇门
G_PRO_IroFan5					=	165		--钻石扇门
-- 雷神
G_PRO_Thor0					=	90		--见习雷霆斗士
G_PRO_Thor1					=	91		--雷霆斗士
G_PRO_Thor2					=	92		--雷霆斗师
G_PRO_Thor3					=	93		--雷霆斗尊
G_PRO_Thor4					=	94		--雷霆斗圣
G_PRO_Thor5					=	95		--雷神

--升级所需时间，见cq_levexp up_lev_time 字段
tUpLevTime = {}

tUpLevTime[1] = 2
tUpLevTime[2] = 2
tUpLevTime[3] = 1
tUpLevTime[4] = 2
tUpLevTime[5] = 2
tUpLevTime[6] = 3
tUpLevTime[7] = 3
tUpLevTime[8] = 5
tUpLevTime[9] = 7
tUpLevTime[10] = 14
tUpLevTime[11] = 18
tUpLevTime[12] = 20
tUpLevTime[13] = 23
tUpLevTime[14] = 26
tUpLevTime[15] = 25
tUpLevTime[16] = 34
tUpLevTime[17] = 37
tUpLevTime[18] = 44
tUpLevTime[19] = 50
tUpLevTime[20] = 57
tUpLevTime[21] = 56
tUpLevTime[22] = 58
tUpLevTime[23] = 59
tUpLevTime[24] = 66
tUpLevTime[25] = 67
tUpLevTime[26] = 66
tUpLevTime[27] = 65
tUpLevTime[28] = 72
tUpLevTime[29] = 83
tUpLevTime[30] = 92
tUpLevTime[31] = 91
tUpLevTime[32] = 92
tUpLevTime[33] = 103
tUpLevTime[34] = 117
tUpLevTime[35] = 121
tUpLevTime[36] = 121
tUpLevTime[37] = 122
tUpLevTime[38] = 134
tUpLevTime[39] = 155
tUpLevTime[40] = 160
tUpLevTime[41] = 172
tUpLevTime[42] = 188
tUpLevTime[43] = 235
tUpLevTime[44] = 269
tUpLevTime[45] = 283
tUpLevTime[46] = 282
tUpLevTime[47] = 278
tUpLevTime[48] = 312
tUpLevTime[49] = 361
tUpLevTime[50] = 302
tUpLevTime[51] = 302
tUpLevTime[52] = 316
tUpLevTime[53] = 342
tUpLevTime[54] = 392
tUpLevTime[55] = 417
tUpLevTime[56] = 418
tUpLevTime[57] = 374
tUpLevTime[58] = 463
tUpLevTime[59] = 537
tUpLevTime[60] = 566
tUpLevTime[61] = 567
tUpLevTime[62] = 578
tUpLevTime[63] = 672
tUpLevTime[64] = 770
tUpLevTime[65] = 834
tUpLevTime[66] = 837
tUpLevTime[67] = 847
tUpLevTime[68] = 924
tUpLevTime[69] = 1059
tUpLevTime[70] = 819
tUpLevTime[71] = 833
tUpLevTime[72] = 828
tUpLevTime[73] = 1040
tUpLevTime[74] = 1193
tUpLevTime[75] = 831
tUpLevTime[76] = 834
tUpLevTime[77] = 824
tUpLevTime[78] = 918
tUpLevTime[79] = 1067
tUpLevTime[80] = 1104
tUpLevTime[81] = 1109
tUpLevTime[82] = 1138
tUpLevTime[83] = 1287
tUpLevTime[84] = 1479
tUpLevTime[85] = 1557
tUpLevTime[86] = 1565
tUpLevTime[87] = 1588
tUpLevTime[88] = 1717
tUpLevTime[89] = 2000
tUpLevTime[90] = 2082
tUpLevTime[91] = 2093
tUpLevTime[92] = 1662
tUpLevTime[93] = 1877
tUpLevTime[94] = 2182
tUpLevTime[95] = 2326
tUpLevTime[96] = 2365
tUpLevTime[97] = 2429
tUpLevTime[98] = 2654
tUpLevTime[99] = 3085
tUpLevTime[100] = 3252
tUpLevTime[101] = 3307
tUpLevTime[102] = 3634
tUpLevTime[103] = 4610
tUpLevTime[104] = 5358
tUpLevTime[105] = 5710
tUpLevTime[106] = 5792
tUpLevTime[107] = 6071
tUpLevTime[108] = 6536
tUpLevTime[109] = 9211
tUpLevTime[110] = 9720
tUpLevTime[111] = 10810
tUpLevTime[112] = 10964
tUpLevTime[113] = 11155
tUpLevTime[114] = 11347
tUpLevTime[115] = 11424
tUpLevTime[116] = 11539
tUpLevTime[117] = 11730
tUpLevTime[118] = 13804
tUpLevTime[119] = 17057
tUpLevTime[120] = 13422
tUpLevTime[121] = 16107
tUpLevTime[122] = 19328
tUpLevTime[123] = 23194
tUpLevTime[124] = 27833
tUpLevTime[125] = 33399
tUpLevTime[126] = 40079
tUpLevTime[127] = 48095
tUpLevTime[128] = 51053
tUpLevTime[129] = 51053
tUpLevTime[130] = 102106
tUpLevTime[131] = 153159
tUpLevTime[132] = 229739
tUpLevTime[133] = 344608
tUpLevTime[134] = 516912
tUpLevTime[135] = 775368
tUpLevTime[136] = 1163052
tUpLevTime[137] = 1744578
tUpLevTime[138] = 2616867
tUpLevTime[139] = 3925301
tUpLevTime[140] = 3925301
tUpLevTime[141] = 3925301
tUpLevTime[142] = 3925301
tUpLevTime[143] = 3925301
tUpLevTime[144] = 3925301
tUpLevTime[145] = 3925301
tUpLevTime[146] = 3925301
tUpLevTime[147] = 3925301
tUpLevTime[148] = 3925301
tUpLevTime[149] = 3925301

-- 地图传送光效，五大主城，市场，镇魔榙
tChgMapEffect = {}
tChgMapEffect[1000] = "moveback"
tChgMapEffect[1002] = "moveback"
tChgMapEffect[1011] = "moveback"
tChgMapEffect[1015] = "moveback"
tChgMapEffect[1020] = "moveback"
tChgMapEffect[1036] = "moveback"
tChgMapEffect[4020] = "moveback"

-- 非物品装备段
tNoItem = {}
tNoItem[1] = {700000,799999}
tNoItem[2] = {350001,389999}
tNoItem[3] = {181000,200599}
tNoItem[4] = {800000,899999}
tNoItem[5] = {3009000,3009999}
tNoItem[6] = {3000000,3008999}
tNoItem[7] = {3600000,3699999}
tNoItem[8] = {3100000,3199999}
tNoItem[9] = {3200000,3299999}
tNoItem[10] = {3300000,3399999}
tNoItem[11] = {4000000,4099999}
tNoItem[12] = {4200001,4200019}

-- 切换PK 模式地图显示条件表
tMapTypeLimit = {}
tMapTypeLimit[1] = {}
tMapTypeLimit[1][1] = 268435456		--帮派争霸赛地图
tMapTypeLimit[1][2] = 4294967296		--组队竞赛Pk地图
tMapTypeLimit[1][3] = 137438953472		--组队竞技场
tMapTypeLimit[1][4] = 549755813888		--组队大众PK赛

tMapTypeLimit[2] = {}
tMapTypeLimit[2][1] = 2147483648     --战旗争霸站地图
tMapTypeLimit[2][2] = 562949953421312     -- 国境地图

tEquipItem = {}
-- 装备和外套段(小于该ID段的ID都属于装备和外套)
tEquipItem["MaxId"] = 699999

-- 属于外套的ID段
tEquipItem[1] = {181000,200599}
tEquipItem[2] = {350001,389999}

-- 可神佑的ID段
tGodBlessItem = {}
tGodBlessItem[1] = {0,699999}
tGodBlessItem[2] = {900000,999999}
tGodBlessItem[3] = {2100000,2199999}

-- 可追加和打洞的ID段
tAdditionalItem = {}
tAdditionalItem[1] = {0,180999}
tAdditionalItem[2] = {200600,350000}
tAdditionalItem[3] = {390000,699999}
tAdditionalItem[4] = {900000,999999}

-- 龙灵ID段
tDragonSoulId = {4200001,4200019}

-- 短兵器的前缀
-- 410：刀
-- 420：剑
-- 430：钩
-- 440：鞭
-- 450：斧
-- 460：锤
-- 480：棒
-- 481：杵
-- 490：匕首
G_tShortWeapon = {410,420,430,440,450,460,480,481,490}

-- WHILE的地方加上1k次的使用限制，超过跳出循环
G_CalculateLoop = 1000

-- 时效不删物品表
tNoDelSaveTimeItem = {}