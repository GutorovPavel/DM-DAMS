CREATE OR REPLACE FUNCTION get_avg_by_types2(OUT category varchar, OUT avg_price numeric)
RETURNS SETOF RECORD AS $$ 
		SELECT dish_type_name, AVG(price) FROM dishes
		JOIN dish_types USING(dish_type_id)
		GROUP BY dish_type_name
$$ LANGUAGE SQL;

SELECT * FROM get_avg_by_types2()

CREATE OR REPLACE FUNCTION get_avg_by_types() 
RETURNS SETOF numeric AS $$ 
		SELECT AVG(price) FROM dishes
		GROUP BY dish_type_id
$$ LANGUAGE SQL

SELECT get_avg_by_types() AS avg_prices

SELECT * FROM orders

CREATE OR REPLACE FUNCTION set_premium()
RETURNS TRIGGER AS $$
DECLARE
	avg_price numeric;
BEGIN
	SELECT AVG(total_price) INTO avg_price FROM orders;
	IF NEW.total_price >= avg_price THEN 
		NEW.is_premium = TRUE;
	ELSE 
		NEW.is_premium = FALSE;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql

CREATE TRIGGER set_premium_trigger
BEFORE INSERT OR UPDATE ON orders
FOR EACH ROW EXECUTE PROCEDURE set_premium();

CREATE OR REPLACE FUNCTION check_log()
RETURNS trigger AS $$
BEGIN
	IF length(NEW.log_message) < 10 THEN
		RAISE EXCEPTION 'useless message: less than 10 characters long';
		RETURN NULL;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_log_trigger
BEFORE INSERT ON logging
FOR EACH ROW EXECUTE PROCEDURE check_log();

INSERT INTO logging(log_message, user_id) VALUES
('lol', 1);



