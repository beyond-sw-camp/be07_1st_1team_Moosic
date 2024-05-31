DELIMITER //
CREATE PROCEDURE `앨범검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT album_id, album_title FROM album WHERE album.album_title LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;