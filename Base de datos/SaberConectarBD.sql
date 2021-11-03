-- MySQL Script generated by MySQL Workbench
-- Mon Nov  1 18:06:53 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Saber_Conectar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Saber_Conectar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Saber_Conectar` DEFAULT CHARACTER SET utf8 ;
USE `Saber_Conectar` ;

-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Instituciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Instituciones` (
  `idInstituciones` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `CUIT` INT NOT NULL,
  PRIMARY KEY (`idInstituciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Provincias` (
  `idProvincias` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProvincias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Nivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Nivel` (
  `idNivel` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNivel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Tipo_Dni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Tipo_Dni` (
  `idTipo_Dni` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Alumnos` (
  `idAlumno` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Dni` INT NOT NULL,
  `Num_Dni` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  `Provincia` INT NOT NULL,
  `Fecha_Nacimiento` DATE NOT NULL,
  `Nivel_Educativo` INT NOT NULL,
  `Correo_Electronico` VARCHAR(45) NOT NULL,
  `idUsuario` INT NOT NULL,
  INDEX `idUsuario_idx` (`idUsuario` ASC) INVISIBLE,
  INDEX `Provincia_idx` (`Provincia` ASC) VISIBLE,
  INDEX `Nivel_Educativo_idx` (`Nivel_Educativo` ASC) VISIBLE,
  INDEX `Tipo_Dni_idx` (`Tipo_Dni` ASC) VISIBLE,
  PRIMARY KEY (`idAlumno`),
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Saber_Conectar`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Provincia`
    FOREIGN KEY (`Provincia`)
    REFERENCES `Saber_Conectar`.`Provincias` (`idProvincias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Nivel_Educativo`
    FOREIGN KEY (`Nivel_Educativo`)
    REFERENCES `Saber_Conectar`.`Nivel` (`idNivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Tipo_Dni`
    FOREIGN KEY (`Tipo_Dni`)
    REFERENCES `Saber_Conectar`.`Tipo_Dni` (`idTipo_Dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Ciudades` (
  `idCiudades` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCiudades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Carreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Carreras` (
  `idCarreras` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCarreras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Loguin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Loguin` (
  `idLoguin` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Hora` DATE NULL,
  `idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idLoguin`),
  INDEX `idUsuarios_idx` (`idUsuarios` ASC) VISIBLE,
  CONSTRAINT `idUsuarios`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `Saber_Conectar`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Inscripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Inscripcion` (
  `idInscripcion` INT NOT NULL AUTO_INCREMENT,
  `Nivel` INT NOT NULL,
  `Carrera` INT NOT NULL,
  `Año_Ingreso` VARCHAR(45) NOT NULL,
  `idAlumno` INT NOT NULL,
  PRIMARY KEY (`idInscripcion`, `idAlumno`),
  INDEX `id_nivel_idx` (`Nivel` ASC) VISIBLE,
  INDEX `id_Carrera_idx` (`Carrera` ASC) VISIBLE,
  CONSTRAINT `Nivel_`
    FOREIGN KEY (`Nivel`)
    REFERENCES `Saber_Conectar`.`Nivel` (`idNivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Carrera`
    FOREIGN KEY (`Carrera`)
    REFERENCES `Saber_Conectar`.`Carreras` (`idCarreras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Nivel_Institucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Nivel_Institucion` (
  `idNivel_Institucion` INT NOT NULL,
  `idNivel` INT NOT NULL,
  `id_Institucion` INT NOT NULL,
  PRIMARY KEY (`idNivel_Institucion`, `idNivel`, `id_Institucion`),
  INDEX `idInstituciones_idx` (`id_Institucion` ASC) VISIBLE,
  CONSTRAINT `id_Nivel`
    FOREIGN KEY (`idNivel`)
    REFERENCES `Saber_Conectar`.`Nivel` (`idNivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idInstituciones`
    FOREIGN KEY (`id_Institucion`)
    REFERENCES `Saber_Conectar`.`Instituciones` (`idInstituciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Carrera_Institucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Carrera_Institucion` (
  `idCarrera_Institucion` INT NOT NULL AUTO_INCREMENT,
  `idCarrera` INT NOT NULL,
  PRIMARY KEY (`idCarrera_Institucion`, `idCarrera`),
  INDEX `idCarrera_idx` (`idCarrera` ASC) VISIBLE,
  CONSTRAINT `idCarrera`
    FOREIGN KEY (`idCarrera`)
    REFERENCES `Saber_Conectar`.`Carreras` (`idCarreras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saber_Conectar`.`Carreras_Nivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saber_Conectar`.`Carreras_Nivel` (
  `idCarreras_Nivel` INT NOT NULL AUTO_INCREMENT,
  `idCarrera` INT NOT NULL,
  `idNivel` INT NOT NULL,
  PRIMARY KEY (`idCarreras_Nivel`),
  INDEX `id_Carrera_idx` (`idCarrera` ASC) VISIBLE,
  INDEX `Nivel_idx` (`idNivel` ASC) VISIBLE,
  CONSTRAINT `id_Carrera`
    FOREIGN KEY (`idCarrera`)
    REFERENCES `Saber_Conectar`.`Carreras` (`idCarreras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idNivel`
    FOREIGN KEY (`idNivel`)
    REFERENCES `Saber_Conectar`.`Nivel` (`idNivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
