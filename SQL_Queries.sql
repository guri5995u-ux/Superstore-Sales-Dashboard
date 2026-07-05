CREATE TABLE sales (
    row_id INT,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales NUMERIC(10,2),
    quantity INT,
    discount NUMERIC(5,2),
    profit NUMERIC(10,2)
);

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'sales'
ORDER BY ordinal_position;

SELECT COUNT(*) AS total_rows
FROM sales;

--Total Sales by Region
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

--Profit by Category
SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

--Monthly Sales Trend
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;
