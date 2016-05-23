/*Address*/
INSERT INTO address (addressLine1, addressLine2, postCode, town, county, country) VALUES ('69 Urmums Avenue', '','QW1 2ER','London', '','UK');
INSERT INTO address (addressLine1, addressLine2, postCode, town, county, country) VALUES ('1 Some Place', 'Some Plaice', 'TY34 56UI','Reading', '', 'UK');
INSERT INTO address (addressLine1, addressLine2, postCode, town, county, country) VALUES ('56a Hole Street', '', 'OP7 8AS','Manchester','','UK');
INSERT INTO address (addressLine1, addressLine2, postCode, town, county, country) VALUES ('22 Styff Crescent', '','DF9 0GH','Cardiff', 'South Wales','UK');
INSERT INTO address (addressLine1, addressLine2, postCode, town, county, country) VALUES ('342 Ill Lane', '','JK1 2DI','Edinburgh', 'Scotland','UK');
INSERT INTO address (addressLine1, addressLine2, postCode, town, county, country) VALUES ( '13 Open Close', 'Theodor Industrial Estate', 'LZ34 5XC', 'Paris', '', 'France');

/*CustomerStatus*/
INSERT INTO customerstatus (`status`) VALUES ('Blocked');
INSERT INTO customerstatus (`status`) VALUES ('Pending');
INSERT INTO customerstatus (`status`) VALUES ('Active');
INSERT INTO customerstatus (`status`) VALUES ('On Hold');
INSERT INTO customerstatus (`status`) VALUES ('Flagged');

/*Customer*/
INSERT INTO `nbgardens`.`customer` (`firstName`, `lastName`, `DOB`, `email`, `creditRemaining`, `phoneNumber`, `customerstatus_statusId`, `Address_addressId`, `username`, `password`)
VALUES 
('King', 'Adrian Winthrop', '1961-12-21', 'WinthropKA@aol.com', '1921.31', '07432718569', 3, 5, 'KingWinthrop', '749440ec6a5039dc8c9a683c93ebc014b99cf1c1'),
('Daryl', 'Addison Hibbert', '1955-11-05', 'HibbertD55@gmail.com', '5426.21', '07752632148', 3, 4, 'HibbertHotel', 'ed23ead82f5ff0139c4f5db7503a0520074d4c9a'),
('Melville', 'Myers', '1960-08-23', 'MMyers60@live.com', '8423.31', '07623523523', 3, 5, 'TheRealMyers', '0757a065dfb9e249730930c941e9de0b2dec7a45'),
('Gyles', 'Chadwick', '1965-07-11', 'GylesChadwick@live.com', '8946.13', '01613251261', 3, 3, 'GylesChadwick', '0757a065dfb9e249730930c941e9de0b2dec7a45'),
('Kolo', 'Toure', '1970-01-03', 'KToure@gmail.com', '10000.00', '07896125412', 1, 2, 'Toure', 'd31a2229bcc9cccf64091a8612622f168ff05a83'),
('Georgei', 'Peyton', '02/06/1939', 'goodolddays1939@gmail.co.uk', '8921.89', '07975201315', '23/05/2016', '23/05/2016', 3, 1, 'olddays', '2e71777dff35158b955605a606c042e4ad0b3217'),
('Kim', 'Harlow', '29/12/1943', 'sweetsweetroyalty@gmail.com', '8991.98', '07697135336', '23/05/2016', '23/05/2016', 3, 2, 'royal1', '4dbc8c31da4ffd6e039f26f7a2707d0cd15fc563'),
('Terrence', 'Cooke', '06/11/1944', 'lobsterbisque@aol.com', '1786.56', '07850661978', '23/05/2016', '23/05/2016', 3, 3, 'bisqueisgreat11', '9a86c2a4fd81e21711e5c9ce7e03995ead892a7b'),
('Matthew', 'Hameldon', '17/01/1951', 'gloryhameldon@btinternet.com', '6534.98', '07089532432', '23/05/2016', '23/05/2016', 3, 4, 'morninggloryhameldon', '3e581f77c81e8f6bf3b98d7823f6393a01d1b880'),
('Wigheard Boniface', 'Everett', '11/09/1955', 'hearmywig@aol.co.uk', '1675.91', '07298820624', '23/05/2016', '23/05/2016', 3, 5, 'wig42', 'fa7a3966d55d6b7cc7fd89709b69e8fd82d0423e'),
('Aharon Nogah', 'Babcock', '18/02/1970', 'anogah@.gmail.co.uk', '0', '07462704357', '23/05/2016', '23/05/2016', 5, 6, 'aharon1970', 'c2072a50342594eb27cee996d3bf5239067bd3b5');

/*OrderStatus*/
INSERT INTO `nbgardens`.`orderstatus` (`orderStausId`, `status`) VALUES ('1','basket');
INSERT INTO `nbgardens`.`orderstatus` (`orderStausId`, `status`) VALUES ('2','confirmed');
INSERT INTO `nbgardens`.`orderstatus` (`orderStausId`, `status`) VALUES ('3','complete');
INSERT INTO `nbgardens`.`orderstatus` (`orderStausId`, `status`) VALUES ('4','paid');
INSERT INTO `nbgardens`.`orderstatus` (`orderStausId`, `status`) VALUES ('5','dispatched');

/*SalesOrder*/
INSERT INTO `nbgardens`.`salesorder` 
(`salesOrderID`, `vatCost`, `postageCost`, `baseCost`, `totalCost`, `dateCreated`, `dispatchDate`, `packageCost`, `discount`, `customerId`, `addressID`, `PaymentId`, `orderStatus_OrderStatusId`) 
VALUES 
('1', '3.00', '0.99', '25.00', '28.99', '2016-01-01', '2016-01-03', '0.00', '0.00', 1, 2, 3, 4);
INSERT INTO `nbgardens`.`salesorder` 
(`salesOrderID`, `vatCost`, `postageCost`, `baseCost`, `totalCost`, `dateCreated`, `dispatchDate`, `packageCost`, `discount`, `customerId`, `addressID`, `PaymentId`, `orderStatus_OrderStatusId`) 
VALUES 
('2', '2.50', '0.99', '47.00', '50.49', '2016-01-01', '2016-01-03', '0.00', '0.00', 4, 3, 2, 1);
INSERT INTO `nbgardens`.`salesorder` 
(`salesOrderID`, `vatCost`, `postageCost`, `baseCost`, `totalCost`, `dateCreated`, `dispatchDate`, `packageCost`, `discount`, `customerId`, `addressID`, `PaymentId`, `orderStatus_OrderStatusId`) 
VALUES 
('3', '2.00', '0.99', '33.67', '36.66', '2016-01-01', '2016-01-03', '0.00', '0.00', 3, 2, 4, 1);
INSERT INTO `nbgardens`.`salesorder` 
(`salesOrderID`, `vatCost`, `postageCost`, `baseCost`, `totalCost`, `dateCreated`, `dispatchDate`, `packageCost`, `discount`, `customerId`, `addressID`, `PaymentId`, `orderStatus_OrderStatusId`) 
VALUES 
('4', '1.50', '3.00', '23.12', '27.62', '2016-01-01', '2016-01-03', '0.00', '0.00', 5, 4, 1 3);
INSERT INTO `nbgardens`.`salesorder` 
(`salesOrderID`, `vatCost`, `postageCost`, `baseCost`, `totalCost`, `dateCreated`, `dispatchDate`, `packageCost`, `discount`, `customerId`, `addressID`, `PaymentId`, `orderStatus_OrderStatusId`) 
VALUES 
('5', '1.00', '2.50', '765.99', '768.99', '2016-01-01', '2016-01-03', '0.00', '0.00', 2, 3, 5, 4);

/*SalesOrderEvent*/
INSERT INTO `nbgardens`.`salesorderevent` (`orderEventID`, `dateCreated`, `dateMod`, `salesorder_SalesOrderId`, `staff_StaffId`, `event`, `notes`) VALUES ('1', '2016-01-01', '2016-01-03', 1, 5, 'C', 'Nullam placerat imperdiet libero, vitae pharetra dolor mollis vel. Vestibulum et quam justo. Proin hendrerit, nibh at rutrum mattis, lorem massa egestas dui, sagittis semper neque lacus sit amet magna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');
INSERT INTO `nbgardens`.`salesorderevent` (`orderEventID`, `dateCreated`, `dateMod`, `salesorder_SalesOrderId`, `staff_StaffId`, `event`, `notes`) VALUES ('2', '2016-01-01', '2016-01-03', 3, 4, 'U', 'Sed fringilla iaculis hendrerit. Ut lacinia iaculis enim id imperdiet. Praesent finibus gravida lectus quis blandit. Fusce commodo faucibus sem non faucibus. Integer eu sagittis turpis, gravida porta enim. Fusce commodo finibus felis, eget luctus quam blandit sit amet. Donec malesuada mollis facilisis. Nullam at elit vitae ex tempor porta in et metus. Maecenas metus nulla, sollicitudin vehicula fringilla a, suscipit eget lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer ac condimentum metus. Aliquam ut leo quis dui egestas scelerisque. In mattis arcu a lorem vulputate lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse eget ipsum urna. ');
INSERT INTO `nbgardens`.`salesorderevent` (`orderEventID`, `dateCreated`, `dateMod`, `salesorder_SalesOrderId`, `staff_StaffId`, `event`, `notes`) VALUES ('3', '2016-01-01', '2016-01-03', 2, 3, 'D', 'Morbi tincidunt, neque in interdum pretium, purus arcu aliquam ex, eu ultrices tellus augue quis velit. Mauris sodales erat eu auctor consectetur. Fusce eget velit fringilla, ultrices dolor sit amet, finibus arcu. Pellentesque tincidunt orci sit amet sapien mattis, quis lobortis sapien suscipit. Praesent rhoncus convallis fringilla. Vestibulum eu tellus felis. Praesent condimentum sollicitudin lacus commodo suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam metus nunc, facilisis quis ullamcorper et, molestie eu eros. Ut vehicula felis quis tristique laoreet. ');
INSERT INTO `nbgardens`.`salesorderevent` (`orderEventID`, `dateCreated`, `dateMod`, `salesorder_SalesOrderId`, `staff_StaffId`, `event`, `notes`) VALUES ('4', '2016-01-01', '2016-01-03', 4, 2, 'C', 'In pretium auctor auctor. Cras nec turpis at augue imperdiet finibus at vitae sapien. Integer at risus feugiat, volutpat odio vel, mattis felis. Proin ut leo lacinia, eleifend est ac, gravida nibh. Duis pulvinar velit in ante dapibus feugiat. Donec ultricies nisl vel dolor sodales rhoncus ullamcorper a tellus. Suspendisse rhoncus risus eget tincidunt rutrum. ');
INSERT INTO `nbgardens`.`salesorderevent` (`orderEventID`, `dateCreated`, `dateMod`, `salesorder_SalesOrderId`, `staff_StaffId`, `event`, `notes`) VALUES ('5', '2016-01-01', '2016-01-03', 5, 1,'U', 'Nunc vitae libero non sapien bibendum dapibus sit amet sed mi. Proin et velit condimentum, laoreet neque eleifend, cursus orci. In hac habitasse platea dictumst. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tincidunt laoreet tristique. Phasellus pellentesque, lacus id mattis sodales, metus ante congue felis, auctor sollicitudin justo quam et risus. Quisque ut hendrerit elit. Sed id ultricies tortor. In purus ex, eleifend nec mi porttitor, cursus sollicitudin enim. Donec pulvinar, massa et cursus efficitur, ligula ante aliquet nisl, et vehicula risus quam vitae neque. Donec semper tempus dui a gravida. Nulla molestie metus ex, quis tempor lacus gravida eu. Maecenas ut est mollis, euismod ligula sed, egestas augue. Morbi a tincidunt lectus.');

/*StockStatus*/
INSERT INTO stockstatus (status) VALUES ('Damaged');
INSERT INTO stockstatus (status) VALUES ('Discontinued');
INSERT INTO stockstatus (status) VALUES ('Recall');
INSERT INTO stockstatus (status) VALUES ('Active');
INSERT INTO stockstatus (status) VALUES ('Inactive');
INSERT INTO stockstatus (status) VALUES ('Embargo');

/*SupplierStatus*/
INSERT INTO supplierstatus (`status`) values ('active');

/*Stock*/
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (100, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (100, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (311, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (4, 10, 1, 1);
INSERT INTO stock (quantity, ReorderLevel, StockStatus_stockStatusId, Supplier_supplierID) VALUES (54, 10, 1, 1);

/*Product*/
INSERT INTO product (productId, ProductName, description, quantity, length, height, width, dateCreated, dateModified, stock_stockID) 
VALUES (1, 'JBGnome', 'Gnome with the likeness of our leader, Justin Bieber.', 1000, 10, 30, 10, '2005-06-01 00:00:00', '2005-06-01 00:00:00', 1);

INSERT INTO product (productId, ProductName, description, quantity, length, height, width, dateCreated, dateModified, stock_stockID) 
VALUES (2, '1DGnome', 'Harry Styles.', 1000, 10, 30, 10, '2005-06-01 00:00:00', '2005-06-01 00:00:00', 2);

INSERT INTO product (productId, ProductName, description, quantity, length, height, width, dateCreated, dateModified, stock_stockID) 
VALUES (3, 'BartlettGnome', 'Gnome with the likeness of Samuel Rhett Bartlett.', 1000, 10, 30, 10, '2005-06-01 00:00:00', '2005-06-01 00:00:00', 3);

INSERT INTO product (productId, ProductName, description, quantity, length, height, width, dateCreated, dateModified, stock_stockID) 
VALUES (4, 'SilcockGnome', 'Mad Gnome fae Wiggan', 1000, 10, 30, 10, '2005-06-01 00:00:00', '2005-06-01 00:00:00', 4);

/*Password Recovery*/
SELECT * FROM nbgardens.recoverpassword;

INSERT INTO recoverpassword (Customer_customerID, guid, expiry) VALUES (1,'asd1555frtf23', '2020-01-01 00:00:00');

INSERT INTO recoverpassword (Customer_customerID, guid, expiry) VALUES (2,'45g6yt4egef', '2020-01-01 00:00:00');

INSERT INTO recoverpassword (Customer_customerID, guid, expiry) VALUES (3,'asd1f65g7fef25', '2020-01-01 00:00:00');

INSERT INTO recoverpassword (Customer_customerID, guid, expiry) VALUES (4,'asd1g56fgtr26', '2020-01-01 00:00:00');

INSERT INTO recoverpassword (Customer_customerID, guid, expiry) VALUES (5, 'asdf54t6127', '2020-01-01 00:00:00');

/*Payment Details*/
INSERT INTO paymentdetails (cardNumber, cardHolderName, cardType, expirationDate, dateCreated, dateModified, IssueNumber, PaymentID, Customer_customerID)
VALUES ('0000111122223333', 'Mark Leitch', 'Visa Credit', '2020-01-01', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 123, 1234567891. 1);

INSERT INTO paymentdetails (cardNumber, cardHolderName, cardType, expirationDate, dateCreated, dateModified, IssueNumber, PaymentID, Customer_customerID)
VALUES ('0000111122223334', 'Chris Garland', 'Visa Credit', '2020-01-01', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 124, 1234567892. 2);

INSERT INTO paymentdetails (cardNumber, cardHolderName, cardType, expirationDate, dateCreated, dateModified, IssueNumber, PaymentID, Customer_customerID)
VALUES ('0000111122223335', 'Samuel Rhett Bartlett', 'Visa Credit', '2020-01-01', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 125, 1234567893. 3);

INSERT INTO paymentdetails (cardNumber, cardHolderName, cardType, expirationDate, dateCreated, dateModified, IssueNumber, PaymentID, Customer_customerID)
VALUES ('0000111122223336', 'Ben Stinchcombe', 'Visa Credit', '2020-01-01', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 126, 1234567894. 4);

/*PurchaseOrder*/
INSERT INTO `nbgardens`.`purchaseorder` (`purchaseOrderID`, `dateCreated`, `dispatchDate`, `baseCost`, `vatCost`, `totalCost`, `statusID`, `deliveryCost`, `discount`, `packageCost`, `supplierId`, `statusId`) VALUES ('1', '1900-01-01 00:00:00', '1900-01-01 11:00:00', '12.34', '20.0', '1230.0', '1', '10', '0', '1.99', 1, 2);
INSERT INTO `nbgardens`.`purchaseorder` (`purchaseOrderID`, `dateCreated`, `dispatchDate`, `baseCost`, `vatCost`, `totalCost`, `statusID`, `deliveryCost`, `discount`, `packageCost`, `supplierId`, `statusId`) VALUES ('2', '1900-01-01 00:00:00', '1900-01-01 11:00:00', '54.56', '20.0', '343.78', '2', '10', '0', '1.99', 2, 1);
INSERT INTO `nbgardens`.`purchaseorder` (`purchaseOrderID`, `dateCreated`, `dispatchDate`, `baseCost`, `vatCost`, `totalCost`, `statusID`, `deliveryCost`, `discount`, `packageCost`, `supplierId`, `statusId`) VALUES ('3', '1900-01-01 00:00:00', '1900-01-01 11:00:00', '34.23', '20.0', '345.98', '3', '10', '0', '1.99', 1, 3);
INSERT INTO `nbgardens`.`purchaseorder` (`purchaseOrderID`, `dateCreated`, `dispatchDate`, `baseCost`, `vatCost`, `totalCost`, `statusID`, `deliveryCost`, `discount`, `packageCost`, `supplierId`, `statusId`) VALUES ('4', '1900-01-01 00:00:00', '1900-01-01 11:00:00', '854.12', '20.0', '26.98', '4', '10', '0', '1.99', 3, 2);
INSERT INTO `nbgardens`.`purchaseorder` (`purchaseOrderID`, `dateCreated`, `dispatchDate`, `baseCost`, `vatCost`, `totalCost`, `statusID`, `deliveryCost`, `discount`, `packageCost`, `supplierId`, `statusId`) VALUES ('5', '1900-01-01 00:00:00', '1900-01-01 11:00:00', '234.93', '20.0', '245.45', '5', '10', '0', '1.99',4, 4);

/*Staff*/
insert into staff (firstname, lastname, `password`) values ('Amy', 'Stephens', '7BCtpn75G6');
insert into staff (firstname, lastname, `password`) values ('Rachel', 'Daniels', 'G0cNZiaZiR');
insert into staff (firstname, lastname, `password`) values ('Ben', 'Back', 'qzGxYcL');
insert into staff (firstname, lastname, `password`) values ('Al', 'Stock', 'TXxekyfyF');
insert into staff (firstname, lastname, `password`) values ('Ray', 'Smithy', 'Wtr4JU');

/*Events*/
INSERT INTO `EVENT` (eventName) VALUES ('Create Staff accounts');
INSERT INTO `EVENT` (eventName) VALUES ('Read Staff accounts');
INSERT INTO `EVENT` (eventName) VALUES ('Update Staff accounts');
INSERT INTO `EVENT` (eventName) VALUES ('Delete Staff accounts');
INSERT INTO `EVENT` (eventName) VALUES ('CRUD Staff accounts');
INSERT INTO `EVENT` (eventName) VALUES ('Create Customer accounts');
INSERT INTO `EVENT` (eventName) VALUES ('Read Customer accounts');
INSERT INTO `EVENT` (eventName) VALUES ('Update Customer accounts');
INSERT INTO `EVENT` (eventName) VALUES ('Delete Customer accounts');
INSERT INTO `EVENT` (eventName) VALUES ('CRUD Customer accounts');
INSERT INTO `EVENT` (eventName) VALUES ('Create Stock');
INSERT INTO `EVENT` (eventName) VALUES ('Read Stock');
INSERT INTO `EVENT` (eventName) VALUES ('Update Stock');
INSERT INTO `EVENT` (eventName) VALUES ('Delete Stock');
INSERT INTO `EVENT` (eventName) VALUES ('CRUD Stock');
INSERT INTO `EVENT` (eventName) VALUES ('Create Products');
INSERT INTO `EVENT` (eventName) VALUES ('Read Products');
INSERT INTO `EVENT` (eventName) VALUES ('Update Products');
INSERT INTO `EVENT` (eventName) VALUES ('Delete Products');
INSERT INTO `EVENT` (eventName) VALUES ('CRUD Products');
INSERT INTO `EVENT` (eventName) VALUES ('Create Supplier');
INSERT INTO `EVENT` (eventName) VALUES ('Read Supplier');
INSERT INTO `EVENT` (eventName) VALUES ('Update Supplier');
INSERT INTO `EVENT` (eventName) VALUES ('Delete Supplier');
INSERT INTO `EVENT` (eventName) VALUES ('CRUD Supplier');
INSERT INTO `EVENT` (eventName) VALUES ('Create Purchase order');
INSERT INTO `EVENT` (eventName) VALUES ('Read Purchase order');
INSERT INTO `EVENT` (eventName) VALUES ('Update Purchase order');
INSERT INTO `EVENT` (eventName) VALUES ('Delete Purchase order');
INSERT INTO `EVENT` (eventName) VALUES ('CRUD Purchase order');
INSERT INTO `EVENT` (eventName) VALUES ('Create Sales order');
INSERT INTO `EVENT` (eventName) VALUES ('Read Sales order');
INSERT INTO `EVENT` (eventName) VALUES ('Update Sales order');
INSERT INTO `EVENT` (eventName) VALUES ('Delete Sales order');
INSERT INTO `EVENT` (eventName) VALUES ('CRUD Sales order');
INSERT INTO `EVENT` (eventName) VALUES ('Create Event');
INSERT INTO `EVENT` (eventName) VALUES ('Read Event');
INSERT INTO `EVENT` (eventName) VALUES ('Update Event');
INSERT INTO `EVENT` (eventName) VALUES ('Delete Event');
INSERT INTO `EVENT` (eventName) VALUES ('CRUD Event');
INSERT INTO `EVENT` (eventName) VALUES ('Create Roles');
INSERT INTO `EVENT` (eventName) VALUES ('Read Roles');
INSERT INTO `EVENT` (eventName) VALUES ('Update Roles');
INSERT INTO `EVENT` (eventName) VALUES ('Delete Roles');
INSERT INTO `EVENT` (eventName) VALUES ('CRUD Roles');
INSERT INTO `EVENT` (eventName) VALUES ('Credit Checks');

/*Role*/
INSERT INTO role (roleName) Values ('Inventory Manager');
INSERT INTO role (roleName) Values ('Sales manager');
INSERT INTO role (roleName) Values ('Sales employee');
INSERT INTO role (roleName) Values ('Warehouse employee');
INSERT INTO role (roleName) Values ('Accounts employee');
INSERT INTO role (roleName) Values ('Warehouse senior employee');
INSERT INTO role (roleName) Values ('Supermanager');
 
 /*StaffRoleLink*/
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (2, 1);
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (5, 2);
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (6, 3);
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (6, 4);
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (1, 4);
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (3, 5);

/*RoleEventLink*/
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (1, 15);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (1, 20);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (1, 25);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (1, 30);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (3, 6);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (3, 7);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (3, 8);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (2, 10);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (4,12);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (4,17);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (4,33);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (5, 10);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (6, 7);
INSERT INTO roleeventlink (Role_roleId, Event_eventId) VALUES (7, 7);

/*SalesReturns*/
INSERT INTO `nbgardens`.`salesreturns` (`returnID`, `quantity`, `returnDate`, `returnReason`, `dateCreated`, `dateMod`, `salesOrderLine_orderLineId`) VALUES ('1', '1', '2016-01-16', 'Mauris euismod sem vitae arcu ornare laoreet.', '1952-01-01', '1874-03-04', 1);
INSERT INTO `nbgardens`.`salesreturns` (`returnID`, `quantity`, `returnDate`, `returnReason`, `dateCreated`, `dateMod`, `salesOrderLine_orderLineId`) VALUES ('2', '1', '2016-01-17', 'Mauris euismod sem vitae arcu ornare laoreet.', '1952-01-01', '1874-03-04', 2);
INSERT INTO `nbgardens`.`salesreturns` (`returnID`, `quantity`, `returnDate`, `returnReason`, `dateCreated`, `dateMod`, `salesOrderLine_orderLineId`) VALUES ('3', '1', '2016-01-18', 'Mauris euismod sem vitae arcu ornare laoreet.', '1952-01-01', '1874-03-04', 3);
INSERT INTO `nbgardens`.`salesreturns` (`returnID`, `quantity`, `returnDate`, `returnReason`, `dateCreated`, `dateMod`, `salesOrderLine_orderLineId`) VALUES ('4', '1', '2016-01-19', 'Mauris euismod sem vitae arcu ornare laoreet.', '1952-01-01', '1874-03-04', 4);
INSERT INTO `nbgardens`.`salesreturns` (`returnID`, `quantity`, `returnDate`, `returnReason`, `dateCreated`, `dateMod`, `salesOrderLine_orderLineId`) VALUES ('5', '1', '2016-01-11', 'Mauris euismod sem vitae arcu ornare laoreet.', '1952-01-01', '1874-03-04', 5);

/*OrderLine*/
INSERT INTO `nbgardens`.`orderline` (`productId`, `quantity`, `orderId`, `totalCost`, `dateCreated`) VALUES (1, 1, 1, 12.99, '2015-01-01');
INSERT INTO `nbgardens`.`orderline` (`productId`, `quantity`, `orderId`, `totalCost`, `dateCreated`) VALUES (2, 1, 2, 3.00, '2015-01-01');
INSERT INTO `nbgardens`.`orderline` (`productId`, `quantity`, `orderId`, `totalCost`, `dateCreated`) VALUES (3, 1, 3, 99.00, '2015-01-01');
INSERT INTO `nbgardens`.`orderline` (`productId`, `quantity`, `orderId`, `totalCost`, `dateCreated`) VALUES (4, 1, 4, 120.00, '2015-01-01');
INSERT INTO `nbgardens`.`orderline` (`productId`, `quantity`, `orderId`, `totalCost`, `dateCreated`) VALUES (5, 1, 5, 50.00, '2015-01-01');

