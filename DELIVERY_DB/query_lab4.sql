-- advanced select
SELECT order_id, status_name FROM orders o, order_status s
WHERE o.status_id = s.status_id AND s.status_id = 4

SELECT status_name, COUNT(o.*) FROM orders o, order_status s
WHERE o.status_id = s.status_id
GROUP BY status_name
ORDER BY COUNT(o.*);


-- group by
SELECT post_id, AVG(salary) FROM employees
GROUP BY post_id
ORDER BY AVG(salary) DESC;


-- inner join
SELECT dish_type_name, COUNT(d.*) FROM dishes d
JOIN dish_types dt USING(dish_type_id)
WHERE price < 100
GROUP BY dish_type_name
ORDER BY COUNT(d.*) DESC;	


-- left outer join
SELECT first_name, last_name, order_id FROM clients 
JOIN users USING(user_id)
LEFT JOIN orders USING(client_id);


-- full 
SELECT * FROM orders o
FULL JOIN clients USING(client_id);


-- many to many
SELECT restaurant_name, COUNT(d.*) FROM restaurants r
JOIN restaurants_dishes USING(restaurant_id)
JOIN dishes d USING(dish_id)
GROUP BY restaurant_name
ORDER BY COUNT(d.*) DESC;


-- having
SELECT post_name, AVG(salary) FROM employees
JOIN posts USING(post_id)
GROUP BY post_name
HAVING AVG(salary) > 700
ORDER BY AVG(salary) DESC;


-- xd (spisok chelov i skol'ko oni zaplatili)
SELECT first_name, last_name, SUM(price) from orders
JOIN clients USING(client_id)
JOIN users USING(user_id)
JOIN orders_dishes USING(order_id)
JOIN dishes USING(dish_id)
GROUP BY first_name, last_name
ORDER BY SUM(price) DESC;


-- union
SELECT price FROM dishes
UNION
SELECT salary FROM employees
ORDER BY price DESC;


-- podzaprosi

SELECT first_name, last_name, salary FROM employees
JOIN users USING(user_id)
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary

SELECT first_name, last_name, SUM(total_price) from clients
JOIN orders USING(client_id)
JOIN users USING(user_id)
WHERE EXISTS (SELECT client_id FROM orders
			 WHERE client_id = clients.client_id
			 AND total_price BETWEEN 600 AND 4000)
GROUP BY first_name, last_name
ORDER BY SUM(total_price) DESC


		-- рубрика зачем мне подзапросы
		SELECT first_name, last_name, SUM(total_price) from clients
		JOIN orders USING(client_id)
		JOIN users USING(user_id)
		GROUP BY first_name, last_name
		HAVING SUM(total_price) > 2000
		ORDER BY SUM(total_price) DESC
		-- рубрика зачем мне подзапросы
		
		
SELECT restaurant_name, address, phone FROM restaurants
WHERE restaurant_rating > 4 AND EXISTS (SELECT dish_id FROM dishes 
										WHERE price < 80 AND dish_type_id = 1)
										
										







