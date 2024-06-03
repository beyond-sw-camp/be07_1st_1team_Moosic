drop procedure 로그아웃;
DELIMITER //

CREATE PROCEDURE 로그아웃(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in input varchar(30)
)
BEGIN
    declare member_check int;
    
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	
    if member_check = 1 then
		select '로그아웃 성공' as 결과창 where input = '로그아웃';
	end if;
END //

DELIMITER ;

select * from member;

call 로그아웃('alice1@example.com' , 'password1', null);
call 로그아웃('alice1@example.com' , 'password1', '로그아웃');
