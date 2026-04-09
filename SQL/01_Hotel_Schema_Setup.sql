CREATE TABLE users (
    user_id VARCHAR(50),
    name VARCHAR(100),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);

CREATE TABLE bookings (
    booking_id VARCHAR(50),
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50)
);

CREATE TABLE items (
    item_id VARCHAR(50),
    item_name VARCHAR(100),
    item_rate DECIMAL(10,2)
);

CREATE TABLE booking_commercials (
    id VARCHAR(50),
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity DECIMAL(10,2)
);


INSERT INTO users VALUES
('U1','John','9999999991','john@mail.com','Addr1'),
('U2','Sam','9999999992','sam@mail.com','Addr2'),
('U3','Alex','9999999993','alex@mail.com','Addr3');

INSERT INTO bookings VALUES
('B1','2021-10-05 10:00:00','R1','U1'),
('B2','2021-10-10 12:00:00','R2','U2'),
('B3','2021-10-20 09:00:00','R3','U3'),
('B4','2021-11-05 11:00:00','R4','U1'),
('B5','2021-11-15 13:00:00','R5','U2'),
('B6','2021-11-25 15:00:00','R6','U3');


INSERT INTO items VALUES
('I1','Paratha',20),
('I2','Veg Curry',100),
('I3','Biryani',200);

INSERT INTO booking_commercials VALUES
('C1','B1','BL1','2021-10-05','I1',10),
('C2','B1','BL1','2021-10-05','I2',5),
('C3','B2','BL2','2021-10-10','I2',10),
('C4','B2','BL2','2021-10-10','I3',2),
('C5','B3','BL3','2021-10-20','I3',3),
('C6','B4','BL4','2021-11-05','I1',20),
('C7','B4','BL4','2021-11-05','I2',10),
('C8','B5','BL5','2021-11-15','I3',5),
('C9','B6','BL6','2021-11-25','I2',15);
