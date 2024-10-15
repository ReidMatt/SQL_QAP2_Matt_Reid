-- Database: QAP_2_SQL_Problem_2_Matt Reid

-- DROP DATABASE IF EXISTS "QAP_2_SQL_Problem_2_Matt Reid";

CREATE DATABASE "QAP_2_SQL_Problem_2_Matt Reid"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;



CREATE TABLE products (
id SERIAL Primary KEY,
product_name VARCHAR(100),
price DECIMAL(10, 2),
stock_quantity INT
);

CREATE TABLE customers (
id SERIAL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100)
);

CREATE TABLE orders (
id SERIAL PRIMARY KEY,
customer_id INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
order_id INT,
product_id INT,
quantity INT,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (product_id) REFERENCES products (id)
);

INSERT INTO products (product_name, price, stock_quantity)
VALUES
('Laptop', 1000.00, 10),
('Headphone', 150.00, 25),
('Mouse', 25.00, 50),
('Keyboard', 45.00, 30),
('Monitor', 300.00, 15);

INSERT INTO customers (first_name, last_name, email)
VALUES
('Jim', 'Hare', 'jim.hare@test.com'),
('Jody', 'Race', 'jody.race@test.com'),
('Lorne', 'Reid', 'lorne.reid@test.com'),
('Emily', 'Miller', 'emily.miller@test.com');

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2024-10-10'),
(2, '2024-10-11'),
(1, '2024-10-12'),
(3, '2024-10-13'),
(4, '2024-10-14');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1,1,1),
(1,2,2),
(2,3,1),
(2,4,1),
(3,5,1),
(3,1,1),
(4,2,3),
(4,4,2),
(5,3,1),
(5,5,1);

SELECT product_name, stock_quantity
FROM products;

SELECT product.product_name, order_item.quantity
FROM order_items order_item
INNER JOIN products product ON order_item.product_id = product.id
WHERE order_item.order_id = 1;

SELECT orders.id AS order_id, order_items.product_id, order_items.quantity
FROM orders orders
INNER JOIN order_items order_items ON orders.id = order_items.order_id
WHERE orders.customer_id = 1;

SELECT product_id, quantity
FROM order_items
WHERE order_id = 1;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE id = 1;

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE id = 2;

DELETE FROM order_items
WHERE order_id = 1;

DELETE FROM orders
WHERE id = 1;





	

COMMENT ON DATABASE "QAP_2_SQL_Problem_2_Matt Reid"
    IS 'Develop a system to  manage  products, customers and orders for online store.';