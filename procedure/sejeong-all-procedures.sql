-- 1. 음원에 좋아요 누르기
DELIMITER //
CREATE PROCEDURE `음원에좋아요누르기`(IN 음원아이디 BIGINT, IN 회원아이디 BIGINT)
BEGIN
    DECLARE 데이터개수 INT;
    SET 데이터개수 = 0;

    SELECT COUNT(*) INTO 데이터개수 FROM music_like WHERE music_id = 음원아이디 AND member_id = 회원아이디;

    IF 데이터개수 > 0 THEN
       DELETE FROM music_like WHERE music_id = 음원아이디 AND member_id = 회원아이디;
    ELSE
        INSERT INTO music_like(music_id , member_id) VALUES (음원아이디, 회원아이디);
    END IF;
END
// DELIMITER ;


-- 2. 자신이 누른 좋아요 목록 조회
-- 회원이 좋아요 누른 음원 목록을 최신순으로 정렬하여 반환합니다.
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

-- 3. 재생중인 곡 좋아요 여부 표시
DELIMITER //
CREATE PROCEDURE `재생중인곡좋아요여부표시`(IN 음원아이디 BIGINT, IN 회원아이디 BIGINT)
BEGIN
    SELECT COUNT(*)
    FROM music_like
    WHERE music_like.music_id = 음원아이디 AND music_like.member_id = 회원아이디;
END
// DELIMITER ;



-- 4. 음원에 싫어요 누르기
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

-- 5. 음원 검색
DELIMITER //
CREATE PROCEDURE `음원검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT music_id, music_title, playtime, like_count FROM music WHERE music.music_title LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;


-- 6. 앨범 검색
DELIMITER //
CREATE PROCEDURE `앨범검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT album_id, album_title FROM album WHERE album.album_title LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;


-- 7. 아티스트 검색
DELIMITER //
CREATE PROCEDURE `아티스트검색`(IN 검색어 VARCHAR(253))
BEGIN
    SELECT artist_id, artist_name FROM artist WHERE artist.artist_name LIKE CONCAT(CONCAT('%', 검색어), '%');
END
// DELIMITER ;

select * from artist;


-- 8. 플레이리스트 만들기
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

-- 9. 플레이리스트에 음원 추가하기
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

-- 10. 플레이리스트 내역을 조회하기
DELIMITER //
CREATE PROCEDURE `플레이리스트조회하기`(IN 플레이리스트아이디 BIGINT)
BEGIN
    SELECT music.music_id music_id, music.music_title music_title FROM music, member_playlist_detail mpd, member_playlist mp
    WHERE music.music_id = mpd.music_id AND mp.playlist_id = mpd.playlist_id AND mp.playlist_id = 플레이리스트아이디;
END
// DELIMITER ;



-- 11. 음원 좋아요 수 조회하기
DELIMITER //
CREATE PROCEDURE `음원좋아요수조회`(IN 음원아이디 BIGINT)
BEGIN
    SELECT music.music_title music_title, COUNT(*) like_count
    FROM music INNER JOIN music_like
    WHERE music.music_id = music_like.music_id
    AND music.music_id = 음원아이디
    GROUP BY music.music_title ;
END
// DELIMITER ;


-- 12. 통합 검색
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