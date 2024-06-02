DELIMITER //

CREATE PROCEDURE user_streaming_cnt
	(IN in_member_id bigint
    ,IN in_music_id bigint
)
BEGIN
	SELECT COUNT(*)
	FROM member_play_history
	WHERE music_id = in_music_id
		and TIMESTAMPDIFF(SECOND, start_time, end_time) > 60
		and end_time is not null
		and member_id = in_member_id;
END //

DELIMITER ;

CALL user_streaming_cnt(1, 162);
