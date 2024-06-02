DELIMITER //

CREATE PROCEDURE alter_play_history(
	IN in_play_cnt_id bigint
)
BEGIN
    UPDATE member_play_history
    SET end_time = sysdate()
    WHERE play_cnt_id = in_play_cnt_id;
    
END //

DELIMITER ;

CALL alter_play_history(3);
