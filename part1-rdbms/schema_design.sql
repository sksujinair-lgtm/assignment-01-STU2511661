-- =========================
-- CUSTOMERS TABLE
-- =========================
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES
('CUST1001', 'Amit Sharma', 'amit@gmail.com', 'Mumbai'),
('CUST1002', 'Priya Nair', 'priya@gmail.com', 'Kochi'),
('CUST1003', 'Rahul Verma', 'rahul@gmail.com', 'Delhi'),
('CUST1004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('CUST1005', 'Arjun Mehta', 'arjun@gmail.com', 'Pune');


-- =========================
-- PRODUCTS TABLE
-- =========================
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO Products VALUES
('P1001', 'Laptop', 'Electronics', 55000.00),
('P1002', 'Mobile', 'Electronics', 20000.00),
('P1003', 'Shoes', 'Fashion', 3000.00),
('P1004', 'Watch', 'Accessories', 2500.00),
('P1005', 'Bag', 'Travel', 1500.00);


-- =========================
-- SALES REPRESENTATIVES TABLE
-- =========================
CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL
);

INSERT INTO Sales_Reps VALUES
('SR101', 'Ravi Kumar', 'West'),
('SR102', 'Anita Joseph', 'South'),
('SR103', 'Karan Singh', 'North'),
('SR104', 'Meera Das', 'East'),
('SR105', 'Vikas Jain', 'Central');


-- =========================
-- ORDERS TABLE
-- =========================
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

INSERT INTO Orders VALUES
('ORD1001', '2024-01-10', 'CUST1001', 'SR101'),
('ORD1002', '2024-01-12', 'CUST1002', 'SR102'),
('ORD1003', '2024-01-15', 'CUST1003', 'SR103'),
('ORD1004', '2024-01-18', 'CUST1004', 'SR104'),
('ORD1005', '2024-01-20', 'CUST1005', 'SR105');


-- =========================
-- ORDER ITEMS TABLE
-- =========================
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
('ORD1001', 'P1001', 1),
('ORD1002', 'P1002', 2),
('ORD1003', 'P1003', 1),
('ORD1004', 'P1004', 3),
('ORD1005', 'P1005', 2);
