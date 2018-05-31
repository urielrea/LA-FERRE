SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `baseferreteria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `baseferreteria` ;

-- -----------------------------------------------------
-- Table `baseferreteria`.`trabajo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `baseferreteria`.`trabajo` (
  `idtrabajo` INT NOT NULL AUTO_INCREMENT ,
  `contacto` VARCHAR(8) NOT NULL ,
  `cant_empleados` VARCHAR(2) NOT NULL ,
  `descripcion` VARCHAR(255) NULL ,
  `caracteristicas` VARCHAR(512) NULL ,
  `precio_diario` DECIMAL(7,2) NOT NULL ,
  `estado` VARCHAR(15) NOT NULL ,
  `tipo_trabajo` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`idtrabajo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseferreteria`.`persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `baseferreteria`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(20) NOT NULL ,
  `apaterno` VARCHAR(20) NOT NULL ,
  `amaterno` VARCHAR(20) NOT NULL ,
  `tipo_documento` VARCHAR(15) NOT NULL ,
  `num_documento` VARCHAR(8) NOT NULL ,
  `direccion` VARCHAR(100) NULL ,
  `telefono` VARCHAR(8) NULL ,
  `email` VARCHAR(25) NULL ,
  PRIMARY KEY (`idpersona`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseferreteria`.`cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `baseferreteria`.`cliente` (
  `idpersona` INT NOT NULL ,
  `codigo_cliente` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`idpersona`) ,
  UNIQUE INDEX `codigo_cliente_UNIQUE` (`codigo_cliente` ASC) ,
  CONSTRAINT `fk_persona_cliente`
    FOREIGN KEY (`idpersona` )
    REFERENCES `baseferreteria`.`persona` (`idpersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseferreteria`.`trabajador`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `baseferreteria`.`trabajador` (
  `idpersona` INT NOT NULL ,
  `sueldo` DECIMAL(7,2) NOT NULL ,
  `acceso` VARCHAR(15) NOT NULL ,
  `login` VARCHAR(15) NOT NULL ,
  `password` VARCHAR(20) NOT NULL ,
  `estado` VARCHAR(1) NOT NULL ,
  PRIMARY KEY (`idpersona`) ,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) ,
  CONSTRAINT `fk_persona_trabajador`
    FOREIGN KEY (`idpersona` )
    REFERENCES `baseferreteria`.`persona` (`idpersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseferreteria`.`producto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `baseferreteria`.`producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(255) NULL ,
  `unidad_medida` VARCHAR(20) NOT NULL ,
  `precio_venta` DECIMAL(7,2) NOT NULL ,
  PRIMARY KEY (`idproducto`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseferreteria`.`reserva`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `baseferreteria`.`reserva` (
  `idreserva` INT NOT NULL AUTO_INCREMENT ,
  `idtrabajo` INT NOT NULL ,
  `idcliente` INT NOT NULL ,
  `idtrabajador` INT NOT NULL ,
  `tipo_reserva` VARCHAR(20) NOT NULL ,
  `fecha_reserva` DATE NOT NULL ,
  `fecha_ingresa` DATE NOT NULL ,
  `fecha_salida` DATE NOT NULL ,
  `costo_reserva` DECIMAL(7,2) NOT NULL ,
  `estado` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`idreserva`) ,
  INDEX `fk_reserva_habitacion_idx` (`idtrabajo` ASC) ,
  INDEX `fk_reserva_cliente_idx` (`idcliente` ASC) ,
  INDEX `fk_reserva_trabajador_idx` (`idtrabajador` ASC) ,
  CONSTRAINT `fk_reserva_trabajo`
    FOREIGN KEY (`idtrabajo` )
    REFERENCES `baseferreteria`.`trabajo` (`idtrabajo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_cliente`
    FOREIGN KEY (`idcliente` )
    REFERENCES `baseferreteria`.`cliente` (`idpersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_trabajador`
    FOREIGN KEY (`idtrabajador` )
    REFERENCES `baseferreteria`.`trabajador` (`idpersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseferreteria`.`consumo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `baseferreteria`.`consumo` (
  `idconsumo` INT NOT NULL AUTO_INCREMENT ,
  `idreserva` INT NOT NULL ,
  `idproducto` INT NOT NULL ,
  `cantidad` DECIMAL(7,2) NOT NULL ,
  `precio_venta` DECIMAL(7,2) NOT NULL ,
  `estado` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`idconsumo`) ,
  INDEX `fk_consumo_producto_idx` (`idproducto` ASC) ,
  INDEX `fk_consumo_reserva_idx` (`idreserva` ASC) ,
  CONSTRAINT `fk_consumo_producto`
    FOREIGN KEY (`idproducto` )
    REFERENCES `baseferreteria`.`producto` (`idproducto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consumo_reserva`
    FOREIGN KEY (`idreserva` )
    REFERENCES `baseferreteria`.`reserva` (`idreserva` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseferreteria`.`pago`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `baseferreteria`.`pago` (
  `idpago` INT NOT NULL AUTO_INCREMENT ,
  `idreserva` INT NOT NULL ,
  `tipo_comprobante` VARCHAR(20) NOT NULL ,
  `num_comprobante` VARCHAR(20) NOT NULL ,
  `igv` DECIMAL(4,2) NOT NULL ,
  `total_pago` DECIMAL(7,2) NOT NULL ,
  `fecha_emision` DATE NOT NULL ,
  `fecha_pago` DATE NOT NULL ,
  PRIMARY KEY (`idpago`) ,
  INDEX `fk_pago_reserva_idx` (`idreserva` ASC) ,
  CONSTRAINT `fk_pago_reserva`
    FOREIGN KEY (`idreserva` )
    REFERENCES `baseferreteria`.`reserva` (`idreserva` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `baseferreteria` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
