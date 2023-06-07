DELIMITER //
CREATE PROCEDURE `little_lemon_db`.`UpdateBooking`(IN input_id INT, IN input_date DATE)
BEGIN
    UPDATE `little_lemon_db`.`Bookings`
    SET `booking_date` = input_date
    WHERE `id` = input_id;
    SELECT 'Booking has been updated successfully.' AS Update_Status;
END //
DELIMITER ;
