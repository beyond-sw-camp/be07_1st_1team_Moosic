DELIMITER //
CREATE PROCEDURE `플레이리스트조회하기`(IN 플레이리스트아이디 BIGINT)
BEGIN
    SELECT music.music_id music_id, music.music_title music_title FROM music, member_playlist_detail mpd, member_playlist mp
    WHERE music.music_id = mpd.music_id AND mp.playlist_id = mpd.playlist_id AND mp.playlist_id = 플레이리스트아이디;
END
// DELIMITER ;