--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-11-25 15:00:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16517)
-- Name: adresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adresses (
    id integer NOT NULL,
    title text NOT NULL,
    adress_line text,
    zipcode text,
    street_id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.adresses OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16806)
-- Name: brand_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand_products (
    product_id integer NOT NULL,
    brand_id integer NOT NULL
);


ALTER TABLE public.brand_products OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16699)
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16568)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16473)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16791)
-- Name: color_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color_products (
    color_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.color_products OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16692)
-- Name: colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colors (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.colors OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16466)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16510)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    username character varying NOT NULL,
    first_name character varying NOT NULL,
    second_name character varying NOT NULL,
    mail text,
    phone text
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16580)
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts (
    id integer NOT NULL,
    name character varying NOT NULL,
    percent real NOT NULL,
    "desc" text
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16776)
-- Name: discounts_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts_categories (
    category_id integer NOT NULL,
    discount_id integer NOT NULL
);


ALTER TABLE public.discounts_categories OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16629)
-- Name: express_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.express_rates (
    id integer NOT NULL,
    name character varying NOT NULL,
    rate real NOT NULL
);


ALTER TABLE public.express_rates OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16619)
-- Name: followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.followers (
    id integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public.followers OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16662)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    total_price real NOT NULL,
    customer_id integer NOT NULL,
    seller_id integer NOT NULL,
    product_id integer NOT NULL,
    shipment_method_id integer NOT NULL,
    invoice_adress_id integer NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16714)
-- Name: payment_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_details (
    id integer NOT NULL,
    status text NOT NULL,
    order_id integer NOT NULL,
    payment_type_id integer NOT NULL
);


ALTER TABLE public.payment_details OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16836)
-- Name: payment_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_products (
    product_id integer NOT NULL,
    payment_details_id integer NOT NULL
);


ALTER TABLE public.payment_products OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16655)
-- Name: payment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_types (
    id integer NOT NULL,
    payment_options text NOT NULL
);


ALTER TABLE public.payment_types OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16881)
-- Name: pdetails_ptypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pdetails_ptypes (
    payment_detail_id integer NOT NULL,
    payment_type_id integer NOT NULL
);


ALTER TABLE public.pdetails_ptypes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16556)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    "desc" text,
    unit_price real NOT NULL,
    stock_id integer NOT NULL,
    category_id integer NOT NULL,
    discount_id integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16763)
-- Name: products_sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_sellers (
    product_id integer NOT NULL,
    seller_id integer NOT NULL
);


ALTER TABLE public.products_sellers OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16609)
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    score real NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16648)
-- Name: reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reasons (
    id integer NOT NULL,
    return_options text NOT NULL
);


ALTER TABLE public.reasons OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16866)
-- Name: reasons_returns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reasons_returns (
    return_id integer,
    reason_id integer NOT NULL
);


ALTER TABLE public.reasons_returns OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16851)
-- Name: return_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_products (
    product_id integer NOT NULL,
    return_id integer NOT NULL
);


ALTER TABLE public.return_products OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16731)
-- Name: returns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.returns (
    id integer NOT NULL,
    total_refund real NOT NULL,
    "desc" text,
    order_id integer NOT NULL,
    reason_id integer NOT NULL,
    product_id integer NOT NULL,
    payment_detail_id integer NOT NULL
);


ALTER TABLE public.returns OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16534)
-- Name: scores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scores (
    id integer NOT NULL,
    score real NOT NULL
);


ALTER TABLE public.scores OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16602)
-- Name: sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellers (
    id integer NOT NULL,
    name character varying NOT NULL,
    rating_id integer NOT NULL,
    follower_id integer NOT NULL
);


ALTER TABLE public.sellers OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16636)
-- Name: shipment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipment_methods (
    id integer NOT NULL,
    name character varying NOT NULL,
    price real NOT NULL,
    express_rate_id integer NOT NULL
);


ALTER TABLE public.shipment_methods OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16821)
-- Name: size_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.size_products (
    product_id integer NOT NULL,
    size_id integer NOT NULL
);


ALTER TABLE public.size_products OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16707)
-- Name: sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sizes (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.sizes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16592)
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    id integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16488)
-- Name: streets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.streets (
    id integer NOT NULL,
    name character varying NOT NULL,
    town_id integer NOT NULL
);


ALTER TABLE public.streets OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16480)
-- Name: towns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.towns (
    id integer NOT NULL,
    name character varying NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.towns OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16539)
-- Name: user_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_reviews (
    id integer NOT NULL,
    count real NOT NULL,
    "desc" text,
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    score_id integer NOT NULL
);


ALTER TABLE public.user_reviews OWNER TO postgres;

--
-- TOC entry 3543 (class 0 OID 16517)
-- Dependencies: 219
-- Data for Name: adresses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3566 (class 0 OID 16806)
-- Dependencies: 242
-- Data for Name: brand_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3559 (class 0 OID 16699)
-- Dependencies: 235
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3547 (class 0 OID 16568)
-- Dependencies: 223
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3539 (class 0 OID 16473)
-- Dependencies: 215
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3565 (class 0 OID 16791)
-- Dependencies: 241
-- Data for Name: color_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3558 (class 0 OID 16692)
-- Dependencies: 234
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3538 (class 0 OID 16466)
-- Dependencies: 214
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3542 (class 0 OID 16510)
-- Dependencies: 218
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3548 (class 0 OID 16580)
-- Dependencies: 224
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3564 (class 0 OID 16776)
-- Dependencies: 240
-- Data for Name: discounts_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3553 (class 0 OID 16629)
-- Dependencies: 229
-- Data for Name: express_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3552 (class 0 OID 16619)
-- Dependencies: 228
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3557 (class 0 OID 16662)
-- Dependencies: 233
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3561 (class 0 OID 16714)
-- Dependencies: 237
-- Data for Name: payment_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3568 (class 0 OID 16836)
-- Dependencies: 244
-- Data for Name: payment_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3556 (class 0 OID 16655)
-- Dependencies: 232
-- Data for Name: payment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3571 (class 0 OID 16881)
-- Dependencies: 247
-- Data for Name: pdetails_ptypes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3546 (class 0 OID 16556)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3563 (class 0 OID 16763)
-- Dependencies: 239
-- Data for Name: products_sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3551 (class 0 OID 16609)
-- Dependencies: 227
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3555 (class 0 OID 16648)
-- Dependencies: 231
-- Data for Name: reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3570 (class 0 OID 16866)
-- Dependencies: 246
-- Data for Name: reasons_returns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3569 (class 0 OID 16851)
-- Dependencies: 245
-- Data for Name: return_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3562 (class 0 OID 16731)
-- Dependencies: 238
-- Data for Name: returns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3544 (class 0 OID 16534)
-- Dependencies: 220
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3550 (class 0 OID 16602)
-- Dependencies: 226
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3554 (class 0 OID 16636)
-- Dependencies: 230
-- Data for Name: shipment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3567 (class 0 OID 16821)
-- Dependencies: 243
-- Data for Name: size_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3560 (class 0 OID 16707)
-- Dependencies: 236
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3549 (class 0 OID 16592)
-- Dependencies: 225
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3541 (class 0 OID 16488)
-- Dependencies: 217
-- Data for Name: streets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3540 (class 0 OID 16480)
-- Dependencies: 216
-- Data for Name: towns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3545 (class 0 OID 16539)
-- Dependencies: 221
-- Data for Name: user_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3315 (class 2606 OID 16523)
-- Name: adresses adresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresses
    ADD CONSTRAINT adresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3347 (class 2606 OID 16705)
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 16574)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 16479)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3345 (class 2606 OID 16698)
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 16472)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 16516)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 16586)
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 16635)
-- Name: express_rates express_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.express_rates
    ADD CONSTRAINT express_rates_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 16623)
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- TOC entry 3343 (class 2606 OID 16666)
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3351 (class 2606 OID 16720)
-- Name: payment_details payment_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3341 (class 2606 OID 16661)
-- Name: payment_types payment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_types
    ADD CONSTRAINT payment_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 16562)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 16613)
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 16654)
-- Name: reasons reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reasons
    ADD CONSTRAINT reasons_pkey PRIMARY KEY (id);


--
-- TOC entry 3353 (class 2606 OID 16737)
-- Name: returns returns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 16538)
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 16608)
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 16642)
-- Name: shipment_methods shipment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment_methods
    ADD CONSTRAINT shipment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 3349 (class 2606 OID 16713)
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 16596)
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 16494)
-- Name: streets streets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 16486)
-- Name: towns towns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.towns
    ADD CONSTRAINT towns_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 16545)
-- Name: user_reviews user_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT user_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3384 (class 2606 OID 16816)
-- Name: brand_products brands_brand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand_products
    ADD CONSTRAINT brands_brand FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- TOC entry 3386 (class 2606 OID 16831)
-- Name: size_products brands_brand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size_products
    ADD CONSTRAINT brands_brand FOREIGN KEY (size_id) REFERENCES public.sizes(id);


--
-- TOC entry 3380 (class 2606 OID 16781)
-- Name: discounts_categories categories_discount; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts_categories
    ADD CONSTRAINT categories_discount FOREIGN KEY (category_id) REFERENCES public.categories(id) NOT VALID;


--
-- TOC entry 3362 (class 2606 OID 16575)
-- Name: products category_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT category_product FOREIGN KEY (category_id) REFERENCES public.categories(id) NOT VALID;


--
-- TOC entry 3355 (class 2606 OID 16500)
-- Name: towns city_towns; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.towns
    ADD CONSTRAINT city_towns FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;


--
-- TOC entry 3382 (class 2606 OID 16801)
-- Name: color_products colors_color; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color_products
    ADD CONSTRAINT colors_color FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- TOC entry 3354 (class 2606 OID 16495)
-- Name: cities country_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT country_city FOREIGN KEY (country_id) REFERENCES public.countries(id) NOT VALID;


--
-- TOC entry 3357 (class 2606 OID 16529)
-- Name: adresses customer_adress; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresses
    ADD CONSTRAINT customer_adress FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- TOC entry 3368 (class 2606 OID 16667)
-- Name: order_details customer_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT customer_order FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- TOC entry 3359 (class 2606 OID 16551)
-- Name: user_reviews customer_reviews; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT customer_reviews FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- TOC entry 3363 (class 2606 OID 16587)
-- Name: products discount_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT discount_product FOREIGN KEY (discount_id) REFERENCES public.discounts(id) NOT VALID;


--
-- TOC entry 3381 (class 2606 OID 16786)
-- Name: discounts_categories discounts_discount; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts_categories
    ADD CONSTRAINT discounts_discount FOREIGN KEY (discount_id) REFERENCES public.discounts(id) NOT VALID;


--
-- TOC entry 3367 (class 2606 OID 16643)
-- Name: shipment_methods express_rates_shipment_methods; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment_methods
    ADD CONSTRAINT express_rates_shipment_methods FOREIGN KEY (express_rate_id) REFERENCES public.express_rates(id);


--
-- TOC entry 3365 (class 2606 OID 16624)
-- Name: sellers follower_seller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT follower_seller FOREIGN KEY (follower_id) REFERENCES public.followers(id) NOT VALID;


--
-- TOC entry 3369 (class 2606 OID 16687)
-- Name: order_details invoice_adress_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT invoice_adress_order FOREIGN KEY (invoice_adress_id) REFERENCES public.adresses(id) NOT VALID;


--
-- TOC entry 3373 (class 2606 OID 16721)
-- Name: payment_details order_payment_details; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT order_payment_details FOREIGN KEY (order_id) REFERENCES public.order_details(id) NOT VALID;


--
-- TOC entry 3374 (class 2606 OID 16738)
-- Name: returns order_return; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT order_return FOREIGN KEY (order_id) REFERENCES public.order_details(id) NOT VALID;


--
-- TOC entry 3388 (class 2606 OID 16846)
-- Name: payment_products payment_detail_payments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_products
    ADD CONSTRAINT payment_detail_payments FOREIGN KEY (payment_details_id) REFERENCES public.payment_details(id);


--
-- TOC entry 3375 (class 2606 OID 16753)
-- Name: returns payment_return; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT payment_return FOREIGN KEY (payment_detail_id) REFERENCES public.payment_details(id) NOT VALID;


--
-- TOC entry 3394 (class 2606 OID 16886)
-- Name: pdetails_ptypes pdetail_ptypes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pdetails_ptypes
    ADD CONSTRAINT pdetail_ptypes FOREIGN KEY (payment_detail_id) REFERENCES public.payment_details(id) NOT VALID;


--
-- TOC entry 3385 (class 2606 OID 16811)
-- Name: brand_products product_brand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand_products
    ADD CONSTRAINT product_brand FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3383 (class 2606 OID 16796)
-- Name: color_products product_color; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color_products
    ADD CONSTRAINT product_color FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3378 (class 2606 OID 16766)
-- Name: products_sellers product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_sellers
    ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3370 (class 2606 OID 16677)
-- Name: order_details product_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT product_order FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 3389 (class 2606 OID 16841)
-- Name: payment_products product_payments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_products
    ADD CONSTRAINT product_payments FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3376 (class 2606 OID 16748)
-- Name: returns product_return; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT product_return FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 3390 (class 2606 OID 16856)
-- Name: return_products product_returns; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_products
    ADD CONSTRAINT product_returns FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3360 (class 2606 OID 16563)
-- Name: user_reviews product_reviews; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT product_reviews FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 3387 (class 2606 OID 16826)
-- Name: size_products products_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size_products
    ADD CONSTRAINT products_size FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3395 (class 2606 OID 16891)
-- Name: pdetails_ptypes ptype_pdetails; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pdetails_ptypes
    ADD CONSTRAINT ptype_pdetails FOREIGN KEY (payment_type_id) REFERENCES public.payment_types(id) NOT VALID;


--
-- TOC entry 3366 (class 2606 OID 16614)
-- Name: sellers rating_seller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT rating_seller FOREIGN KEY (rating_id) REFERENCES public.ratings(id) NOT VALID;


--
-- TOC entry 3392 (class 2606 OID 16876)
-- Name: reasons_returns reason_reasons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reasons_returns
    ADD CONSTRAINT reason_reasons FOREIGN KEY (reason_id) REFERENCES public.reasons(id);


--
-- TOC entry 3377 (class 2606 OID 16743)
-- Name: returns reason_return; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT reason_return FOREIGN KEY (reason_id) REFERENCES public.reasons(id) NOT VALID;


--
-- TOC entry 3393 (class 2606 OID 16871)
-- Name: reasons_returns return_reasons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reasons_returns
    ADD CONSTRAINT return_reasons FOREIGN KEY (return_id) REFERENCES public.returns(id);


--
-- TOC entry 3391 (class 2606 OID 16861)
-- Name: return_products return_returns; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_products
    ADD CONSTRAINT return_returns FOREIGN KEY (return_id) REFERENCES public.returns(id);


--
-- TOC entry 3361 (class 2606 OID 16546)
-- Name: user_reviews score_reviews; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT score_reviews FOREIGN KEY (score_id) REFERENCES public.scores(id) NOT VALID;


--
-- TOC entry 3379 (class 2606 OID 16771)
-- Name: products_sellers seller_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_sellers
    ADD CONSTRAINT seller_fk FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- TOC entry 3371 (class 2606 OID 16672)
-- Name: order_details seller_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT seller_order FOREIGN KEY (seller_id) REFERENCES public.sellers(id) NOT VALID;


--
-- TOC entry 3372 (class 2606 OID 16682)
-- Name: order_details shipment_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT shipment_order FOREIGN KEY (shipment_method_id) REFERENCES public.shipment_methods(id) NOT VALID;


--
-- TOC entry 3364 (class 2606 OID 16597)
-- Name: products stock_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT stock_product FOREIGN KEY (stock_id) REFERENCES public.stocks(id) NOT VALID;


--
-- TOC entry 3358 (class 2606 OID 16524)
-- Name: adresses street_adress; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresses
    ADD CONSTRAINT street_adress FOREIGN KEY (street_id) REFERENCES public.streets(id) NOT VALID;


--
-- TOC entry 3356 (class 2606 OID 16505)
-- Name: streets town_streets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT town_streets FOREIGN KEY (town_id) REFERENCES public.towns(id) NOT VALID;


-- Completed on 2022-11-25 15:00:04

--
-- PostgreSQL database dump complete
--
