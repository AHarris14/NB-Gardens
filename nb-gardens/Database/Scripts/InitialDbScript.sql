-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema nbgardens
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nbgardens
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nbgardens` DEFAULT CHARACTER SET utf8 ;
USE `nbgardens` ;

-- -----------------------------------------------------
-- Table `nbgardens`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`address` (
  `addressLine1` VARCHAR(50) NOT NULL COMMENT '',
  `addressLine2` VARCHAR(45) NOT NULL COMMENT '',
  `addressLine3` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `postCode` VARCHAR(9) NOT NULL COMMENT '',
  `country` VARCHAR(45) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateModified` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`addressLine1`, `postCode`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`customer` (
  `customerID` INT(11) NOT NULL COMMENT '',
  `firstName` VARCHAR(30) NOT NULL COMMENT '',
  `lastName` VARCHAR(45) NOT NULL COMMENT '',
  `DoB` DATE NOT NULL COMMENT '',
  `eMail` VARCHAR(60) NULL DEFAULT NULL COMMENT '',
  `credit` DECIMAL(7,2) NOT NULL COMMENT '',
  `status` INT(11) NOT NULL COMMENT '',
  `phoneNumber` VARCHAR(25) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateModified` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`customerID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`customerstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`customerstatus` (
  `statusId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `status` VARCHAR(20) NOT NULL COMMENT '',
  PRIMARY KEY (`statusId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`orderevent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`orderevent` (
  `orderEventID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `eventName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateMod` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`orderEventID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`orderline` (
  `lineNo` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`lineNo`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`paymentdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`paymentdetails` (
  `cardNumber` VARCHAR(16) NOT NULL COMMENT '',
  `cardHolderName` VARCHAR(65) NOT NULL COMMENT '',
  `cardType` VARCHAR(20) NOT NULL COMMENT '',
  `expirationDate` DATE NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateModified` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`cardNumber`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`product` (
  `productID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `productName` VARCHAR(45) NOT NULL COMMENT '',
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateMod` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`productID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`purchaseorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`purchaseorder` (
  `orderID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateArrived` DATE NULL DEFAULT NULL COMMENT '',
  `baseCost` DECIMAL(10,0) NOT NULL COMMENT '',
  `vATCost` DECIMAL(10,0) NOT NULL COMMENT '',
  `totalCost` DECIMAL(10,0) NOT NULL COMMENT '',
  `status` VARCHAR(45) NOT NULL COMMENT '',
  `deliveryCost` DECIMAL(10,0) NOT NULL COMMENT '',
  PRIMARY KEY (`orderID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`returns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`returns` (
  `returnID` INT(11) NOT NULL COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `returnDate` DATE NULL DEFAULT NULL COMMENT '',
  `returnReason` VARCHAR(45) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateMod` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`returnID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`salesorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`salesorder` (
  `salesOrderID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `timeCreated` VARCHAR(45) NOT NULL COMMENT '',
  `vATCost` DECIMAL(10,0) NOT NULL COMMENT '',
  `discount` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '',
  `postageCost` DECIMAL(10,0) NOT NULL COMMENT '',
  `baseCost` DECIMAL(10,0) NOT NULL COMMENT '',
  `totalCost` DECIMAL(10,0) NOT NULL COMMENT '',
  `dispatchTime` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `dispatchDate` DATE NULL DEFAULT NULL COMMENT '',
  `PackageCost` DECIMAL(5,2) NOT NULL COMMENT '',
  PRIMARY KEY (`salesOrderID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`staff` (
  `staffID` INT(11) NOT NULL COMMENT '',
  `dep` VARCHAR(20) NOT NULL COMMENT '',
  `role` VARCHAR(25) NOT NULL COMMENT '',
  `dateCreated` DATE NULL DEFAULT NULL COMMENT '',
  `dateMod` DATE NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`staffID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`stock` (
  `stockID` INT(11) NOT NULL COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`stockID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`supplier` (
  `supplierID` INT(11) NOT NULL COMMENT '',
  `supplierName` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`supplierID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`wishlist` (
  `quantity` INT(11) NOT NULL COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
