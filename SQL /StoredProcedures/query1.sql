DROP PROCEDURE IF EXISTS sp_query1;

DELIMITER //

CREATE PROCEDURE sp_query1(
	IN input_time VARCHAR(10), 
    OUT greeting VARCHAR(50)
    ) -- takes an input time, outputs a greeting
BEGIN
	DECLARE hour_ INT;
    DECLARE min_ INT;
    DECLARE time_ TIME;
    
    
    IF LENGTH(input_time) !=4 OR input_time NOT REGEXP  '^[0-9]{4}$' 
    THEN SET greeting = 'Invalid time format. Please use HHMM.';
    
    ELSE 
		SET hour_ = CAST(SUBSTRING(input_time, 1, 2) AS UNSIGNED);
        SET min_ = CAST(SUBSTRING(input_time, 3, 2) AS UNSIGNED);
    
		IF hour_ NOT BETWEEN 0 AND 23 OR min_ NOT BETWEEN 0 AND 59 THEN
			SET greeting = 'Invalid time format. Please use HHMM.';
		
		ELSE 
			SET time_ = STR_TO_DATE(input_time, '%H%i');
			IF time_ BETWEEN '06:00:00' AND '11:59:59'  THEN SET greeting = 'Good morning';
			ELSEIF time_ BETWEEN '12:00:00' AND '16:59:59' THEN SET greeting = 'Good afternoon';
			ELSEIF time_ BETWEEN '17:00:00' AND '23:59:59' THEN SET greeting = 'Good evening';
			ELSE SET greeting = 'My it''s late, shouldn''t you be in bed?'; 
			END IF;
		END IF;
	END IF;
END //

DELIMITER ;

CALL sp_query1('0730', @greeting);
SELECT @greeting;
        
        
        
		