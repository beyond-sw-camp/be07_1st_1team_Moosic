DELIMITER //
CREATE PROCEDURE `음원에싫어요누르기`(IN 음원아이디 BIGINT, IN 회원아이디 BIGINT)
BEGIN
    DECLARE 데이터개수 INT;
    SET 데이터개수 = 0;

    SELECT COUNT(*) INTO 데이터개수 FROM music_dislike WHERE music_id = 음원아이디 AND member_id = 회원아이디;

    IF 데이터개수 > 0 THEN
       DELETE FROM music_dislike WHERE music_id = 음원아이디 AND member_id = 회원아이디;
       SELECT '싫어요를 취소했습니다.';
    ELSE
        INSERT INTO music_dislike(music_id , member_id) VALUES (음원아이디, 회원아이디);
        SELECT '싫어요를 눌렀습니다.', music_id, member_id FROM music_dislike WHERE music_id = 음원아이디 AND member_id = 회원아이디;
    END IF;
END
// DELIMITER ;
