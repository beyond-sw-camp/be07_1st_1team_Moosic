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


--
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

--
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

--
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

