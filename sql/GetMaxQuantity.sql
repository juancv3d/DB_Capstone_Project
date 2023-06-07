DELIMITER //
CREATE PROCEDURE `little_lemon_db`.`GetMaxQuantity`()
BEGIN
    SELECT MAX(quantity) AS max_quantity
    FROM `little_lemon_db`.`Orders`;
END //
DELIMITER ;
