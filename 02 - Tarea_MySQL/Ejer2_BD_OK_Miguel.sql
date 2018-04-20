-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Gabinete
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Gabinete` ;

-- -----------------------------------------------------
-- Schema Gabinete
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Gabinete` DEFAULT CHARACTER SET utf8 ;
USE `Gabinete` ;

-- -----------------------------------------------------
-- Table `Gabinete`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Gabinete`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `Gabinete`.`Cliente` (
  `idCliente` INT NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `nombreCalle` VARCHAR(45) NOT NULL,
  `numeroCalle` VARCHAR(45) NOT NULL,
  `numeroPiso` VARCHAR(45) NOT NULL,
  `puerta` VARCHAR(45) NOT NULL,
  `codPostal` VARCHAR(45) NOT NULL,
  `poblacion` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `telfContacto` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gabinete`.`Juicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Gabinete`.`Juicio` ;

CREATE TABLE IF NOT EXISTS `Gabinete`.`Juicio` (
  `idJuicio` INT NOT NULL,
  `numeroExpediente` VARCHAR(45) NOT NULL,
  `Juiciocol` VARCHAR(45) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NULL,
  `estadoJuicio` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idJuicio`, `Cliente_idCliente`),
  INDEX `fk_Juicio_Cliente_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Juicio_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Gabinete`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gabinete`.`Abogado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Gabinete`.`Abogado` ;

CREATE TABLE IF NOT EXISTS `Gabinete`.`Abogado` (
  `idAbogado` INT NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `nombreCalle` VARCHAR(45) NOT NULL,
  `numeroCalle` VARCHAR(45) NOT NULL,
  `numeroPiso` VARCHAR(45) NOT NULL,
  `puerta` VARCHAR(45) NOT NULL,
  `codPostal` VARCHAR(45) NOT NULL,
  `poblacion` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAbogado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gabinete`.`AbogadoLlevaCaso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Gabinete`.`AbogadoLlevaCaso` ;

CREATE TABLE IF NOT EXISTS `Gabinete`.`AbogadoLlevaCaso` (
  `Juicio_idJuicio` INT NOT NULL,
  `Juicio_Cliente_idCliente` INT NOT NULL,
  `Abogado_idAbogado` INT NOT NULL,
  PRIMARY KEY (`Juicio_idJuicio`, `Juicio_Cliente_idCliente`, `Abogado_idAbogado`),
  INDEX `fk_Juicio_has_Abogado_Abogado1_idx` (`Abogado_idAbogado` ASC),
  INDEX `fk_Juicio_has_Abogado_Juicio1_idx` (`Juicio_idJuicio` ASC, `Juicio_Cliente_idCliente` ASC),
  CONSTRAINT `fk_Juicio_has_Abogado_Juicio1`
    FOREIGN KEY (`Juicio_idJuicio` , `Juicio_Cliente_idCliente`)
    REFERENCES `Gabinete`.`Juicio` (`idJuicio` , `Cliente_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Juicio_has_Abogado_Abogado1`
    FOREIGN KEY (`Abogado_idAbogado`)
    REFERENCES `Gabinete`.`Abogado` (`idAbogado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
