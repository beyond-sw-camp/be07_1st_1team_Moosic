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

CALL `멤버넣기`('Alice Kim', 'alice.kim@example.com', 'password123', '010-1234-5678', '1990-01-01', 'Female', 'account001', 'https://example.com/profiles/alice.jpg');
CALL `멤버넣기`('Bob Lee', 'bob.lee@example.com', 'securepass', '010-2345-6789', '1985-02-14', 'Male', 'account002', 'https://example.com/profiles/bob.jpg');
CALL `멤버넣기`('Charlie Park', 'charlie.park@example.com', 'mypassword', '010-3456-7890', '1992-03-20', 'Male', 'account003', 'https://example.com/profiles/charlie.jpg');
CALL `멤버넣기`('David Choi', 'david.choi@example.com', 'adminpass', '010-4567-8901', '1988-04-15', 'Male', 'account004', 'https://example.com/profiles/david.jpg');
CALL `멤버넣기`('Eva Lim', 'eva.lim@example.com', 'evapass', '010-5678-9012', '1995-05-10', 'Female', NULL, 'https://example.com/profiles/eva.jpg');
CALL `멤버넣기`('Frank Kim', 'frank.kim@example.com', 'frankpass', '010-6789-0123', '1991-06-25', 'Male', NULL, 'https://example.com/profiles/frank.jpg');
CALL `멤버넣기`('Grace Park', 'grace.park@example.com', 'gracepass', '010-7890-1234', '1989-07-30', 'Female', NULL, 'https://example.com/profiles/grace.jpg');
CALL `멤버넣기`('Henry Lee', 'henry.lee@example.com', 'henrypass', '010-8901-2345', '1994-08-18', 'Male', NULL, 'https://example.com/profiles/henry.jpg');
CALL `멤버넣기`('Ivy Choi', 'ivy.choi@example.com', 'ivypass', '010-9012-3456', '1993-09-22', 'Female', 'account009', 'https://example.com/profiles/ivy.jpg');
CALL `멤버넣기`('Jack Kim', 'jack.kim@example.com', 'jackpass', '010-0123-4567', '1987-10-11', 'Male', 'account010', 'https://example.com/profiles/jack.jpg');
CALL `멤버넣기`('Kathy Lim', 'kathy.lim@example.com', 'kathypass', '010-1234-5679', '1996-11-09', 'Female', 'account011', 'https://example.com/profiles/kathy.jpg');
CALL `멤버넣기`('Leo Park', 'leo.park@example.com', 'leopass', '010-2345-6790', '1984-12-08', 'Male', 'account012', 'https://example.com/profiles/leo.jpg');
CALL `멤버넣기`('Mona Choi', 'mona.choi@example.com', 'monapass', '010-3456-7891', '1990-01-15', 'Female', 'account013', 'https://example.com/profiles/mona.jpg');
CALL `멤버넣기`('Nick Lee', 'nick.lee@example.com', 'nickpass', '010-4567-8902', '1985-02-25', 'Male', 'account014', 'https://example.com/profiles/nick.jpg');
CALL `멤버넣기`('Olivia Kim', 'olivia.kim@example.com', 'oliviapass', '010-5678-9013', '1992-03-30', 'Female', 'account015', 'https://example.com/profiles/olivia.jpg');
CALL `멤버넣기`('Paul Park', 'paul.park@example.com', 'paulpass', '010-6789-0124', '1988-04-22', 'Male', 'account016', 'https://example.com/profiles/paul.jpg');
CALL `멤버넣기`('Queen Lim', 'queen.lim@example.com', 'queenpass', '010-7890-1235', '1991-05-29', 'Female', 'account017', 'https://example.com/profiles/queen.jpg');
CALL `멤버넣기`('Ray Choi', 'ray.choi@example.com', 'raypass', '010-8901-2346', '1989-06-19', 'Male', 'account018', 'https://example.com/profiles/ray.jpg');
CALL `멤버넣기`('Sara Lee', 'sara.lee@example.com', 'sarapass', '010-9012-3457', '1993-07-21', 'Female', 'account019', 'https://example.com/profiles/sara.jpg');
CALL `멤버넣기`('Tom Kim', 'tom.kim@example.com', 'tompass', '010-0123-4568', '1994-08-23', 'Male', 'account020', 'https://example.com/profiles/tom.jpg');
