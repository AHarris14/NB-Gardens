/*CustomerStatusDrip*/
ALTER TABLE customer DROP COLUMN status;

/*Drop Constraints*/
ALTER TABLE customer DROP FOREIGN KEY fk_Customer_Address1;
ALTER TABLE supplier DROP FOREIGN KEY fk_Supplier_Address1;
ALTER TABLE SalesOrder DROP FOREIGN KEY fk_salesorder_Address1;

/*Make primary key auto increment*/
Alter table address modify addressId INT AUTO_INCREMENT;

/*Make foreign key columns ints*/
Alter table customer modify Address_addressId INT;
Alter table supplier modify Address_addressId INT;
Alter table salesorder modify addressId INT;

/*Readd constraints*/
ALTER TABLE customer ADD CONSTRAINT fk_Customer_Address1 FOREIGN KEY(Address_addressId) REFERENCES ADDRESS(addressId);
ALTER TABLE supplier ADD CONSTRAINT fk_Supplier_Address1 FOREIGN KEY(Address_addressId) REFERENCES ADDRESS(addressId);
ALTER TABLE salesorder ADD CONSTRAINT fk_salesorder_Address1 FOREIGN KEY(addressId) REFERENCES ADDRESS(addressId);

/*PurcahseOrderConstraint*/
ALTER TABLE PURCHASEORDER
ADD CONSTRAINT fk_purchaseorders_orderstatus
FOREIGN KEY (statusId)
REFERENCES orderstatus(orderStatusId);

/*PaymentIdColumnMoveToFirst*/
ALTER TABLE PAYMENTDETAILS CHANGE COLUMN PaymentID PaymentID INT NOT NULL AUTO_INCREMENT FIRST;