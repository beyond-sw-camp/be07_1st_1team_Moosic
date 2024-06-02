DELIMITER //
CREATE PROCEDURE `아티스트검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT artist_id, artist_name FROM artist WHERE artist.artist_name LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;

select * from artist;