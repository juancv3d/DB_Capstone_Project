DELIMITER //
CREATE PROCEDURE `little_lemon_db`.`CancelBooking`(IN input_id INT)
BEGIN
    DELETE FROM `little_lemon_db`.`Bookings`
    WHERE `id` = input_id;
    SELECT 'Booking has been cancelled successfully.' AS Cancel_Status;
END //
DELIMITER ;
