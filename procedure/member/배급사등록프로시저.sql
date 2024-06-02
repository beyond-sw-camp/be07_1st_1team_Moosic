DELIMITER //

CREATE PROCEDURE `배급사등록`(
    IN d_distributor_name varchar(30),
    in d_distributor_email varchar(100),
    in d_password varchar(30),
    in d_phone_num varchar(20)
)
BEGIN
    INSERT INTO album_distributor(distributor_name, distributor_email, password, distributor_num)
    VALUES (d_distributor_name, d_distributor_email, d_password, d_phone_num);
END //

DELIMITER ;

CALL `배급사등록`('MusicWave', 'info@musicwave.com', 'wavepass', '010-1234-5678');
CALL `배급사등록`('SoundStream', 'contact@soundstream.com', 'streampass', '010-2345-6789');
CALL `배급사등록`('Harmonia', 'support@harmonia.com', 'harmonypass', '010-3456-7890');
CALL `배급사등록`('MelodyWorks', 'admin@melodyworks.com', 'melodypass', '010-4567-8901');
CALL `배급사등록`('TuneSource', 'service@tunesource.com', 'tunepass', '010-5678-9012');