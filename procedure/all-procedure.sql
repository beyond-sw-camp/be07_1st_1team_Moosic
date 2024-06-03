--------------------------------------- 프로시저 모음 -------------------------------------------------

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




DELIMITER //

CREATE PROCEDURE make_album(IN in_title varchar(255), IN in_img varchar(2083), IN in_id BIGINT)
BEGIN
	INSERT INTO album(album_title, release_date, album_art_image_url, distributor_id) 
		values(in_title, in_rdate, in_img, in_id);
END //

DELIMITER ;



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


DELIMITER //

CREATE PROCEDURE make_music
	(IN in_title varchar(255)
    , IN in_lyrics varchar(10000)
    , IN in_url varchar(2083)
    , IN in_pt int(10)
    , IN in_id BIGINT
    , IN in_genre enum('k-pop','pop','j-pop','dance','ballad','hip-hop','trot'))
    
BEGIN
	INSERT INTO `moosic`.`music`
(`music_title`,
`lyrics`,
`music_file_url`,
`playtime`,
`album_id`,
`genre`)
VALUES
(in_title,
in_lyrics,
in_url,
in_pt,
in_id,
in_genre);

UPDATE album 
SET music_count = music_count + 1
WHERE album_id = in_id;
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE `음원에싫어요누르기`(IN 음원아이디 BIGINT, IN 회원아이디 BIGINT)
BEGIN
    DECLARE 데이터개수 INT;
    SET 데이터개수 = 0;

    SELECT COUNT(*) INTO 데이터개수 FROM music_dislike WHERE music_id = 음원아이디 AND member_id = 회원아이디;

    IF 데이터개수 > 0 THEN
       DELETE FROM music_dislike WHERE music_id = 음원아이디 AND member_id = 회원아이디;
       SELECT '싫어요를 취소했습니다.';
    ELSE
        INSERT INTO music_dislike(music_id , member_id) VALUES (음원아이디, 회원아이디);
        SELECT '싫어요를 눌렀습니다.', music_id, member_id FROM music_dislike WHERE music_id = 음원아이디 AND member_id = 회원아이디;
    END IF;
END
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE `음원에좋아요누르기`(IN 음원아이디 BIGINT, IN 회원아이디 BIGINT)
BEGIN
    DECLARE 데이터개수 INT;
    SET 데이터개수 = 0;

    SELECT COUNT(*) INTO 데이터개수 FROM music_like WHERE music_id = 음원아이디 AND member_id = 회원아이디;

    IF 데이터개수 > 0 THEN
        DELETE FROM music_like WHERE music_id = 음원아이디 AND member_id = 회원아이디;
        SELECT '좋아요를 취소했습니다.';
    ELSE
        INSERT INTO music_like(music_id , member_id) VALUES (음원아이디, 회원아이디);
        SELECT '좋아요를 눌렀습니다.', music_id, member_id FROM music_like WHERE music_id = 음원아이디 AND member_id = 회원아이디;
    END IF;
END
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE `자신이누른좋아요목록조회`(IN 회원아이디 BIGINT)
BEGIN
    SELECT music.music_id, music.music_title
    FROM music INNER JOIN music_like
        ON music_like.music_id = music.music_id
    WHERE music_like.member_id = 회원아이디
    ORDER BY music_like.created_date DESC;
END
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE `재생중인곡좋아요여부표시`(IN 음원아이디 BIGINT, IN 회원아이디 BIGINT)
BEGIN
    SELECT COUNT(*)
    FROM music_like
    WHERE music_like.music_id = 음원아이디 AND music_like.member_id = 회원아이디;
END
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE `관리자 넣기`(
    IN p_admin_name VARCHAR(30),
    IN p_admin_email VARCHAR(100),
    IN p_password VARCHAR(30),
    IN p_phone_num VARCHAR(20)
)
BEGIN
    INSERT INTO `admin` (admin_name, admin_email, password, phone_num)
    VALUES (p_admin_name, p_admin_email, p_password, p_phone_num);
END //
DELIMITER ;


DELIMITER //

CREATE PROCEDURE 로그아웃(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in input varchar(30)
)
BEGIN
    -- login_check 라는 int 타입의 변수 선언
    declare member_check int;
    
    -- 입력받은 이메일과 비밀번호가 member 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	
    -- login_check 가 1이라면 로그인 성공 출력
    -- 1이 아니라면 잘못된 로그인 정보입니다. 를 출력
    if member_check = 1 then
		select '로그아웃 성공' as 결과창 where input = '로그아웃';
	end if;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE 멤버로그인(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    -- login_check 라는 int 타입의 변수 선언
    declare login_check int;
    
    -- 입력받은 이메일과 비밀번호가 member 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into login_check from member where member_email = m_member_email and password = m_password;

    -- login_check 가 1이라면 로그인 성공 출력
    -- 1이 아니라면 잘못된 로그인 정보입니다. 를 출력
    if login_check = 1 then
		select '로그인 성공' as 결과창;
	else
		select '잘못된 로그인 정보입니다.' as 결과창;
	end if;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE `멤버넣기`(
    IN m_member_name VARCHAR(20),
    IN m_member_email VARCHAR(100),
    IN m_password VARCHAR(30),
    IN m_phone_num VARCHAR(20),
    IN m_birthday date,
    in m_gender varchar(10),
    in m_account_id varchar(100),
    in m_member_profile_image_url varchar(2083)
)
BEGIN
    INSERT INTO `member` (member_name, member_email, password, phonenum, birthdate, gender, account_id, member_profile_image_url)
    VALUES (m_member_name, m_member_email, m_password, m_phone_num, m_birthday,m_gender,m_account_id,m_member_profile_image_url);
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE `배급사등록`(
    IN d_distributor_name varchar(30),
    in d_distributor_email varchar(100),
    in d_password varchar(30),
    in d_phone_num varchar(20)
)
BEGIN
    INSERT INTO album_distributor(distributor_name, distributor_email, password, distributor_num)
    VALUES (d_distributor_name, d_distributor_email, d_password, d_phone_num);
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE 회원정보수정(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in m_c_password varchar(30),
    in m_c_phonenum varchar(20),
    in m_c_account_id varchar(100),
    in m_c_profile varchar(2083)
)
BEGIN
	declare login_check int;
    
    -- 입력받은 이메일과 비밀번호가 artist 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into login_check from member where password = m_password and member_email = m_member_email;
    
    -- login_check 가 1이라면 로그인 성공 출력
    -- 1이 아니라면 잘못된 로그인 정보입니다. 를 출력
    if login_check = 1 then
		update member set password = m_c_password where m_c_password is not null and member_email = m_member_email;
        update member set phonenum = m_c_phonenum where m_c_phonenum is not null and member_email = m_member_email;
        update member set account_id = m_c_account_id where m_c_account_id is not null and member_email = m_member_email;
        update member set member_profile_image_url = m_c_profile where m_c_profile is not null and member_email = m_member_email;
	else
		select '잘못된 정보입니다.' as 결과창;
	end if;
end// 
DELIMITER ;

DELIMITER //
CREATE PROCEDURE 회원탈퇴(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    -- login_check 라는 int 타입의 변수 선언
    declare login_check int;
    
    -- 입력받은 이메일과 비밀번호가 artist 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into login_check from member where password = m_password and member_email = m_member_email;
    
    -- login_check 가 1이라면 로그인 성공 출력
    -- 1이 아니라면 잘못된 로그인 정보입니다. 를 출력
    if login_check = 1 then
		update member set del_yn = 1 where member_email = m_member_email;
        select '회원탈퇴 완료';
	else
		select '잘못된 정보입니다.' as 결과창;
	end if;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_streaming_cnt
	(IN in_member_id bigint
    ,IN in_music_id bigint
)
BEGIN
	SELECT COUNT(*)
	FROM member_play_history
	WHERE music_id = in_music_id
		and TIMESTAMPDIFF(SECOND, start_time, end_time) > 60
		and end_time is not null
		and member_id = in_member_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE total_streaming_cnt
	(IN in_music_id bigint)
BEGIN
	SELECT COUNT(*)
	FROM member_play_history
	WHERE music_id = in_music_id
		and TIMESTAMPDIFF(SECOND, start_time, end_time) > 60
		and end_time is not null;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE select_artist
	(IN in_music_id bigint
)
BEGIN
	SELECT m.artist_type, a.artist_name
	FROM moosic.music_artist m
	JOIN artist a
	ON a.artist_id = m.artist_id
	WHERE music_id = in_music_id
	ORDER BY m.artist_type;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE store_play_history(
    IN in_member_id BIGINT(20),
    IN in_music_id BIGINT(20),
    OUT out_play_cnt_id BIGINT(20)
)
BEGIN
    -- 데이터를 삽입
    INSERT INTO member_play_history (
        member_id,
        music_id
    ) VALUES (
        in_member_id,
        in_music_id
    );

    -- 마지막으로 삽입된 레코드의 AUTO_INCREMENT 값을 가져옴
    SET out_play_cnt_id = LAST_INSERT_ID();
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE alter_play_history(
	IN in_play_cnt_id bigint
)
BEGIN
    UPDATE member_play_history
    SET end_time = sysdate()
    WHERE play_cnt_id = in_play_cnt_id;
    
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE 결제정보등록(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in input_bank varchar(30),
    in input_account varchar(30)
)
BEGIN
    declare member_check int;
    declare member_id_check int;
	declare payment_id int;

    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
	select payment_method_id into payment_id from member where member_id = member_id_check;
    
    if member_check = 1 then
		if payment_id is null then
            insert into member_payment_method(bank_name, account_number, member_id) values (input_bank, input_account, member_id_check);
            update member set payment_method_id = (select payment_method_id from member_payment_method where member_id = member_id_check and del_yn = 0)
				where member_id = member_id_check;
            select '결제 정보 등록 완료';
		else
			select '이미 계좌가 등록되어 있습니다.' as 결과;
		end if;
	end if;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE 결제정보삭제(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    -- login_check 라는 int 타입의 변수 선언
    declare member_check int;
    declare member_id_check int;
    declare method_id int;
	declare payment_id int;
    
    -- 입력받은 이메일과 비밀번호가 member 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
    select payment_method_id into method_id from member_payment_method where member_id = member_id_check and del_yn != 1;
    select payment_method_id into payment_id from member where member_id = member_id_check;
   
    -- 결재 정보에 member_id 의 정보가 있고, 그 결재 정보가 삭제되지 않은 정보라면
    -- 해당 정보를 삭제하는 연산 수행 -> del_yn 을 0 -> 1로 변경
    if member_check = 1 then
		if payment_id is not null then
			update member_payment_method set del_yn = 1 where payment_method_id = method_id;
			update member set payment_method_id = null where member_id = member_id_check;
			select '삭제 완료';
		else
			select "등록된 계좌 정보가 없습니다." as 결과;
		end if;
	end if;
END //


DELIMITER //
CREATE PROCEDURE 결제정보수정(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in input_bank varchar(30),
    in input_account varchar(30)
)
BEGIN
    -- login_check 라는 int 타입의 변수 선언
    declare member_check int;
    declare member_id_check int;
    declare method_id int;
    
    -- 입력받은 이메일과 비밀번호가 member 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
    select payment_method_id into method_id from member_payment_method where member_id = member_id_check and del_yn != 1;
    
    -- 결재 정보에 member_id 의 정보가 있고, 그 결재 정보가 삭제되지 않은 정보라면
    -- 해당 정보를 삭제하는 연산 수행 -> del_yn 을 0 -> 1로 변경
    if member_check = 1 then
		select * from member_payment_method where payment_method_id = method_id;
		update member_payment_method set del_yn = 1 where payment_method_id = method_id;
        insert into member_payment_method(bank_name, account_number, member_id) values (input_bank, input_account, member_id_check);
        update member set payment_method_id = (select payment_method_id 
                                               from member_payment_method 
                                               where member_id = member_id_check and del_yn = 0)
                where member_id = member_id_check;
        select '정보 수정 완료';
	else
		select '등록된 결제 정보가 없습니다.' as 결과;
	end if;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE refund(IN input_member_id BIGINT, out return_msg varchar(100))
BEGIN
    DECLARE can_refund_exists INT;
    DECLARE history_id bigint;

	SELECT
		payment_history_id
        INTO history_id
	FROM member_payment_history AS mph
	WHERE mph.member_id = input_member_id and mph.cancel_yn = 0 AND datediff(CURRENT_DATE, mph.created_at) <= 3
	ORDER BY mph.created_at desc
    LIMIT 1;

    -- 결과가 NULL이면 -1을 할당
    IF history_id IS NULL THEN
        set return_msg = "취소 가능한 내역이 없습니다.";
    ELSE
		UPDATE member_payment_history
        SET canceled_at = sysdate()
			,cancel_yn = 1
		WHERE payment_history_id = history_id;
        UPDATE member
        SET membership = 0
        WHERE member_id = input_member_id;
		set return_msg = "결제가 취소되었습니다.";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE 구독내역(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    declare member_check int;
    declare member_id_check int;
    
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
    
    if member_check = 1 then
		select * from member_payment_history where member_id = member_id_check;
	else
		select '계정 확인' as 결과;
	end if;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE 구독취소(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    declare member_check int;
    declare member_id_check int;
    declare canc_yn int;
    
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
    select cancel_yn into canc_yn from member_payment_history where member_id = member_id_check;
    
    if member_check = 1 then
		if canc_yn = 0 then
			update member_payment_history set cancel_yn = 1 where member_id = member_id_check;
			update member_payment_history set canceled_at = now() where member_id = member_id_check;
			select '구독 취소 완료';
        end if;
	else
		select '계정 확인' as 결과;
	end if;
END // DELIMITER ;


DELIMITER //
CREATE PROCEDURE `플레이리스트조회하기`(IN 플레이리스트아이디 BIGINT)
BEGIN
    SELECT music.music_id music_id, music.music_title music_title FROM music, member_playlist_detail mpd, member_playlist mp
    WHERE music.music_id = mpd.music_id AND mp.playlist_id = mpd.playlist_id AND mp.playlist_id = 플레이리스트아이디;
END
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE `플레이리스트만들기`(IN 회원아이디 BIGINT, IN 플레이리스트이름 VARCHAR(255), IN 썸네일URL VARCHAR(2083))
BEGIN
    INSERT INTO member_playlist(playlist_title, playlist_thumbnail_url, member_id)
    VALUES (플레이리스트이름, 썸네일URL, 회원아이디);

    SELECT '플레이리스트를 만들었습니다.', playlist_title
    FROM member_playlist
    WHERE playlist_title = 플레이리스트이름 AND member_id = 회원아이디
    ORDER BY created_at
    LIMIT 1;
END
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE `플레이리스트에음원추가하기`(IN 플레이리스트아이디 BIGINT, IN 음원아이디 BIGINT)
BEGIN
    INSERT INTO member_playlist_detail(playlist_id, music_id) VALUES(플레이리스트아이디, 음원아이디);
    SELECT mp.playlist_id, mp.playlist_title, music.music_title
    FROM member_playlist mp, member_playlist_detail mpd, music
    WHERE mp.playlist_id = mpd.playlist_id
      AND mpd.music_id = music.music_id
      AND mp.playlist_id = 플레이리스트아이디;
END
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE `아티스트검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT artist_id, artist_name FROM artist WHERE artist.artist_name LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE `앨범검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT album_id, album_title FROM album WHERE album.album_title LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE `음원검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT music_id, music_title, playtime, like_count FROM music WHERE music.music_title LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;

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