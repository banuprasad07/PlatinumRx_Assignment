CREATE TABLE users (
  user_id VARCHAR(50) PRIMARY KEY,
  name VARCHAR(200),
  phone_number VARCHAR(30),
  mail_id VARCHAR(200),
  billing_address TEXT
);

CREATE TABLE bookings (
  booking_id VARCHAR(50) PRIMARY KEY,
  booking_date TIMESTAMP,
  room_no VARCHAR(50),
  user_id VARCHAR(50)
);

CREATE TABLE items (
  item_id VARCHAR(50) PRIMARY KEY,
  item_name VARCHAR(200),
  item_rate DECIMAL(12,2)
);

CREATE TABLE booking_commercials (
  id VARCHAR(50) PRIMARY KEY,
  booking_id VARCHAR(50),
  bill_id VARCHAR(50),
  bill_date TIMESTAMP,
  item_id VARCHAR(50),
  item_quantity DECIMAL(12,4)
);



