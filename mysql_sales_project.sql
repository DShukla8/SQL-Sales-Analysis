-- Sales Data Analysis using MySQL
USE sales_project;

-- Description: SQL queries to analyze sales performance, customer behavior, and product trends

-- 1. TOTAL SALES REVENUE
-- Calculates total revenue generated from all sales transactions

SELECT SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- 2. TOP CUSTOMERS BY SPENDING
-- This query identifies customers who have spent the highest amount on purchases 

 SELECT c.name, SUM(p.price * o.quantity) AS total_spent
 FROM orders o
 JOIN customers c ON o.customer_id = c.customer_id
 JOIN products p ON o.product_id = p.product_id
 GROUP BY c.name
 ORDER BY total_spent DESC;

-- 3. BEST-SELLING PRODUCT
-- Determines the product with the highest quantity sold

SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- 4. MONTHLY SALES TREND
-- Analyzes revenue trends over months to identify sales patterns

SELECT MONTH(order_date) AS month, SUM(p.price * o.quantity) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- 5. REVENUE BY REGION
-- Calculates total revenue generated from each region to compare regional performance

SELECT c.region, SUM(p.price * o.quantity) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.region
ORDER BY revenue DESC;

-- 6. AVERAGE ORDER VALUE
-- Calculates average order value of each order to understand customer spending behavior

SELECT AVG(order_total) AS avg_order_value
FROM (
	SELECT SUM(p.price * o.quantity) AS order_total
    FROM orders o
	JOIN products p ON o.product_id = p.product_id
GROUP BY o.order_id
) AS temp;

-- 7. CUSTOMERS WITH NO RECENT ORDERS
-- Finds inactive customers who have not made recent purchases

SELECT name 
FROM customers
WHERE customer_id NOT IN (
	SELECT customer_id 
    FROM ORDERS
    WHERE order_date >= '2025-03-01'
);    

 