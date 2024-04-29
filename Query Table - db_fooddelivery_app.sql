-- QUERY MEMBUAT TABLE DATABASE --
-- 1. Membuat tabel City
CREATE TABLE city(
	city_id INT PRIMARY KEY,
	name VARCHAR(255) UNIQUE NOT NULL
);

-- 2. Membuat table restaurant
CREATE TABLE restaurant(
	restaurant_id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	phone_number VARCHAR(20) NOT NULL,
	address TEXT NOT NULL,
	city_id INT NOT NULL,
	coordinate POINT NOT NULL,
	password VARCHAR(255) NOT NULL,
	CONSTRAINT fk_city
		FOREIGN KEY (city_id) REFERENCES city(city_id)
		ON DELETE CASCADE
);

-- 3. Membuat tabel food
CREATE TABLE food(
	food_id SERIAL PRIMARY KEY,
	restaurant_id INT NOT NULL,
	food_name VARCHAR(255) NOT NULL,
	price NUMERIC NOT NULL,
	description TEXT NOT NULL,
	availability BOOLEAN NOT NULL,
	CONSTRAINT check_price
		CHECK (price >= 0),
	CONSTRAINT fk_restaurant
		FOREIGN KEY (restaurant_id)
		REFERENCES restaurant(restaurant_id)
		ON DELETE CASCADE
);

-- 4. Create tabel users
CREATE TABLE users(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(20) UNIQUE NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255),
	email VARCHAR(255) UNIQUE NOT NULL,
	phone_number VARCHAR(255) NOT NULL,
	address TEXT NOT NULL,
	city_id INT NOT NULL,
	coordinate POINT NOT NULL,
	password VARCHAR(255) NOT NULL,
	CONSTRAINT fk_city
		FOREIGN KEY (city_id) 
		REFERENCES city(city_id)
		ON DELETE CASCADE
);

-- 5. Create table driver
CREATE TABLE driver(
	driver_id SERIAL PRIMARY KEY,
	username VARCHAR(20) UNIQUE NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255),
	email VARCHAR(255) UNIQUE NOT NULL,
	phone_number VARCHAR(20) NOT NULL,
	driver_license VARCHAR(15) NOT NULL,
	city_id INT NOT NULL,
	license_plate VARCHAR(20) NOT NULL,
	password VARCHAR(255) NOT NULL,
	CONSTRAINT fk_city
		FOREIGN KEY (city_id)
		REFERENCES city(city_id)
		ON DELETE CASCADE
);

-- 6. Membuat tabel driver_coordinate
CREATE TABLE driver_coordinate(
	driver_coordinate_id SERIAL PRIMARY KEY,
	driver_id INT NOT NULL,
	created_at TIMESTAMP NOT NULL,
	coordinate POINT NOT NULL,
	CONSTRAINT fk_driver
		FOREIGN KEY (driver_id)
		REFERENCES driver(driver_id)
		ON DELETE CASCADE
);

-- 7. Membuat tabel order_status
CREATE TABLE order_status(
	order_status_id INT PRIMARY KEY,
	status VARCHAR(20) UNIQUE NOT NULL
);

-- 8. Membuat table orders
CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	driver_id INT,
	created_at TIMESTAMP NOT NULL,
	delivery_charge NUMERIC NOT NULL,
	review TEXT,
	CONSTRAINT check_delivery_charge
		CHECK (delivery_charge >= 0),
	CONSTRAINT fk_user
		FOREIGN KEY (user_id)
		REFERENCES users(user_id)
		ON DELETE CASCADE,
	CONSTRAINT fk_driver
		FOREIGN KEY (driver_id)
		REFERENCES driver(driver_id)
		ON DELETE CASCADE
);

-- 9. Membuat tabel order_detail
CREATE TABLE order_detail(
	order_detail_id SERIAL PRIMARY KEY,
	order_id INT NOT NULL,
	food_id INT NOT NULL,
	qty NUMERIC NOT NULL,
	is_like BOOLEAN,
	CONSTRAINT check_qty
		CHECK (qty > 0),
	CONSTRAINT fk_order
		FOREIGN KEY (order_id)
		REFERENCES orders(order_id)
		ON DELETE CASCADE,
	CONSTRAINT fk_food
		FOREIGN KEY (food_id)
		REFERENCES food(food_id)
		ON DELETE CASCADE,
);

-- 10. Membuat tabel order_status_log
CREATE TABLE order_status_log(
	order_status_log SERIAL PRIMARY KEY,
	order_id INT NOT NULL,
	order_status_id INT NOT NULL,
	created_at TIMESTAMP NOT NULL,
	CONSTRAINT fk_order
		FOREIGN KEY (order_id)
		REFERENCES orders(order_id)
		ON DELETE CASCADE,
	CONSTRAINT fk_order_status
		FOREIGN KEY (order_status_id)
		REFERENCES order_status(order_status_id)
		ON DELETE CASCADE,
);



