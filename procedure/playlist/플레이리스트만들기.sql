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