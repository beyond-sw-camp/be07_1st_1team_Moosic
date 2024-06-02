-------------------------------------------- 구독 취소 ------------------------------------------------------
drop procedure 구독취소;
DELIMITER //

CREATE PROCEDURE 구독취소(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    declare member_check int;
    declare member_id_check int;
    declare canc_yn int;
    
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
    select cancel_yn into canc_yn from member_payment_history where member_id = member_id_check;
    
    if member_check = 1 then
		if canc_yn = 0 then
			update member_payment_history set cancel_yn = 1 where member_id = member_id_check;
			update member_payment_history set canceled_at = now() where member_id = member_id_check;
			select '구독 취소 완료';
        end if;
	else
		select '계정 확인' as 결과;
	end if;
END //

DELIMITER ;
call 구독취소('bob2@example.com', 'password2');