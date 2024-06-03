-------------------------------------------- 구독 내역 ----------------------------------------------------
drop procedure 유저구독내역;
DELIMITER //
select * from admin;
CREATE PROCEDURE 유저구독내역(
    in a_admin_email varchar(100),
    in a_password varchar(30)
)
BEGIN
    declare member_check int;
    declare member_id_check int;
    
    select 1 into member_check from admin where admin_email = a_admin_email and password = a_password;
	select admin_id into member_id_check from admin where admin_email = a_admin_email and member_check = 1;
    
    if member_check = 1 then
		select * from member_payment_history;
	else
		select 'admin 계정 확인 요망' as 결과;
	end if;
END //

DELIMITER ;

call team1_moosic.유저구독내역('seho@moosic.com', '1234');