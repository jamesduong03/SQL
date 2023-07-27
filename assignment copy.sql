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

ALTER TABLE orders
ADD price DECIMAL(10, 2) not null;

commit;





