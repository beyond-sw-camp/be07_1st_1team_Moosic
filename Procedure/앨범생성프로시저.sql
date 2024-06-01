DELIMITER //

CREATE PROCEDURE make_album(IN in_title varchar(255), IN in_img varchar(2083), IN in_id BIGINT)
BEGIN
	INSERT INTO album(album_title, release_date, album_art_image_url, distributor_id) 
		values(in_title, in_rdate, in_img, in_id);
END //

DELIMITER ;

CALL make_album("HEO_TORR", "2024-06-01 12:00:00", "example.com", 5);
