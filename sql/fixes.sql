ALTER TABLE `game_cq`.`cq_changename_backup` 
ADD COLUMN `changetime` INT NOT NULL AFTER `newname`;

ALTER TABLE `game_cq`.`cq_user` 
CHANGE COLUMN `auto_exercise` `auto_exercise` INT UNSIGNED NOT NULL DEFAULT '0' ;