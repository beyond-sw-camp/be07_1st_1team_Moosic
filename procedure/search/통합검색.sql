DELIMITER //
CREATE PROCEDURE `통합검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT '음원' AS type, music_id AS id, music_title AS `title or name` FROM music WHERE music.music_title LIKE CONCAT(CONCAT('%', 검색어), '%')
    UNION ALL
    SELECT '앨범' AS type, album_id AS id, album_title AS `title or name` FROM album WHERE album.album_title LIKE CONCAT(CONCAT('%', 검색어), '%')
    UNION ALL
    SELECT '아티스트' AS type, artist_id AS id, artist_name AS `title or name` FROM artist WHERE artist.artist_name LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;