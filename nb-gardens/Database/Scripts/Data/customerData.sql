USE nbgardens;

ALTER TABLE customer DROP COLUMN status;
INSERT INTO `nbgardens`.`customer` (`firstName`, `lastName`, `DOB`, `email`, `creditRemaining`, `phoneNumber`, `customerstatus_statusId`, `Address_addressId`, `username`, `password`)
VALUES 
<<<<<<< HEAD:nb-gardens/Database/Scripts/customerDataSam.sql
('Georgei', 'Peyton', '02/06/1939', 'goodolddays1939@gmail.co.uk', 8921.89, '07975201315', '23/05/2016', '23/05/2016', 3, 1, 'olddays', '2e71777dff35158b955605a606c042e4ad0b3217'),
('Kim', 'Harlow', '29/12/1943', 'sweetsweetroyalty@gmail.com', 8991.98, '07697135336', '23/05/2016', '23/05/2016', 3, 2, 'royal1', '4dbc8c31da4ffd6e039f26f7a2707d0cd15fc563'),
('Terrence', 'Cooke', '06/11/1944', 'lobsterbisque@aol.com', 1786.56, '07850661978', '23/05/2016', '23/05/2016', 3, 3, 'bisqueisgreat11', '9a86c2a4fd81e21711e5c9ce7e03995ead892a7b'),
('Matthew', 'Hameldon', '17/01/1951', 'gloryhameldon@btinternet.com', 6534.98, '07089532432', '23/05/2016', '23/05/2016', 3, 4, 'morninggloryhameldon', '3e581f77c81e8f6bf3b98d7823f6393a01d1b880'),
('Wigheard Boniface', 'Everett', '11/09/1955', 'hearmywig@aol.co.uk', 1675.91, '07298820624', '23/05/2016', '23/05/2016', 3, 5, 'wig42', 'fa7a3966d55d6b7cc7fd89709b69e8fd82d0423e'),
('Aharon Nogah', 'Babcock', '18/02/1970', 'anogah@.gmail.co.uk', '0', 07462704357, '23/05/2016', '23/05/2016', 5, 6, 'aharon1970', 'c2072a50342594eb27cee996d3bf5239067bd3b5');
=======
('King', 'Adrian Winthrop', '1961-12-21', 'WinthropKA@aol.com', '1921.31', '07432718569', 3, 7, 'KingWinthrop', '749440ec6a5039dc8c9a683c93ebc014b99cf1c1'),
('Daryl', 'Addison Hibbert', '1955-11-05', 'HibbertD55@gmail.com', '5426.21', '07752632148', 3, 8, 'HibbertHotel', 'ed23ead82f5ff0139c4f5db7503a0520074d4c9a'),
('Melville', 'Myers', '1960-08-23', 'MMyers60@live.com', '8423.31', '07623523523', 3, 9, 'TheRealMyers', '0757a065dfb9e249730930c941e9de0b2dec7a45'),
('Gyles', 'Chadwick', '1965-07-11', 'GylesChadwick@live.com', '8946.13', '01613251261', 3, 10, 'GylesChadwick', '0757a065dfb9e249730930c941e9de0b2dec7a45'),
('Kolo', 'Toure', '1970-01-03', 'KToure@gmail.com', '10000.00', '07896125412', 1, 11, 'Toure', 'd31a2229bcc9cccf64091a8612622f168ff05a83'),
('Georgei', 'Peyton', '02/06/1939', 'goodolddays1939@gmail.co.uk', '8921.89', '07975201315', '23/05/2016', '23/05/2016', '3', '1', 'olddays', '2e71777dff35158b955605a606c042e4ad0b3217'),
('Kim', 'Harlow', '29/12/1943', 'sweetsweetroyalty@gmail.com', '8991.98', '07697135336', '23/05/2016', '23/05/2016', '3', '2', 'royal1', '4dbc8c31da4ffd6e039f26f7a2707d0cd15fc563'),
('Terrence', 'Cooke', '06/11/1944', 'lobsterbisque@aol.com', '1786.56', '07850661978', '23/05/2016', '23/05/2016', '3', '3', 'bisqueisgreat11', '9a86c2a4fd81e21711e5c9ce7e03995ead892a7b'),
('Matthew', 'Hameldon', '17/01/1951', 'gloryhameldon@btinternet.com', '6534.98', '07089532432', '23/05/2016', '23/05/2016', '3', '4', 'morninggloryhameldon', '3e581f77c81e8f6bf3b98d7823f6393a01d1b880'),
('Wigheard Boniface', 'Everett', '11/09/1955', 'hearmywig@aol.co.uk', '1675.91', '07298820624', '23/05/2016', '23/05/2016', '3', '5', 'wig42', 'fa7a3966d55d6b7cc7fd89709b69e8fd82d0423e'),
('Aharon Nogah', 'Babcock', '18/02/1970', 'anogah@.gmail.co.uk', '0', '07462704357', '23/05/2016', '23/05/2016', '5', '6', 'aharon1970', 'c2072a50342594eb27cee996d3bf5239067bd3b5');
>>>>>>> 52397e48efbb7feb7db1b4f2a02f9e334bb977d4:nb-gardens/Database/Scripts/Data/customerData.sql
