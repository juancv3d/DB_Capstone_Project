DELIMITER //
CREATE PROCEDURE `little_lemon_db`.`GetOrderDetail`(IN customerID INT)
BEGIN
    SELECT id, quantity, total_cost FROM `little_lemon_db`.`Orders` WHERE customer_id = customerID;
END //
DELIMITER ;
