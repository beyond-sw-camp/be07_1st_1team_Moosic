DELIMITER //

CREATE PROCEDURE refund(IN input_member_id BIGINT, out return_msg varchar(100))
BEGIN
    DECLARE can_refund_exists INT;
    DECLARE history_id bigint;

	SELECT
		payment_history_id
        INTO history_id
	FROM member_payment_history AS mph
	WHERE mph.member_id = input_member_id and mph.cancel_yn = 0 AND datediff(CURRENT_DATE, mph.created_at) <= 3
	ORDER BY mph.created_at desc
    LIMIT 1;

    -- 결과가 NULL이면 -1을 할당
    IF history_id IS NULL THEN
        set return_msg = "취소 가능한 내역이 없습니다.";
    ELSE
		UPDATE member_payment_history
        SET canceled_at = sysdate()
			,cancel_yn = 1
		WHERE payment_history_id = history_id;
        UPDATE member
        SET membership = 0
        WHERE member_id = input_member_id;
		set return_msg = "구독 취소되었습니다.";
    END IF;
END //

DELIMITER ;

CALL refund(20, @return_msg);
select @return_msg;
