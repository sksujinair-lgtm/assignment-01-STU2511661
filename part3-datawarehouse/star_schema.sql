-- =========================
-- DIMENSION: DATE
-- =========================
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

INSERT INTO dim_date VALUES
(1, '2024-01-10', 1, 2024),
(2, '2024-01-15', 1, 2024),
(3, '2024-02-05', 2, 2024),
(4, '2024-02-20', 2, 2024),
(5, '2024-03-10', 3, 2024);


-- =========================
-- DIMENSION: STORE
-- =========================
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO dim_store VALUES
(101, 'Store A', 'Mumbai'),
(102, 'Store B', 'Delhi'),
(103, 'Store C', 'Bangalore');


-- =========================
-- DIMENSION: PRODUCT
-- =========================
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

INSERT INTO dim_product VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mobile', 'Electronics'),
(203, 'Shirt', 'Clothing'),
(204, 'Rice', 'Groceries');


-- =========================
-- FACT TABLE: SALES
-- =========================
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

INSERT INTO fact_sales VALUES
(1, 1, 101, 201, 1, 55000.00),
(2, 1, 102, 202, 2, 40000.00),
(3, 2, 103, 203, 3, 6000.00),
(4, 2, 101, 204, 5, 2500.00),
(5, 3, 102, 201, 1, 55000.00),
(6, 3, 103, 202, 2, 40000.00),
(7, 4, 101, 203, 4, 8000.00),
(8, 4, 102, 204, 6, 3000.00),
(9, 5, 103, 201, 1, 55000.00),
(10, 5, 101, 202, 2, 40000.00);
