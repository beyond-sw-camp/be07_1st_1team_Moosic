create database team1_moosic;
use team1_moosic;

SET foreign_key_checks = 0;

-- writer: moori
DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
`music_id`	bigint PRIMARY KEY AUTO_INCREMENT,
`music_title`	varchar(255) NOT NULL,
`lyrics`	varchar(10000),
`music_file_url`	varchar(2083) NOT NULL,
`playtime`	int unsigned NOT NULL,
`like_count`	bigint	NOT NULL	DEFAULT 0,
`del_yn`	tinyint(1)	NOT NULL	DEFAULT 0,
`album_id`	bigint	NOT NULL,
`genre`    enum('k-pop', 'pop', 'j-pop', 'dance', 'ballad', 'hip-hop', 'trot')    NOT NULL,
FOREIGN KEY music(album_id) REFERENCES album(album_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
`album_id`	bigint	PRIMARY KEY AUTO_INCREMENT,
`album_title`	varchar(255)	NOT NULL,
`music_count`	int	NOT NULL DEFAULT 0,
`release_date`	timestamp	NOT NULL,
`album_art_image_url`	varchar(2083) NOT NULL DEFAULT '?',
`del_yn`	tinyint(1)	NOT NULL	DEFAULT 0,
`distributor_id`	int	NOT NULL,
FOREIGN KEY album(distributor_id) REFERENCES album_distributor(distributor_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `member_playlist`;

CREATE TABLE `member_playlist` (
`playlist_id`	bigint	PRIMARY KEY AUTO_INCREMENT,
`playlist_title`	varchar(255)	NOT NULL,
`created_at`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
`updated_at`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
`playlist_thumbnail_url`	varchar(2083)	NOT NULL,
`del_yn`	tinyint(1)	NOT NULL	DEFAULT 0,
`member_id`	bigint	NOT NULL,
FOREIGN KEY (member_id) REFERENCES `member`(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `member_play_history`;

CREATE TABLE `member_play_history` (
`play_cnt_id`	bigint	PRIMARY KEY AUTO_INCREMENT,
`member_id`	bigint	NOT NULL,
`music_id`	bigint	NOT NULL,
`start_time`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
`end_time`	timestamp	NULL	DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (member_id) REFERENCES `member`(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (music_id) REFERENCES music(music_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `music_like`;

CREATE TABLE `music_like` (
`music_id`	bigint	NOT NULL,
`member_id`	bigint	NOT NULL,
`created_date`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (music_id) REFERENCES music(music_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (member_id) REFERENCES `member`(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);



--- writer: sejeong
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
	`admin_id`	int	PRIMARY KEY AUTO_INCREMENT,
	`admin_name`	varchar(30)	NOT NULL,
	`admin_email`	varchar(100)	NOT NULL UNIQUE,
	`password`	varchar(30)	NOT NULL,
	`phone_num`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `album_distributor`;
CREATE TABLE `album_distributor` (
	`distributor_id`	int	PRIMARY KEY AUTO_INCREMENT,
	`distributor_name`	varchar(30)	NOT NULL,
	`distributor_email`	varchar(100)	NOT NULL	UNIQUE,
	`password`	varchar(30)	NOT NULL,
	`distributor_num`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `member_payment_history`;

CREATE TABLE `member_payment_history` (
	`payment_history_id`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`created_at`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`canceled_at`	timestamp	NULL,
	`cancel_yn`	tinyint(1)	NOT NULL	DEFAULT 0,
	`member_id`	bigint	NOT NULL,
	`payment_method_id`	bigint	NOT NULL,
    FOREIGN KEY (member_id) REFERENCES `member`(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (payment_method_id) REFERENCES member_payment_method(payment_method_id) ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `member_playlist_detail`;

CREATE TABLE `member_playlist_detail` (
	`detail_id`	bigint	PRIMARY KEY	AUTO_INCREMENT,
	`playlist_id`	bigint	NOT NULL,
	`music_id`	bigint	NOT NULL,
	FOREIGN KEY (playlist_id) REFERENCES member_playlist(playlist_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (music_id) REFERENCES music(music_id) ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS music_artist;

CREATE TABLE music_artist (
    music_artist_id    bigint    PRIMARY KEY AUTO_INCREMENT,
    artist_type    enum('메인 아티스트', '작곡가', '작사가', '편곡자', '실연자')    NOT NULL,
    music_id    bigint    NOT NULL,
    artist_id    bigint    NOT NULL,
    foreign key (music_id) references music(music_id) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (artist_id) references artist(artist_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- writer: jiho
DROP TABLE IF EXISTS `member_payment_method`;

CREATE TABLE `member_payment_method` (
	`payment_method_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`bank_name` enum('국민은행', '신한은행', '우리은행', '하나은행', '카카오뱅크') NOT NULL,
	`account_number` varchar(30) NOT NULL unique,
	`del_yn` tinyint(1) NOT NULL DEFAULT 0,
	`member_id` bigint NOT NULL,
	FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `music_dislike`;

CREATE TABLE `music_dislike` (
	`member_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`music_id` bigint NOT NULL,
	FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `music_chart`;

CREATE TABLE `music_chart` (
	`chart_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`music_id` bigint NOT NULL,
	`rank` bigint NOT NULL,
	`genre` enum('k-pop', 'pop', 'j-pop', 'dance', 'ballad', 'hip-hop', 'trot', 'total'),
	FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`member_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`member_name` varchar(20) NOT NULL,
	`member_email` varchar(100) NOT NULL unique,
	`password` varchar(30) NOT NULL,
	`phonenum` varchar(20) NOT NULL unique,
	`birthdate` date NOT NULL,
	`gender` varchar(10) NOT NULL,
	`payment_method_id` bigint NULL,
	`member_profile_image_url` varchar(2083) NULL,
	`membership` tinyint(1) NOT NULL DEFAULT 0,
	`del_yn` tinyint(1) NOT NULL DEFAULT 0,
	FOREIGN KEY (`payment_method_id`) REFERENCES `member_payment_method` (`payment_method_id`)
);

DROP TABLE IF EXISTS `artist`;

CREATE TABLE `artist` (
	`artist_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`artist_name` varchar(30) NOT NULL,
	`artist_profile_image_url` varchar(2083) NULL
);

SET foreign_key_checks = 1;
