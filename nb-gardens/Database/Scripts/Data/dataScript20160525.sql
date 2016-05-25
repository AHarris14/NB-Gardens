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
