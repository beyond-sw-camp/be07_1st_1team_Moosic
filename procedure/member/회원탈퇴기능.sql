--------------------------------------회원 탈퇴_멤버-----------------------------------------------------
drop procedure 회원탈퇴;
DELIMITER //

CREATE PROCEDURE 회원탈퇴(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    declare login_check int;
    
    select 1 into login_check from member where password = m_password and member_email = m_member_email;
    
    if login_check = 1 then
		update member set del_yn = 1 where member_email = m_member_email;
        select '회원탈퇴 완료';
	else
		select '잘못된 정보입니다.' as 결과창;
	end if;
END //

DELIMITER ;

call secession_member('alice1@example.com','password1');
select * from member;

