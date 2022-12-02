-- all *
SELECT * FROM clients;


-- simple where
SELECT dish_name FROM dishes 
WHERE dish_type = 1;

SELECT client_id, status_id, create_time FROM orders
WHERE status_id = 4
ORDER BY create_time;

SELECT restaurant_name, restaurant_rating FROM restaurants 
WHERE restaurant_rating > 4.5
ORDER BY restaurant_rating DESC;

SELECT * FROM orders
WHERE deliver_time IS NULL;

SELECT log_message FROM logging
WHERE fk_user_id = 5;


-- where (and, or, between)
SELECT dish_name, price FROM dishes
WHERE price BETWEEN 9 AND 60
ORDER BY price;

SELECT employee_id, salary FROM employees
WHERE fk_post_id = 4 AND salary > 500
ORDER BY salary;


-- like
SELECT * FROM clients
WHERE address LIKE '%LA%';

SELECT first_name, last_name FROM users
WHERE first_name LIKE 'John';


-- max, min, avg
SELECT MIN(price) FROM dishes;

SELECT AVG(price) FROM dishes
WHERE dish_type = 1;


-- update
UPDATE dishes
SET price = price + 30
WHERE dish_type = 1;

SELECT dish_name, price FROM dishes
WHERE dish_type = 1 OR dish_type = 2
ORDER BY dish_type DESC;



