-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema nbgardens
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nbgardens` DEFAULT CHARACTER SET utf8 ;
USE `nbgardens` ;

-- -----------------------------------------------------
-- Table `nbgardens`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Event` (
  `eventId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `eventName` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`eventId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nbgardens`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Role` (
  `roleId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `roleName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`roleId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nbgardens`.`RoleEventLink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`RoleEventLink` (
  `Role_roleId` INT NOT NULL COMMENT '',
  `Event_eventId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Role_roleId`, `Event_eventId`)  COMMENT '',
  INDEX `fk_Permission_Event1_idx` (`Event_eventId` ASC)  COMMENT '',
  CONSTRAINT `fk_Permission_Role1`
    FOREIGN KEY (`Role_roleId`)
    REFERENCES `nbgardens`.`Role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permission_Event1`
    FOREIGN KEY (`Event_eventId`)
    REFERENCES `nbgardens`.`Event` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


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
  `email` VARCHAR(60) NULL COMMENT '',
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
  `addresscol` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`addressId`)  COMMENT '')
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
  `statusId` INT NOT NULL COMMENT '',
  `customer_customerID` INT(11) NOT NULL COMMENT '',
  `address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`salesOrderID`, `customer_customerID`, `address_addressId`)  COMMENT '',
  INDEX `fk_salesorder_customer1_idx` (`customer_customerID` ASC)  COMMENT '',
  INDEX `fk_salesorder_address1_idx` (`address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_salesorder_customer1`
    FOREIGN KEY (`customer_customerID`)
    REFERENCES `nbgardens`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesorder_address1`
    FOREIGN KEY (`address_addressId`)
    REFERENCES `nbgardens`.`address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`StockStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`StockStatus` (
  `stockStatusId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `status` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`stockStatusId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nbgardens`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`supplier` (
  `supplierID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `supplierName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`supplierID`, `address_addressId`)  COMMENT '',
  INDEX `fk_supplier_address1_idx` (`address_addressId` ASC)  COMMENT '',
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
  `StockStatus_stockStatusId` INT NOT NULL COMMENT '',
  `supplier_supplierID` INT(11) NOT NULL COMMENT '',
  `supplier_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`stockID`, `StockStatus_stockStatusId`, `supplier_supplierID`, `supplier_address_addressId`)  COMMENT '',
  INDEX `fk_stock_StockStatus1_idx` (`StockStatus_stockStatusId` ASC)  COMMENT '',
  INDEX `fk_stock_supplier1_idx` (`supplier_supplierID` ASC, `supplier_address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_stock_StockStatus1`
    FOREIGN KEY (`StockStatus_stockStatusId`)
    REFERENCES `nbgardens`.`StockStatus` (`stockStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_supplier1`
    FOREIGN KEY (`supplier_supplierID` , `supplier_address_addressId`)
    REFERENCES `nbgardens`.`supplier` (`supplierID` , `address_addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  `salesorder_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  `stock_stockID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`salesOrderID`, `salesorder_salesOrderID`, `salesorder_customer_customerID`, `salesorder_address_addressId`, `stock_stockID`)  COMMENT '',
  INDEX `fk_purchaseorder_salesorder1_idx` (`salesorder_salesOrderID` ASC, `salesorder_customer_customerID` ASC, `salesorder_address_addressId` ASC)  COMMENT '',
  INDEX `fk_purchaseorder_stock1_idx` (`stock_stockID` ASC)  COMMENT '',
  CONSTRAINT `fk_purchaseorder_salesorder1`
    FOREIGN KEY (`salesorder_salesOrderID` , `salesorder_customer_customerID` , `salesorder_address_addressId`)
    REFERENCES `nbgardens`.`salesorder` (`salesOrderID` , `customer_customerID` , `address_addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchaseorder_stock1`
    FOREIGN KEY (`stock_stockID`)
    REFERENCES `nbgardens`.`stock` (`stockID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`OrderEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`OrderEvent` (
  `orderEventID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `eventName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateMod` DATE NOT NULL COMMENT '',
  `StaffId` INT NOT NULL COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  `salesorder_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  `purchaseorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `purchaseorder_salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `purchaseorder_salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  `purchaseorder_salesorder_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  `purchaseorder_stock_stockID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`orderEventID`, `salesorder_salesOrderID`, `salesorder_customer_customerID`, `salesorder_address_addressId`, `purchaseorder_salesOrderID`, `purchaseorder_salesorder_salesOrderID`, `purchaseorder_salesorder_customer_customerID`, `purchaseorder_salesorder_address_addressId`, `purchaseorder_stock_stockID`)  COMMENT '',
  INDEX `fk_orderevent_salesorder1_idx` (`salesorder_salesOrderID` ASC, `salesorder_customer_customerID` ASC, `salesorder_address_addressId` ASC)  COMMENT '',
  INDEX `fk_OrderEvent_purchaseorder1_idx` (`purchaseorder_salesOrderID` ASC, `purchaseorder_salesorder_salesOrderID` ASC, `purchaseorder_salesorder_customer_customerID` ASC, `purchaseorder_salesorder_address_addressId` ASC, `purchaseorder_stock_stockID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderevent_salesorder1`
    FOREIGN KEY (`salesorder_salesOrderID` , `salesorder_customer_customerID` , `salesorder_address_addressId`)
    REFERENCES `nbgardens`.`salesorder` (`salesOrderID` , `customer_customerID` , `address_addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderEvent_purchaseorder1`
    FOREIGN KEY (`purchaseorder_salesOrderID` , `purchaseorder_salesorder_salesOrderID` , `purchaseorder_salesorder_customer_customerID` , `purchaseorder_salesorder_address_addressId` , `purchaseorder_stock_stockID`)
    REFERENCES `nbgardens`.`purchaseorder` (`salesOrderID` , `salesorder_salesOrderID` , `salesorder_customer_customerID` , `salesorder_address_addressId` , `stock_stockID`)
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
  `orderevent_orderEventID` INT(11) NOT NULL COMMENT '',
  `orderevent_salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `orderevent_salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  `orderevent_salesorder_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`staffID`, `orderevent_orderEventID`, `orderevent_salesorder_salesOrderID`, `orderevent_salesorder_customer_customerID`, `orderevent_salesorder_address_addressId`)  COMMENT '',
  INDEX `fk_staff_orderevent1_idx` (`orderevent_orderEventID` ASC, `orderevent_salesorder_salesOrderID` ASC, `orderevent_salesorder_customer_customerID` ASC, `orderevent_salesorder_address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_staff_orderevent1`
    FOREIGN KEY (`orderevent_orderEventID` , `orderevent_salesorder_salesOrderID` , `orderevent_salesorder_customer_customerID` , `orderevent_salesorder_address_addressId`)
    REFERENCES `nbgardens`.`OrderEvent` (`orderEventID` , `salesorder_salesOrderID` , `salesorder_customer_customerID` , `salesorder_address_addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`StaffRoleLink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`StaffRoleLink` (
  `Role_roleId` INT NOT NULL COMMENT '',
  `staff_staffID` INT(11) NOT NULL COMMENT '',
  `staff_orderevent_orderEventID` INT(11) NOT NULL COMMENT '',
  `staff_orderevent_salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `staff_orderevent_salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  `staff_orderevent_salesorder_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`Role_roleId`, `staff_staffID`, `staff_orderevent_orderEventID`, `staff_orderevent_salesorder_salesOrderID`, `staff_orderevent_salesorder_customer_customerID`, `staff_orderevent_salesorder_address_addressId`)  COMMENT '',
  INDEX `fk_StaffRoleLink_staff1_idx` (`staff_staffID` ASC, `staff_orderevent_orderEventID` ASC, `staff_orderevent_salesorder_salesOrderID` ASC, `staff_orderevent_salesorder_customer_customerID` ASC, `staff_orderevent_salesorder_address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_StaffRoleLink_Role1`
    FOREIGN KEY (`Role_roleId`)
    REFERENCES `nbgardens`.`Role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StaffRoleLink_staff1`
    FOREIGN KEY (`staff_staffID` , `staff_orderevent_orderEventID` , `staff_orderevent_salesorder_salesOrderID` , `staff_orderevent_salesorder_customer_customerID` , `staff_orderevent_salesorder_address_addressId`)
    REFERENCES `nbgardens`.`staff` (`staffID` , `orderevent_orderEventID` , `orderevent_salesorder_salesOrderID` , `orderevent_salesorder_customer_customerID` , `orderevent_salesorder_address_addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nbgardens`.`CustomerAddressLink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`CustomerAddressLink` (
  `customer_customerID` INT(11) NOT NULL COMMENT '',
  `address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`customer_customerID`, `address_addressId`)  COMMENT '',
  INDEX `fk_CustomerAddressLink_address1_idx` (`address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_CustomerAddressLink_customer`
    FOREIGN KEY (`customer_customerID`)
    REFERENCES `nbgardens`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CustomerAddressLink_address1`
    FOREIGN KEY (`address_addressId`)
    REFERENCES `nbgardens`.`address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `nbgardens` ;

-- -----------------------------------------------------
-- Table `nbgardens`.`orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`orderline` (
  `orderLineId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `productId` INT NOT NULL COMMENT '',
  `quantity` INT NOT NULL COMMENT '',
  `orderId` INT NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  `salesorder_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`orderLineId`, `salesorder_salesOrderID`, `salesorder_customer_customerID`, `salesorder_address_addressId`)  COMMENT '',
  INDEX `fk_orderline_salesorder1_idx` (`salesorder_salesOrderID` ASC, `salesorder_customer_customerID` ASC, `salesorder_address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_orderline_salesorder1`
    FOREIGN KEY (`salesorder_salesOrderID` , `salesorder_customer_customerID` , `salesorder_address_addressId`)
    REFERENCES `nbgardens`.`salesorder` (`salesOrderID` , `customer_customerID` , `address_addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `IssueNumber` INT NOT NULL COMMENT '',
  `PaymentID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `customer_customerID` INT(11) NOT NULL COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`PaymentID`, `customer_customerID`, `salesorder_salesOrderID`, `salesorder_customer_customerID`)  COMMENT '',
  INDEX `fk_paymentdetails_customer1_idx` (`customer_customerID` ASC)  COMMENT '',
  INDEX `fk_paymentdetails_salesorder1_idx` (`salesorder_salesOrderID` ASC, `salesorder_customer_customerID` ASC)  COMMENT '',
  CONSTRAINT `fk_paymentdetails_customer1`
    FOREIGN KEY (`customer_customerID`)
    REFERENCES `nbgardens`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paymentdetails_salesorder1`
    FOREIGN KEY (`salesorder_salesOrderID` , `salesorder_customer_customerID`)
    REFERENCES `nbgardens`.`salesorder` (`salesOrderID` , `customer_customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`product` (
  `productID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `productName` VARCHAR(45) NOT NULL COMMENT '',
  `description` VARCHAR(200) NULL DEFAULT NULL COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `length` DECIMAL(5,2) NOT NULL COMMENT '',
  `height` DECIMAL(5,2) NOT NULL COMMENT '',
  `width` DECIMAL(5,2) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `dateModified` DATE NOT NULL COMMENT '',
  `orderline_orderLineId` INT(11) NOT NULL COMMENT '',
  `orderline_salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `orderline_salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  `orderline_salesorder_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  `stock_stockID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`productID`, `orderline_orderLineId`, `orderline_salesorder_salesOrderID`, `orderline_salesorder_customer_customerID`, `orderline_salesorder_address_addressId`, `stock_stockID`)  COMMENT '',
  INDEX `fk_product_orderline1_idx` (`orderline_orderLineId` ASC, `orderline_salesorder_salesOrderID` ASC, `orderline_salesorder_customer_customerID` ASC, `orderline_salesorder_address_addressId` ASC)  COMMENT '',
  INDEX `fk_product_stock1_idx` (`stock_stockID` ASC)  COMMENT '',
  CONSTRAINT `fk_product_orderline1`
    FOREIGN KEY (`orderline_orderLineId` , `orderline_salesorder_salesOrderID` , `orderline_salesorder_customer_customerID` , `orderline_salesorder_address_addressId`)
    REFERENCES `nbgardens`.`orderline` (`orderLineId` , `salesorder_salesOrderID` , `salesorder_customer_customerID` , `salesorder_address_addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
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
  `returnReason` VARCHAR(45) NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `orderline_orderLineId` INT(11) NOT NULL COMMENT '',
  `orderline_salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `orderline_salesorder_customer_customerID` INT(11) NOT NULL COMMENT '',
  `orderline_salesorder_address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`returnID`, `orderline_orderLineId`, `orderline_salesorder_salesOrderID`, `orderline_salesorder_customer_customerID`, `orderline_salesorder_address_addressId`)  COMMENT '',
  INDEX `fk_returns_orderline1_idx` (`orderline_orderLineId` ASC, `orderline_salesorder_salesOrderID` ASC, `orderline_salesorder_customer_customerID` ASC, `orderline_salesorder_address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_returns_orderline1`
    FOREIGN KEY (`orderline_orderLineId` , `orderline_salesorder_salesOrderID` , `orderline_salesorder_customer_customerID` , `orderline_salesorder_address_addressId`)
    REFERENCES `nbgardens`.`orderline` (`orderLineId` , `salesorder_salesOrderID` , `salesorder_customer_customerID` , `salesorder_address_addressId`)
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
