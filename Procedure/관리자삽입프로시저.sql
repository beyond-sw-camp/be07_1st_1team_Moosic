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

-- 값 삽입 예시 
CALL `관리자 넣기`('Alice Kim', 'alice.kim@example.com', 'password123', '010-1234-5678');
CALL `관리자 넣기`('Bob Lee', 'bob.lee@example.com', 'securepass', '010-2345-6789');
CALL `관리자 넣기`('Charlie Park', 'charlie.park@example.com', 'mypassword', '010-3456-7890');
CALL `관리자 넣기`('David Choi', 'david.choi@example.com', 'adminpass', '010-4567-8901');
