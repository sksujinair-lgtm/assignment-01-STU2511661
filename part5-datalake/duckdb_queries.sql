-- DuckDB Cross-Format Queries
-- All queries read directly from raw files (no pre-loading into tables)

-- Q1: List all customers along with the total number of orders they have placed
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('customers.csv') AS c
LEFT JOIN read_csv_auto('orders_flat.csv') AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;

-- Q2: Find the top 3 customers by total order value
SELECT
    customer_id,
    customer_name,
    SUM(unit_price * quantity) AS total_order_value
FROM read_csv_auto('orders_flat.csv')
GROUP BY customer_id, customer_name
ORDER BY total_order_value DESC
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore
SELECT DISTINCT
    o.product_id,
    o.product_name,
    o.category
FROM read_csv_auto('orders_flat.csv') AS o
WHERE o.customer_city = 'Bangalore';

-- Q4: Join all three files to show: customer name, order date, product name, and quantity
SELECT
    c.name             AS customer_name,
    o.order_date,
    p.product_name,
    o.quantity
FROM read_csv_auto('orders_flat.csv') AS o
JOIN read_csv_auto('customers.csv') AS c
    ON o.customer_id = c.customer_id
JOIN read_parquet('products.parquet') AS p
    ON o.product_id = p.product_id
ORDER BY o.order_date;
