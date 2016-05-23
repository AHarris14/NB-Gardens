/*Staff*/
insert into staff (firstname, lastname, `password`) values ('Amy', 'Stephens', '7BCtpn75G6');
insert into staff (firstname, lastname, `password`) values ('Rachel', 'Daniels', 'G0cNZiaZiR');
insert into staff (firstname, lastname, `password`) values ('Ben', 'Back', 'qzGxYcL');
insert into staff (firstname, lastname, `password`) values ('Al', 'Stock', 'TXxekyfyF');
insert into staff (firstname, lastname, `password`) values ('Ray', 'Smithy', 'Wtr4JU');

/*Credit Checks*/
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
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (6, 5);
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (6, 6);
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (1, 6);
INSERT INTO STAFFROLELINK (Role_roleId, staff_staffID) VALUES (3, 7);

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
