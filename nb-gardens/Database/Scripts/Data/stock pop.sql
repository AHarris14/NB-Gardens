INSERT INTO supplierstatus (`status`) values ('active');
INSERT INTO supplier (supplierName, Address_addressId, supplierStatus_statusId) VALUES ('Gnome Limit', 1, 1);
INSERT INTO stockstatus (`status`) VALUES ('active');


INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (100, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (100, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (311, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (4, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (54, 10, 1, 1);
