-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema flight_ticket_booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema flight_ticket_booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flight_ticket_booking` DEFAULT CHARACTER SET utf8 ;
USE `flight_ticket_booking` ;

-- -----------------------------------------------------
-- Table `flight_ticket_booking`.`Passenger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_ticket_booking`.`Passenger` (
  `passenger_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`passenger_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_ticket_booking`.`airports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_ticket_booking`.`airports` (
  `IATA_code` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IATA_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_ticket_booking`.`airlines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_ticket_booking`.`airlines` (
  `airlines_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`airlines_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_ticket_booking`.`Flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_ticket_booking`.`Flights` (
  `number` INT NOT NULL,
  `departure` DATETIME NOT NULL,
  `arrival` DATETIME NOT NULL,
  `duration_in_minutes` INT NOT NULL,
  `distance_in_miles` INT NOT NULL,
  `departure_airport_id` INT NOT NULL,
  `arrival_airport_id` INT NOT NULL,
  `IATA_code` INT NOT NULL,
  `airlines_id` INT NOT NULL,
  PRIMARY KEY (`number`),
  INDEX `fk_Flights_airports1_idx` (`IATA_code` ASC) VISIBLE,
  INDEX `fk_Flights_airlines1_idx` (`airlines_id` ASC) VISIBLE,
  CONSTRAINT `fk_Flights_airports1`
    FOREIGN KEY (`IATA_code`)
    REFERENCES `flight_ticket_booking`.`airports` (`IATA_code`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Flights_airlines1`
    FOREIGN KEY (`airlines_id`)
    REFERENCES `flight_ticket_booking`.`airlines` (`airlines_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_ticket_booking`.`flight_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_ticket_booking`.`flight_classes` (
  `flight_class_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`flight_class_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_ticket_booking`.`Tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_ticket_booking`.`Tickets` (
  `number` INT NOT NULL,
  `price` DECIMAL(9,2) NOT NULL,
  `confirmation_number` VARCHAR(45) NOT NULL,
  `passenger_id` INT NOT NULL,
  `Flights_number` INT NOT NULL,
  `flight_class_id` INT NOT NULL,
  PRIMARY KEY (`number`),
  INDEX `fk_Tickets_Passenger_idx` (`passenger_id` ASC) VISIBLE,
  INDEX `fk_Tickets_Flights1_idx` (`Flights_number` ASC) VISIBLE,
  INDEX `fk_Tickets_flight_classes1_idx` (`flight_class_id` ASC) VISIBLE,
  CONSTRAINT `fk_Tickets_Passenger`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `flight_ticket_booking`.`Passenger` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tickets_Flights1`
    FOREIGN KEY (`Flights_number`)
    REFERENCES `flight_ticket_booking`.`Flights` (`number`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tickets_flight_classes1`
    FOREIGN KEY (`flight_class_id`)
    REFERENCES `flight_ticket_booking`.`flight_classes` (`flight_class_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '	';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
