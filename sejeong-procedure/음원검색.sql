-- 음원 검색
-- 제목에 검색어가 포함된 음원의 music_id, music_title, playtime, like_count를 반환합니다.
DELIMITER //
CREATE PROCEDURE `음원검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT music_id, music_title, playtime, like_count FROM music WHERE music.music_title LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;