DELIMITER //

CREATE PROCEDURE `아티스트회원가입`(
    IN a_artist_name varchar(30),
    in a_artist_email varchar(100),
    in a_password varchar(30),
    in a_phone_num varchar(20),
    in a_artist_profile_image_url varchar(2083)
)
BEGIN
    INSERT INTO artist(artist_name, artist_email, password, phone_num, artist_profile_image_url)
    VALUES (a_artist_name, a_artist_email, a_password, a_phone_num, a_artist_profile_image_url);
END //

DELIMITER ;

CALL `아티스트회원가입`('Alice Kim', 'alice.kim@example.com', 'password123', '010-1234-5678', 'https://example.com/profiles/alice.jpg');
CALL `아티스트회원가입`('Bob Lee', 'bob.lee@example.com', 'securepass', '010-2345-6789', 'https://example.com/profiles/bob.jpg');
CALL `아티스트회원가입`('Charlie Park', 'charlie.park@example.com', 'mypassword', '010-3456-7890', 'https://example.com/profiles/charlie.jpg');
CALL `아티스트회원가입`('David Choi', 'david.choi@example.com', 'adminpass', '010-4567-8901', 'https://example.com/profiles/david.jpg');
CALL `아티스트회원가입`('Eva Lim', 'eva.lim@example.com', 'evapass', '010-5678-9012', NULL);
CALL `아티스트회원가입`('Frank Kim', 'frank.kim@example.com', 'frankpass', '010-6789-0123', NULL);
CALL `아티스트회원가입`('Grace Park', 'grace.park@example.com', 'gracepass', '010-7890-1234', NULL);
CALL `아티스트회원가입`('Henry Lee', 'henry.lee@example.com', 'henrypass', '010-8901-2345', NULL);
CALL `아티스트회원가입`('Ivy Choi', 'ivy.choi@example.com', 'ivypass', '010-9012-3456', 'https://example.com/profiles/ivy.jpg');
CALL `아티스트회원가입`('Jack Kim', 'jack.kim@example.com', 'jackpass', '010-0123-4567', 'https://example.com/profiles/jack.jpg');
CALL `아티스트회원가입`('Kathy Lim', 'kathy.lim@example.com', 'kathypass', '010-1234-5679', 'https://example.com/profiles/kathy.jpg');
CALL `아티스트회원가입`('Leo Park', 'leo.park@example.com', 'leopass', '010-2345-6790', 'https://example.com/profiles/leo.jpg');
CALL `아티스트회원가입`('Mona Choi', 'mona.choi@example.com', 'monapass', '010-3456-7891', 'https://example.com/profiles/mona.jpg');
CALL `아티스트회원가입`('Nick Lee', 'nick.lee@example.com', 'nickpass', '010-4567-8902', 'https://example.com/profiles/nick.jpg');
CALL `아티스트회원가입`('Olivia Kim', 'olivia.kim@example.com', 'oliviapass', '010-5678-9013', 'https://example.com/profiles/olivia.jpg');
CALL `아티스트회원가입`('Paul Park', 'paul.park@example.com', 'paulpass', '010-6789-0124', 'https://example.com/profiles/paul.jpg');
CALL `아티스트회원가입`('Queen Lim', 'queen.lim@example.com', 'queenpass', '010-7890-1235', 'https://example.com/profiles/queen.jpg');
CALL `아티스트회원가입`('Ray Choi', 'ray.choi@example.com', 'raypass', '010-8901-2346', 'https://example.com/profiles/ray.jpg');
CALL `아티스트회원가입`('Sara Lee', 'sara.lee@example.com', 'sarapass', '010-9012-3457', 'https://example.com/profiles/sara.jpg');
CALL `아티스트회원가입`('Tom Kim', 'tom.kim@example.com', 'tompass', '010-0123-4568', 'https://example.com/profiles/tom.jpg');