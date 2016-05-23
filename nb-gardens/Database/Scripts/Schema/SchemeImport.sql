-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema u228862510_nbg
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema u228862510_nbg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `u228862510_nbg` DEFAULT CHARACTER SET utf8 ;
USE `u228862510_nbg` ;

-- -----------------------------------------------------
-- Table `u228862510_nbg`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`address` (
  `addressId` VARCHAR(45) NOT NULL COMMENT '',
  `addressLine1` VARCHAR(50) NOT NULL COMMENT '',
  `addressLine2` VARCHAR(30) NOT NULL COMMENT '',
  `postCode` VARCHAR(10) NOT NULL COMMENT '',
  `town` VARCHAR(30) NOT NULL COMMENT '',
  `county` VARCHAR(20) NOT NULL COMMENT '',
  `country` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateModified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `addresscol` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`addressId`)  COMMENT '')
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`customerstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`customerstatus` (
  `statusId` TINYINT NOT NULL AUTO_INCREMENT COMMENT '',
  `status` VARCHAR(20) NOT NULL COMMENT '',
  PRIMARY KEY (`statusId`)  COMMENT '')
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`customer` (
  `customerID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `firstName` VARCHAR(30) NOT NULL COMMENT '',
  `lastName` VARCHAR(45) NOT NULL COMMENT '',
  `DOB` DATE NOT NULL COMMENT '',
  `email` VARCHAR(60) NULL DEFAULT NULL COMMENT '',
  `creditRemaining` DECIMAL(7,2) NOT NULL COMMENT '',
  `phoneNumber` VARCHAR(25) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateModified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `customerstatus_statusId` TINYINT NOT NULL COMMENT '',
  `Address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  `username` VARCHAR(30) NULL DEFAULT NULL COMMENT '',
  `password` VARCHAR(80) NULL DEFAULT NULL COMMENT '',
  `status` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`customerID`)  COMMENT '',
  INDEX `fk_customer_customerstatus1_idx` (`customerstatus_statusId` ASC)  COMMENT '',
  INDEX `fk_Customer_Address1_idx` (`Address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_Customer_Address1`
    FOREIGN KEY (`Address_addressId`)
    REFERENCES `u228862510_nbg`.`address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_customerstatus1`
    FOREIGN KEY (`customerstatus_statusId`)
    REFERENCES `u228862510_nbg`.`customerstatus` (`statusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`stockstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`stockstatus` (
  `stockStatusId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `status` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`stockStatusId`)  COMMENT '')
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`supplierstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`supplierstatus` (
  `statusId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `status` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`statusId`)  COMMENT '')
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`supplier` (
  `supplierID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Added supplier index as a Unique Index\n\nSam A, 14:13 18th May',
  `supplierName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateMod` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `Address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  `supplierStatus_statusId` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`supplierID`)  COMMENT '',
  UNIQUE INDEX `supplierID_UNIQUE` (`supplierID` ASC)  COMMENT '',
  INDEX `fk_Supplier_Address1_idx` (`Address_addressId` ASC)  COMMENT '',
  INDEX `fk_Supplier_supplierStatus1_idx` (`supplierStatus_statusId` ASC)  COMMENT '',
  CONSTRAINT `fk_Supplier_Address1`
    FOREIGN KEY (`Address_addressId`)
    REFERENCES `u228862510_nbg`.`address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Supplier_supplierStatus1`
    FOREIGN KEY (`supplierStatus_statusId`)
    REFERENCES `u228862510_nbg`.`supplierstatus` (`statusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`stock` (
  `stockID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `ReorderLevel` INT(11) NOT NULL COMMENT '',
  `StockStatus_stockStatusId` INT(11) NOT NULL COMMENT 'Active\nIn stock but not live on customer site\nDamaged\nDiscontinued \nOut of stock\nOn hold\n',
  `supplier_supplierID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`stockID`)  COMMENT '',
  INDEX `fk_stock_StockStatus1_idx` (`StockStatus_stockStatusId` ASC)  COMMENT '',
  INDEX `fk_stock_supplier1_idx` (`supplier_supplierID` ASC)  COMMENT '',
  CONSTRAINT `fk_stock_StockStatus1`
    FOREIGN KEY (`StockStatus_stockStatusId`)
    REFERENCES `u228862510_nbg`.`stockstatus` (`stockStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_supplier1`
    FOREIGN KEY (`supplier_supplierID`)
    REFERENCES `u228862510_nbg`.`supplier` (`supplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`product` (
  `productID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Removed invalid foreign keys without relationships\n\nSam A, 14:13 18th May',
  `productName` VARCHAR(45) NOT NULL COMMENT '',
  `description` VARCHAR(200) NULL DEFAULT NULL COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `length` DECIMAL(5,2) NOT NULL COMMENT '',
  `height` DECIMAL(5,2) NOT NULL COMMENT '',
  `width` DECIMAL(5,2) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateModified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `stock_stockID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`productID`)  COMMENT '',
  INDEX `fk_product_stock1_idx` (`stock_stockID` ASC)  COMMENT '',
  CONSTRAINT `fk_product_stock1`
    FOREIGN KEY (`stock_stockID`)
    REFERENCES `u228862510_nbg`.`stock` (`stockID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`customerreview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`customerreview` (
  `Customer_customerID` INT(11) NOT NULL COMMENT '',
  `Product_productID` INT(11) NOT NULL COMMENT '',
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `reviewDescription` TEXT NOT NULL COMMENT '',
  `startRating` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`Customer_customerID`, `Product_productID`)  COMMENT '',
  INDEX `fk_CustomerReview_Product1_idx` (`Product_productID` ASC)  COMMENT '',
  CONSTRAINT `fk_CustomerReview_Customer1`
    FOREIGN KEY (`Customer_customerID`)
    REFERENCES `u228862510_nbg`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CustomerReview_Product1`
    FOREIGN KEY (`Product_productID`)
    REFERENCES `u228862510_nbg`.`product` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`event` (
  `eventId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `eventName` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`eventId`)  COMMENT '')
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`purchaseorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`purchaseorder` (
  `purchaseOrderID` INT(11) NOT NULL COMMENT 'Made some camel case corrections and basic cleanup\n\nSam A, 14:47, 18th May',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dispatchDate` DATETIME NULL DEFAULT NULL COMMENT '',
  `baseCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `vatCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `statusID` INT(11) NOT NULL COMMENT '',
  `deliveryCost` DECIMAL(10,0) NOT NULL COMMENT '',
  `discount` DECIMAL(7,2) NULL DEFAULT NULL COMMENT '',
  `packageCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `Supplier_supplierID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`purchaseOrderID`)  COMMENT '',
  INDEX `fk_PurchaseOrder_Supplier1_idx` (`Supplier_supplierID` ASC)  COMMENT '',
  CONSTRAINT `fk_PurchaseOrder_Supplier1`
    FOREIGN KEY (`Supplier_supplierID`)
    REFERENCES `u228862510_nbg`.`supplier` (`supplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`orderstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`orderstatus` (
  `orderStatusId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `status` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`orderStatusId`)  COMMENT '')
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`paymentdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`paymentdetails` (
  `cardNumber` VARCHAR(16) NOT NULL COMMENT '',
  `cardHolderName` VARCHAR(65) NOT NULL COMMENT '',
  `cardType` VARCHAR(20) NOT NULL COMMENT '',
  `expirationDate` DATE NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateModified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `IssueNumber` INT(11) NOT NULL COMMENT '',
  `PaymentID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `customer_customerID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`PaymentID`)  COMMENT '',
  INDEX `fk_paymentdetails_customer1_idx` (`customer_customerID` ASC)  COMMENT '',
  CONSTRAINT `fk_paymentdetails_customer1`
    FOREIGN KEY (`customer_customerID`)
    REFERENCES `u228862510_nbg`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`salesorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`salesorder` (
  `salesOrderID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `vatCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `postageCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `baseCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL COMMENT '',
  `dispatchDate` DATE NOT NULL COMMENT '',
  `packageCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `discount` DECIMAL(7,2) NOT NULL COMMENT '',
  `customerID` INT(11) NOT NULL COMMENT '',
  `addressId` VARCHAR(45) NOT NULL COMMENT '',
  `paymentID` INT(11) NOT NULL COMMENT '',
  `orderStatus_orderStatusId` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`salesOrderID`)  COMMENT '',
  INDEX `fk_salesorder_customer1_idx` (`customerID` ASC)  COMMENT '',
  INDEX `fk_salesorder_address1_idx` (`addressId` ASC)  COMMENT '',
  INDEX `fk_salesorder_paymentdetails1_idx` (`paymentID` ASC)  COMMENT '',
  INDEX `fk_salesorder_orderStatus1_idx` (`orderStatus_orderStatusId` ASC)  COMMENT '',
  CONSTRAINT `fk_salesorder_address1`
    FOREIGN KEY (`addressId`)
    REFERENCES `u228862510_nbg`.`address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesorder_customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `u228862510_nbg`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesorder_orderStatus1`
    FOREIGN KEY (`orderStatus_orderStatusId`)
    REFERENCES `u228862510_nbg`.`orderstatus` (`orderStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesorder_paymentdetails1`
    FOREIGN KEY (`paymentID`)
    REFERENCES `u228862510_nbg`.`paymentdetails` (`PaymentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`orderline` (
  `orderLineId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `productId` INT(11) NOT NULL COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `orderId` INT(11) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `dateCreated` DATE NOT NULL COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `purchaseorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `product_productID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`orderLineId`)  COMMENT '',
  INDEX `fk_orderline_salesorder1_idx` (`salesorder_salesOrderID` ASC)  COMMENT '',
  INDEX `fk_orderline_purchaseorder1_idx` (`purchaseorder_salesOrderID` ASC)  COMMENT '',
  INDEX `fk_orderline_product1_idx` (`product_productID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderline_product1`
    FOREIGN KEY (`product_productID`)
    REFERENCES `u228862510_nbg`.`product` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_purchaseorder1`
    FOREIGN KEY (`purchaseorder_salesOrderID`)
    REFERENCES `u228862510_nbg`.`purchaseorder` (`purchaseOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_salesorder1`
    FOREIGN KEY (`salesorder_salesOrderID`)
    REFERENCES `u228862510_nbg`.`salesorder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`staff` (
  `staffID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `firstName` VARCHAR(30) NOT NULL COMMENT '',
  `lastName` VARCHAR(45) NOT NULL COMMENT '',
  `password` VARCHAR(10) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`staffID`)  COMMENT '')
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`purchaseorderevent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`purchaseorderevent` (
  `orderEventID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `staff_staffID` INT(11) NOT NULL COMMENT '',
  `purchaseorder_purchaseOrderID` INT(11) NOT NULL COMMENT '',
  `eventName` VARCHAR(30) NOT NULL COMMENT '',
  `notes` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`orderEventID`)  COMMENT '',
  INDEX `fk_orderevent_staff1_idx` (`staff_staffID` ASC)  COMMENT '',
  INDEX `fk_PurchaseOrderEvent_purchaseorder1_idx` (`purchaseorder_purchaseOrderID` ASC)  COMMENT '',
  CONSTRAINT `fk_PurchaseOrderEvent_purchaseorder1`
    FOREIGN KEY (`purchaseorder_purchaseOrderID`)
    REFERENCES `u228862510_nbg`.`purchaseorder` (`purchaseOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderevent_staff1`
    FOREIGN KEY (`staff_staffID`)
    REFERENCES `u228862510_nbg`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`purchaseorderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`purchaseorderline` (
  `orderLineId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `purchaseorder_purchaseOrderID` INT(11) NOT NULL COMMENT '',
  `product_productID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`orderLineId`)  COMMENT '',
  INDEX `fk_orderline_purchaseorder1_idx` (`purchaseorder_purchaseOrderID` ASC)  COMMENT '',
  INDEX `fk_orderline_product1_idx` (`product_productID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderline_product10`
    FOREIGN KEY (`product_productID`)
    REFERENCES `u228862510_nbg`.`product` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_purchaseorder10`
    FOREIGN KEY (`purchaseorder_purchaseOrderID`)
    REFERENCES `u228862510_nbg`.`purchaseorder` (`purchaseOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`purchasereturns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`purchasereturns` (
  `returnID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `returnDate` DATE NOT NULL COMMENT '',
  `returnReason` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateMod` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `purchaseOrderLine_orderLineId` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`returnID`)  COMMENT '',
  INDEX `fk_Returns_PurchaseOrderLine1_idx` (`purchaseOrderLine_orderLineId` ASC)  COMMENT '',
  CONSTRAINT `fk_Returns_PurchaseOrderLine1`
    FOREIGN KEY (`purchaseOrderLine_orderLineId`)
    REFERENCES `u228862510_nbg`.`purchaseorderline` (`orderLineId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`recoverpassword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`recoverpassword` (
  `Customer_customerID` INT(11) NOT NULL COMMENT '',
  `guid` VARCHAR(45) NOT NULL COMMENT '',
  `expiry` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`Customer_customerID`)  COMMENT '',
  INDEX `fk_RecoverPassword_Customer_idx` (`Customer_customerID` ASC)  COMMENT '',
  CONSTRAINT `fk_RecoverPassword_Customer`
    FOREIGN KEY (`Customer_customerID`)
    REFERENCES `u228862510_nbg`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`role` (
  `roleId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `roleName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`roleId`)  COMMENT '')
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`roleeventlink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`roleeventlink` (
  `Role_roleId` INT(11) NOT NULL COMMENT '',
  `Event_eventId` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`Role_roleId`, `Event_eventId`)  COMMENT '',
  INDEX `fk_Permission_Event1_idx` (`Event_eventId` ASC)  COMMENT '',
  CONSTRAINT `fk_Permission_Event1`
    FOREIGN KEY (`Event_eventId`)
    REFERENCES `u228862510_nbg`.`event` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permission_Role1`
    FOREIGN KEY (`Role_roleId`)
    REFERENCES `u228862510_nbg`.`role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`salesorderevent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`salesorderevent` (
  `orderEventID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `staff_staffID` INT(11) NOT NULL COMMENT '',
  `event` VARCHAR(45) NOT NULL COMMENT '',
  `notes` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`orderEventID`)  COMMENT '',
  INDEX `fk_orderevent_salesorder1_idx` (`salesorder_salesOrderID` ASC)  COMMENT '',
  INDEX `fk_orderevent_staff1_idx` (`staff_staffID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderevent_salesorder10`
    FOREIGN KEY (`salesorder_salesOrderID`)
    REFERENCES `u228862510_nbg`.`salesorder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderevent_staff10`
    FOREIGN KEY (`staff_staffID`)
    REFERENCES `u228862510_nbg`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`salesorderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`salesorderline` (
  `orderLineId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateMod` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `product_productID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`orderLineId`)  COMMENT '',
  INDEX `fk_orderline_salesorder1_idx` (`salesorder_salesOrderID` ASC)  COMMENT '',
  INDEX `fk_orderline_product1_idx` (`product_productID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderline_product100`
    FOREIGN KEY (`product_productID`)
    REFERENCES `u228862510_nbg`.`product` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_salesorder100`
    FOREIGN KEY (`salesorder_salesOrderID`)
    REFERENCES `u228862510_nbg`.`salesorder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`salesreturns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`salesreturns` (
  `returnID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `returnDate` DATE NOT NULL COMMENT '',
  `returnReason` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dateMod` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `salesOrderLine_orderLineId` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`returnID`)  COMMENT '',
  INDEX `fk_Returns_SalesOrderLine1_idx` (`salesOrderLine_orderLineId` ASC)  COMMENT '',
  CONSTRAINT `fk_Returns_SalesOrderLine10`
    FOREIGN KEY (`salesOrderLine_orderLineId`)
    REFERENCES `u228862510_nbg`.`salesorderline` (`orderLineId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`staffrolelink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`staffrolelink` (
  `Role_roleId` INT(11) NOT NULL COMMENT '',
  `staff_staffID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`Role_roleId`, `staff_staffID`)  COMMENT '',
  INDEX `fk_staffrolelink_staff1_idx` (`staff_staffID` ASC)  COMMENT '',
  CONSTRAINT `fk_StaffRoleLink_Role1`
    FOREIGN KEY (`Role_roleId`)
    REFERENCES `u228862510_nbg`.`role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staffrolelink_staff1`
    FOREIGN KEY (`staff_staffID`)
    REFERENCES `u228862510_nbg`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`stockevent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`stockevent` (
  `stockEventId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `Staff_staffID` INT(11) NOT NULL COMMENT '',
  `event` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `Stock_stockID` INT(11) NOT NULL COMMENT '',
  `notes` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`stockEventId`)  COMMENT '',
  INDEX `fk_stockEvent_Staff1_idx` (`Staff_staffID` ASC)  COMMENT '',
  INDEX `fk_stockEvent_Stock1_idx` (`Stock_stockID` ASC)  COMMENT '',
  CONSTRAINT `fk_stockEvent_Staff1`
    FOREIGN KEY (`Staff_staffID`)
    REFERENCES `u228862510_nbg`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stockEvent_Stock1`
    FOREIGN KEY (`Stock_stockID`)
    REFERENCES `u228862510_nbg`.`stock` (`stockID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`wishlist` (
  `wishlistID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `createdDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `Customer_customerID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`wishlistID`)  COMMENT '',
  INDEX `fk_Wishlist_Customer1_idx` (`Customer_customerID` ASC)  COMMENT '',
  CONSTRAINT `fk_Wishlist_Customer1`
    FOREIGN KEY (`Customer_customerID`)
    REFERENCES `u228862510_nbg`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `u228862510_nbg`.`wishlistitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `u228862510_nbg`.`wishlistitem` (
  `createdDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `Product_productID` INT(11) NOT NULL COMMENT '',
  `Wishlist_wishlistID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`Product_productID`, `Wishlist_wishlistID`)  COMMENT '',
  INDEX `fk_WishlistItem_Product1_idx` (`Product_productID` ASC)  COMMENT '',
  INDEX `fk_WishlistItem_Wishlist1_idx` (`Wishlist_wishlistID` ASC)  COMMENT '',
  CONSTRAINT `fk_WishlistItem_Product1`
    FOREIGN KEY (`Product_productID`)
    REFERENCES `u228862510_nbg`.`product` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WishlistItem_Wishlist1`
    FOREIGN KEY (`Wishlist_wishlistID`)
    REFERENCES `u228862510_nbg`.`wishlist` (`wishlistID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
