DELIMITER //

CREATE PROCEDURE member_like_music(IN input_music_id bigint, IN input_member_id bigint)
BEGIN
	DECLARE like_exists INT;
    
	SELECT COUNT(*) INTO like_exists
    FROM music_like
	WHERE music_id = input_music_id AND member_id = input_member_id;

 IF like_exists = 0 THEN
        INSERT INTO music_like (music_id, member_id) VALUES (input_music_id, input_member_id);
    ELSE
        DELETE FROM music_like WHERE music_id = input_music_id AND member_id = input_member_id;
    END IF;
END 

// DELIMITER ;
