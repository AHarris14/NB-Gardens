<<<<<<< HEAD
USE nbgardens;

ALTER TABLE customer DROP COLUMN status;
INSERT INTO `nbgardens`.`customer` (`firstName`, `lastName`, `DOB`, `email`, `creditRemaining`, `phoneNumber`, `customerstatus_statusId`, `Address_addressId`, `username`, `password`)
VALUES 
('King', 'Adrian Winthrop', '1961-12-21', 'WinthropKA@aol.com', '1921.31', '07432718569', 3, 7, 'KingWinthrop', '749440ec6a5039dc8c9a683c93ebc014b99cf1c1'),
('Daryl', 'Addison Hibbert', '1955-11-05', 'HibbertD55@gmail.com', '5426.21', '07752632148', 3, 8, 'HibbertHotel', 'ed23ead82f5ff0139c4f5db7503a0520074d4c9a'),
('Melville', 'Myers', '1960-08-23', 'MMyers60@live.com', '8423.31', '07623523523', 3, 9, 'TheRealMyers', '0757a065dfb9e249730930c941e9de0b2dec7a45'),
('Gyles', 'Chadwick', '1965-07-11', 'GylesChadwick@live.com', '8946.13', '01613251261', 3, 10, 'GylesChadwick', '0757a065dfb9e249730930c941e9de0b2dec7a45'),
('Kolo', 'Toure', '1970-01-03', 'KToure@gmail.com', '10000.00', '07896125412', 1, 11, 'Toure', 'd31a2229bcc9cccf64091a8612622f168ff05a83');
=======
INSERT INTO `nbgardens`.`customer` (`firstName`, `lastName`, `DOB`, `email`, `creditRemaining`, `status`, `phoneNumber`, `dateCreated`, `dateModified`, `customerstatus_statusId`, `Address_addressId`, `username`, `password`)
VALUES 
('Georgei', 'Peyton', `02/06/1939`, `goodolddays1939@gmail.co.uk`, '8921.89', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Kim', 'Harlow', `29/12/1943`, `sweetsweetroyalty@gmail.com`, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Terrence', 'Cooke', `06/11/1944`, `lobsterbisque@aol.com`, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
('Matthew', 'Hameldon', `17/01/1951`, `gloryhameldon@btinternet.com`, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
('Wigheard Boniface', 'Everett', `11/09/1955`, , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
('Aharon Nogah', 'Babcock', `18/02/1970`, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
>>>>>>> db1d4763bbc382bc8f1167a17a66c519047e2a76
