CREATE DATABASE IF NOT EXISTS ecommerce_dw;
USE ecommerce_dw;

-- FACT TABLE
CREATE TABLE fact_sales (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    city VARCHAR(50)
);
