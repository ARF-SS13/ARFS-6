CREATE TABLE `erro_agegate` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`verified` INT(11) NULL DEFAULT '0',
	`discordcode` VARCHAR(12) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`ckey` VARCHAR(32) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`age` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COMMENT='age gate goes into the feedback database. yes.'
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=4
;
