USE business_analytics;

-- Insert Customers
INSERT INTO customers (name, email, city) VALUES
('Amit Sharma', 'amit.sharma@gmail.com', 'Mumbai'),
('Priya Verma', 'priya.verma@gmail.com', 'Pune'),
('Rahul Patil', 'rahul.patil@gmail.com', 'Nagpur'),
('Sneha Iyer', 'sneha.iyer@gmail.com', 'Bangalore'),
('Karan Mehta', 'karan.mehta@gmail.com', 'Delhi');

-- Insert Products
INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 60000.00),
('Smartphone', 'Electronics', 25000.00),
('Headphones', 'Accessories', 2000.00),
('Office Chair', 'Furniture', 8000.00),
('Monitor', 'Electronics', 15000.00);

-- Insert Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-01-10'),
(2, '2025-01-12'),
(3, '2025-01-15'),
(1, '2025-02-05'),
(4, '2025-02-10');

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(4, 5, 1),
(5, 1, 1),
(5, 2, 1);
