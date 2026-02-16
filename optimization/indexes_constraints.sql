USE business_analytics;

-- 1️⃣ Add Index on Foreign Keys (Improves Join Performance)
CREATE INDEX idx_orders_customer_id 
ON orders(customer_id);

CREATE INDEX idx_order_items_order_id 
ON order_items(order_id);

CREATE INDEX idx_order_items_product_id 
ON order_items(product_id);


-- 2️⃣ Add Index on Frequently Filtered Columns
CREATE INDEX idx_products_category 
ON products(category);

CREATE INDEX idx_orders_order_date 
ON orders(order_date);


-- 3️⃣ Add Additional Data Integrity Constraints

-- Prevent negative quantity
ALTER TABLE order_items
ADD CONSTRAINT chk_quantity_positive 
CHECK (quantity > 0);

-- Prevent negative price
ALTER TABLE products
ADD CONSTRAINT chk_price_positive 
CHECK (price > 0);
