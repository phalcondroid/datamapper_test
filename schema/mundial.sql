-- MySQL Script generated by MySQL Workbench
-- Fri Mar 31 09:20:37 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mundial
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mundial
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mundial` DEFAULT CHARACTER SET utf8 ;
USE `mundial` ;

-- -----------------------------------------------------
-- Table `mundial`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mundial`.`pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mundial`.`equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mundial`.`equipo` (
  `id_equipo` INT NOT NULL AUTO_INCREMENT,
  `id_pais` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_equipo`),
  INDEX `fk_equipo_pais1_idx` (`id_pais` ASC),
  CONSTRAINT `fk_equipo_pais1`
    FOREIGN KEY (`id_pais`)
    REFERENCES `mundial`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mundial`.`arbitro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mundial`.`arbitro` (
  `id_arbitro` INT NOT NULL AUTO_INCREMENT,
  `id_pais` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_arbitro`),
  INDEX `fk_arbitro_pais1_idx` (`id_pais` ASC),
  CONSTRAINT `fk_arbitro_pais1`
    FOREIGN KEY (`id_pais`)
    REFERENCES `mundial`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mundial`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mundial`.`estado` (
  `idestado` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mundial`.`partido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mundial`.`partido` (
  `id_partido` INT NOT NULL AUTO_INCREMENT,
  `id_estado` INT NOT NULL COMMENT 'select e1.nombre from partido \np inner join estado e\n\nwhere e.id_estado = 1\n\n\n1 = sin jugar\n2 = jugado\n3 = aplazado',
  `id_equipo1` INT NOT NULL,
  `id_equipo2` INT NOT NULL,
  `id_arbitro` INT NOT NULL,
  `resultado` VARCHAR(45) NULL,
  PRIMARY KEY (`id_partido`),
  INDEX `fk_partido_equipo_idx` (`id_equipo1` ASC),
  INDEX `fk_partido_equipo1_idx` (`id_equipo2` ASC),
  INDEX `fk_partido_arbitro1_idx` (`id_arbitro` ASC),
  INDEX `fk_partido_estado1_idx` (`id_estado` ASC),
  CONSTRAINT `fk_partido_equipo`
    FOREIGN KEY (`id_equipo1`)
    REFERENCES `mundial`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_equipo1`
    FOREIGN KEY (`id_equipo2`)
    REFERENCES `mundial`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_arbitro1`
    FOREIGN KEY (`id_arbitro`)
    REFERENCES `mundial`.`arbitro` (`id_arbitro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mundial`.`estado` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mundial`.`calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mundial`.`calendario` (
  `id_calendario` INT NOT NULL AUTO_INCREMENT,
  `id_partido` INT NOT NULL,
  `fecha` DATE NULL,
  `hora` TIME NULL,
  PRIMARY KEY (`id_calendario`),
  INDEX `fk_calendario_partido1_idx` (`id_partido` ASC),
  CONSTRAINT `fk_calendario_partido1`
    FOREIGN KEY (`id_partido`)
    REFERENCES `mundial`.`partido` (`id_partido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
