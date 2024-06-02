drop procedure 로그아웃;
DELIMITER //

CREATE PROCEDURE 로그아웃(
    in m_member_email varchar(100),
    in m_password varchar(30),
    in input varchar(30)
)
BEGIN
    -- login_check 라는 int 타입의 변수 선언
    declare member_check int;
    
    -- 입력받은 이메일과 비밀번호가 member 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into member_check from member where member_email = m_member_email and password = m_password;
	
    -- login_check 가 1이라면 로그인 성공 출력
    -- 1이 아니라면 잘못된 로그인 정보입니다. 를 출력
    if member_check = 1 then
		select '로그아웃 성공' as 결과창 where input = '로그아웃';
	end if;
END //

DELIMITER ;

select * from member;

call 로그아웃('alice1@example.com' , 'password1', null);
call 로그아웃('alice1@example.com' , 'password1', '로그아웃');