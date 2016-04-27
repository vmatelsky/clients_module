SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema MyBankDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `MyBankDB` ;

-- -----------------------------------------------------
-- Schema MyBankDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MyBankDB` DEFAULT CHARACTER SET utf8 ;
USE `MyBankDB` ;

-- -----------------------------------------------------
-- Table `MyBankDB`.`cities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MyBankDB`.`cities` ;

CREATE TABLE IF NOT EXISTS `MyBankDB`.`cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyBankDB`.`martial_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MyBankDB`.`martial_status` ;

CREATE TABLE IF NOT EXISTS `MyBankDB`.`martial_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyBankDB`.`nationality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MyBankDB`.`nationality` ;

CREATE TABLE IF NOT EXISTS `MyBankDB`.`nationality` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyBankDB`.`disability`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MyBankDB`.`disability` ;

CREATE TABLE IF NOT EXISTS `MyBankDB`.`disability` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyBankDB`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MyBankDB`.`clients` ;

CREATE TABLE IF NOT EXISTS `MyBankDB`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NOT NULL,
  `birthday_date` DATE NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `passport_series` VARCHAR(45) NOT NULL,
  `passport_number` VARCHAR(45) NOT NULL,
  `passport_authority` VARCHAR(45) NOT NULL,
  `passport_issue_date` DATE NOT NULL,
  `passport_identification_number` VARCHAR(45) NOT NULL,
  `birthday_place` VARCHAR(45) NOT NULL,
  `actual_residential_city_id` INT NOT NULL,
  `actual_address` VARCHAR(45) NOT NULL,
  `home_phone_number` VARCHAR(45) NULL,
  `cellular_phone_number` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `place_of_work` VARCHAR(45) NULL,
  `job_title` VARCHAR(45) NULL,
  `resirential_city_id` INT NOT NULL,
  `residential_address` VARCHAR(45) NOT NULL,
  `martial_status_id` INT NOT NULL,
  `nationality_id` INT NOT NULL,
  `disability_id` INT NOT NULL,
  `is_retired` TINYINT(1) NOT NULL,
  `monthly_income` DECIMAL(5) NULL,
  `is_reservist` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clients_cities_idx` (`resirential_city_id` ASC),
  INDEX `fk_clients_cities1_idx` (`actual_residential_city_id` ASC),
  INDEX `fk_clients_martial_status1_idx` (`martial_status_id` ASC),
  INDEX `fk_clients_nationality1_idx` (`nationality_id` ASC),
  INDEX `fk_clients_disability1_idx` (`disability_id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `MyBankDB`.`cities`
-- -----------------------------------------------------
START TRANSACTION;
USE `MyBankDB`;
INSERT INTO `MyBankDB`.`cities` (`id`, `name`) VALUES (DEFAULT, 'Minsk');
INSERT INTO `MyBankDB`.`cities` (`id`, `name`) VALUES (DEFAULT, 'Homel');
INSERT INTO `MyBankDB`.`cities` (`id`, `name`) VALUES (DEFAULT, 'Hrodno');
INSERT INTO `MyBankDB`.`cities` (`id`, `name`) VALUES (DEFAULT, 'Brest');
INSERT INTO `MyBankDB`.`cities` (`id`, `name`) VALUES (DEFAULT, 'Vitebsk');

COMMIT;


-- -----------------------------------------------------
-- Data for table `MyBankDB`.`martial_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `MyBankDB`;
INSERT INTO `MyBankDB`.`martial_status` (`id`, `name`) VALUES (DEFAULT, 'single');
INSERT INTO `MyBankDB`.`martial_status` (`id`, `name`) VALUES (DEFAULT, 'married');
INSERT INTO `MyBankDB`.`martial_status` (`id`, `name`) VALUES (DEFAULT, 'separated');
INSERT INTO `MyBankDB`.`martial_status` (`id`, `name`) VALUES (DEFAULT, 'divorced');
INSERT INTO `MyBankDB`.`martial_status` (`id`, `name`) VALUES (DEFAULT, 'widowed');

COMMIT;


-- -----------------------------------------------------
-- Data for table `MyBankDB`.`nationality`
-- -----------------------------------------------------
START TRANSACTION;
USE `MyBankDB`;
INSERT INTO `MyBankDB`.`nationality` (`id`, `name`) VALUES (DEFAULT, 'Belarusian');
INSERT INTO `MyBankDB`.`nationality` (`id`, `name`) VALUES (DEFAULT, 'Belgian');
INSERT INTO `MyBankDB`.`nationality` (`id`, `name`) VALUES (DEFAULT, 'Briton');
INSERT INTO `MyBankDB`.`nationality` (`id`, `name`) VALUES (DEFAULT, 'Bulgarian');
INSERT INTO `MyBankDB`.`nationality` (`id`, `name`) VALUES (DEFAULT, 'Egyptian');

COMMIT;


-- -----------------------------------------------------
-- Data for table `MyBankDB`.`disability`
-- -----------------------------------------------------
START TRANSACTION;
USE `MyBankDB`;
INSERT INTO `MyBankDB`.`disability` (`id`, `name`) VALUES (DEFAULT, 'Cancer');
INSERT INTO `MyBankDB`.`disability` (`id`, `name`) VALUES (DEFAULT, 'Chronic Fatigue Syndrome');
INSERT INTO `MyBankDB`.`disability` (`id`, `name`) VALUES (DEFAULT, 'Epilepsy/Seizure Disorder');
INSERT INTO `MyBankDB`.`disability` (`id`, `name`) VALUES (DEFAULT, 'Fibromyalgia');
INSERT INTO `MyBankDB`.`disability` (`id`, `name`) VALUES (DEFAULT, 'Lupus Erythmatosis');

COMMIT;

