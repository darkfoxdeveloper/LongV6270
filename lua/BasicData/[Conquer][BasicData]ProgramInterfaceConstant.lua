----------------------------------------------------------------------------
--Name:		[����][��������]����ӿڳ���.lua
--Purpose:	����ӿڳ���
--Creator: 	֣����
--Created:	2014/09/01
----------------------------------------------------------------------------
G_PLAYER_BEGIN 						=	1000
G_PLAYER_ID 						=	1001	--��ǰ���ID				֧�ֲ���:	get
G_PLAYER_Name 						=	1002	--�������         				get
G_PLAYER_LookFace					=	1003	--���ͷ����						get set
G_PLAYER_Hair 						=	1004	--��ҷ��ͱ��						get
G_PLAYER_Profession					=	1005	--��ҵ�ְҵ						get set
G_PLAYER_Level						=	1006	--��ҵȼ�							get		 add
G_PLAYER_MapID						=	1007	--������ڵ�ͼID  					get
G_PLAYER_PosX						=	1008	--������ڵ�ͼX����  				get
G_PLAYER_PosY						=	1009	--������ڵ�ͼY����				get
G_PLAYER_Virtue						=	1010	--��ҹ���ֵ						get
G_PLAYER_Meto						=	1011	--���ת��							get
G_PLAYER_Sex						=	1012	--����Ա�							get
G_PLAYER_TeamMemberNum				=	1013	--��Ҷ����Ա������û�ж���Ϊ0	get
G_PLAYER_HomeID						=	1014	--��ҷ���id						get
G_PLAYER_AccountId					=	1015	--����˺�id						get
G_PLAYER_BattleEffect				=	1016	--���ս����						get
G_PLAYER_MateName					=	1017	--��Ұ�������						get
G_PLAYER_RidingPoints				=	1018	--���������						get
G_PLAYER_Life						=	1019	--�������ֵ						get		 add
G_PLAYER_MaxLife					=	1020	--����������ֵ					get
G_PLAYER_Mana						=	1021	--��ҷ���ֵ						get		 add
G_PLAYER_MaxMana					=	1022	--��������ֵ					get
G_PLAYER_Mentor						=	1023	--��ҵ㻯����						get		 add
G_PLAYER_Transfrom					=	1024	--����ID							get	set
G_PLAYER_Money						=	1025	--�����Ϸ��						get		 add
G_PLAYER_MoneyTrial					=	1026	--��������ʯ����							 add
G_PLAYER_EMoney						=	1027	--�����ʯ							get		 add
G_PLAYER_EMoneyMono					=	1028	--�������							get		 add
G_PLAYER_Exp						=	1029	--��Ҿ���(add���������ӹ���)		get		 add
G_PLAYER_ExpContribute				=	1030	--��Ҿ���(add�������ӹ���)				 add
G_PLAYER_PK							=	1031	--���PKֵ							get		 add
G_PLAYER_Strength					=	1032	--�������ֵ						get		 add
G_PLAYER_Speed						=	1033	--�������ֵ		 				get		 add
G_PLAYER_Health						=	1034	--�������ֵ						get		 add
G_PLAYER_Soul						=	1035	--��Ҿ���ֵ						get		 add
G_PLAYER_SynRank					=	1036	--��Ұ���������					get
G_PLAYER_Iterator					=	1037	--����������ϵͳ�е���			get	set	 add
G_PLAYER_Crime						=	1038	--����ʱ��							get	set
G_PLAYER_GameCard					=	1039	--cq_card��¼����					get
G_PLAYER_GameCard2					=	1040	--cq_card2��¼����					get
G_PLAYER_XP							=	1041	--��ǰXPֵ							get	set	 add
G_PLAYER_EP							=	1042	--����ֵ							get	set	 add
G_PLAYER_AddPoint					=	1043	--������Ե�						get	set	 add
G_PLAYER_ClientVersion				=	1044	--�ͻ��İ汾						get
G_PLAYER_Peerage					=	1045	--��Ҿ�λ							get
G_PLAYER_Businness					=	1046	--�������״̬						get	set
G_PLAYER_VIP						=	1047	--���VIP�ȼ�						get
G_PLAYER_VIPValue					=	1048	--���VIPֵ							get	set	 add
G_PLAYER_StorageMoney				=	1049	--��Ҵ洢��Ǯ						get		 add
G_PLAYER_FirstPro					=	1050	--ְҵ								get
G_PLAYER_OldPro						=	1051	--ǰ��ְҵ							get
G_PLAYER_AddMount					=	1052	--�����ƶ���								 add
G_PLAYER_Cultivation				=	1053	--����ֵ							get		 add
G_PLAYER_PKProtocol					=	1054	--PKģʽ							get	set
G_PLAYER_StrengthValue				=	1055	--����ֵ							get		 add
G_PLAYER_SynID						=	1056	--����ID							get
G_PLAYER_FamilyID					=	1057	--����ID							get
G_PLAYER_LevupExp					=	1058	--��������һ�����辭��			get
G_PLAYER_MateID						=	1059	--�����żID						get
G_PLAYER_GodBless					=	1060	--���ף��ʣ��ʱ��				get		 add
G_PLAYER_TransferDragon20			=	1061	--���ת������20������			get
G_PLAYER_TransferDragon100			=	1062	--���ת������100������			get
G_PLAYER_BusinessManDays			=	1063	--����ת��ʣ������				get
G_PLAYER_GodBlessTime				=	1064	--���ף���˺ŵĵ���ʱ��		get
G_PLAYER_ExpPercent					=	1065	--��ҰٷֱȾ���(add���������ӹ���)	get		add
G_PLAYER_ExpPercentContribute		=	1066	--��ҰٷֱȾ���(add�������ӹ���)		add
G_PLAYER_CultureValue    			=	1067		--��ȡ�����Ϊֵ				get add
G_PLAYER_League_Point    			=	1068		--��ȡ��һƽ��������� 		get add
G_PLAYER_League_ID    				=	1069		--��ȡ�������id 		get
G_PLAYER_Service_Value    			=	1070		--���ս�� 		get add
G_PLAYER_League_Official     		=	1071		--��ȡ��ҹ�ְ 		get 
G_PLAYER_ExpTime					=	1072	--ͨ��exptime���ҼӾ���	add
G_PLAYER_LAST 						=	1999
                                                  
G_NPC_BEGIN 						=	2000
G_NPC_ID 							=	2001	--ȡ��ǰNPC��ID			=id=0   
G_NPC_Name 							=	2002	--ȡNPC������            
G_NPC_OwnerID 						=	2003	--ȡNPC��OwnerID
G_NPC_OwnerType 					=	2004	--ȡNPC��OwnerType
G_NPC_Type 							=	2005	--ȡNPC������        
G_NPC_LookFace 						=	2006	--ȡNPC��Lookface   	                         
G_NPC_MapID 						=	2007	--ȡNPC���ڵĵ�ͼ���		           
G_NPC_PosX 							=	2008	--ȡNPC���ڵ�ͼ��X����		             
G_NPC_PosY 							=	2009	--ȡNPC���ڵ�ͼ��Y����	
G_NPC_Data0 						=	2010	--ȡNPC���ϵ�Data0ֵ		
G_NPC_Data1 						=	2011	--ȡNPC���ϵ�Data1ֵ
G_NPC_Data2 						=	2012	--ȡNPC���ϵ�Data2ֵ		   
G_NPC_Data3 						=	2013	--ȡNPC���ϵ�Data3ֵ
G_NPC_DataStr 						=	2014	--ȡNPC���ϵ�DataStrֵ
G_NPC_MaxLife 						=	2015	--ȡNPC���Ѫֵ
G_NPC_Life 							=	2016	--ȡNPC��ǰѪֵ
G_NPC_LAST 							=	2099
                                                 
                                                 
G_MAP_BEGIN 						=	2100	--2101��2103-2107 Ҫ��GetMapInt��ȡ��2103��2108-2111Ҫ��GetMapIntEx��ȡ
G_MAP_ID 							=	2101	--ȡ��ǰ��ͼ��ID			=ID=0
G_MAP_Name 							=	2102	--ȡ��ͼ������
G_MAP_Type 							=	2103	--ȡ��ͼ������
G_MAP_OwnerID 						=	2104	--ȡ��ͼ����ID
G_MAP_RebornMap						=	2105	--ȡ��ͼ������ͼID
G_MAP_PosX 							=	2106	--ȡ��ͼ������X����
G_MAP_PosY 							=	2107	--ȡ��ͼ������Y����    
G_MAP_SYNID 						=	2108	--���ɵ�ͼ
G_MAP_RES_LEV 						=	2109	--��Դ�ȼ�
G_MAP_DOC 							=	2110	--mapdoc
G_MAP_STATUS 						=	2111	--����״̬
G_MAP_RESET_STATUS					=	2112	--����״̬
G_MAP_PORTAL_X 						=	2113	--ȡ��ͼ��ڵ�X����
G_MAP_PORTAL_Y   					=	2114	--ȡ��ͼ��ڵ�Y���� 
G_MAP_LAST  						=	2199
                                                 
                                                 
G_DYNA_GLOBAL_BEGIN 				=	2200
G_DYNA_GLOBAL_ID					=	2201	-- cq_dyna_global_data (���˳���Ӧ=id��lua���޽ӿ�)
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
G_TASKDETAIL_ID						=	2251	-- task_detail (���˳���Ӧ			=id��lua���޽ӿ�)
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
G_ITEM_ID			 				=	2301	--��Ʒ��ID			=ID=0
G_ITEM_Type			 				=	2302	--��Ʒ����
G_ITEM_OwnerID			 			=	2303	--OwnerID
G_ITEM_PlayerID			 			=	2304	--PlayerID
G_ITEM_Amount			 			=	2305	--��ǰ�;�
G_ITEM_AmountLimit			 	 	=	2306	--�;�����
G_ITEM_Ident						=	2307	--�Ƿ����
G_ITEM_Position						=	2308	--λ��
G_ITEM_Gem1							=	2309	--��һ����
G_ITEM_Gem2							=	2310	--�ڶ�����
G_ITEM_Magic1						=	2311	--��һ��ħ��Ч��
G_ITEM_Magic2						=	2312	--�ڶ���ħ��Ч��
G_ITEM_Addition						=	2313	--׷����ֵ			--�������G_ITEM_Magic3
G_ITEM_Data							=	2314	--��ƷData�ֶ�ֵ
G_ITEM_ReduceDmg					=	2315	--����
G_ITEM_AddLife						=	2316	--�����ӳ�
G_ITEM_AntiMonster					=	2317	--���ƹ���
G_ITEM_Name							=	2318	--����
G_ITEM_Color						=	2319	--��ɫ
G_ITEM_Monopoly						=	2320	--��Ʒװ������
G_ITEM_AddExp						=	2321	--׷�Ӿ���
G_ITEM_DelTime						=	2322	--ʱЧ����Ʒɾ��ʱ��
G_ITEM_SaveTime						=	2323	--��Ʒ��Чʱ��
G_ITEM_AcutionDeposit				=	2324	--�����б�֤��
G_ITEM_LAST							=	2399
                                                 
G_TEAM_BEGIN						=	2400
G_TEAM_ID							=	2401	--�����ID
G_TEAM_Amount						=	2402	--��������
G_TEAM_MinLev						=	2403	--��Ա��͵ȼ�
G_TEAM_MaxLev						=	2404	--��Ա��ߵȼ�
G_TEAM_MinMoney						=	2405	--��Ա���ٽ��
G_TEAM_Mate							=	2406	--��Ա�Ƿ�Ϊ����
G_TEAM_Friend						=	2407	--��Ա�Ƿ�Ϊ����
G_TEAM_Alive						=	2408	--��Ա�Ƿ񶼻���
G_TEAM_LAST							=	2499
                                                 
G_TRAP_BEGIN						=	2500	-- cq_trap��
G_TRAP_ID							=	2501	
G_TRAP_TYPE							=	2502
G_TRAP_LOOK							=	2503
G_TRAP_OWNER_ID						=	2504    --��δʵ��
G_TRAP_MAPID						=	2505
G_TRAP_PosX							=	2506
G_TRAP_PosY							=	2507
G_TRAP_DATA							=	2508	--��δʵ��
G_TRAP_BOUND_CX						=	2509	--��δʵ��
G_TRAP_BOUND_CY						=	2510	--��δʵ��
G_TRAP_LAST							=	2599
                                                 	
G_EMONEY_CARD_BEGIN					=	2600	-- ��ʯ����
G_EMONEY_CARD1						=	2601	-- emoney_card
G_EMONEY_CARD2						=	2602	-- emoney_card2
G_EMONEY_CARD3						=	2603	-- emoney_card3
G_EMONEY_CARD4						=	2604	-- emoney_card4
G_EMONEY_CARD_END					=	2699		
                                                 	
G_ITEMTYPE_BEGIN					=	2700	--cq_itemtype����
G_ITEMTYPE_Name						=	2701	--����
G_ITEMTYPE_Profession				=	2702	--ְҵ����
G_ITEMTYPE_Skill					=	2703	--��������
G_ITEMTYPE_Level					=	2704	--�ȼ�����
G_ITEMTYPE_Sex						=	2705	--�Ա�����
G_ITEMTYPE_Monopoly					=	2706	--��ռ��
G_ITEMTYPE_Mask						=	2707	--(������Ʒ֮�������)
G_ITEMTYPE_EmoneyPrice				=	2708	--��ʯ�۸�
G_ITEMTYPE_EmoneyMonoPrice			=	2709	--����۸�
G_ITEMTYPE_SaveTime					=	2710	--����ʱ��
G_ITEMTYPE_TypeDesc					=	2711	--����˵��
G_ITEMTYPE_ItemDesc					=	2712	--��Ʒ˵��
G_ITEMTYPE_AccumulateLimit			=	2713	--��Ʒ������
G_ITEMTYPE_LAST						=	2799
                                                 
G_NPC_COUNT_BEGIN					=	2800
G_NPC_COUNT_ALL						=	2801	--ȡ��ҵ�ͼ������NPC������
G_NPC_COUNT_FURNITURE				=	2802	--ȡ��ҵ�ͼ�����мҾߵ�����
G_NPC_COUNT_NAME					=	2803	--ȡ��ҵ�ͼ������ָ�����ֵ�NPC����
G_NPC_COUNT_TYPE					=	2804	--ȡ��ҵ�ͼ������ָ�����͵�NPC����
G_NPC_COUNT_LAST					=	2899
                                                 
G_SYNDICATE_BEGIN					=	2800
G_SYNDICATE_ALLY_SYN0				=	2801	--ͬ�˰���1
G_SYNDICATE_ALLY_SYN1				=	2802	--ͬ�˰���2
G_SYNDICATE_ALLY_SYN2				=	2803	--ͬ�˰���3
G_SYNDICATE_ALLY_SYN3				=	2804	--ͬ�˰���4
G_SYNDICATE_ALLY_SYN4				=	2805	--ͬ�˰���5
G_SYNDICATE_ALLY_SYN5				=	2806	--ͬ�˰���6
G_SYNDICATE_ALLY_SYN6				=	2807	--ͬ�˰���7
G_SYNDICATE_ALLY_SYN7				=	2808	--ͬ�˰���8
G_SYNDICATE_ALLY_SYN8				=	2809	--ͬ�˰���9
G_SYNDICATE_ALLY_SYN9				=	2810	--ͬ�˰���10
G_SYNDICATE_ALLY_SYN10				=	2811	--ͬ�˰���11
G_SYNDICATE_ALLY_SYN11				=	2812	--ͬ�˰���12
G_SYNDICATE_ALLY_SYN12				=	2813	--ͬ�˰���13
G_SYNDICATE_ALLY_SYN13				=	2814	--ͬ�˰���14
G_SYNDICATE_ALLY_SYN14				=	2815	--ͬ�˰���15
G_SYNDICATE_ENEMY_SYN0				=	2816	--�ж԰���1
G_SYNDICATE_ENEMY_SYN1				=	2817	--�ж԰���2
G_SYNDICATE_ENEMY_SYN2				=	2818	--�ж԰���3
G_SYNDICATE_ENEMY_SYN3				=	2819	--�ж԰���4
G_SYNDICATE_ENEMY_SYN4				=	2820	--�ж԰���5
G_SYNDICATE_ENEMY_SYN5				=	2821	--�ж԰���6
G_SYNDICATE_ENEMY_SYN6				=	2822	--�ж԰���7
G_SYNDICATE_ENEMY_SYN7				=	2823	--�ж԰���8
G_SYNDICATE_ENEMY_SYN8				=	2824	--�ж԰���9
G_SYNDICATE_ENEMY_SYN9				=	2825	--�ж԰���10
G_SYNDICATE_ENEMY_SYN10				=	2826	--�ж԰���11
G_SYNDICATE_ENEMY_SYN11				=	2827	--�ж԰���12
G_SYNDICATE_ENEMY_SYN12				=	2828	--�ж԰���13
G_SYNDICATE_ENEMY_SYN13				=	2829	--�ж԰���14
G_SYNDICATE_ENEMY_SYN14				=	2830	--�ж԰���15
G_SYNDICATE_NAME					=	2831	--��������
G_SYNDICATE_LEADER_NAME				=	2832	--���ɰ�������
G_SYNDICATE_MONEY					=	2833	--���ɻ���
G_SYNDICATE_MEMBER_AMOUNT			=	2834	--���ɳ�Ա����
G_SYNDICATE_EMONEY					=	2835	--������ʯ
G_SYNDICATE_LEVEL					=	2837	--���ɵȼ�

G_SYNDICATE_END						=	2899
                                                 	
G_SYN_MEMBER_ATTR_BEGIN				=	2900	
G_SYN_MEMBER_ATTR_RANK				=	2901	--������ҵİ����ڵȼ�(ָ��������������)
G_SYN_MEMBER_ATTR_PROFFER			=	2902	--������ҵ���Ϸ�ҹ���ֵ
G_SYN_MEMBER_ATTR_END				=	2999
                                                 
                                                 
G_GONGFU_ATTR_BEGIN				 	=	3000
G_GONGFU_ATTR_REALM				 	=	3001	--��ҵĹ�������		get
G_GONGFU_ATTR_FREE_CULTIVATE_PARAM	=	3002	--��������������		get	set	add
G_GONGFU_ATTR_GENUINEQI_LV		 	=	3003	--��������ȼ�			get	set	add
G_GONGFU_ATTR_END				 	=	3099	

G_MONSTER_BEGIN						=	3100	--����
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



----------------------------------------------------------�������泣�õ���һЩ����
G_User_MaxLev = 140								--��ҵȼ�����
G_User_MaxEmoney = 999999999					--�����ʯ����
G_User_MaxEmoneyMono = 999999999				--�����Ʒ��ʯ����
G_User_FreePractice = 1000000					--������������������






