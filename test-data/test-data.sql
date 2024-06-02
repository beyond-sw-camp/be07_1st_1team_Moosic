TRUNCATE `member`;
TRUNCATE `artist`;
TRUNCATE album_distributor;
TRUNCATE member_payment_method;
TRUNCATE member_payment_history;
TRUNCATE member_playlist;
TRUNCATE member_playlist_detail;
TRUNCATE `member_play_history`;
TRUNCATE music;
TRUNCATE album;



SET foreign_key_checks = 0;
INSERT INTO `member` (`member_name`, `member_email`, `password`, `phonenum`, `birthdate`, `gender`, `member_profile_image_url`) VALUES
('Alice', 'alice1@example.com', 'password1', '010-1111-1111', '1990-01-01 00:00:00', 'Female', 'http://example.com/image1'),
('Bob', 'bob2@example.com', 'password2', '010-2222-2222', '1985-02-02 00:00:00', 'Male', 'http://example.com/image2'),
('Charlie', 'charlie3@example.com', 'password3', '010-3333-3333', '1992-03-03 00:00:00', 'Male', 'http://example.com/image3'),
('David', 'david4@example.com', 'password4', '010-4444-4444', '1988-04-04 00:00:00', 'Male', 'http://example.com/image4'),
('Eva', 'eva5@example.com', 'password5', '010-5555-5555', '1995-05-05 00:00:00', 'Female', 'http://example.com/image5'),
('Frank', 'frank6@example.com', 'password6', '010-6666-6666', '1980-06-06 00:00:00', 'Male', 'http://example.com/image6'),
('Grace', 'grace7@example.com', 'password7', '010-7777-7777', '1991-07-07 00:00:00', 'Female', 'http://example.com/image7'),
('Hank', 'hank8@example.com', 'password8', '010-8888-8888', '1987-08-08 00:00:00', 'Male', 'http://example.com/image8'),
('Ivy', 'ivy9@example.com', 'password9', '010-9999-9999', '1993-09-09 00:00:00', 'Female', 'http://example.com/image9'),
('Jack', 'jack10@example.com', 'password10', '010-1010-1010', '1989-10-10 00:00:00', 'Male', 'http://example.com/image10'),
('Kate', 'kate11@example.com', 'password11', '010-1112-1112', '1994-11-11 00:00:00', 'Female', 'http://example.com/image11'),
('Leo', 'leo12@example.com', 'password12', '010-1212-1212', '1986-12-12 00:00:00', 'Male', 'http://example.com/image12'),
('Mona', 'mona13@example.com', 'password13', '010-1313-1313', '1996-01-13 00:00:00', 'Female', 'http://example.com/image13'),
('Nate', 'nate14@example.com', 'password14', '010-1414-1414', '1984-02-14 00:00:00', 'Male', 'http://example.com/image14'),
('Olivia', 'olivia15@example.com', 'password15', '010-1515-1515', '1997-03-15 00:00:00', 'Female', 'http://example.com/image15'),
('Paul', 'paul16@example.com', 'password16', '010-1616-1616', '1983-04-16 00:00:00', 'Male', 'http://example.com/image16'),
('Quincy', 'quincy17@example.com', 'password17', '010-1717-1717', '1998-05-17 00:00:00', 'Male', 'http://example.com/image17'),
('Rachel', 'rachel18@example.com', 'password18', '010-1818-1818', '1982-06-18 00:00:00', 'Female', 'http://example.com/image18'),
('Sam', 'sam19@example.com', 'password19', '010-1919-1919', '1999-07-19 00:00:00', 'Male', 'http://example.com/image19'),
('Tina', 'tina20@example.com', 'password20', '010-2020-2020', '1981-08-20 00:00:00', 'Female', 'http://example.com/image20'),
('Uma', 'uma21@example.com', 'password21', '010-2121-2121', '2000-09-21 00:00:00', 'Female', 'http://example.com/image21'),
('Victor', 'victor22@example.com', 'password22', '010-2222-2323', '1980-10-22 00:00:00', 'Male', 'http://example.com/image22'),
('Wendy', 'wendy23@example.com', 'password23', '010-2323-2424', '2001-11-23 00:00:00', 'Female', 'http://example.com/image23'),
('Xander', 'xander24@example.com', 'password24', '010-2424-2525', '1979-12-24 00:00:00', 'Male', 'http://example.com/image24'),
('Yara', 'yara25@example.com', 'password25', '010-2525-2626', '2002-01-25 00:00:00', 'Female', 'http://example.com/image25'),
('Zack', 'zack26@example.com', 'password26', '010-2626-2727', '1978-02-26 00:00:00', 'Male', 'http://example.com/image26'),
('Ann', 'ann27@example.com', 'password27', '010-2727-2828', '2003-03-27 00:00:00', 'Female', 'http://example.com/image27'),
('Ben', 'ben28@example.com', 'password28', '010-2828-2929', '1977-04-28 00:00:00', 'Male', 'http://example.com/image28'),
('Cara', 'cara29@example.com', 'password29', '010-2929-3030', '2004-05-29 00:00:00', 'Female', 'http://example.com/image29'),
('Dean', 'dean30@example.com', 'password30', '010-3030-3131', '1976-06-30 00:00:00', 'Male', 'http://example.com/image30');


-- artist
INSERT INTO `artist` (`artist_name`, `artist_profile_image_url`) VALUES
('Artist One', 'http://example.com/image1'),
('Artist Two', 'http://example.com/image2'),
('Artist Three', 'http://example.com/image3'),
('Artist Four', 'http://example.com/image4'),
('Artist Five', 'http://example.com/image5'),
('Artist Six', 'http://example.com/image6'),
('Artist Seven', 'http://example.com/image7'),
('Artist Eight', 'http://example.com/image8'),
('Artist Nine', 'http://example.com/image9'),
('Artist Ten', 'http://example.com/image10'),
('Artist Eleven', 'http://example.com/image11'),
('Artist Twelve', 'http://example.com/image12'),
('Artist Thirteen', 'http://example.com/image13'),
('Artist Fourteen', 'http://example.com/image14'),
('Artist Fifteen', 'http://example.com/image15'),
('Artist Sixteen', 'http://example.com/image16'),
('Artist Seventeen', 'http://example.com/image17'),
('Artist Eighteen', 'http://example.com/image18'),
('Artist Nineteen', 'http://example.com/image19'),
('Artist Twenty', 'http://example.com/image20');


-- album_distributor
INSERT INTO album_distributor (distributor_name, distributor_email, password, distributor_num) VALUES
('Distributor One', 'distributor1@example.com', 'password1', '010-1111-1111'),
('Distributor Two', 'distributor2@example.com', 'password2', '010-1111-1112'),
('Distributor Three', 'distributor3@example.com', 'password3', '010-1111-1113'),
('Distributor Four', 'distributor4@example.com', 'password4', '010-1111-1114'),
('Distributor Five', 'distributor5@example.com', 'password5', '010-1111-1115');


--
INSERT INTO member_payment_method (bank_name, account_number, del_yn, member_id) VALUES
('국민은행', '1111-1111-1111-1111', 0, 1),
('신한은행', '2222-2222-2222-2222', 0, 2),
('우리은행', '3333-3333-3333-3333', 0, 3),
('하나은행', '4444-4444-4444-4444', 0, 4),
('카카오뱅크', '5555-5555-5555-5555', 0, 5),
('국민은행', '6666-6666-6666-6666', 0, 6),
('신한은행', '7777-7777-7777-7777', 0, 7),
('우리은행', '8888-8888-8888-8888', 0, 8),
('하나은행', '9999-9999-9999-9999', 0, 9),
('카카오뱅크', '1010-1010-1010-1010', 0, 10),
('국민은행', '1111-1111-1111-1112', 0, 11),
('신한은행', '2222-2222-2222-2223', 0, 12),
('우리은행', '3333-3333-3333-3334', 0, 13),
('하나은행', '4444-4444-4444-4445', 0, 14),
('카카오뱅크', '5555-5555-5555-5556', 0, 15),
('국민은행', '6666-6666-6666-6667', 0, 16),
('신한은행', '7777-7777-7777-7778', 0, 17),
('우리은행', '8888-8888-8888-8889', 0, 18),
('하나은행', '9999-9999-9999-9990', 0, 19),
('카카오뱅크', '1010-1010-1010-1020', 0, 20);


INSERT INTO member_payment_history (created_at, canceled_at, cancel_yn, member_id, payment_method_id) VALUES
('2023-01-01 10:00:00', NULL, 0, 1, 1),
('2023-01-02 11:00:00', NULL, 0, 2, 2),
('2023-01-03 12:00:00', NULL, 0, 3, 3),
('2023-01-04 13:00:00', NULL, 0, 4, 4),
('2023-01-05 14:00:00', '2023-01-06 10:00:00', 1, 5, 5),
('2023-01-06 15:00:00', NULL, 0, 6, 6),
('2023-01-07 16:00:00', '2023-01-08 11:00:00', 1, 7, 7),
('2023-01-08 17:00:00', NULL, 0, 8, 8),
('2023-01-09 18:00:00', '2023-01-10 12:00:00', 1, 9, 9),
('2023-01-10 19:00:00', NULL, 0, 10, 10),
('2023-01-11 20:00:00', NULL, 0, 11, 11),
('2023-01-12 21:00:00', NULL, 0, 12, 12),
('2023-01-13 22:00:00', NULL, 0, 13, 13),
('2023-01-14 23:00:00', '2023-01-15 13:00:00', 1, 14, 14),
('2023-01-15 09:00:00', NULL, 0, 15, 15),
('2023-01-16 08:00:00', NULL, 0, 16, 16),
('2023-01-17 07:00:00', NULL, 0, 17, 17),
('2023-01-18 06:00:00', '2023-01-19 14:00:00', 1, 18, 18),
('2023-01-19 05:00:00', NULL, 0, 19, 19),
('2023-01-20 04:00:00', NULL, 0, 20, 20);



-- playlist
INSERT INTO member_playlist (playlist_title, created_at, updated_at, playlist_thumbnail_url, del_yn, member_id) VALUES
('My Favorite Songs', '2023-01-01 10:00:00', '2023-01-01 10:00:00', 'http://example.com/thumbnail1.jpg', 0, 1),
('Workout Playlist', '2023-01-02 11:00:00', '2023-01-02 11:00:00', 'http://example.com/thumbnail2.jpg', 0, 2),
('Chill Vibes', '2023-01-03 12:00:00', '2023-01-03 12:00:00', 'http://example.com/thumbnail3.jpg', 0, 3),
('Party Hits', '2023-01-04 13:00:00', '2023-01-04 13:00:00', 'http://example.com/thumbnail4.jpg', 0, 4),
('Classic Rock', '2023-01-05 14:00:00', '2023-01-05 14:00:00', 'http://example.com/thumbnail5.jpg', 0, 5);
INSERT INTO member_playlist_detail (playlist_id, music_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(5, 17),
(5, 18),
(5, 19),
(5, 20);



-- member_play_history
INSERT INTO `member_play_history` (`member_id`, `music_id`, `start_time`, `end_time`) VALUES
(1, 1, '2023-01-01 10:00:00', '2023-01-01 10:03:00'),
(2, 2, '2023-01-02 11:00:00', '2023-01-02 11:04:00'),
(3, 3, '2023-01-03 12:00:00', '2023-01-03 12:05:00'),
(4, 4, '2023-01-04 13:00:00', '2023-01-04 13:03:00'),
(5, 5, '2023-01-05 14:00:00', '2023-01-05 14:02:00'),
(6, 6, '2023-01-06 15:00:00', '2023-01-06 15:04:00'),
(7, 7, '2023-01-07 16:00:00', '2023-01-07 16:06:00'),
(8, 8, '2023-01-08 17:00:00', '2023-01-08 17:05:00'),
(9, 9, '2023-01-09 18:00:00', '2023-01-09 18:04:00'),
(10, 10, '2023-01-10 19:00:00', '2023-01-10 19:03:00'),
(11, 11, '2023-01-11 20:00:00', '2023-01-11 20:02:00'),
(12, 12, '2023-01-12 21:00:00', '2023-01-12 21:04:00'),
(13, 13, '2023-01-13 22:00:00', '2023-01-13 22:06:00'),
(14, 14, '2023-01-14 23:00:00', '2023-01-14 23:05:00'),
(15, 15, '2023-01-15 09:00:00', '2023-01-15 09:03:00'),
(16, 16, '2023-01-16 08:00:00', '2023-01-16 08:04:00'),
(17, 17, '2023-01-17 07:00:00', '2023-01-17 07:05:00'),
(18, 18, '2023-01-18 06:00:00', '2023-01-18 06:02:00'),
(19, 19, '2023-01-19 05:00:00', '2023-01-19 05:03:00'),
(20, 20, '2023-01-20 04:00:00', '2023-01-20 04:06:00'),
(21, 21, '2023-01-21 03:00:00', '2023-01-21 03:05:00'),
(22, 22, '2023-01-22 02:00:00', '2023-01-22 02:04:00'),
(23, 23, '2023-01-23 01:00:00', '2023-01-23 01:06:00'),
(24, 24, '2023-01-24 00:00:00', '2023-01-24 00:03:00'),
(25, 25, '2023-01-25 10:00:00', '2023-01-25 10:04:00'),
(26, 26, '2023-01-26 11:00:00', '2023-01-26 11:05:00'),
(27, 27, '2023-01-27 12:00:00', '2023-01-27 12:02:00'),
(28, 28, '2023-01-28 13:00:00', '2023-01-28 13:03:00'),
(29, 29, '2023-01-29 14:00:00', '2023-01-29 14:04:00'),
(30, 30, '2023-01-30 15:00:00', '2023-01-30 15:06:00'),
(1, 31, '2023-02-01 10:00:00', '2023-02-01 10:05:00'),
(2, 32, '2023-02-02 11:00:00', '2023-02-02 11:04:00'),
(3, 33, '2023-02-03 12:00:00', '2023-02-03 12:06:00'),
(4, 34, '2023-02-04 13:00:00', '2023-02-04 13:02:00'),
(5, 35, '2023-02-05 14:00:00', '2023-02-05 14:03:00'),
(6, 36, '2023-02-06 15:00:00', '2023-02-06 15:05:00'),
(7, 37, '2023-02-07 16:00:00', '2023-02-07 16:04:00'),
(8, 38, '2023-02-08 17:00:00', '2023-02-08 17:06:00'),
(9, 39, '2023-02-09 18:00:00', '2023-02-09 18:02:00'),
(10, 40, '2023-02-10 19:00:00', '2023-02-10 19:05:00'),
(11, 1, '2023-02-11 20:00:00', '2023-02-11 20:06:00'),
(12, 2, '2023-02-12 21:00:00', '2023-02-12 21:03:00'),
(13, 3, '2023-02-13 22:00:00', '2023-02-13 22:05:00'),
(14, 4, '2023-02-14 23:00:00', '2023-02-14 23:04:00'),
(15, 5, '2023-02-15 09:00:00', '2023-02-15 09:02:00');


-- music_title
INSERT INTO `music` (`music_title`, `lyrics`, `music_file_url`, `playtime`, `like_count`, `del_yn`, `album_id`, `genre`) VALUES
('Song of Freedom', 'Lyrics of freedom...', 'http://example.com/music1.mp3', 210, 100, 0, 1, 'k-pop'),
('Love Symphony', 'Lyrics of love...', 'http://example.com/music2.mp3', 180, 200, 0, 1, 'pop'),
('Mystery Night', 'Lyrics of mystery...', 'http://example.com/music3.mp3', 240, 150, 0, 2, 'j-pop'),
('Dance Fever', 'Lyrics of dance...', 'http://example.com/music4.mp3', 200, 250, 0, 2, 'dance'),
('Ballad of Dreams', 'Lyrics of dreams...', 'http://example.com/music5.mp3', 300, 50, 0, 3, 'ballad'),
('Hip-Hop Hustle', 'Lyrics of hustle...', 'http://example.com/music6.mp3', 220, 300, 0, 3, 'hip-hop'),
('Trot Delight', 'Lyrics of delight...', 'http://example.com/music7.mp3', 260, 75, 0, 4, 'trot'),
('Pop Sensation', 'Lyrics of sensation...', 'http://example.com/music8.mp3', 190, 180, 0, 4, 'pop'),
('K-Pop Magic', 'Lyrics of magic...', 'http://example.com/music9.mp3', 210, 110, 0, 5, 'k-pop'),
('J-Pop Star', 'Lyrics of star...', 'http://example.com/music10.mp3', 230, 90, 0, 5, 'j-pop'),
('Dance Party', 'Lyrics of party...', 'http://example.com/music11.mp3', 200, 220, 0, 6, 'dance'),
('Ballad Harmony', 'Lyrics of harmony...', 'http://example.com/music12.mp3', 310, 130, 0, 6, 'ballad'),
('Hip-Hop Beats', 'Lyrics of beats...', 'http://example.com/music13.mp3', 215, 270, 0, 7, 'hip-hop'),
('Trot Joy', 'Lyrics of joy...', 'http://example.com/music14.mp3', 265, 95, 0, 7, 'trot'),
('Pop Melody', 'Lyrics of melody...', 'http://example.com/music15.mp3', 195, 185, 0, 8, 'pop'),
('K-Pop Rhythm', 'Lyrics of rhythm...', 'http://example.com/music16.mp3', 205, 120, 0, 8, 'k-pop'),
('J-Pop Groove', 'Lyrics of groove...', 'http://example.com/music17.mp3', 225, 105, 0, 9, 'j-pop'),
('Dance Floor', 'Lyrics of floor...', 'http://example.com/music18.mp3', 210, 240, 0, 9, 'dance'),
('Ballad Serenade', 'Lyrics of serenade...', 'http://example.com/music19.mp3', 320, 140, 0, 10, 'ballad'),
('Hip-Hop Flow', 'Lyrics of flow...', 'http://example.com/music20.mp3', 225, 310, 0, 10, 'hip-hop'),
('Trot Bliss', 'Lyrics of bliss...', 'http://example.com/music21.mp3', 270, 85, 0, 11, 'trot'),
('Pop Anthem', 'Lyrics of anthem...', 'http://example.com/music22.mp3', 205, 190, 0, 11, 'pop'),
('K-Pop Star', 'Lyrics of star...', 'http://example.com/music23.mp3', 215, 130, 0, 12, 'k-pop'),
('J-Pop Icon', 'Lyrics of icon...', 'http://example.com/music24.mp3', 235, 100, 0, 12, 'j-pop'),
('Dance Energy', 'Lyrics of energy...', 'http://example.com/music25.mp3', 220, 210, 0, 13, 'dance'),
('Ballad Soul', 'Lyrics of soul...', 'http://example.com/music26.mp3', 315, 150, 0, 13, 'ballad'),
('Hip-Hop Vibe', 'Lyrics of vibe...', 'http://example.com/music27.mp3', 230, 280, 0, 14, 'hip-hop'),
('Trot Tune', 'Lyrics of tune...', 'http://example.com/music28.mp3', 275, 70, 0, 14, 'trot'),
('Pop Rhythm', 'Lyrics of rhythm...', 'http://example.com/music29.mp3', 200, 195, 0, 15, 'pop'),
('K-Pop Beat', 'Lyrics of beat...', 'http://example.com/music30.mp3', 210, 125, 0, 15, 'k-pop'),
('J-Pop Dance', 'Lyrics of dance...', 'http://example.com/music31.mp3', 220, 115, 0, 16, 'j-pop'),
('Dance Fusion', 'Lyrics of fusion...', 'http://example.com/music32.mp3', 225, 250, 0, 16, 'dance'),
('Ballad Story', 'Lyrics of story...', 'http://example.com/music33.mp3', 325, 160, 0, 17, 'ballad'),
('Hip-Hop Jam', 'Lyrics of jam...', 'http://example.com/music34.mp3', 235, 290, 0, 17, 'hip-hop'),
('Trot Melody', 'Lyrics of melody...', 'http://example.com/music35.mp3', 280, 80, 0, 18, 'trot'),
('Pop Groove', 'Lyrics of groove...', 'http://example.com/music36.mp3', 210, 200, 0, 18, 'pop'),
('K-Pop Wave', 'Lyrics of wave...', 'http://example.com/music37.mp3', 215, 140, 0, 19, 'k-pop'),
('J-Pop Dream', 'Lyrics of dream...', 'http://example.com/music38.mp3', 230, 110, 0, 19, 'j-pop'),
('Dance Magic', 'Lyrics of magic...', 'http://example.com/music39.mp3', 215, 220, 0, 20, 'dance'),
('Ballad Heart', 'Lyrics of heart...', 'http://example.com/music40.mp3', 330, 170, 0, 20, 'ballad');


INSERT INTO album (album_title, music_count, release_date, album_art_image_url, del_yn, distributor_id) VALUES
('Greatest Hits', 2, '2023-01-01 10:00:00', 'http://example.com/art1.jpg', 0, 1),
('Love Songs', 3, '2023-02-01 11:00:00', 'http://example.com/art2.jpg', 0, 2),
('Dance Party', 4, '2023-03-01 12:00:00', 'http://example.com/art3.jpg', 0, 3),
('Rock Anthems', 2, '2023-04-01 13:00:00', 'http://example.com/art4.jpg', 0, 4),
('Hip-Hop Beats', 4, '2023-05-01 14:00:00', 'http://example.com/art5.jpg', 0, 5),
('Chill Vibes', 3, '2023-06-01 15:00:00', 'http://example.com/art6.jpg', 0, 1),
('Acoustic Favorites', 2, '2023-07-01 16:00:00', 'http://example.com/art7.jpg', 0, 2),
('Pop Essentials', 4, '2023-08-01 17:00:00', 'http://example.com/art8.jpg', 0, 3),
('Classic Rock', 3, '2023-09-01 18:00:00', 'http://example.com/art9.jpg', 0, 4),
('Electronic Beats', 2, '2023-10-01 19:00:00', 'http://example.com/art10.jpg', 0, 5),
('Jazz Collection', 3, '2023-11-01 20:00:00', 'http://example.com/art11.jpg', 0, 1),
('Country Roads', 2, '2023-12-01 21:00:00', 'http://example.com/art12.jpg', 0, 2),
('Indie Playlist', 4, '2023-01-15 10:00:00', 'http://example.com/art13.jpg', 0, 3),
('Metal Madness', 2, '2023-02-15 11:00:00', 'http://example.com/art14.jpg', 0, 4),
('R&B Vibes', 4, '2023-03-15 12:00:00', 'http://example.com/art15.jpg', 0, 5),
('Reggae Rhythms', 3, '2023-04-15 13:00:00', 'http://example.com/art16.jpg', 0, 1),
('Soul Classics', 2, '2023-05-15 14:00:00', 'http://example.com/art17.jpg', 0, 2),
('Blues Legends', 3, '2023-06-15 15:00:00', 'http://example.com/art18.jpg', 0, 3),
('Latin Hits', 4, '2023-07-15 16:00:00', 'http://example.com/art19.jpg', 0, 4),
('World Music', 2, '2023-08-15 17:00:00', 'http://example.com/art20.jpg', 0, 5);
SET foreign_key_checks = 1;