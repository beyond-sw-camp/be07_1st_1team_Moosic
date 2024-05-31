-- 1. 음원에 좋아요 누르기
DELIMITER //
CREATE PROCEDURE `음원에좋아요누르기`(IN 음원아이디 BIGINT, IN 회원아이디 BIGINT)
BEGIN
    DECLARE 데이터개수 INT;
    SET 데이터개수 = 0;

    SELECT COUNT(*) INTO 데이터개수 FROM music_like WHERE music_id = 음원아이디 AND member_id = 회원아이디;

    IF 데이터개수 > 0 THEN
       DELETE FROM music_like WHERE music_id = 음원아이디 AND member_id = 회원아이디;
    ELSE
        INSERT INTO music_like(music_id , member_id) VALUES (음원아이디, 회원아이디);
    END IF;
END
// DELIMITER ;


-- 2. 자신이 누른 좋아요 목록 조회
DELIMITER //
CREATE PROCEDURE `자신이누른좋아요목록조회`(IN 회원아이디 BIGINT)
BEGIN
    SELECT music.music_id, music.music_title
    FROM music INNER JOIN music_like
        ON music_like.music_id = music.music_id
    WHERE music_like.member_id = 회원아이디;
END
// DELIMITER ;

