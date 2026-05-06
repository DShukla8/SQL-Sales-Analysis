-- Database Setup: Sales Project
-- Creates Tables and Inserts sample data

-- Create Database

CREATE DATABASE sales_project;
USE sales_project;

-- 1. Create Tables

CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
	name VARCHAR (100),
	region VARCHAR (100)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
	product_name VARCHAR (100),
	category VARCHAR (100),
	price DECIMAL (10,2)
    );

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
    );
    
-- 2. Insert Sample Data

INSERT INTO customers (customer_id, name, region) VALUES
(1, 'Aarti', 'North'),
(2, 'Rahul', 'West'),
(3, 'Sneha', 'South'),
(4, 'Amit', 'East'),
(5, 'Neha', 'North');

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Phone', 'Electronics', 20000),
(103, 'Shoes', 'Fashion', 3000),
(104, 'Watch', 'Accessories', 2000),
(105, 'Bag', 'Fashion', 1500);

INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1, 1, 101, 1, '2025-01-10'),
(2, 2, 102, 2, '2025-01-15'),
(3, 3, 103, 3, '2025-02-01'),
(4, 1, 104, 2, '2025-02-10'),
(5, 4, 105, 1, '2025-03-05'),
(6, 5, 101, 1, '2025-03-15'),
(7, 2, 103, 2, '2025-04-01');

