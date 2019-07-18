
/* ODS */
-- Drop table

-- DROP TABLE "ODS".address;

CREATE TABLE address (
	address_id int4 NULL,
	address varchar(50) NULL,
	address2 varchar(50) NULL,
	district varchar(20) NULL,
	city_id int2 NULL,
	postal_code varchar(10) NULL,
	phone varchar(20) NULL,
	last_update timestamp NULL
);

-- Drop table

-- DROP TABLE "ODS".city;

CREATE TABLE city (
	city_id int4 NULL,
	city varchar(50) NULL,
	country_id int2 NULL,
	last_update timestamp NULL
);

-- Drop table

-- DROP TABLE "ODS".country;

CREATE TABLE country (
	country_id int4 NULL,
	country varchar(50) NULL,
	last_update timestamp NULL
);

-- Drop table

-- DROP TABLE "ODS".customer;

CREATE TABLE customer (
	customer_id int4 NULL,
	store_id int2 NULL,
	first_name varchar(45) NULL,
	last_name varchar(45) NULL,
	email varchar(45) NULL,
	address_id int2 NULL,
	activebool bool NULL,
	create_date date NULL,
	last_update timestamp NULL,
	active int4 NULL
);

-- Drop table

-- DROP TABLE "ODS".payment;

CREATE TABLE payment (
	payment_id int4 NULL,
	customer_id int4 NULL,
	staff_id int4 NULL,
	rental_id int4 NULL,
	amount numeric NULL,
	payment_date timestamp NULL
);

-- Drop table

-- DROP TABLE "ODS".staff;

CREATE TABLE staff (
	staff_id int4 NULL,
	first_name varchar(45) NULL,
	last_name varchar(45) NULL,
	address_id int2 NULL,
	email varchar(50) NULL,
	store_id int2 NULL,
	active bool NULL,
	username varchar(16) NULL,
	"password" varchar(40) NULL,
	last_update timestamp NULL,
	picture bytea NULL
);



