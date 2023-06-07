DELIMITER //
CREATE PROCEDURE `little_lemon_db`.`CheckBooking`(IN input_date DATE, IN table_no INT)
BEGIN
    DECLARE booking_exists INT;

    SELECT COUNT(*) INTO booking_exists 
    FROM `little_lemon_db`.`Bookings` 
    WHERE booking_date = input_date AND table_number = table_no;
    
    IF booking_exists > 0 THEN
        SELECT 'Table is already booked on this date' AS Booking_Status;
    ELSE
        SELECT 'Table is available on this date' AS Booking_Status;
    END IF;
END //
DELIMITER ;
