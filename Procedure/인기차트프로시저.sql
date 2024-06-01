DELIMITER //

CREATE PROCEDURE make_popular_chart(
	IN in_genre varchar(20)
)
BEGIN
    IF in_genre = 'total' THEN
		select c.music_id
			, c.cnt
			, (select music_title from music where music_id = c.music_id) as music_name
			, RANK() OVER (ORDER BY cnt DESC) AS R
		from (SELECT music_id, count(*) as cnt
		FROM member_play_history
		WHERE end_time is not null
			and TIMESTAMPDIFF(SECOND, start_time, end_time) > 60
			and TIMESTAMPDIFF(SECOND, start_time, current_timestamp) < 3600 -- 배치 실행 시간 기준 1시간 전부터 재생된 음악
		group by music_id) as c
		order by c.cnt desc
		limit 10;
	ELSE
		select c.music_id
			, c.genre
			, c.cnt
			, (select music_title from music where music_id = c.music_id) as music_name
			, RANK() OVER (ORDER BY cnt DESC) AS R
		from (SELECT mph.music_id, min(m.genre) as genre, count(*) as cnt
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

CALL make_popular_chart('ballad');
