ALTER TABLE `ad_log` 
CHANGE COLUMN `user_name` `user_name` VARCHAR(15) NOT NULL DEFAULT '' ;

ALTER TABLE `ad_queue` 
CHANGE COLUMN `user_name` `user_name` VARCHAR(15) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_action` 
CHANGE COLUMN `param` `param` VARCHAR(255) NULL DEFAULT NULL ;

ALTER TABLE `cq_action_total` 
CHANGE COLUMN `param` `param` VARCHAR(255) NULL DEFAULT NULL ;

ALTER TABLE `cq_auction` 
CHANGE COLUMN `seller_name` `seller_name` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `bider_name` `bider_name` VARCHAR(15) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_changename_backup` 
CHANGE COLUMN `oldname` `oldname` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `newname` `newname` VARCHAR(15) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_client_config` 
CHANGE COLUMN `server_name` `server_name` VARCHAR(50) NOT NULL DEFAULT '' ,
CHANGE COLUMN `cross_server` `cross_server` VARCHAR(50) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_config` 
CHANGE COLUMN `describ` `describ` VARCHAR(255) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_cross_vexillum` 
CHANGE COLUMN `server_name` `server_name` VARCHAR(15) NULL DEFAULT '' ,
CHANGE COLUMN `syn_name` `syn_name` VARCHAR(35) NULL DEFAULT '' ;

ALTER TABLE `cq_deluser` 
CHANGE COLUMN `name` `name` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `lastname` `lastname` VARCHAR(15) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_user` 
CHANGE COLUMN `name` `name` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `lastname` `lastname` VARCHAR(15) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_user_timeout` 
CHANGE COLUMN `name` `name` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `lastname` `lastname` VARCHAR(15) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_depot` 
CHANGE COLUMN `pwd` `pwd` VARCHAR(32) NULL DEFAULT NULL ;

ALTER TABLE `cq_dyna_global_data` 
CHANGE COLUMN `datastr0` `datastr0` VARCHAR(35) NOT NULL DEFAULT '' ,
CHANGE COLUMN `datastr1` `datastr1` VARCHAR(35) NOT NULL DEFAULT '' ,
CHANGE COLUMN `datastr2` `datastr2` VARCHAR(35) NOT NULL DEFAULT '' ,
CHANGE COLUMN `datastr3` `datastr3` VARCHAR(35) NOT NULL DEFAULT '' ,
CHANGE COLUMN `datastr4` `datastr4` VARCHAR(35) NOT NULL DEFAULT '' ,
CHANGE COLUMN `datastr5` `datastr5` VARCHAR(35) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_dynamap` 
CHANGE COLUMN `name` `name` VARCHAR(35) NOT NULL DEFAULT 'undefined' ;

ALTER TABLE `cq_dynanpc` 
CHANGE COLUMN `name` `name` VARCHAR(35) NOT NULL DEFAULT 'undefined' ,
CHANGE COLUMN `datastr` `datastr` VARCHAR(255) NOT NULL DEFAULT 'None' ,
CHANGE COLUMN `default_owner_name` `default_owner_name` VARCHAR(15) NULL DEFAULT '' ;

ALTER TABLE `cq_flag_war_user` 
CHANGE COLUMN `name` `name` VARCHAR(15) NOT NULL DEFAULT '0' ;

ALTER TABLE `cq_forbidname` 
CHANGE COLUMN `check` `check` VARCHAR(16) NULL DEFAULT NULL ;

ALTER TABLE `cq_itemtype` 
CHANGE COLUMN `name` `name` VARCHAR(35) NOT NULL DEFAULT '' ,
CHANGE COLUMN `type_desc` `type_desc` VARCHAR(50) NULL DEFAULT NULL ,
CHANGE COLUMN `item_desc` `item_desc` VARCHAR(200) NULL DEFAULT NULL ;

ALTER TABLE `cq_jail_log` 
CHANGE COLUMN `user_name` `user_name` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `reason` `reason` VARCHAR(31) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_jianghu_player` 
CHANGE COLUMN `gongfu_name` `gongfu_name` VARCHAR(50) NULL DEFAULT '0' ;

ALTER TABLE `cq_leaveword` 
CHANGE COLUMN `send_name` `send_name` VARCHAR(15) NOT NULL DEFAULT 'unknown' ,
CHANGE COLUMN `words` `words` VARCHAR(255) NOT NULL DEFAULT 'undefined' ;

ALTER TABLE `cq_mail` 
CHANGE COLUMN `Sender_name` `Sender_name` VARCHAR(32) NOT NULL DEFAULT '' ,
CHANGE COLUMN `title` `title` VARCHAR(32) NULL DEFAULT NULL ,
CHANGE COLUMN `content` `content` VARCHAR(255) NULL DEFAULT NULL ;

ALTER TABLE `cq_newaction` 
CHANGE COLUMN `param` `param` VARCHAR(255) NULL DEFAULT '' ;

ALTER TABLE `cq_operating_mail_type` 
CHANGE COLUMN `sender_name` `sender_name` VARCHAR(32) NOT NULL DEFAULT '' ,
CHANGE COLUMN `title` `title` VARCHAR(32) NOT NULL DEFAULT '' ,
CHANGE COLUMN `content` `content` VARCHAR(255) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_pet` 
CHANGE COLUMN `name` `name` VARCHAR(15) NOT NULL DEFAULT 'None' ;

ALTER TABLE `cq_pk_bonus` 
CHANGE COLUMN `Target_name` `Target_name` VARCHAR(15) NULL DEFAULT NULL ,
CHANGE COLUMN `Hunter_name` `Hunter_name` VARCHAR(15) NULL DEFAULT NULL ;

ALTER TABLE `cq_pk_info` 
CHANGE COLUMN `pk1_name` `pk1_name` VARCHAR(31) NOT NULL DEFAULT '' ,
CHANGE COLUMN `pk2_name` `pk2_name` VARCHAR(31) NOT NULL DEFAULT '' ,
CHANGE COLUMN `pk3_name` `pk3_name` VARCHAR(31) NOT NULL DEFAULT '' ,
CHANGE COLUMN `pk4_name` `pk4_name` VARCHAR(31) NOT NULL DEFAULT '' ,
CHANGE COLUMN `pk5_name` `pk5_name` VARCHAR(31) NOT NULL DEFAULT '' ,
CHANGE COLUMN `pk6_name` `pk6_name` VARCHAR(31) NOT NULL DEFAULT '' ,
CHANGE COLUMN `pk7_name` `pk7_name` VARCHAR(31) NOT NULL DEFAULT '' ,
CHANGE COLUMN `pk8_name` `pk8_name` VARCHAR(31) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_pk_item` 
CHANGE COLUMN `target_name` `target_name` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `hunter_name` `hunter_name` VARCHAR(15) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_pk_item_timeout` 
CHANGE COLUMN `target_name` `target_name` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `hunter_name` `hunter_name` VARCHAR(15) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_protect_path` 
CHANGE COLUMN `param` `param` VARCHAR(128) NULL DEFAULT NULL ;

ALTER TABLE `cq_quiz` 
CHANGE COLUMN `question` `question` VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN `answer1` `answer1` VARCHAR(100) NULL DEFAULT NULL ,
CHANGE COLUMN `answer2` `answer2` VARCHAR(100) NULL DEFAULT NULL ,
CHANGE COLUMN `answer3` `answer3` VARCHAR(100) NULL DEFAULT NULL ,
CHANGE COLUMN `answer4` `answer4` VARCHAR(100) NULL DEFAULT NULL ;

ALTER TABLE `cq_rule` 
CHANGE COLUMN `mode` `mode` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `condition` `condition` VARCHAR(255) NOT NULL DEFAULT '' ,
CHANGE COLUMN `result` `result` VARCHAR(255) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_super_flag` 
CHANGE COLUMN `name` `name` VARCHAR(31) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_syn_advertising_info` 
CHANGE COLUMN `content` `content` VARCHAR(255) NULL DEFAULT NULL ;

ALTER TABLE `cq_syndicate` 
CHANGE COLUMN `name` `name` VARCHAR(35) NOT NULL DEFAULT '' ,
CHANGE COLUMN `announce` `announce` VARCHAR(255) NOT NULL DEFAULT '' ,
CHANGE COLUMN `leader_title` `leader_title` VARCHAR(15) NOT NULL DEFAULT 'guildleader' ;

ALTER TABLE `cq_sys_leaveword` 
CHANGE COLUMN `send_name` `send_name` VARCHAR(15) NOT NULL DEFAULT 'unknown' ,
CHANGE COLUMN `words` `words` VARCHAR(255) NOT NULL DEFAULT 'undefined' ;

ALTER TABLE `cq_sysnpc` 
CHANGE COLUMN `name` `name` VARCHAR(35) NOT NULL DEFAULT 'undefined' ,
CHANGE COLUMN `datastr` `datastr` VARCHAR(15) NULL DEFAULT 'None' ;

ALTER TABLE `cq_unlawful` 
CHANGE COLUMN `word` `word` VARCHAR(16) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_virtual_gm` 
CHANGE COLUMN `name` `name` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `password` `password` VARCHAR(50) NOT NULL DEFAULT '' ;

ALTER TABLE `cq_wanted` 
CHANGE COLUMN `target_name` `target_name` VARCHAR(15) NULL DEFAULT NULL ,
CHANGE COLUMN `payer` `payer` VARCHAR(15) NULL DEFAULT NULL ,
CHANGE COLUMN `hunter` `hunter` VARCHAR(15) NULL DEFAULT NULL ;

ALTER TABLE `family` 
CHANGE COLUMN `family_name` `family_name` VARCHAR(35) NULL DEFAULT '0' ,
CHANGE COLUMN `annouce` `annouce` VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN `create_name` `create_name` VARCHAR(15) NULL DEFAULT '0' ;
