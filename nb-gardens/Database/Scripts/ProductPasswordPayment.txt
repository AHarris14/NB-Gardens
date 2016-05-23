//Product queries

SELECT * FROM nbgardens.product;

INSERT INTO product (productId, ProductName, description, quantity, length, height, width, dateCreated, dateModified, stock_stockID) 
VALUES (1, 'JBGnome', 'Gnome with the likeness of our leader, Justin Bieber.', 1000, 10, 30, 10, '2005-06-01 00:00:00', '2005-06-01 00:00:00', 1);

INSERT INTO product (productId, ProductName, description, quantity, length, height, width, dateCreated, dateModified, stock_stockID) 
VALUES (2, '1DGnome', 'Harry Styles.', 1000, 10, 30, 10, '2005-06-01 00:00:00', '2005-06-01 00:00:00', 2);

INSERT INTO product (productId, ProductName, description, quantity, length, height, width, dateCreated, dateModified, stock_stockID) 
VALUES (3, 'BartlettGnome', 'Gnome with the likeness of Samuel Rhett Bartlett.', 1000, 10, 30, 10, '2005-06-01 00:00:00', '2005-06-01 00:00:00', 3);

INSERT INTO product (productId, ProductName, description, quantity, length, height, width, dateCreated, dateModified, stock_stockID) 
VALUES (4, 'SilcockGnome', 'Mad Gnome fae Wiggan', 1000, 10, 30, 10, '2005-06-01 00:00:00', '2005-06-01 00:00:00', 4);

INSERT INTO product (productId, ProductName, description, quantity, length, height, width, dateCreated, dateModified, stock_stockID) 
VALUES (5, 'JBGnome', 'Gnome with the likeness of our leader, Justin Bieber.', 1000, 10, 30, 10, '2005-06-01 00:00:00', '2005-06-01 00:00:00', 5);

//Password Recovery

SELECT * FROM nbgardens.recoverpassword;

INSERT INTO roverpassword (Customer_customerID, guid, expiry) VALUES (1,'asd123', '2020-01-01 00:00:00');

INSERT INTO roverpassword (Customer_customerID, guid, expiry) VALUES (2,'asd124', '2020-01-01 00:00:00');

INSERT INTO roverpassword (Customer_customerID, guid, expiry) VALUES (3,'asd125', '2020-01-01 00:00:00');

INSERT INTO roverpassword (Customer_customerID, guid, expiry) VALUES (4,'asd126', '2020-01-01 00:00:00');

INSERT INTO roverpassword (Customer_customerID, guid, expiry) VALUES (5,1, 'asd127', '2020-01-01 00:00:00');

//Payment Details
INSERT INTO paymentdetails (cardNumber, cardHolderName, cardType, expirationDate, dateCreated, dateModified, IssueNumber, PaymentID, Customer_customerID)
VALUES ('0000111122223333', 'Mark Leitch', 'Visa Credit', '2020-01-01', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 123, 1234567891. 1);

INSERT INTO paymentdetails (cardNumber, cardHolderName, cardType, expirationDate, dateCreated, dateModified, IssueNumber, PaymentID, Customer_customerID)
VALUES ('0000111122223334', 'Chris Garland', 'Visa Credit', '2020-01-01', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 124, 1234567892. 2);

INSERT INTO paymentdetails (cardNumber, cardHolderName, cardType, expirationDate, dateCreated, dateModified, IssueNumber, PaymentID, Customer_customerID)
VALUES ('0000111122223335', 'Samuel Rhett Bartlett', 'Visa Credit', '2020-01-01', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 125, 1234567893. 3);

INSERT INTO paymentdetails (cardNumber, cardHolderName, cardType, expirationDate, dateCreated, dateModified, IssueNumber, PaymentID, Customer_customerID)
VALUES ('0000111122223336', 'Ben Stinchcombe', 'Visa Credit', '2020-01-01', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 126, 1234567894. 4);

INSERT INTO paymentdetails (cardNumber, cardHolderName, cardType, expirationDate, dateCreated, dateModified, IssueNumber, PaymentID, Customer_customerID)
VALUES ('0000111122223337', 'Euan Johnston', 'Visa Credit', '2020-01-01', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 127, 1234567895. 5);

