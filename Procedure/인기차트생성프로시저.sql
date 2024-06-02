DELIMITER //

CREATE PROCEDURE make_popular_chart(
	IN in_genre varchar(20)
)
BEGIN
	DELETE from music_chart where genre = in_genre;
    
    IF in_genre = 'total' THEN
		INSERT INTO music_chart(genre, popular_rank, music_id) 
        select 
			'total'
			, RANK() OVER (ORDER BY cnt DESC) AS R
			, c.music_id
		from (
			SELECT music_id, count(*) as cnt
			FROM member_play_history
			WHERE end_time is not null
				and TIMESTAMPDIFF(SECOND, start_time, end_time) > 60
				and TIMESTAMPDIFF(SECOND, start_time, current_timestamp) < 3600 -- 배치 실행 시간 기준 1시간 전부터 재생된 음악
			group by music_id) as c
		order by c.cnt desc
		limit 10;
	ELSE
		INSERT INTO music_chart(genre, popular_rank, music_id) 
		select 
			c.genre
			, RANK() OVER (ORDER BY cnt DESC) AS R
			, c.music_id
		from (
			SELECT mph.music_id, min(m.genre) as genre, count(*) as cnt
			FROM member_play_history as mph
			JOIN music as m
			ON mph.music_id = m.music_id
			WHERE end_time is not null
				and TIMESTAMPDIFF(SECOND, start_time, end_time) > 60
				and TIMESTAMPDIFF(SECOND, start_time, current_timestamp) < 3600 -- 배치 실행 시간 기준 1시간 전부터 재생된 음악
				and m.genre = in_genre
			group by mph.music_id) as c
		order by c.cnt desc
		limit 10
		;
	END IF;
END //

DELIMITER ;

CALL make_popular_chart('total');
CALL make_popular_chart('k-pop');
CALL make_popular_chart('pop');
CALL make_popular_chart('j-pop');
CALL make_popular_chart('dance');
CALL make_popular_chart('ballad');
CALL make_popular_chart('hip-hop');
CALL make_popular_chart('trot');
