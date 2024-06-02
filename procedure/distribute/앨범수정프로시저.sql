DELIMITER //

CREATE PROCEDURE alter_album(IN in_id bigint, IN in_title varchar(255), IN in_date timestamp, IN in_img varchar(2083), IN in_yn tinyint)
BEGIN
	UPDATE album 
    SET album_title = in_title
		,release_date = in_date
        , album_art_image_url = in_img
        , del_yn = in_yn
	WHERE album_id = in_id;
END //

DELIMITER ;

CALL alter_album(61, "HEO_TORR", "2024-07-01 12:00:00", "example.com", 1);
