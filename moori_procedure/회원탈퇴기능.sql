--------------------------------------회원 탈퇴_멤버-----------------------------------------------------
drop procedure 회원탈퇴;
DELIMITER //

CREATE PROCEDURE 회원탈퇴(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    -- login_check 라는 int 타입의 변수 선언
    declare login_check int;
    
    -- 입력받은 이메일과 비밀번호가 artist 의 이메일과 비밀번호와 같다면 login_check 에 1을 넣는다.
    select 1 into login_check from member where password = m_password and member_email = m_member_email;
    
    -- login_check 가 1이라면 로그인 성공 출력
    -- 1이 아니라면 잘못된 로그인 정보입니다. 를 출력
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

