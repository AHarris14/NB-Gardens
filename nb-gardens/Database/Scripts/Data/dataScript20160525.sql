<<<<<<< HEAD
/*purchaseOrderLog*/
INSERT INTO puchaseOrderLog (staff_staffID, purchaseorder_purchaseOrderID, eventName) VALUES (1,1, 'created');
INSERT INTO puchaseOrderLog (staff_staffID, purchaseorder_purchaseOrderID, eventName) VALUES (2,6, 'orderline adder');
INSERT INTO puchaseOrderLog (staff_staffID, purchaseorder_purchaseOrderID, eventName) VALUES (3,3, 'orderline deleted');
INSERT INTO puchaseOrderLog (staff_staffID, purchaseorder_purchaseOrderID, eventName) VALUES (4,4, 'orderline quantity changed');
INSERT INTO puchaseOrderLog (staff_staffID, purchaseorder_purchaseOrderID, eventName) VALUES (5,5, 'orderline product changed');

/*stocklog*/
INSERT INTO stocklog (staff_staffId, `event`, stock_stockId) VALUES (1, 'new supplier',1);
INSERT INTO stocklog (staff_staffId, `event`, stock_stockId) VALUES (2,'arrived',3);
INSERT INTO stocklog (staff_staffId, `event`, stock_stockId) VALUES (3, 'live',4);
INSERT INTO stocklog (staff_staffId, `event`, stock_stockId) VALUES (4, 'suspended',5);
INSERT INTO stocklog (staff_staffId, `event`, stock_stockId) VALUES (5,'damaged 2 units',2);

/*PurchaseOrderLine*/
INSERT INTO purchaseorderline (`quantity`, `totalCost`, `purchaseorder_purchaseOrderID`, `product_productID`) values (4, 88.80, 1, 1);
INSERT INTO purchaseorderline (`quantity`, `totalCost`, `purchaseorder_purchaseOrderID`, `product_productID`) values (13, 0.13, 2, 2);
INSERT INTO purchaseorderline (`quantity`, `totalCost`, `purchaseorder_purchaseOrderID`, `product_productID`) values (7, 863.52, 3, 3);
INSERT INTO purchaseorderline (`quantity`, `totalCost`, `purchaseorder_purchaseOrderID`, `product_productID`) values (3, 110.94, 4, 4);
INSERT INTO purchaseorderline (`quantity`, `totalCost`, `purchaseorder_purchaseOrderID`, `product_productID`) values (2, 0.02, 5, 2);
INSERT INTO purchaseorderline (`quantity`, `totalCost`, `purchaseorder_purchaseOrderID`, `product_productID`) values (1, 123.36, 5, 3);

/*PurchaseReturns*/
INSERT INTO purchasereturns (quantity, returnDate, returnReason, purchaseOrderLine_orderLineId) VALUES (1, NOW(), 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae ab voluptatibus et voluptates ea aut.', 1);
INSERT INTO purchasereturns (quantity, returnDate, returnReason, purchaseOrderLine_orderLineId) VALUES (1, NOW(), 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae ab voluptatibus et voluptates ea aut.', 2);
INSERT INTO purchasereturns (quantity, returnDate, returnReason, purchaseOrderLine_orderLineId) VALUES (1, NOW(), 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae ab voluptatibus et voluptates ea aut.', 3);

/*add 5 wishlists*/
INSERT INTO wishlist (customer_customerId) VALUES (1);
INSERT INTO wishlist (customer_customerId) VALUES (2);
INSERT INTO wishlist (customer_customerId) VALUES (3);
INSERT INTO wishlist (customer_customerId) VALUES (4);
INSERT INTO wishlist (customer_customerId) VALUES (5);

/*add 5 wish list items to each wish list*/
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (1,1);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (3,1);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (4,1);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (5,1);

INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (1,2);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (3,2);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (4,2);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (5,2);

INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (1,3);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (3,3);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (4,3);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (5,3);

INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (1,4);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (3,4);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (4,4);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (5,4);

INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (1,5);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (3,5);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (4,5);
INSERT INTO wishlistitem (Product_productID, Wishlist_wishlistID) VALUES (5,5);

