-------------------------------------------- 구독 내역 ----------------------------------------------------
drop procedure 구독내역;
DELIMITER //

CREATE PROCEDURE 구독내역(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    declare member_check int;
    declare member_id_check int;
    
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
    
    if member_check = 1 then
		select * from member_payment_history where member_id = member_id_check;
	else
		select '계정 확인' as 결과;
	end if;
END //

DELIMITER ;

call 구독내역('bob2@example.com', 'password2');