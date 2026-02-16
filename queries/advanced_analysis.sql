USE business_analytics;

-- 1️⃣ Customer Lifetime Value (CLV)
SELECT 
    c.customer_id,
    c.name,
    SUM(p.price * oi.quantity) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name
ORDER BY lifetime_value DESC;


-- 2️⃣ Average Order Value
SELECT 
    AVG(order_total) AS avg_order_value
FROM (
    SELECT 
        o.order_id,
        SUM(p.price * oi.quantity) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_id
) AS order_summary;


-- 3️⃣ Customers With More Than One Order (Repeat Customers)
SELECT 
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 1;


-- 4️⃣ Revenue by Product Category
SELECT 
    p.category,
    SUM(p.price * oi.quantity) AS category_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;


-- 5️⃣ Most Frequently Purchased Product
SELECT 
    p.product_name,
    COUNT(oi.order_item_id) AS purchase_frequency
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY purchase_frequency DESC
LIMIT 1;
