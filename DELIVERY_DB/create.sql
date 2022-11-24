CREATE TABLE IF NOT EXISTS users
(
	user_id serial PRIMARY KEY,
	email varchar(63) UNIQUE NOT NULL,
	phone varchar(13) UNIQUE NOT NULL,
	first_name varchar(127) NOT NULL,
	last_name varchar(127)
);

CREATE TABLE IF NOT EXISTS clients
(
	client_id serial PRIMARY KEY,
	address text NOT NULL,
	fk_user_id int UNIQUE NOT NULL REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS posts
(
	post_id serial PRIMARY KEY,
	post_name varchar(31) NOT NULL
);

CREATE TABLE IF NOT EXISTS employees
(
	employee_id serial PRIMARY KEY,
	fk_post_id int REFERENCES posts(post_id),
	salary decimal NOT NULL,
	birth_date date NOT NULL,
	fk_user_id int UNIQUE NOT NULL REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS logging
(
	log_id serial PRIMARY KEY,
	log_message varchar(127) NOT NULL,
	fk_user_id int REFERENCES users(user_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS restaurants
(
	restaurant_id serial PRIMARY KEY,
	restaurant_name varchar(127) UNIQUE NOT NULL,
	address text NOT NULL,
	phone varchar(13) UNIQUE NOT NULL
-- 	restaurant_rating float(4,1) 
);

CREATE TABLE IF NOT EXISTS dish_types
(
	type_id serial PRIMARY KEY,
	type_name varchar(63) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS dishes
(
	dish_id serial PRIMARY KEY,
	dish_name varchar(127) NOT NULL,
	dish_type int NOT NULL REFERENCES dish_types(type_id) ON DELETE CASCADE, /*one to many*/
	price decimal NOT NULL,
	cookup_time time NOT NULL
);

CREATE TABLE IF NOT EXISTS order_status
(
	status_id serial PRIMARY KEY,
	status_name varchar(63) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS orders 
(
	order_id serial PRIMARY KEY,
	create_time timestamp NOT NULL,
	deliver_time timestamp NOT NULL,
	client_id int REFERENCES clients(client_id) ON DELETE SET NULL,
	status_id int NOT NULL REFERENCES order_status(status_id),
	total_price decimal NOT NULL
);

CREATE TABLE IF NOT EXISTS restaurants_dishes
(
	fk_restaurant_id int REFERENCES restaurants(restaurant_id) ON DELETE CASCADE,
	fk_dish_id int REFERENCES dishes(dish_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS orders_dishes 
(
	order_id int REFERENCES orders(order_id) ON DELETE CASCADE,
	dish_id int REFERENCES dishes(dish_id) ON DELETE CASCADE
);

-- ALTER TABLE IF EXISTS orders
-- ADD CHECK (total_price >= 0);

ALTER TABLE IF EXISTS restaurants
ADD CHECK (restaurant_rating >= 0);

-- ALTER TABLE IF EXISTS restaurants
-- ADD COLUMN restaurant_rating NUMERIC(2, 1) NOT NULL;