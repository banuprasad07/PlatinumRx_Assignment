INSERT INTO users (user_id,name,phone_number,mail_id,billing_address) VALUES
('user-001','John Doe','9876543210','john@example.com','Street 1, City'),
('user-002','Maria Smith','9876500000','maria@example.com','Street 5, City');

INSERT INTO bookings (booking_id,booking_date,room_no,user_id) VALUES
('bk-001','2021-09-23 07:36:48','room-12','user-001'),
('bk-002','2021-10-02 10:15:30','room-21','user-002'),
('bk-003','2021-11-15 18:00:00','room-33','user-001');

INSERT INTO items (item_id,item_name,item_rate) VALUES
('itm-001','Tawa Paratha',18.00),
('itm-002','Mix Veg',89.00),
('itm-003','Butter Naan',45.50);

INSERT INTO booking_commercials (id,booking_id,bill_id,bill_date,item_id,item_quantity) VALUES
('id-001','bk-001','bill-001','2021-09-23 12:03:22','itm-001',3),
('id-002','bk-001','bill-001','2021-09-23 12:03:22','itm-002',1),
('id-003','bk-002','bill-002','2021-10-02 14:22:10','itm-001',2),
('id-004','bk-003','bill-003','2021-11-15 19:10:00','itm-003',5);
