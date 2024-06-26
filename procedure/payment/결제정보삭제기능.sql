drop procedure 결제정보삭제;
DELIMITER //

CREATE PROCEDURE 결제정보삭제(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    declare member_check int;
    declare member_id_check int;
    declare method_id int;
	declare payment_id int;
    
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
    select payment_method_id into method_id from member_payment_method where member_id = member_id_check and del_yn != 1;
    select payment_method_id into payment_id from member where member_id = member_id_check;

    if member_check = 1 then
		if payment_id is not null then
			update member_payment_method set del_yn = 1 where payment_method_id = method_id;
			update member set payment_method_id = null where member_id = member_id_check;
			select '삭제 완료';
		else
			select "등록된 계좌 정보가 없습니다." as 결과;
		end if;
	end if;
END //

DELIMITER ;
select * from member;
call 결제정보삭제('bob2@example.com', 'password2');
