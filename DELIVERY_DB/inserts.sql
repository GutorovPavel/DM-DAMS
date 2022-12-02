truncate restaurants, users, clients, posts, employees, dish_types, dishes, order_status, orders, restaurants_dishes, orders_dishes RESTART IDENTITY CASCADE;

INSERT INTO users(email, phone, first_name, last_name) VALUES
('weak@mail.ru', '+375331111111', 'John', 'Weak'),
('seak@mail.ru', '+375331111112', 'John', 'Seak'),
('killed@mail.ru', '+375331111113', 'John', 'killed'),
('kicked@mail.ru', '+375331111114', 'John', 'Kicked'),
('leaked@mail.ru', '+375331111115', 'John', 'Leaked'),
('filled_omg@mail.ru', '+375331111116', 'John', 'Filled'),
('a@mail.ru', '+375331111117', 'Alex', 'A'),
('b@mail.ru', '+375331111118', 'Alex', 'B'),
('v@mail.ru', '+375331111119', 'Alex', 'V'),
('pliska@mail.ru', '+375331111110', 'Vlad', 'Pliska'),
('kiska@gmail.ru', '+375331111121', 'Jessica', 'Kiska'),
('criro@gmail.ru', '+375331111122', 'Cristiano', 'Ronaldo'),
('leo@gmail.ru', '+375331111123', 'Leo', 'Messi'),
('geek@mail.ru', '+375331111124', 'John', 'Geek'),
('stick@mail.ru', '+375331111125', 'John', 'Stick'),
('til''t@mail.ru', '+375331111126', 'John', 'Til''t');

INSERT INTO logging(log_message, user_id) VALUES
('made an order', 1),
('made an order', 2),
('eating order', 3),
('meet the deliver', 4),
('eat the deliver', 4),
('made a burger', 5),
('watching porno', 6),
('ate a burger', 5);

INSERT INTO clients(address, user_id) VALUES 
('LA, address1', 1),
('NY, address2', 2),
('Chicago, address3', 3),
('Torronto, address4', 4),
('LA, address5', 5),
('LA, address6', 6),
('LA, address5', 14),
('LA, address6', 15),
('LA, address5', 16);

INSERT INTO posts(post_name) VALUES
('Director'),
('Manager'),
('Deliverer'),
('Collector');

INSERT INTO employees(post_id, salary, birth_date, user_id) VALUES
(1, 2500, '2001-01-01', 7),
(2, 1500, '2001-01-02', 8),
(3, 1000, '2001-01-03', 9),
(3, 900, '2001-01-04', 10),
(4, 800, '2001-01-05', 11),
(4, 500, '2001-01-06', 12),
(4, 600, '2001-01-07', 13);

INSERT INTO restaurants(restaurant_name, address, phone, restaurant_rating) VALUES
('Ploho & Tochka', 'address1', '+375331111111', 2.9),
('Vkusno & Tochka', 'address2', '+375331111112', 4.99),
('Sin & Dochka', 'address3', '+375331111113', 4.7),
('Pe4en'' & Po4ka', 'address4', '+375331111114', 4.6);

INSERT INTO dish_types(dish_type_name) VALUES
('type1'),
('type2'),
('type3'),
('type4'),
('type5'),
('type6'),
('type7');

INSERT INTO dishes(dish_name, dish_type_id, price, cookup_time) VALUES
('dish1_type1', 1, 99.9, '00:20:00'),
('dish2_type1', 1, 89.9, '00:20:00'),
('dish3_type1', 1, 89.9, '00:20:00'),
('dish4_type1', 1, 79.9, '00:15:00'),
('dish5_type1', 1, 79.9, '00:25:00'),
('dish6_type1', 1, 59.9, '00:15:00'),
('dish7_type2', 2, 159.9, '00:40:00'),
('dish8_type2', 2, 199.9, '00:40:00'),
('dish9_type2', 2, 199.9, '00:50:00'),
('dish0_type3', 3, 9.9, '00:01:00'),
('dish11_type3', 3, 9.9, '00:01:00'),
('dish12_type3', 3, 7.9, '00:01:00'),
('dish13_type4', 4, 99.9, '00:30:00'),
('dish14_type5', 5, 89.9, '00:30:00'),
('dish15_type6', 6, 29.9, '00:10:00'),
('dish16_type7', 7, 29.9, '00:10:00');

INSERT INTO restaurants_dishes(restaurant_id, dish_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 14),
(1, 15),
(1, 16),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(2, 6),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(3, 10),
(3, 11),
(3, 12),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6);

INSERT INTO order_status(status_name) VALUES
('confirmed'),
('is collecting'),
('on the way'),
('delivered');

INSERT INTO orders(create_time, deliver_time, client_id, status_id, total_price) VALUES 
('2022-01-01 00:01:00', '2022-01-01 00:41:00', 1, 4, 1000),
('2022-01-01 00:02:00', '2022-01-01 00:42:00', 1, 4, 2000),
('2022-01-01 00:03:00', '2022-01-01 00:43:00', 2, 4, 3000),
('2022-01-01 00:04:00', '2022-01-01 00:44:00', 2, 4, 4000),
('2022-01-01 00:05:00', '2022-01-01 00:45:00', 3, 4, 5000),
('2022-01-01 00:06:00', '2022-01-01 00:46:00', 3, 4, 6000),
('2022-01-01 00:07:00', '2022-01-01 00:47:00', 3, 4, 100),
('2022-01-01 00:08:00', '2022-01-01 00:48:00', 4, 4, 200),
('2022-01-01 00:09:00', '2022-01-01 00:49:00', 5, 4, 300),
('2022-01-01 00:10:00', null, 5, 3, 400),
('2022-01-01 00:11:00', null, 5, 3, 500),
('2022-01-01 00:12:00', null, 5, 3, 600),
('2022-01-01 00:13:00', null, 6, 2, 700),
('2022-01-01 00:14:00', null, 6, 1, 800);

INSERT INTO orders_dishes(order_id, dish_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),
(3, 2),
(3, 10),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(5, 1),
(5, 2),
(5, 4),
(5, 8),
(6, 1),
(6, 2),
(7, 15),
(8, 16),
(9, 1),
(9, 13),
(10, 1),
(10, 12),
(11, 5),
(11, 6),
(12, 7),
(13, 8),
(14, 9),
(14, 12),
(14, 13),
(14, 16);