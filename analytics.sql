USE ecommerce_dw;

-- 1. Total revenue
SELECT SUM(total_amount) AS total_revenue
FROM fact_sales;

-- 2. Revenue by category
SELECT category, SUM(total_amount) AS revenue
FROM fact_sales
GROUP BY category
ORDER BY revenue DESC;

-- 3. Top products by revenue
SELECT product, SUM(total_amount) AS revenue
FROM fact_sales
GROUP BY product
ORDER BY revenue DESC;

-- 4. City-wise sales
SELECT city, SUM(total_amount) AS revenue
FROM fact_sales
GROUP BY city
ORDER BY revenue DESC;

-- 5. Monthly trend
SELECT DATE(order_date) AS date, SUM(total_amount) AS revenue
FROM fact_sales
GROUP BY date
ORDER BY date;
