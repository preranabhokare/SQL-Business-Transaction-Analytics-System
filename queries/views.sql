USE business_analytics;

-- 1️⃣ View: Customer Revenue Summary
CREATE OR REPLACE VIEW customer_revenue_summary AS
SELECT 
    c.customer_id,
    c.name,
    c.city,
    SUM(p.price * oi.quantity) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name, c.city;


-- 2️⃣ View: Product Sales Summary
CREATE OR REPLACE VIEW product_sales_summary AS
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(p.price * oi.quantity) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category;


-- 3️⃣ View: Monthly Revenue Report
CREATE OR REPLACE VIEW monthly_revenue_report AS
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(p.price * oi.quantity) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month;


-- 4️⃣ View: Order Summary Dashboard
CREATE OR REPLACE VIEW order_summary_dashboard AS
SELECT 
    o.order_id,
    c.name AS customer_name,
    o.order_date,
    SUM(p.price * oi.quantity) AS order_total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id, c.name, o.order_date;
