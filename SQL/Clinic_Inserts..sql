-- sample clinics
INSERT INTO clinics VALUES
('cnc-0100001','Alpha Clinic','CityA','StateX','CountryZ'),
('cnc-0100002','Beta Clinic','CityB','StateX','CountryZ'),
('cnc-0100003','Gamma Clinic','CityA','StateY','CountryZ');

-- sample customers
INSERT INTO customer VALUES
('cust-001','Alice','9000000001'),
('cust-002','Bob','9000000002'),
('cust-003','Charlie','9000000003');

-- sample clinic_sales
INSERT INTO clinic_sales VALUES
('ord-0001','cust-001','cnc-0100001',24999,'2021-03-15 10:12:00','online'),
('ord-0002','cust-002','cnc-0100001',1200,'2021-03-20 11:00:00','walk-in'),
('ord-0003','cust-003','cnc-0100002',5000,'2021-04-05 09:30:00','online'),
('ord-0004','cust-001','cnc-0100002',7500,'2021-04-15 14:20:00','agent'),
('ord-0005','cust-002','cnc-0100003',1000,'2021-04-20 10:00:00','walk-in'),
('ord-0006','cust-001','cnc-0100001',3000,'2021-05-01 12:00:00','online');

-- sample expenses
INSERT INTO expenses VALUES
('exp-0001','cnc-0100001','rent',5000,'2021-03-31 00:00:00'),
('exp-0002','cnc-0100001','supplies',700,'2021-03-10 00:00:00'),
('exp-0003','cnc-0100002','equipment',2000,'2021-04-30 00:00:00'),
('exp-0004','cnc-0100003','supplies',300,'2021-04-22 00:00:00');

