DELIMITER //
CREATE PROCEDURE `자신이누른좋아요목록조회`(IN 회원아이디 BIGINT)
BEGIN
    SELECT music.music_id, music.music_title
    FROM music INNER JOIN music_like
        ON music_like.music_id = music.music_id
    WHERE music_like.member_id = 회원아이디
    ORDER BY music_like.created_date DESC;
END
// DELIMITER ;