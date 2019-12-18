-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DW_URG
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DW_URG
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DW_URG` DEFAULT CHARACTER SET utf8 ;
USE `DW_URG` ;

-- -----------------------------------------------------
-- Table `DW_URG`.`PROVENIENCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW_URG`.`PROVENIENCIA` (
  `ID_PROVENIENCIA` INT NOT NULL AUTO_INCREMENT,
  `desc_proveniencia` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_PROVENIENCIA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW_URG`.`ESPECIALIDADE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW_URG`.`ESPECIALIDADE` (
  `ID_ESPECIALIDADE` INT NOT NULL AUTO_INCREMENT,
  `desc_especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_ESPECIALIDADE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW_URG`.`PACIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW_URG`.`PACIENTE` (
  `ID_PACIENTE` INT NOT NULL AUTO_INCREMENT,
  `sexo` VARCHAR(45) NULL,
  `data_nascimento` DATE NULL,
  PRIMARY KEY (`ID_PACIENTE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW_URG`.`CAUSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW_URG`.`CAUSA` (
  `ID_CAUSA` INT NOT NULL AUTO_INCREMENT,
  `desc_causa` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_CAUSA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW_URG`.`DATA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW_URG`.`DATA` (
  `ID_DATA` INT NOT NULL AUTO_INCREMENT,
  `ADMISSAO` DATETIME NULL,
  `ALTA` DATETIME NULL,
  PRIMARY KEY (`ID_DATA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW_URG`.`LOCAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW_URG`.`LOCAL` (
  `ID_LOCAL` INT NOT NULL AUTO_INCREMENT,
  `desc_local` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_LOCAL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW_URG`.`FACTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW_URG`.`FACTOS` (
  `URG_EPISODIO` INT NOT NULL,
  `PROVENIENCIA_ID_PROVENIENCIA` INT NOT NULL,
  `ESPECIALIDADE_ID_ESPECIALIDADE` INT NOT NULL,
  `PACIENTE_ID_PACIENTE` INT NOT NULL,
  `CAUSA_ID_CAUSA` INT NOT NULL,
  `DATA_ID_DATA` INT NOT NULL,
  `LOCAL_ID_LOCAL` INT NOT NULL,
  PRIMARY KEY (`URG_EPISODIO`),
  INDEX `fk_FACTOS_PROVENIENCIA_idx` (`PROVENIENCIA_ID_PROVENIENCIA` ASC) VISIBLE,
  INDEX `fk_FACTOS_ESPECIALIDADE1_idx` (`ESPECIALIDADE_ID_ESPECIALIDADE` ASC) VISIBLE,
  INDEX `fk_FACTOS_PACIENTE1_idx` (`PACIENTE_ID_PACIENTE` ASC) VISIBLE,
  INDEX `fk_FACTOS_CAUSA1_idx` (`CAUSA_ID_CAUSA` ASC) VISIBLE,
  INDEX `fk_FACTOS_DATA1_idx` (`DATA_ID_DATA` ASC) VISIBLE,
  INDEX `fk_FACTOS_local1_idx` (`LOCAL_ID_LOCAL` ASC) VISIBLE,
  CONSTRAINT `fk_FACTOS_PROVENIENCIA`
    FOREIGN KEY (`PROVENIENCIA_ID_PROVENIENCIA`)
    REFERENCES `DW_URG`.`PROVENIENCIA` (`ID_PROVENIENCIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FACTOS_ESPECIALIDADE1`
    FOREIGN KEY (`ESPECIALIDADE_ID_ESPECIALIDADE`)
    REFERENCES `DW_URG`.`ESPECIALIDADE` (`ID_ESPECIALIDADE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FACTOS_PACIENTE1`
    FOREIGN KEY (`PACIENTE_ID_PACIENTE`)
    REFERENCES `DW_URG`.`PACIENTE` (`ID_PACIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FACTOS_CAUSA1`
    FOREIGN KEY (`CAUSA_ID_CAUSA`)
    REFERENCES `DW_URG`.`CAUSA` (`ID_CAUSA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FACTOS_DATA1`
    FOREIGN KEY (`DATA_ID_DATA`)
    REFERENCES `DW_URG`.`DATA` (`ID_DATA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FACTOS_local1`
    FOREIGN KEY (`LOCAL_ID_LOCAL`)
    REFERENCES `DW_URG`.`LOCAL` (`ID_LOCAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
