DELIMITER //

CREATE PROCEDURE select_streaming_cnt
	(IN in_member_id bigint
    ,IN in_music_id bigint
    ,IN cnt_type int -- 0 = 특정 유저 1 = total
    ,OUT streaming_cnt bigint
)
BEGIN
	IF cnt_type = 0 THEN
		SELECT COUNT(*)
        INTO streaming_cnt
		FROM member_play_history
		WHERE music_id = in_music_id
			and TIMESTAMPDIFF(SECOND, start_time, end_time) > 60
			and end_time is not null
			and member_id = in_member_id;
	ELSE
		SELECT COUNT(*)
		INTO streaming_cnt
		FROM member_play_history
		WHERE music_id = in_music_id
			and TIMESTAMPDIFF(SECOND, start_time, end_time) > 60
			and end_time is not null;
	END IF;
END //

DELIMITER ;

CALL select_streaming_cnt(1, 162, 0, @streaming_cnt);
select @streaming_cnt;
