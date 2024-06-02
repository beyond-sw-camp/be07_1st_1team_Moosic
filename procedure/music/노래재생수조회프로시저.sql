DELIMITER //

CREATE PROCEDURE total_streaming_cnt
	(IN in_music_id bigint)
BEGIN
	SELECT COUNT(*)
	FROM member_play_history
	WHERE music_id = in_music_id
		and TIMESTAMPDIFF(SECOND, start_time, end_time) > 60
		and end_time is not null;
END //

DELIMITER ;

CALL total_streaming_cnt(162);
