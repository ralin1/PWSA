-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ProjektFC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProjektFC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjektFC` DEFAULT CHARACTER SET utf8 ;
USE `ProjektFC` ;

-- -----------------------------------------------------
-- Table `ProjektFC`.`Użytkownik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjektFC`.`Użytkownik` (
  `idUżytkownik` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `haslo` VARCHAR(32) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `miasto` VARCHAR(255) NULL,
  `rodzajUz` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUżytkownik`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjektFC`.`Obszar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjektFC`.`Obszar` (
  `idObszar` INT NOT NULL AUTO_INCREMENT,
  `odleglosc` FLOAT NOT NULL,
  `dlugoscPromieniu` FLOAT NOT NULL,
  `dlugosc` FLOAT NOT NULL,
  `szerokosc` FLOAT NOT NULL,
  `wysokosc` FLOAT NOT NULL,
  PRIMARY KEY (`idObszar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjektFC`.`Lokalizacja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjektFC`.`Lokalizacja` (
  `idLokalizacja` INT NOT NULL AUTO_INCREMENT,
  `dlugosc` FLOAT NOT NULL,
  `szerokosc` FLOAT NOT NULL,
  `wysokosc` FLOAT NOT NULL,
  `Obszar_idObszar` INT NOT NULL,
  PRIMARY KEY (`idLokalizacja`),
  INDEX `fk_Lokalizacja_Obszar1_idx` (`Obszar_idObszar` ASC),
  CONSTRAINT `fk_Lokalizacja_Obszar1`
    FOREIGN KEY (`Obszar_idObszar`)
    REFERENCES `ProjektFC`.`Obszar` (`idObszar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjektFC`.`Pomiar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjektFC`.`Pomiar` (
  `idPomiar` INT NOT NULL AUTO_INCREMENT,
  `glosnosc` FLOAT NOT NULL,
  `data` DATETIME NOT NULL,
  `Użytkownik_idUżytkownik` INT NOT NULL,
  `Lokalizacja_idLokalizacja` INT NOT NULL,
  PRIMARY KEY (`idPomiar`),
  INDEX `fk_Pomiar_Użytkownik_idx` (`Użytkownik_idUżytkownik` ASC),
  INDEX `fk_Pomiar_Lokalizacja1_idx` (`Lokalizacja_idLokalizacja` ASC),
  CONSTRAINT `fk_Pomiar_Użytkownik`
    FOREIGN KEY (`Użytkownik_idUżytkownik`)
    REFERENCES `ProjektFC`.`Użytkownik` (`idUżytkownik`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pomiar_Lokalizacja1`
    FOREIGN KEY (`Lokalizacja_idLokalizacja`)
    REFERENCES `ProjektFC`.`Lokalizacja` (`idLokalizacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjektFC`.`Urzadzenia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjektFC`.`Urzadzenia` (
  `idUrzadzenia` INT NOT NULL AUTO_INCREMENT,
  `producent` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `Użytkownik_idUżytkownik` INT NOT NULL,
  PRIMARY KEY (`idUrzadzenia`),
  INDEX `fk_Urzadzenia_Użytkownik1_idx` (`Użytkownik_idUżytkownik` ASC),
  CONSTRAINT `fk_Urzadzenia_Użytkownik1`
    FOREIGN KEY (`Użytkownik_idUżytkownik`)
    REFERENCES `ProjektFC`.`Użytkownik` (`idUżytkownik`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
