DELIMITER //
CREATE PROCEDURE `재생중인곡좋아요여부표시`(IN 음원아이디 BIGINT, IN 회원아이디 BIGINT)
BEGIN
    SELECT COUNT(*)
    FROM music_like
    WHERE music_like.music_id = 음원아이디 AND music_like.member_id = 회원아이디;
END
// DELIMITER ;