DELIMITER //

CREATE PROCEDURE select_artist
	(IN in_music_id bigint
)
BEGIN
	SELECT m.artist_type, a.artist_name
	FROM moosic.music_artist m
	JOIN artist a
	ON a.artist_id = m.artist_id
	WHERE music_id = in_music_id
	ORDER BY m.artist_type;
END //

DELIMITER ;

CALL select_artist(162);
