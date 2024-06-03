--------------------------------------회원 정보 수정-----------------------------------------------------
drop procedure 회원정보수정;
select * from member;
DELIMITER //

CREATE PROCEDURE 회원정보수정(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in m_c_password varchar(30),
    in m_c_phonenum varchar(20),
    in m_c_account_id varchar(100),
    in m_c_profile varchar(2083)
)
BEGIN
	declare login_check int;
    
    select 1 into login_check from member where password = m_password and member_email = m_member_email;
    

    if login_check = 1 then
		update member set password = m_c_password where m_c_password is not null and member_email = m_member_email;
        update member set phonenum = m_c_phonenum where m_c_phonenum is not null and member_email = m_member_email;
        update member set payment_method_id = m_c_account_id where m_c_account_id is not null and member_email = m_member_email;
        update member set member_profile_image_url = m_c_profile where m_c_profile is not null and member_email = m_member_email;
	else
		select '잘못된 정보입니다.' as 결과창;
	end if;
end// 
DELIMITER ;

call secession_member('alice1@example.com','password1');
select * from member;

call correction_member_information('alice1@example.com', 'password', 'password1', null , null, null);
