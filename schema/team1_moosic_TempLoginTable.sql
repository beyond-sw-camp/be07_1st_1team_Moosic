DROP TABLE IF EXISTS `login_status`;

CREATE TABLE `login_status` (
	`login_id` bigint NOT NULL auto_increment,
	`user_name` varchar(30) NOT NULL,
	`user_password` varchar(30) NOT NULL,
    PRIMARY KEY (`login_id`)
);