--1. Achieving 1NF 
USE nelson;
-- Creating Tables for 1NF
CREATE TABLE orders(
orderId INT PRIMARY KEY,
customerName VARCHAR(200)
);
CREATE TABLE products(
orderId INT,
productName VARCHAR(200),
FOREIGN KEY (orderId) REFERENCES orders(orderId)
);
-- Inserting values for 1NF 
INSERT INTO orders(orderId, customerName)
VALUES	(101, 'John Doe'),
		(102, 'Jane Smith'),
		(103, 'Emily Clerk');
        
INSERT INTO products(orderId, productName)
VALUES (101, 'laptop'),
		(101, 'mouse'),
        (102, 'tablet'),
        (102, 'keyboard'),
        (102, 'mouse'),
        (103, 'phone');


--2.  Achieving 2NF
USE nelson;
CREATE TABLE OrdersTable (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- OrderDetails table (each product belongs to an order)
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES OrdersTable(OrderID)
);

-- Inserting Values iNTO orders Table
INSERT INTO OrdersTable (OrderID, CustomerName)
VALUES (101, 'John Doe'),
		(102, 'Jane Smith'),
        (103, 'Emily Clerk');
        
-- Inserting values into order details table
INSERT INTO OrderDetails (OrderID, Product, Quantity)
VALUES (101, 'Laptop', 2),
		(101, 'Mouse', 1),
        (102, 'Tablet', 3),
        (102, 'Keyboard', 1),
        (102, 'Mouse', 2),
        (103, 'Phone', 1);
