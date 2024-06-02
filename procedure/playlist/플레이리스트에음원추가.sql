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
