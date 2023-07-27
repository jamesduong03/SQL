CREATE TABLE customer(
account_no VARCHAR2(10) not null,
cust_fname varchar2(20) not null,
custlname VARCHAR2(20) not null,
business_flag VARCHAR2(1),
org_name VARCHAR2(50),
cust_phone VARCHAR2(20),
street_name VARCHAR2(50),
street_no VARCHAR2(10),
city VARCHAR2(20),
postcode VARCHAR2(8),
email VARCHAR2(50),
CONSTRAINT account_no_pk PRIMARY KEY (account_no));

CREATE TABLE sessions (
session_no VARCHAR2(10) NOT NULL,
session_date DATE,
session_start DATE,
session_end DATE,
location VARCHAR2(50) not null,
CONSTRAINT session_no_pk PRIMARY KEY (session_no));

CREATE TABLE ORDERS (
account_no VARCHAR2(10) not null,
order_no VARCHAR2(10) NOT NULL,
ordet_date DATE,
order_payment_status VARCHAR2(10),
collection_type VARCHAR2(1),
dest_street_name VARCHAR2(20),
dest_street_number VARCHAR2(20),
dest_city VARCHAR2(20),
dest_postcode VARCHAR2(8),
shipping_price VARCHAR2(20),
session_no VARCHAR2(10),
CONSTRAINT order_no_pk PRIMARY KEY (order_no),
CONSTRAINT session_no_fk FOREIGN KEY (session_no) 
REFERENCES sessions (session_no));


CREATE TABLE booking (
booking_no VARCHAR2(20) not null,
account_no VARCHAR2(20) not null,
order_no VARCHAR2(10) NOT NULL,
session_no VARCHAR2(10) NOT NULL,
session_date date,
session_start date,
reason VARCHAR2(255),
price DECIMAL(10, 2) not null,
booking_payment_status VARCHAR(20),
CONSTRAINT booking_no_pk PRIMARY key (booking_no),
CONSTRAINT account_no_fk FOREIGN KEY (account_no)
REFERENCES customer(account_no),
CONSTRAINT order_no_fk FOREIGN KEY (order_no)
REFERENCES orders (order_no));

Create table photograph (
photo_unique_no VARCHAR2(20),
photo_size VARCHAR2(8),
photo_colour VARCHAR2(10),
photo_finish varchar2(10),
quantity VARCHAR2(4),
CONSTRAINT photo_no_pk 
PRIMARY key (photo_unique_no));

CREATE TABLE photosession (
  session_no VARCHAR2(10),
  photo_unique_no VARCHAR2(20),
  CONSTRAINT photosession_pk PRIMARY KEY (session_no, photo_unique_no),
  CONSTRAINT session_no_fk_photossn FOREIGN KEY (session_no)
    REFERENCES sessions (session_no),
  CONSTRAINT photo_no_fk_photossn FOREIGN KEY (photo_unique_no)
    REFERENCES photograph (photo_unique_no)
);



-- Inserts for customer table
INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10001', 'John', 'Doe', 'N', NULL, '1234567890', 'Main Street', '123', 'New York', '10001', 'john.doe@example.com');

INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10002', 'Sarah', 'Smith', 'N', NULL, '9876543210', 'Elm Avenue', '456', 'Los Angeles', '90001', 'sarah.smith@example.com');

INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10003', 'Michael', 'Johnson', 'Y', 'ABC Corporation', '5555555555', 'Park Road', '789', 'Chicago', '60601', 'michael.johnson@example.com');

INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10004', 'Emily', 'Brown', 'N', NULL, '1112223333', 'Oak Street', '222', 'Houston', '77002', 'emily.brown@example.com');

INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10005', 'Daniel', 'Wilson', 'N', NULL, '4445556666', 'Cedar Lane', '777', 'Seattle', '98101', 'daniel.wilson@example.com');

INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10006', 'Olivia', 'Miller', 'N', NULL, '9998887777', 'Pine Street', '987', 'San Francisco', '94101', 'olivia.miller@example.com');

INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10007', 'David', 'Anderson', 'N', NULL, '7778889999', 'Maple Avenue', '456', 'Dallas', '75201', 'david.anderson@example.com');

INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10008', 'Keith', 'Brown', 'N', NULL, '4445556666', 'Beach Drive', '555', 'Washington DC', '80451', 'keith.brown@example.com');

INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10009', 'Matthew', 'Roberts', 'Y', 'XYZ Enterprises', '6669991111', 'Grove Road', '555', 'Atlanta', '30301', 'matthew.roberts@example.com');

INSERT INTO customer (account_no, cust_fname, custlname, business_flag, org_name, cust_phone, street_name, street_no, city, postcode, email)
VALUES ('10010', 'Ava', 'Davis', 'N', NULL, '2223334444', 'Birch Street', '888', 'Boston', '02101', 'ava.davis@example.com');

SELECT * FROM customer;

-- Inserts for sessions table
INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1001', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Franklin Beach');

INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1002', TO_DATE('2023-06-02', 'YYYY-MM-DD'), TO_DATE('2023-06-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-02 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Myers Waterfall');

INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1003', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2023-06-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-03 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Evergreen Park');

INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1004', TO_DATE('2023-06-04', 'YYYY-MM-DD'), TO_DATE('2023-06-04 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Sunset Studio');

INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1005', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-06-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Blossom Botanical Garden');

INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1006', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2023-06-06 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-06 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Skyline Rooftop');

INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1007', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2023-06-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-07 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Cascade Waterfall');

INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1008', TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_DATE('2023-06-08 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-08 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Harbor City Street');

INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1009', TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_DATE('2023-06-09 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-09 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Mountain Vista');

INSERT INTO sessions (session_no, session_date, session_start, session_end, location)
VALUES ('S1010', TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Art Museum');

SELECT * FROM sessions;

--Inserting data into Orders table

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10001', 'O1001', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Paid', 'D', 'Main Street', '123', 'Cityville', '12345', '10.00', 'S1001');

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10002', 'O1002', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'Paid', 'C', 'Park Lane', '456', 'Townsville', '54321', '5.00', 'S1002');

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10003', 'O1003', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'Unpaid', 'D', 'Garden Avenue', '789', 'Villageland', '98765', '0.00', 'S1003');

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10004', 'O1004', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'Paid', 'C', 'Sunset Boulevard', '321', 'Metropolis', '56789', '8.50', 'S1004');

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10005', 'O1005', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'Paid', 'D', 'Oak Street', '567', 'Greenville', '43210', '12.00', 'S1005');

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10006', 'O1006', TO_DATE('2023-06-06', 'YYYY-MM-DD'), 'Unpaid', 'C', 'Maple Avenue', '987', 'Hometown', '10987', '7.50', 'S1006');

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10007', 'O1007', TO_DATE('2023-06-07', 'YYYY-MM-DD'), 'Paid', 'D', 'River Road', '654', 'Riverside', '87654', '9.50', 'S1007');

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10008', 'O1008', TO_DATE('2023-06-08', 'YYYY-MM-DD'), 'Paid', 'C', 'Mountain View Drive', '234', 'Mountaintop', '54321', '6.00', 'S1008');

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10009', 'O1009', TO_DATE('2023-06-09', 'YYYY-MM-DD'), 'Unpaid', 'D', 'Broadway', '876', 'Center City', '12345', '0.00', 'S1009');

INSERT INTO ORDERS (account_no, order_no, ordet_date, order_payment_status, collection_type, dest_street_name, dest_street_number, dest_city, dest_postcode, shipping_price, session_no)
VALUES ('10010', 'O1010', TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'Paid', 'C', 'Market Street', '543', 'Downtown', '98765', '7.00', 'S1010');

SELECT * FROM orders;

-- Inserting BOOKING data

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100001', '10001', 'O1001', 'S1001', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Family Portrait', 150.00, 'Paid');

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100002', '10002', 'O1002', 'S1002', TO_DATE('2023-06-02', 'YYYY-MM-DD'), TO_DATE('2023-06-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Engagement Shoot', 200.00, 'Paid');

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100003', '10003', 'O1003', 'S1003', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2023-06-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Graduation Photos', 100.00, 'Unpaid');

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100004', '10004', 'O1004', 'S1004', TO_DATE('2023-06-04', 'YYYY-MM-DD'), TO_DATE('2023-06-04 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Professional Headshots', 80.00, 'Paid');

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100005', '10005', 'O1005', 'S1005', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-06-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Maternity Photoshoot', 120.00, 'Paid');

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100006', '10006', 'O1006', 'S1006', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2023-06-06 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Fashion Photoshoot', 180.00, 'Unpaid');

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100007', '10007', 'O1007', 'S1007', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2023-06-07 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Product Photography', 90.00, 'Paid');

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100008', '10008', 'O1008', 'S1008', TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_DATE('2023-06-08 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'House Photography', 230.00, 'Paid');

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100009', '10009', 'O1009', 'S1008', TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_DATE('2023-06-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Birthday Party Photos', 150.00, 'Unpaid');

INSERT INTO booking (booking_no, account_no, order_no, session_no,  session_date, session_start, reason, price, booking_payment_status)
VALUES ('B100010', '10010', 'O1010', 'S1009', TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Outdoor Wedding Shoot', 250.00, 'Paid');

SELECT * FROM booking;

-- inserting photography data

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100001', '8x10', 'Color', 'Matte', '1');

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100002', '5x7', 'B and W', 'Glossy', '3');

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100003', '11x14', 'Color', 'Matte', '2');

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100004', '4x6', 'B and W', 'Glossy', '5');

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100005', '8x10', 'Color', 'Glossy', '2');

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100006', '5x7', 'B and W', 'Matte', '4');

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100007', '11x14', 'Color', 'Glossy', '3');

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100008', '4x6', 'B and W', 'Matte', '2');

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100009', '8x10', 'Color', 'Glossy', '4');

INSERT INTO photograph (photo_unique_no, photo_size, photo_colour, photo_finish, quantity)
VALUES ('P100010', '5x7', 'B and W', 'Matte', '1');

SELECT * FROM photograph;

-- inserting photosession data

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1001', 'P100001');

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1002', 'P100002');

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1003', 'P100003');

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1004', 'P100004');

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1005', 'P100005');

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1006', 'P100006');

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1007', 'P100007');

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1008', 'P100008');

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1009', 'P100009');

INSERT INTO photosession (session_no, photo_unique_no)
VALUES ('S1010', 'P100010');

SELECT * from photosession;

SELECT table_name FROM user_tables;

SELECT account_no, COUNT(booking_no) AS booking_count
FROM booking
GROUP BY account_no
ORDER BY booking_count DESC;

SELECT o.order_no, o.ordet_date, c.account_no, c.cust_fname, c.custlname, s.session_no, s.location
FROM orders o
JOIN customer c ON o.account_no = c.account_no
JOIN sessions s ON o.session_no = s.session_no
WHERE o.ordet_date = TO_DATE('2023-06-01', 'YYYY-MM-DD');


SELECT s.session_no, AVG(b.price) AS average_price
FROM sessions s
JOIN booking b ON s.session_no = b.session_no
GROUP BY s.session_no
HAVING COUNT(b.booking_no) < 5;


SELECT c.account_no, c.cust_fname, c.custlname, c.city, COUNT(o.order_no) AS order_count
FROM customer c
JOIN orders o ON c.account_no = o.account_no
JOIN sessions s ON o.session_no = s.session_no
WHERE c.city = 'New York'
GROUP BY c.account_no, c.cust_fname, c.custlname, c.city;

SELECT c.account_no, c.cust_fname, c.custlname, SUM(b.price) AS total_booking_price
FROM customer c
JOIN booking b ON c.account_no = b.account_no
GROUP BY c.account_no, c.cust_fname, c.custlname
ORDER BY total_booking_price DESC
FETCH FIRST 5 ROWS ONLY;

