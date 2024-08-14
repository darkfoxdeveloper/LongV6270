ALTER TABLE `game_cq`.`cq_changename_backup` 
ADD COLUMN `changetime` INT NOT NULL AFTER `newname`;

ALTER TABLE `game_cq`.`cq_user` 
CHANGE COLUMN `auto_exercise` `auto_exercise` INT UNSIGNED NOT NULL DEFAULT '0' ;

UPDATE `game_cq`.`cq_portal` SET `portal_x` = '806', `portal_y` = '521' WHERE (`id` = '21');

DELETE FROM `game_cq`.`cq_npc` WHERE (`id` = '5591');
DELETE FROM `game_cq`.`cq_npc` WHERE (`id` = '5592');
DELETE FROM `game_cq`.`cq_npc` WHERE (`id` = '5593');
DELETE FROM `game_cq`.`cq_npc` WHERE (`id` = '5594');

UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '14');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '34');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '73');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '124');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '2613');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '7045');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '7063');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '7064');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '7065');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '7066');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '5308');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '3599');
UPDATE `game_cq`.`cq_monstertype` SET `lookface` = '131' WHERE (`id` = '4886');
