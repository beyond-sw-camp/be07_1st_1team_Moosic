drop procedure 결제정보수정;
DELIMITER //

CREATE PROCEDURE 결제정보수정(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in input_bank varchar(30),
    in input_account varchar(30)
)
BEGIN
    -- login_check 라는 int 타입의 변수 선언
    declare member_check int;
    declare member_id_check int;
    declare method_id int;
    
    -- 입력받은 이메일과 비밀번호가 member 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
    select payment_method_id into method_id from member_payment_method where member_id = member_id_check and del_yn != 1;
    
    -- 결재 정보에 member_id 의 정보가 있고, 그 결재 정보가 삭제되지 않은 정보라면
    -- 해당 정보를 삭제하는 연산 수행 -> del_yn 을 0 -> 1로 변경
    if member_check = 1 then
		select * from member_payment_method where payment_method_id = method_id;
		update member_payment_method set del_yn = 1 where payment_method_id = method_id;
        insert into member_payment_method(bank_name, account_number, member_id) values (input_bank, input_account, member_id_check);
        update member set payment_method_id = (select payment_method_id 
                                               from member_payment_method 
                                               where member_id = member_id_check and del_yn = 0)
                where member_id = member_id_check;
        select '정보 수정 완료';
	else
		select '등록된 결제 정보가 없습니다.' as 결과;
	end if;
END //

DELIMITER ;

select * from member_payment_method;
call 결제정보수정('bob2@example.com', 'password2', "카카오뱅크", "1234-4132-1234-4356");