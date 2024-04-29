-- 1. Membuat INDEX untuk field food_name pada tabel food
CREATE INDEX idx_food_name ON food (food_name);

-- 2. Membuat INDEX untuk field coordinate pada tabel driver_coordinate
CREATE INDEX idx_driver_coordinate
ON driver_coordinate USING gist(coordinate);