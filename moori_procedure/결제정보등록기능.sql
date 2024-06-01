
drop procedure 결제정보등록;
DELIMITER //

CREATE PROCEDURE 결제정보등록(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in input_bank varchar(30),
    in input_account varchar(30)
)
BEGIN
    -- login_check 라는 int 타입의 변수 선언
    declare member_check int;
    declare member_id_check int;
    declare method_check int;
    -- 입력받은 이메일과 비밀번호가 member 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	select member_id into member_id_check from member where member_email = m_member_email and member_check = 1;
    select count(*) into method_check from member_payment_method where member_id = member_id_check;
    -- login_check 가 1이라면 로그인 성공 출력
    -- 1이 아니라면 잘못된 로그인 정보입니다. 를 출력
    if member_check = 1 then
		if method_check < 1 then
			insert into member_payment_method(bank_name,account_number, member_id) values (input_bank, input_account, member_id_check);
            select '결제 정보 등록 완료';
		else
			select '결제 정보 수정을 이용하시거나, 결제 정보 삭제 후 다시 등록해주십시요' as 결과;
		end if;
	end if;
END //

DELIMITER ;

select * from member;
call 결제정보등록('alice1@example.com', 'password1', '국민은행', '1111-1111-1111-4321');
select * from member_payment_method;