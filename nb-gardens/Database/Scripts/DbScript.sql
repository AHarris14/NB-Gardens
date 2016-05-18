-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
  `addressId` VARCHAR(45) NOT NULL COMMENT '',
  `addressLine1` VARCHAR(50) NOT NULL COMMENT '',
  `addressLine2` VARCHAR(30) NOT NULL COMMENT '',
  `postCode` VARCHAR(10) NOT NULL COMMENT '',
  `town` VARCHAR(30) NOT NULL COMMENT '',
  `county` VARCHAR(20) NOT NULL COMMENT '',
  `country` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateModified` DATE NOT NULL COMMENT '',
  `addresscol` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`addressId`)  COMMENT '')
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
-- Table `nbgardens`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`customer` (
  `customerID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `firstName` VARCHAR(30) NOT NULL COMMENT '',
  `lastName` VARCHAR(45) NOT NULL COMMENT '',
  `DoB` DATE NOT NULL COMMENT '',
  `email` VARCHAR(60) NULL DEFAULT NULL COMMENT '',
  `credit` DECIMAL(7,2) NOT NULL COMMENT '',
  `status` INT(11) NOT NULL COMMENT '',
  `phoneNumber` VARCHAR(25) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateModified` DATE NOT NULL COMMENT '',
  `customerstatus_statusId` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`customerID`, `customerstatus_statusId`)  COMMENT '',
  INDEX `fk_customer_customerstatus1_idx` (`customerstatus_statusId` ASC)  COMMENT '',
  CONSTRAINT `fk_customer_customerstatus1`
    FOREIGN KEY (`customerstatus_statusId`)
    REFERENCES `nbgardens`.`customerstatus` (`statusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`customeraddresslink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`customeraddresslink` (
  `customer_customerID` INT(11) NOT NULL COMMENT '',
  `address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`customer_customerID`, `address_addressId`)  COMMENT '',
  INDEX `fk_CustomerAddressLink_address1_idx` (`address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_CustomerAddressLink_address1`
    FOREIGN KEY (`address_addressId`)
    REFERENCES `nbgardens`.`address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CustomerAddressLink_customer`
    FOREIGN KEY (`customer_customerID`)
    REFERENCES `nbgardens`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`event` (
  `eventId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `eventName` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`eventId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`purchaseorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`purchaseorder` (
  `salesOrderID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dispathDate` DATE NOT NULL COMMENT '',
  `baseCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `vATCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `statusId` INT(11) NOT NULL COMMENT '',
  `deliveryCost` DECIMAL(10,0) NOT NULL COMMENT '',
  `discount` DECIMAL(7,2) NULL DEFAULT NULL COMMENT '',
  `packageCost` DECIMAL(7,2) NOT NULL COMMENT '',
  PRIMARY KEY (`salesOrderID`)  COMMENT '')
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
  `IssueNumber` INT(11) NOT NULL COMMENT '',
  `PaymentID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `customer_customerID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`PaymentID`)  COMMENT '',
  INDEX `fk_paymentdetails_customer1_idx` (`customer_customerID` ASC)  COMMENT '',
  CONSTRAINT `fk_paymentdetails_customer1`
    FOREIGN KEY (`customer_customerID`)
    REFERENCES `nbgardens`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`salesorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`salesorder` (
  `salesOrderID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `vATCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `postageCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `baseCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL COMMENT '',
  `dispatchDate` DATE NOT NULL COMMENT '',
  `packageCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `discount` DECIMAL(7,2) NOT NULL COMMENT '',
  `statusId` INT(11) NOT NULL COMMENT '',
  `customer_customerID` INT(11) NOT NULL COMMENT '',
  `address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  `paymentdetails_PaymentID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`salesOrderID`, `paymentdetails_PaymentID`)  COMMENT '',
  INDEX `fk_salesorder_customer1_idx` (`customer_customerID` ASC)  COMMENT '',
  INDEX `fk_salesorder_address1_idx` (`address_addressId` ASC)  COMMENT '',
  INDEX `fk_salesorder_paymentdetails1_idx` (`paymentdetails_PaymentID` ASC)  COMMENT '',
  CONSTRAINT `fk_salesorder_address1`
    FOREIGN KEY (`address_addressId`)
    REFERENCES `nbgardens`.`address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesorder_customer1`
    FOREIGN KEY (`customer_customerID`)
    REFERENCES `nbgardens`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesorder_paymentdetails1`
    FOREIGN KEY (`paymentdetails_PaymentID`)
    REFERENCES `nbgardens`.`paymentdetails` (`PaymentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`staff` (
  `staffID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(30) NULL DEFAULT NULL COMMENT '',
  `password` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`staffID`)  COMMENT '')
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
  `StaffId` INT(11) NOT NULL COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `staff_staffID` INT(11) NOT NULL COMMENT '',
  `purchaseorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`orderEventID`, `salesorder_salesOrderID`, `staff_staffID`, `purchaseorder_salesOrderID`)  COMMENT '',
  INDEX `fk_orderevent_salesorder1_idx` (`salesorder_salesOrderID` ASC)  COMMENT '',
  INDEX `fk_orderevent_staff1_idx` (`staff_staffID` ASC)  COMMENT '',
  INDEX `fk_orderevent_purchaseorder1_idx` (`purchaseorder_salesOrderID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderevent_purchaseorder1`
    FOREIGN KEY (`purchaseorder_salesOrderID`)
    REFERENCES `nbgardens`.`purchaseorder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderevent_salesorder1`
    FOREIGN KEY (`salesorder_salesOrderID`)
    REFERENCES `nbgardens`.`salesorder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderevent_staff1`
    FOREIGN KEY (`staff_staffID`)
    REFERENCES `nbgardens`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`orderline` (
  `orderLineId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `productId` INT(11) NOT NULL COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `orderId` INT(11) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `purchaseorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`orderLineId`, `salesorder_salesOrderID`, `purchaseorder_salesOrderID`)  COMMENT '',
  INDEX `fk_orderline_salesorder1_idx` (`salesorder_salesOrderID` ASC)  COMMENT '',
  INDEX `fk_orderline_purchaseorder1_idx` (`purchaseorder_salesOrderID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderline_purchaseorder1`
    FOREIGN KEY (`purchaseorder_salesOrderID`)
    REFERENCES `nbgardens`.`purchaseorder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_salesorder1`
    FOREIGN KEY (`salesorder_salesOrderID`)
    REFERENCES `nbgardens`.`salesorder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`stockstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`stockstatus` (
  `stockStatusId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `status` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`stockStatusId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`supplier` (
  `supplierID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Added supplier index as a Unique Index\n\nSam A, 14:13 18th May',
  `supplierName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `address_addressId` VARCHAR(45) NOT NULL COMMENT 'Removed Address ID as a primary key, to stop it appearing as a foreign key in Stock table\n\nSam A, 14:13 18th May',
  PRIMARY KEY (`supplierID`)  COMMENT '',
  INDEX `fk_supplier_address1_idx` (`address_addressId` ASC)  COMMENT '',
  UNIQUE INDEX `supplierID_UNIQUE` (`supplierID` ASC)  COMMENT '',
  CONSTRAINT `fk_supplier_address1`
    FOREIGN KEY (`address_addressId`)
    REFERENCES `nbgardens`.`address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`stock` (
  `stockID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `ReorderLevel` INT(11) NOT NULL COMMENT '',
  `StockStatus_stockStatusId` INT(11) NOT NULL COMMENT '',
  `supplier_supplierID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`stockID`, `StockStatus_stockStatusId`, `supplier_supplierID`)  COMMENT '',
  INDEX `fk_stock_StockStatus1_idx` (`StockStatus_stockStatusId` ASC)  COMMENT '',
  INDEX `fk_stock_supplier1_idx` (`supplier_supplierID` ASC)  COMMENT '',
  CONSTRAINT `fk_stock_StockStatus1`
    FOREIGN KEY (`StockStatus_stockStatusId`)
    REFERENCES `nbgardens`.`stockstatus` (`stockStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_supplier1`
    FOREIGN KEY (`supplier_supplierID`)
    REFERENCES `nbgardens`.`supplier` (`supplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`product` (
  `productID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Removed invalid foreign keys without relationships\n\nSam A, 14:13 18th May',
  `productName` VARCHAR(45) NOT NULL COMMENT '',
  `description` VARCHAR(200) NULL DEFAULT NULL COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `length` DECIMAL(5,2) NOT NULL COMMENT '',
  `height` DECIMAL(5,2) NOT NULL COMMENT '',
  `width` DECIMAL(5,2) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateModified` DATE NOT NULL COMMENT '',
  `stock_stockID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`productID`, `stock_stockID`)  COMMENT '',
  INDEX `fk_product_stock1_idx` (`stock_stockID` ASC)  COMMENT '',
  CONSTRAINT `fk_product_stock1`
    FOREIGN KEY (`stock_stockID`)
    REFERENCES `nbgardens`.`stock` (`stockID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`returns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`returns` (
  `returnID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `orderLineId` INT(11) NOT NULL COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `returnDate` DATE NOT NULL COMMENT '',
  `returnReason` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `orderline_orderLineId` INT(11) NOT NULL COMMENT '',
  `orderline_salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `orderline_salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  `orderline_salesorder_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`returnID`, `orderline_orderLineId`, `orderline_salesorder_salesOrderID`, `orderline_salesorder_customer_customerID`, `orderline_salesorder_address_addressId`)  COMMENT '',
  INDEX `fk_returns_orderline1_idx` (`orderline_orderLineId` ASC, `orderline_salesorder_salesOrderID` ASC, `orderline_salesorder_customer_customerID` ASC, `orderline_salesorder_address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_returns_orderline1`
    FOREIGN KEY (`orderline_orderLineId`)
    REFERENCES `nbgardens`.`orderline` (`orderLineId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`role` (
  `roleId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `roleName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`roleId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`roleeventlink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`roleeventlink` (
  `Role_roleId` INT(11) NOT NULL COMMENT '',
  `Event_eventId` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`Role_roleId`, `Event_eventId`)  COMMENT '',
  INDEX `fk_Permission_Event1_idx` (`Event_eventId` ASC)  COMMENT '',
  CONSTRAINT `fk_Permission_Event1`
    FOREIGN KEY (`Event_eventId`)
    REFERENCES `nbgardens`.`event` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permission_Role1`
    FOREIGN KEY (`Role_roleId`)
    REFERENCES `nbgardens`.`role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`staffrolelink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`staffrolelink` (
  `Role_roleId` INT(11) NOT NULL COMMENT '',
  `staff_staffID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`Role_roleId`, `staff_staffID`)  COMMENT '',
  INDEX `fk_staffrolelink_staff1_idx` (`staff_staffID` ASC)  COMMENT '',
  CONSTRAINT `fk_StaffRoleLink_Role1`
    FOREIGN KEY (`Role_roleId`)
    REFERENCES `nbgardens`.`role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staffrolelink_staff1`
    FOREIGN KEY (`staff_staffID`)
    REFERENCES `nbgardens`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`wishlist` (
  `createdDate` DATETIME NOT NULL COMMENT '',
  `orderline_lineNo` INT(11) NOT NULL COMMENT '',
  `customer_customerID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`orderline_lineNo`, `customer_customerID`)  COMMENT '',
  INDEX `fk_wishlist_customer1_idx` (`customer_customerID` ASC)  COMMENT '',
  CONSTRAINT `fk_wishlist_customer1`
    FOREIGN KEY (`customer_customerID`)
    REFERENCES `nbgardens`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
