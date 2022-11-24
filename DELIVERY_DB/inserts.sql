truncate restaurants RESTART IDENTITY CASCADE;

INSERT INTO restaurants(restaurant_name, address, phone, restaurant_rating) VALUES
('name1', 'address1', '+375331111111', '4.9'),
('name3', 'address3', '+375331111113', '4.8'),
('name2', 'address2', '+375331111112', '1.2');

SELECT * FROM restaurants 