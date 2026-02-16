USE business_analytics;

-- 1️⃣ Total Revenue Generated
SELECT 
    SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;


-- 2️⃣ Revenue by Each Customer
SELECT 
    c.name,
    SUM(p.price * oi.quantity) AS customer_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY customer_revenue DESC;


-- 3️⃣ Top Selling Products
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;


-- 4️⃣ Monthly Sales Trend
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(p.price * oi.quantity) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;


-- 5️⃣ Most Valuable Customer
SELECT 
    c.name,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;
