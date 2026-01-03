-- Create Database
CREATE DATABASE ConsumerAnalytics;
GO

USE ConsumerAnalytics;
GO

--------------------------------------------------
-- Customers Table
--------------------------------------------------
CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

--------------------------------------------------
-- Categories Table
--------------------------------------------------
CREATE TABLE categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(50)
);

--------------------------------------------------
-- Products Table
--------------------------------------------------
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

--------------------------------------------------
-- Transactions Table
--------------------------------------------------
CREATE TABLE transactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    transaction_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--------------------------------------------------
-- Insert Categories
--------------------------------------------------
INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Clothing'),
('Groceries'),
('Home & Kitchen');

--------------------------------------------------
-- Insert Products
--------------------------------------------------
INSERT INTO products (product_name, category_id, price)
VALUES
('Smartphone', 1, 700),
('Laptop', 1, 1200),
('T-Shirt', 2, 25),
('Jeans', 2, 50),
('Rice', 3, 40),
('Cooking Oil', 3, 15),
('Blender', 4, 80),
('Microwave', 4, 150);

--------------------------------------------------
-- Insert Customers
--------------------------------------------------
INSERT INTO customers (customer_name, country, age, gender)
VALUES
('Alice', 'USA', 28, 'Female'),
('Bob', 'UK', 35, 'Male'),
('Charlie', 'India', 22, 'Male'),
('Diana', 'Canada', 40, 'Female'),
('Ethan', 'Australia', 30, 'Male');

--------------------------------------------------
-- Insert Transactions
--------------------------------------------------
INSERT INTO transactions (customer_id, product_id, quantity, transaction_date)
VALUES
(1, 1, 1, GETDATE()-10),
(2, 3, 2, GETDATE()-9),
(3, 5, 5, GETDATE()-8),
(4, 2, 1, GETDATE()-7),
(5, 4, 2, GETDATE()-6),
(1, 6, 3, GETDATE()-5),
(2, 7, 1, GETDATE()-4),
(3, 8, 1, GETDATE()-3),
(4, 1, 1, GETDATE()-2),
(5, 5, 2, GETDATE()-1);
