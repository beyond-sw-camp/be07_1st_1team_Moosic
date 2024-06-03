------------------------------------- 멤버 로그인 ---------------------------------------
drop procedure 멤버로그인;
DELIMITER //

CREATE PROCEDURE 멤버로그인(
    in m_member_email varchar(100),
    in m_password varchar(30)
)
BEGIN
    declare login_check int;
    
    select 1 into login_check from member where member_email = m_member_email and password = m_password;

    if login_check = 1 then
		select '로그인 성공' as 결과창;
	else
		select '잘못된 로그인 정보입니다.' as 결과창;
	end if;
END //

DELIMITER ;

select * from member;
call login_member('alice1@example.com', 'password1');
call login_member('alice1@example.com', 'password');

------------------------------------- 관리자 로그인 ---------------------------------------

drop procedure 관리자로그인;
DELIMITER //

CREATE PROCEDURE 관리자로그인(
    in ad_artist_email varchar(100),
    in ad_password varchar(30)
)
BEGIN
    declare login_check int;
    
    select 1 into login_check from admin where password = ad_password and admin_email = ad_artist_email;
    
    if login_check = 1 then
		select '로그인 성공' as 결과창;
	else
		select '잘못된 로그인 정보입니다.' as 결과창;
	end if;
END //

DELIMITER ;
call login_admin('alice.kim@example.com', 'password123');   -- 성공
call login_admin('alice.kim@example.com', 'password12');   -- 실패
call login_admin('alice1.kim@example.com', 'password123'); -- 실패

------------------------------------- 배급사 로그인 ---------------------------------------
select * from album_distributor;

drop procedure 배급사로그인;
DELIMITER //

CREATE PROCEDURE 배급사로그인(
    in dis_distirbutor_email varchar(100),
    in dis_password varchar(30)
)
BEGIN
    declare login_check int;
    
    select 1 into login_check from album_distributor where password = dis_password and distributor_email = dis_distirbutor_email;
    
    if login_check = 1 then
		select '로그인 성공' as 결과창;
	else
		select '잘못된 로그인 정보입니다.' as 결과창;
	end if;
END //

DELIMITER ;
call login_distributor('distributor1@example.com', 'password1');   -- 성공
call login_distributor('distributor1@example.com', 'password12');    -- 실패
