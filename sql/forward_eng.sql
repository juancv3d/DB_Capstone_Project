-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` DEFAULT CHARACTER SET utf8 ;
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `little_lemon_db`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Menu` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Customer` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `phone` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Bookings` (
  `id` INT NOT NULL,
  `booking_date` DATE NULL,
  `table_number` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`order_delivery_status` (
  `id` INT NOT NULL,
  `delivery_date` DATE NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Orders` (
  `id` INT NOT NULL,
  `order_date` DATE NULL,
  `quantity` INT NULL,
  `total_cost` DECIMAL NULL,
  `menu_id` INT NULL,
  `bookings_id` INT NULL,
  `delivery_id` INT NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `menu_fkey_idx` (`menu_id` ASC) VISIBLE,
  INDEX `customer_fkey_idx` (`customer_id` ASC) VISIBLE,
  INDEX `bookings_id_idx` (`bookings_id` ASC) VISIBLE,
  INDEX `delivery_id_idx` (`delivery_id` ASC) VISIBLE,
  CONSTRAINT `menu_fkey`
    FOREIGN KEY (`menu_id`)
    REFERENCES `little_lemon_db`.`Menu` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_fkey`
    FOREIGN KEY (`customer_id`)
    REFERENCES `little_lemon_db`.`Customer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `bookings_id`
    FOREIGN KEY (`bookings_id`)
    REFERENCES `little_lemon_db`.`Bookings` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `delivery_id`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `little_lemon_db`.`order_delivery_status` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Staff` (
  `id` INT NOT NULL,
  `role` VARCHAR(255) NULL,
  `salary` VARCHAR(255) NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `little_lemon_db`.`Customer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
