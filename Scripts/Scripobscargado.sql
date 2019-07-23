--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

-- Started on 2019-07-23 17:09:58 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 17991)
-- Name: ods; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ods;


ALTER SCHEMA ods OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 251 (class 1259 OID 18757)
-- Name: actor; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.actor (
    actor_id integer DEFAULT nextval('public.actor_actor_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.actor OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 18764)
-- Name: address; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.address (
    address_id integer DEFAULT nextval('public.address_address_id_seq'::regclass) NOT NULL,
    address character varying(50) NOT NULL,
    address2 character varying(50),
    district character varying(20) NOT NULL,
    city_id smallint NOT NULL,
    postal_code character varying(10),
    phone character varying(20) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.address OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 18771)
-- Name: category; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.category (
    category_id integer DEFAULT nextval('public.category_category_id_seq'::regclass) NOT NULL,
    name character varying(25) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.category OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 18778)
-- Name: city; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.city (
    city_id integer DEFAULT nextval('public.city_city_id_seq'::regclass) NOT NULL,
    city character varying(50) NOT NULL,
    country_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.city OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 18785)
-- Name: country; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.country (
    country_id integer DEFAULT nextval('public.country_country_id_seq'::regclass) NOT NULL,
    country character varying(50) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.country OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 18792)
-- Name: customer; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.customer (
    customer_id integer DEFAULT nextval('public.customer_customer_id_seq'::regclass) NOT NULL,
    store_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    address_id smallint NOT NULL,
    activebool boolean DEFAULT true NOT NULL,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    last_update timestamp without time zone DEFAULT now(),
    active integer
);


ALTER TABLE ods.customer OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 18870)
-- Name: film; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.film (
    film_id integer DEFAULT nextval('public.film_film_id_seq'::regclass) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_year public.year,
    language_id smallint NOT NULL,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating public.mpaa_rating DEFAULT 'G'::public.mpaa_rating,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    special_features text[],
    fulltext tsvector NOT NULL
);


ALTER TABLE ods.film OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 18801)
-- Name: film_actor; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.film_actor (
    actor_id smallint NOT NULL,
    film_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.film_actor OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 18807)
-- Name: film_category; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.film_category (
    film_id smallint NOT NULL,
    category_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.film_category OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 18813)
-- Name: inventory; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.inventory (
    inventory_id integer DEFAULT nextval('public.inventory_inventory_id_seq'::regclass) NOT NULL,
    film_id smallint NOT NULL,
    store_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.inventory OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 18820)
-- Name: language; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.language (
    language_id integer DEFAULT nextval('public.language_language_id_seq'::regclass) NOT NULL,
    name character(20) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.language OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 18827)
-- Name: payment; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.payment (
    payment_id integer DEFAULT nextval('public.payment_payment_id_seq'::regclass) NOT NULL,
    customer_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    rental_id integer NOT NULL,
    amount numeric(5,2) NOT NULL,
    payment_date timestamp without time zone NOT NULL
);


ALTER TABLE ods.payment OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 18833)
-- Name: rental; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.rental (
    rental_id integer DEFAULT nextval('public.rental_rental_id_seq'::regclass) NOT NULL,
    rental_date timestamp without time zone NOT NULL,
    inventory_id integer NOT NULL,
    customer_id smallint NOT NULL,
    return_date timestamp without time zone,
    staff_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.rental OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 18840)
-- Name: staff; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.staff (
    staff_id integer DEFAULT nextval('public.staff_staff_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id smallint NOT NULL,
    email character varying(50),
    store_id smallint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(40),
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    picture bytea
);


ALTER TABLE ods.staff OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 18851)
-- Name: store; Type: TABLE; Schema: ods; Owner: postgres
--

CREATE TABLE ods.store (
    store_id integer DEFAULT nextval('public.store_store_id_seq'::regclass) NOT NULL,
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE ods.store OWNER TO postgres;

--
-- TOC entry 3187 (class 0 OID 18757)
-- Dependencies: 251
-- Data for Name: actor; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.actor (actor_id, first_name, last_name, last_update) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 18764)
-- Dependencies: 252
-- Data for Name: address; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.address (address_id, address, address2, district, city_id, postal_code, phone, last_update) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 18771)
-- Dependencies: 253
-- Data for Name: category; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.category (category_id, name, last_update) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 18778)
-- Dependencies: 254
-- Data for Name: city; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.city (city_id, city, country_id, last_update) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 18785)
-- Dependencies: 255
-- Data for Name: country; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.country (country_id, country, last_update) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 18792)
-- Dependencies: 256
-- Data for Name: customer; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 18870)
-- Dependencies: 265
-- Data for Name: film; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 18801)
-- Dependencies: 257
-- Data for Name: film_actor; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.film_actor (actor_id, film_id, last_update) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 18807)
-- Dependencies: 258
-- Data for Name: film_category; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.film_category (film_id, category_id, last_update) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 18813)
-- Dependencies: 259
-- Data for Name: inventory; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.inventory (inventory_id, film_id, store_id, last_update) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 18820)
-- Dependencies: 260
-- Data for Name: language; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.language (language_id, name, last_update) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 18827)
-- Dependencies: 261
-- Data for Name: payment; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 18833)
-- Dependencies: 262
-- Data for Name: rental; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 18840)
-- Dependencies: 263
-- Data for Name: staff; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 18851)
-- Dependencies: 264
-- Data for Name: store; Type: TABLE DATA; Schema: ods; Owner: postgres
--

COPY ods.store (store_id, manager_staff_id, address_id, last_update) FROM stdin;
\.


--
-- TOC entry 3030 (class 2606 OID 18763)
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


--
-- TOC entry 3032 (class 2606 OID 18770)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- TOC entry 3034 (class 2606 OID 18777)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3036 (class 2606 OID 18784)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- TOC entry 3038 (class 2606 OID 18791)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- TOC entry 3040 (class 2606 OID 18800)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 3042 (class 2606 OID 18806)
-- Name: film_actor film_actor_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.film_actor
    ADD CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id, film_id);


--
-- TOC entry 3044 (class 2606 OID 18812)
-- Name: film_category film_category_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.film_category
    ADD CONSTRAINT film_category_pkey PRIMARY KEY (film_id, category_id);


--
-- TOC entry 3058 (class 2606 OID 18883)
-- Name: film film_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);


--
-- TOC entry 3046 (class 2606 OID 18819)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- TOC entry 3048 (class 2606 OID 18826)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- TOC entry 3050 (class 2606 OID 18832)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 3052 (class 2606 OID 18839)
-- Name: rental rental_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (rental_id);


--
-- TOC entry 3054 (class 2606 OID 18850)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- TOC entry 3056 (class 2606 OID 18857)
-- Name: store store_pkey; Type: CONSTRAINT; Schema: ods; Owner: postgres
--

ALTER TABLE ONLY ods.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);


-- Completed on 2019-07-23 17:09:58 -04

--
-- PostgreSQL database dump complete
--

