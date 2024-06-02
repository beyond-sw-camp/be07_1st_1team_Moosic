DELIMITER //

CREATE PROCEDURE make_music
	(IN in_title varchar(255)
    , IN in_lyrics varchar(10000)
    , IN in_url varchar(2083)
    , IN in_pt int(10)
    , IN in_id BIGINT
    , IN in_genre enum('k-pop','pop','j-pop','dance','ballad','hip-hop','trot'))
    
BEGIN
	INSERT INTO `moosic`.`music`
(`music_title`,
`lyrics`,
`music_file_url`,
`playtime`,
`album_id`,
`genre`)
VALUES
(in_title,
in_lyrics,
in_url,
in_pt,
in_id,
in_genre);

UPDATE album 
SET music_count = music_count + 1
WHERE album_id = in_id;
END //

DELIMITER ;

CALL make_music("HEO_TORR_SONG", "wal wal wal wal", "example.com", 300, 61, 'hip-hop');
