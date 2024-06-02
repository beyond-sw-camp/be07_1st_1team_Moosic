DELIMITER //

CREATE PROCEDURE store_play_history(
    IN in_member_id BIGINT(20),
    IN in_music_id BIGINT(20),
    OUT out_play_cnt_id BIGINT(20)
)
BEGIN
    -- 데이터를 삽입
    INSERT INTO member_play_history (
        member_id,
        music_id
    ) VALUES (
        in_member_id,
        in_music_id
    );

    -- 마지막으로 삽입된 레코드의 AUTO_INCREMENT 값을 가져옴
    SET out_play_cnt_id = LAST_INSERT_ID();
END //

DELIMITER ;

CALL store_play_history(1, 162, @out_play_cnt_id);

-- 결과 확인
SELECT @out_play_cnt_id;

