DELIMITER //

CREATE PROCEDURE select_popular_chart(
	IN in_genre varchar(20)
)
BEGIN
    select * 
    from music_chart 
    where genre = in_genre 
    order by popular_rank;
END //

DELIMITER ;

CALL select_popular_chart('total');
