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
-- Table `nbgardens`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Address` (
  `addressId` VARCHAR(45) NOT NULL COMMENT '',
  `addressLine1` VARCHAR(50) NOT NULL COMMENT '',
  `addressLine2` VARCHAR(30) NOT NULL COMMENT '',
  `postCode` VARCHAR(10) NOT NULL COMMENT '',
  `town` VARCHAR(30) NOT NULL COMMENT '',
  `county` VARCHAR(20) NOT NULL COMMENT '',
  `country` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateModified` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `addresscol` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`addressId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`CustomerStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`CustomerStatus` (
  `statusId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `status` VARCHAR(20) NOT NULL COMMENT '',
  PRIMARY KEY (`statusId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Customer` (
  `customerID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `firstName` VARCHAR(30) NOT NULL COMMENT '',
  `lastName` VARCHAR(45) NOT NULL COMMENT '',
  `DOB` DATE NOT NULL COMMENT '',
  `email` VARCHAR(60) NULL DEFAULT NULL COMMENT '',
  `credit` DECIMAL(7,2) NOT NULL COMMENT '',
  `status` INT(11) NOT NULL COMMENT '',
  `phoneNumber` VARCHAR(25) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateModified` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `customerstatus_statusId` INT(11) NOT NULL COMMENT '',
  `Address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`customerID`)  COMMENT '',
  INDEX `fk_customer_customerstatus1_idx` (`customerstatus_statusId` ASC)  COMMENT '',
  INDEX `fk_Customer_Address1_idx` (`Address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_customer_customerstatus1`
    FOREIGN KEY (`customerstatus_statusId`)
    REFERENCES `nbgardens`.`CustomerStatus` (`statusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Address1`
    FOREIGN KEY (`Address_addressId`)
    REFERENCES `nbgardens`.`Address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Event` (
  `eventId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `eventName` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`eventId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Staff` (
  `staffID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `firstName` VARCHAR(30) NOT NULL COMMENT '',
  `lastName` VARCHAR(45) NOT NULL COMMENT '',
  `password` VARCHAR(10) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  PRIMARY KEY (`staffID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Supplier` (
  `supplierID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Added supplier index as a Unique Index\n\nSam A, 14:13 18th May',
  `supplierName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateMod` DATETIME NULL DEFAULT NOW() COMMENT '',
  `Address_addressId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`supplierID`)  COMMENT '',
  UNIQUE INDEX `supplierID_UNIQUE` (`supplierID` ASC)  COMMENT '',
  INDEX `fk_Supplier_Address1_idx` (`Address_addressId` ASC)  COMMENT '',
  CONSTRAINT `fk_Supplier_Address1`
    FOREIGN KEY (`Address_addressId`)
    REFERENCES `nbgardens`.`Address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`PurchaseOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`PurchaseOrder` (
  `purchaseOrderID` INT(11) NOT NULL COMMENT 'Made some camel case corrections and basic cleanup\n\nSam A, 14:47, 18th May',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dispatchDate` DATETIME NULL COMMENT '',
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
    REFERENCES `nbgardens`.`Supplier` (`supplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`PurchaseOrderEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`PurchaseOrderEvent` (
  `orderEventID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `staff_staffID` INT(11) NOT NULL COMMENT '',
  `purchaseorder_purchaseOrderID` INT(11) NOT NULL COMMENT '',
  `eventName` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`orderEventID`)  COMMENT '',
  INDEX `fk_orderevent_staff1_idx` (`staff_staffID` ASC)  COMMENT '',
  INDEX `fk_PurchaseOrderEvent_purchaseorder1_idx` (`purchaseorder_purchaseOrderID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderevent_staff1`
    FOREIGN KEY (`staff_staffID`)
    REFERENCES `nbgardens`.`Staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PurchaseOrderEvent_purchaseorder1`
    FOREIGN KEY (`purchaseorder_purchaseOrderID`)
    REFERENCES `nbgardens`.`PurchaseOrder` (`purchaseOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`StockStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`StockStatus` (
  `stockStatusId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `status` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`stockStatusId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Stock` (
  `stockID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `ReorderLevel` INT(11) NOT NULL COMMENT '',
  `StockStatus_stockStatusId` INT(11) NOT NULL COMMENT '',
  `supplier_supplierID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`stockID`)  COMMENT '',
  INDEX `fk_stock_StockStatus1_idx` (`StockStatus_stockStatusId` ASC)  COMMENT '',
  INDEX `fk_stock_supplier1_idx` (`supplier_supplierID` ASC)  COMMENT '',
  CONSTRAINT `fk_stock_StockStatus1`
    FOREIGN KEY (`StockStatus_stockStatusId`)
    REFERENCES `nbgardens`.`StockStatus` (`stockStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_supplier1`
    FOREIGN KEY (`supplier_supplierID`)
    REFERENCES `nbgardens`.`Supplier` (`supplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Product` (
  `productID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Removed invalid foreign keys without relationships\n\nSam A, 14:13 18th May',
  `productName` VARCHAR(45) NOT NULL COMMENT '',
  `description` VARCHAR(200) NULL DEFAULT NULL COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `length` DECIMAL(5,2) NOT NULL COMMENT '',
  `height` DECIMAL(5,2) NOT NULL COMMENT '',
  `width` DECIMAL(5,2) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateModified` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `stock_stockID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`productID`)  COMMENT '',
  INDEX `fk_product_stock1_idx` (`stock_stockID` ASC)  COMMENT '',
  CONSTRAINT `fk_product_stock1`
    FOREIGN KEY (`stock_stockID`)
    REFERENCES `nbgardens`.`Stock` (`stockID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`PaymentDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`PaymentDetails` (
  `cardNumber` VARCHAR(16) NOT NULL COMMENT '',
  `cardHolderName` VARCHAR(65) NOT NULL COMMENT '',
  `cardType` VARCHAR(20) NOT NULL COMMENT '',
  `expirationDate` DATE NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateModified` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `IssueNumber` INT(11) NOT NULL COMMENT '',
  `PaymentID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `customer_customerID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`PaymentID`)  COMMENT '',
  INDEX `fk_paymentdetails_customer1_idx` (`customer_customerID` ASC)  COMMENT '',
  CONSTRAINT `fk_paymentdetails_customer1`
    FOREIGN KEY (`customer_customerID`)
    REFERENCES `nbgardens`.`Customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`SalesOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`SalesOrder` (
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
  `customerID` INT(11) NOT NULL COMMENT '',
  `addressId` VARCHAR(45) NOT NULL COMMENT '',
  `paymentID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`salesOrderID`)  COMMENT '',
  INDEX `fk_salesorder_customer1_idx` (`customerID` ASC)  COMMENT '',
  INDEX `fk_salesorder_address1_idx` (`addressId` ASC)  COMMENT '',
  INDEX `fk_salesorder_paymentdetails1_idx` (`paymentID` ASC)  COMMENT '',
  CONSTRAINT `fk_salesorder_address1`
    FOREIGN KEY (`addressId`)
    REFERENCES `nbgardens`.`Address` (`addressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesorder_customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `nbgardens`.`Customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesorder_paymentdetails1`
    FOREIGN KEY (`paymentID`)
    REFERENCES `nbgardens`.`PaymentDetails` (`PaymentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`OrderLine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`OrderLine` (
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
    REFERENCES `nbgardens`.`Product` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_purchaseorder1`
    FOREIGN KEY (`purchaseorder_salesOrderID`)
    REFERENCES `nbgardens`.`PurchaseOrder` (`purchaseOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_salesorder1`
    FOREIGN KEY (`salesorder_salesOrderID`)
    REFERENCES `nbgardens`.`SalesOrder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`PurchaseOrderLine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`PurchaseOrderLine` (
  `orderLineId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `purchaseorder_purchaseOrderID` INT NOT NULL COMMENT '',
  `product_productID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`orderLineId`)  COMMENT '',
  INDEX `fk_orderline_purchaseorder1_idx` (`purchaseorder_purchaseOrderID` ASC)  COMMENT '',
  INDEX `fk_orderline_product1_idx` (`product_productID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderline_product10`
    FOREIGN KEY (`product_productID`)
    REFERENCES `nbgardens`.`Product` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_purchaseorder10`
    FOREIGN KEY (`purchaseorder_purchaseOrderID`)
    REFERENCES `nbgardens`.`PurchaseOrder` (`purchaseOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`SalesOrderLine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`SalesOrderLine` (
  `orderLineId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `totalCost` DECIMAL(7,2) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateMod` DATETIME NULL DEFAULT NOW() COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `product_productID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`orderLineId`)  COMMENT '',
  INDEX `fk_orderline_salesorder1_idx` (`salesorder_salesOrderID` ASC)  COMMENT '',
  INDEX `fk_orderline_product1_idx` (`product_productID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderline_product100`
    FOREIGN KEY (`product_productID`)
    REFERENCES `nbgardens`.`Product` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_salesorder100`
    FOREIGN KEY (`salesorder_salesOrderID`)
    REFERENCES `nbgardens`.`SalesOrder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`Returns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Returns` (
  `returnID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `quantity` INT(11) NOT NULL COMMENT '',
  `returnDate` DATE NOT NULL COMMENT '',
  `returnReason` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateMod` DATETIME NULL DEFAULT NOW() COMMENT '',
  `PurchaseOrderLine_orderLineId` INT(11) NOT NULL COMMENT '',
  `SalesOrderLine_orderLineId` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`returnID`)  COMMENT '',
  INDEX `fk_Returns_PurchaseOrderLine1_idx` (`PurchaseOrderLine_orderLineId` ASC)  COMMENT '',
  INDEX `fk_Returns_SalesOrderLine1_idx` (`SalesOrderLine_orderLineId` ASC)  COMMENT '',
  CONSTRAINT `fk_Returns_PurchaseOrderLine1`
    FOREIGN KEY (`PurchaseOrderLine_orderLineId`)
    REFERENCES `nbgardens`.`PurchaseOrderLine` (`orderLineId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Returns_SalesOrderLine1`
    FOREIGN KEY (`SalesOrderLine_orderLineId`)
    REFERENCES `nbgardens`.`SalesOrderLine` (`orderLineId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Role` (
  `roleId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `roleName` VARCHAR(30) NOT NULL COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  PRIMARY KEY (`roleId`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`RoleEventLink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`RoleEventLink` (
  `Role_roleId` INT(11) NOT NULL COMMENT '',
  `Event_eventId` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`Role_roleId`, `Event_eventId`)  COMMENT '',
  INDEX `fk_Permission_Event1_idx` (`Event_eventId` ASC)  COMMENT '',
  CONSTRAINT `fk_Permission_Event1`
    FOREIGN KEY (`Event_eventId`)
    REFERENCES `nbgardens`.`Event` (`eventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permission_Role1`
    FOREIGN KEY (`Role_roleId`)
    REFERENCES `nbgardens`.`Role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`StaffRoleLink`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`StaffRoleLink` (
  `Role_roleId` INT(11) NOT NULL COMMENT '',
  `staff_staffID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`Role_roleId`, `staff_staffID`)  COMMENT '',
  INDEX `fk_staffrolelink_staff1_idx` (`staff_staffID` ASC)  COMMENT '',
  CONSTRAINT `fk_StaffRoleLink_Role1`
    FOREIGN KEY (`Role_roleId`)
    REFERENCES `nbgardens`.`Role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staffrolelink_staff1`
    FOREIGN KEY (`staff_staffID`)
    REFERENCES `nbgardens`.`Staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`Wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`Wishlist` (
  `wishlistID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `createdDate` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `Customer_customerID` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`wishlistID`)  COMMENT '',
  INDEX `fk_Wishlist_Customer1_idx` (`Customer_customerID` ASC)  COMMENT '',
  CONSTRAINT `fk_Wishlist_Customer1`
    FOREIGN KEY (`Customer_customerID`)
    REFERENCES `nbgardens`.`Customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`WishlistItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`WishlistItem` (
  `createdDate` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `Product_productID` INT(11) NOT NULL COMMENT '',
  `Wishlist_wishlistID` INT NOT NULL COMMENT '',
  INDEX `fk_WishlistItem_Product1_idx` (`Product_productID` ASC)  COMMENT '',
  PRIMARY KEY (`Product_productID`, `Wishlist_wishlistID`)  COMMENT '',
  INDEX `fk_WishlistItem_Wishlist1_idx` (`Wishlist_wishlistID` ASC)  COMMENT '',
  CONSTRAINT `fk_WishlistItem_Product1`
    FOREIGN KEY (`Product_productID`)
    REFERENCES `nbgardens`.`Product` (`productID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WishlistItem_Wishlist1`
    FOREIGN KEY (`Wishlist_wishlistID`)
    REFERENCES `nbgardens`.`Wishlist` (`wishlistID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nbgardens`.`SalesOrderEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nbgardens`.`SalesOrderEvent` (
  `orderEventID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `dateCreated` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `dateMod` DATETIME NOT NULL DEFAULT NOW() COMMENT '',
  `salesorder_salesOrderID` INT(11) NOT NULL COMMENT '',
  `staff_staffID` INT(11) NOT NULL COMMENT '',
  `event` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`orderEventID`)  COMMENT '',
  INDEX `fk_orderevent_salesorder1_idx` (`salesorder_salesOrderID` ASC)  COMMENT '',
  INDEX `fk_orderevent_staff1_idx` (`staff_staffID` ASC)  COMMENT '',
  CONSTRAINT `fk_orderevent_salesorder10`
    FOREIGN KEY (`salesorder_salesOrderID`)
    REFERENCES `nbgardens`.`SalesOrder` (`salesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderevent_staff10`
    FOREIGN KEY (`staff_staffID`)
    REFERENCES `nbgardens`.`Staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
