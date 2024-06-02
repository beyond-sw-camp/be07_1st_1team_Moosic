drop procedure 결제정보등록;
DELIMITER //

CREATE PROCEDURE 결제정보등록(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in input_bank varchar(30),
    in input_account varchar(30)
)
BEGIN
    declare member_check int;
    declare member_id_check int;
	declare payment_id int;

    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
	select payment_method_id into payment_id from member where member_id = member_id_check;
    
    if member_check = 1 then
		if payment_id is null then
            insert into member_payment_method(bank_name, account_number, member_id) values (input_bank, input_account, member_id_check);
            update member set payment_method_id = (select payment_method_id from member_payment_method where member_id = member_id_check and del_yn = 0)
				where member_id = member_id_check;
            select '결제 정보 등록 완료';
		else
			select '이미 계좌가 등록되어 있습니다.' as 결과;
		end if;
	end if;
END //

DELIMITER ;

select * from member;
select * from member_payment_method;
call 결제정보등록('bob2@example.com', 'password2', '카카오뱅크', '1111-1111-2231-3421');