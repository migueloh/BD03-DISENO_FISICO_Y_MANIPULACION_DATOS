-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PERSONA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PERSONA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PERSONA` (
  `idPERSONA` INT NOT NULL,
  `dni` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `telfContacto` VARCHAR(45) NULL,
  PRIMARY KEY (`idPERSONA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EMPRESA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EMPRESA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EMPRESA` (
  `idEMPRESA` INT NOT NULL,
  `nif` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `razonSocial` VARCHAR(45) NULL,
  `cnae` VARCHAR(45) NULL,
  `PERSONA_idPERSONA` INT NOT NULL,
  PRIMARY KEY (`idEMPRESA`, `PERSONA_idPERSONA`),
  INDEX `fk_EMPRESA_PERSONA1_idx` (`PERSONA_idPERSONA` ASC),
  CONSTRAINT `fk_EMPRESA_PERSONA1`
    FOREIGN KEY (`PERSONA_idPERSONA`)
    REFERENCES `mydb`.`PERSONA` (`idPERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ACONTECIMIENTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ACONTECIMIENTO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ACONTECIMIENTO` (
  `idACONTECIMIENTO` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `lugarDesarrollo` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `horaFin` DATETIME NULL,
  `horaInicio` DATETIME NULL,
  PRIMARY KEY (`idACONTECIMIENTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ASISTENTES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ASISTENTES` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ASISTENTES` (
  `ACONTECIMIENTO_idACONTECIMIENTO` INT NOT NULL,
  `PERSONA_idPERSONA` INT NOT NULL,
  PRIMARY KEY (`ACONTECIMIENTO_idACONTECIMIENTO`, `PERSONA_idPERSONA`),
  INDEX `fk_ACONTECIMIENTO_has_PERSONA_PERSONA1_idx` (`PERSONA_idPERSONA` ASC),
  INDEX `fk_ACONTECIMIENTO_has_PERSONA_ACONTECIMIENTO1_idx` (`ACONTECIMIENTO_idACONTECIMIENTO` ASC),
  CONSTRAINT `fk_ACONTECIMIENTO_has_PERSONA_ACONTECIMIENTO1`
    FOREIGN KEY (`ACONTECIMIENTO_idACONTECIMIENTO`)
    REFERENCES `mydb`.`ACONTECIMIENTO` (`idACONTECIMIENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ACONTECIMIENTO_has_PERSONA_PERSONA1`
    FOREIGN KEY (`PERSONA_idPERSONA`)
    REFERENCES `mydb`.`PERSONA` (`idPERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
