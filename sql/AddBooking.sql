DELIMITER //
CREATE PROCEDURE `little_lemon_db`.`AddBooking`(IN input_id INT, IN customer_id INT, IN input_date DATE, IN table_no INT)
BEGIN
    INSERT INTO `little_lemon_db`.`Bookings` (id, customer_id, booking_date, table_number) 
    VALUES (input_id, customer_id, input_date, table_no);
    SELECT 'Booking has been added successfully.' AS Booking_Status;
END //
DELIMITER ;
