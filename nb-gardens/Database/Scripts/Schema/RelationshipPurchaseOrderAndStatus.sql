ALTER TABLE PURCHASEORDER
ADD CONSTRAINT fk_purchaseorders_orderstatus
FOREIGN KEY (statusId)
REFERENCES orderstatus(orderStatusId);