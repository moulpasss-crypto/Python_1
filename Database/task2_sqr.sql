-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `clientid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `clientcol` VARCHAR(45) NULL,
  PRIMARY KEY (`clientid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_of_pet` VARCHAR(45) NOT NULL,
  `species_of_pet` INT NULL,
  `client_clientid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_client_idx` (`client_clientid` ASC) VISIBLE,
  CONSTRAINT `fk_pet_client`
    FOREIGN KEY (`client_clientid`)
    REFERENCES `mydb`.`client` (`clientid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `room_num` INT NULL,
  `room_type` ENUM('S', 'A') NULL,
  `room_request` VARCHAR(200) NULL,
  `party_of_client` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reserve`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reserve` (
  `idreserve` INT NOT NULL,
  `request_of_reserve` VARCHAR(45) NULL,
  `pet_id` INT NOT NULL,
  `Room_id` INT NOT NULL,
  PRIMARY KEY (`idreserve`),
  INDEX `fk_reserve_pet1_idx` (`pet_id` ASC) VISIBLE,
  INDEX `fk_reserve_Room1_idx` (`Room_id` ASC) VISIBLE,
  CONSTRAINT `fk_reserve_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `mydb`.`pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserve_Room1`
    FOREIGN KEY (`Room_id`)
    REFERENCES `mydb`.`Room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Service` (
  `idService` INT NOT NULL,
  `Room_id` INT NOT NULL,
  PRIMARY KEY (`idService`),
  INDEX `fk_Service_Room1_idx` (`Room_id` ASC) VISIBLE,
  CONSTRAINT `fk_Service_Room1`
    FOREIGN KEY (`Room_id`)
    REFERENCES `mydb`.`Room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
