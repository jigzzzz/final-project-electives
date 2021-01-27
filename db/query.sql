CREATE DATABASE food_oms;
USE food_oms;

CREATE TABLE Customers (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE Categories (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Orders (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    total_order INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Items (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE OrderDetails (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,	
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    item_id INT NOT NULL,
    FOREIGN KEY (item_id) REFERENCES Items(id),
    qty INT NOT NULL
);


INSERT INTO Customers (name, phone_number) VALUES('Ariana', '021635287');
INSERT INTO Customers (name, phone_number) VALUES('Jack', '021982317');
INSERT INTO Customers (name, phone_number) VALUES('Johnson', '021746426');
INSERT INTO Customers (name, phone_number) VALUES('Veronica', '021853481');
INSERT INTO Customers (name, phone_number) VALUES('Adam', '021972351');

INSERT INTO Categories (name) VALUES ('Main Course');
INSERT INTO Categories (name) VALUES ('Dessert');
INSERT INTO Categories (name) VALUES ('Appetizer');

INSERT INTO Orders (order_date, total_order, customer_id) VALUES (NOW(), 35, 1);
INSERT INTO Orders (order_date, total_order, customer_id) VALUES (NOW(), 50, 2);
INSERT INTO Orders (order_date, total_order, customer_id) VALUES (NOW(), 15, 3);
INSERT INTO Orders (order_date, total_order, customer_id) VALUES (NOW(), 20, 4);
INSERT INTO Orders (order_date, total_order, customer_id) VALUES (NOW(), 10, 5);
INSERT INTO Orders (order_date, total_order, customer_id) VALUES (NOW(), 15, 5);

INSERT INTO Items (name, price, category_id) VALUES ('Pudding', 10, 2);
INSERT INTO Items (name, price, category_id) VALUES ('Ice Cream', 5, 2);
INSERT INTO Items (name, price, category_id) VALUES ('Pasta', 20, 1);
INSERT INTO Items (name, price, category_id) VALUES ('Kebab', 15, 3);
INSERT INTO Items (name, price, category_id) VALUES ('Chicken Steak', 30, 1);

-- Ariani $35
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (1, 1, 1);
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (1, 2, 1);
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (1, 3, 1);

-- Jack $50
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (2, 2, 1);
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (2, 4, 1);
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (2, 5, 1);

-- Johnson $15
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (3, 4, 1);

-- Veronica $20
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (4, 3, 1);

-- Adam $10
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (5, 2, 2);
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (6, 1, 1);
INSERT INTO OrderDetails (order_id, item_id, qty) VALUES (6, 2, 1);

