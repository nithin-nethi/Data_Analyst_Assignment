-- Creation of tables for clinic sales and expenses

CREATE TABLE clinics (
    cid VARCHAR(50),
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE customer (
    uid VARCHAR(50),
    name VARCHAR(100),
    mobile VARCHAR(15)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50),
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(50)
);

CREATE TABLE expenses (
    eid VARCHAR(50),
    cid VARCHAR(50),
    description VARCHAR(100),
    amount DECIMAL(10,2),
    datetime DATETIME
);


-- Insertion of sample data into the tables

INSERT INTO clinics VALUES
('C1','Clinic A','Hyderabad','Telangana','India'),
('C2','Clinic B','Hyderabad','Telangana','India'),
('C3','Clinic C','Bangalore','Karnataka','India'),
('C4','Clinic D','Bangalore','Karnataka','India');

INSERT INTO customer VALUES
('U1','John','9999999991'),
('U2','Sam','9999999992'),
('U3','Alex','9999999993'),
('U4','Ravi','9999999994');


INSERT INTO clinic_sales VALUES
('O1','U1','C1',5000,'2021-01-10','online'),
('O2','U2','C1',7000,'2021-01-15','offline'),
('O3','U3','C2',3000,'2021-01-20','online'),
('O4','U4','C3',8000,'2021-01-25','offline'),
('O5','U1','C2',10000,'2021-02-10','online'),
('O6','U2','C3',6000,'2021-02-12','offline'),
('O7','U3','C4',4000,'2021-02-18','online'),
('O8','U4','C1',9000,'2021-02-20','offline'),
('O9','U1','C3',12000,'2021-03-05','online'),
('O10','U2','C4',5000,'2021-03-10','offline'),
('O11','U3','C1',7000,'2021-03-15','online'),
('O12','U4','C2',11000,'2021-03-20','offline');


INSERT INTO expenses VALUES
('E1','C1','rent',2000,'2021-01-10'),
('E2','C2','salary',1500,'2021-01-15'),
('E3','C3','maintenance',3000,'2021-01-20'),
('E4','C4','rent',2500,'2021-01-25'),
('E5','C1','salary',3000,'2021-02-10'),
('E6','C2','rent',2000,'2021-02-12'),
('E7','C3','maintenance',3500,'2021-02-18'),
('E8','C4','salary',2500,'2021-02-20'),
('E9','C1','rent',2500,'2021-03-05'),
('E10','C2','salary',2000,'2021-03-10'),
('E11','C3','maintenance',4000,'2021-03-15'),
('E12','C4','rent',3000,'2021-03-20');


