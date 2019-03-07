CREATE TABLE `tbl_dblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logging_guid` varchar(36) DEFAULT NULL,
  `timestamp` timestamp(3) NULL DEFAULT NULL,
  `sp_name` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `command` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='contains log information from all stored procedures run for purposes of troubleshooting';