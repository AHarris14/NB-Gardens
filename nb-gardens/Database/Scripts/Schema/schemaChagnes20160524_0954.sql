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
