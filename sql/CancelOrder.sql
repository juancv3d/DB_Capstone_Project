DELIMITER //
CREATE PROCEDURE `little_lemon_db`.`CancelOrder`(IN orderId INT)
BEGIN
    DELETE FROM `little_lemon_db`.`Orders` WHERE id = orderId;
END //
DELIMITER ;
