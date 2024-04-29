-- MENAMBAH CONSTRAINT CHECK --
-- 1. Menambah Constraint Check pada field price table food
ALTER TABLE food
ADD CONSTRAINT chk_price CHECK (price >= 0);

-- 2. Menambah Constraint Check pada field delivery_charge table orders
ALTER TABLE orders
ADD CONSTRAINT chk_delivery_charge CHECK (delivery_charge >= 0);

-- 3. Menambah Constraint Check pada field qty table order_detail
ALTER TABLE order_detail
ADD CONSTRAINT chk_qty CHECK (qty > 0);