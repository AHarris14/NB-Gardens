INSERT INTO address (addressId, addressLine1, addressLine2, postCode, town, county, country) VALUES ('001', '69 Urmum Avenue', '', 'YI5 8OS', 'Reading Books', 'SomePLace', 'Mars');
INSERT INTO supplierstatus (statusId, `status`) values ('001', 'active');
INSERT INTO supplier (supplierName, Address_addressId, supplierStatus_statusId) VALUES ('Gnome Limit', '001', '001');
INSERT INTO stockstatus (`status`) VALUES ('active');
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (100, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (100, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (311, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (4, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (54, 10, 1, 1);
