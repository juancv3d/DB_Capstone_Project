DELIMITER //
CREATE PROCEDURE `little_lemon_db`.`AddValidBooking`(IN input_date DATE, IN table_no INT, IN customer_id INT)
BEGIN
    DECLARE booking_exists INT;

    START TRANSACTION;
    
    SELECT COUNT(*) INTO booking_exists 
    FROM `little_lemon_db`.`Bookings` 
    WHERE booking_date = input_date AND table_number = table_no;
    
    IF booking_exists > 0 THEN
        ROLLBACK;
        SELECT 'Table is already booked on this date, booking not made.' AS Booking_Status;
    ELSE
        INSERT INTO `little_lemon_db`.`Bookings` (booking_date, table_number, customer_id) 
        VALUES (input_date, table_no, customer_id);
        COMMIT;
        SELECT 'Table is available, booking made successfully.' AS Booking_Status;
    END IF;
END //
DELIMITER ;
