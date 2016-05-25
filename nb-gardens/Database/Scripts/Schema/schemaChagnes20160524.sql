/*PaymentIdColumnMoveToFirst*/
ALTER TABLE PAYMENTDETAILS CHANGE COLUMN PaymentID PaymentID INT NOT NULL AUTO_INCREMENT FIRST;

/*DropOrderLine*/
drop table orderline;

/*DropConstraints*/
ALTER TABLE purchaseorderevent DROP FOREIGN KEY fk_PurchaseOrderEvent_purchaseorder1;
ALTER TABLE purchaseorderline DROP FOREIGN KEY fk_orderline_purchaseorder10;

/*MakePKAI*/
Alter table purchaseorder modify purchaseOrderId INT AUTO_INCREMENT;

/*Re-add Constraints*/
ALTER TABLE purchaseorderevent ADD CONSTRAINT fk_PurchaseOrderEvent_purchaseorder1 FOREIGN KEY(PurchaseOrder_purchaseOrderId) REFERENCES purchaseorder(purchaseOrderId);
ALTER TABLE purchaseorderline ADD CONSTRAINT fk_orderline_purchaseorder10 FOREIGN KEY(PurchaseOrder_purchaseOrderId) REFERENCES purchaseorder(purchaseOrderId);

/*RemoveColumnInAddress*/
ALTER TABLE address DROP addresscol;

/*AddPriceToProduct*/
ALTER TABLE product ADD price decimal(7,2) AFTER productName;

/*RenameCustoemrReviewColumns*/
ALTER TABLE CUSTOMERREVIEW CHANGE dateCreated dateModified timestamp;
ALTER TABLE CUSTOMERREVIEW CHANGE STARTRATING starRating int(11);

/*Rename purchase order event table to purchase order log*/
RENAME TABLE puchaseOrderEvent TO purchaseOrderLog;