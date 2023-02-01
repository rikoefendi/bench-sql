--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Homebrew)
-- Dumped by pg_dump version 14.6 (Homebrew)

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
-- Name: product_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_user (
    id bigint NOT NULL,
    user_id bigint,
    product_id bigint,
    is_active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.product_user OWNER TO postgres;

--
-- Name: product_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_users_id_seq OWNER TO postgres;

--
-- Name: product_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_users_id_seq OWNED BY public.product_user.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    product_id text,
    sku text,
    name text,
    slug text,
    description text,
    cut_off jsonb,
    stock bigint,
    seller text,
    is_active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name text,
    username text,
    email text,
    phone bigint,
    telegram text,
    email_verify_at timestamp with time zone,
    telegram_verify_at timestamp with time zone,
    password text,
    pin text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    version bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: product_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_user ALTER COLUMN id SET DEFAULT nextval('public.product_users_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: product_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_user (id, user_id, product_id, is_active, created_at, updated_at) FROM stdin;
1	1	1	f	2023-01-04 22:53:32.952417+07	2023-01-04 22:53:32.952417+07
5	5	5	f	2023-01-04 22:53:34.973596+07	2023-01-04 22:53:34.973596+07
6	6	6	f	2023-01-04 22:53:35.200224+07	2023-01-04 22:53:35.200224+07
7	7	7	f	2023-01-04 22:53:35.438273+07	2023-01-04 22:53:35.438273+07
8	8	8	f	2023-01-04 22:53:35.686051+07	2023-01-04 22:53:35.686051+07
9	9	9	f	2023-01-04 22:53:35.941993+07	2023-01-04 22:53:35.941993+07
10	10	10	f	2023-01-04 22:53:36.205708+07	2023-01-04 22:53:36.205708+07
11	11	11	f	2023-01-04 22:53:36.471653+07	2023-01-04 22:53:36.471653+07
12	12	12	f	2023-01-04 22:53:36.691877+07	2023-01-04 22:53:36.691877+07
13	13	13	f	2023-01-04 22:53:36.878888+07	2023-01-04 22:53:36.878888+07
14	14	14	f	2023-01-04 22:53:37.101463+07	2023-01-04 22:53:37.101463+07
2	1	2	f	2023-01-04 22:53:33.704092+07	2023-01-04 22:53:33.704092+07
3	1	3	f	2023-01-04 22:53:34.097053+07	2023-01-04 22:53:34.097053+07
4	1	4	f	2023-01-04 22:53:34.547813+07	2023-01-04 22:53:34.547813+07
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_id, sku, name, slug, description, cut_off, stock, seller, is_active, created_at, updated_at) FROM stdin;
2	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:33.703032+07	2023-01-04 22:53:33.703032+07
3	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:34.096028+07	2023-01-04 22:53:34.096028+07
4	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:34.546387+07	2023-01-04 22:53:34.546387+07
5	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:34.972083+07	2023-01-04 22:53:34.972083+07
6	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:35.199138+07	2023-01-04 22:53:35.199138+07
7	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:35.437012+07	2023-01-04 22:53:35.437012+07
8	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:35.684954+07	2023-01-04 22:53:35.684954+07
9	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:35.940764+07	2023-01-04 22:53:35.940764+07
10	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:36.204649+07	2023-01-04 22:53:36.204649+07
11	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:36.470555+07	2023-01-04 22:53:36.470555+07
12	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:36.690212+07	2023-01-04 22:53:36.690212+07
13	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:36.877666+07	2023-01-04 22:53:36.877666+07
14	\N	dm100	asdf	asdf		\N	45		f	2023-01-04 22:53:37.099896+07	2023-01-04 22:53:37.099896+07
1	\N	dm100	asdf	asdf		{"end": "1:00", "start": "0:00"}	45		f	2023-01-04 22:53:32.949811+07	2023-01-04 22:53:32.949811+07
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, username, email, phone, telegram, email_verify_at, telegram_verify_at, password, pin, created_at, updated_at, version) FROM stdin;
1	adsf	adsfa	adsf@mail.coma	\N	\N	\N	\N		\N	2023-01-09 13:31:04.236417+07	2023-01-09 14:00:41.703095+07	1
2	adsfs	adssfass	adsf@maail.comass	\N	\N	\N	\N	$2a$10$pYfmJCTCSNnJklB8I0drdeMf3Uze7jO3mTMWPpjwA5HWOKMFeIddu	\N	2023-01-10 14:21:22.08032+07	2023-01-10 14:21:22.08032+07	1
3	adsfs	adssfa	adsf@maail.co	\N	\N	\N	\N	$2a$10$llIfcdu6MF/BRK94prTfW.w.b3fyyTeh2gIL4AQWxfHDKLCm/PO/.	\N	2023-01-10 16:02:20.459278+07	2023-01-10 16:02:20.459278+07	1
4	adsfs	adsssfa	adsf@maail.cos	\N	\N	\N	\N	$2a$10$n3Ji8xijeF5EG4mvku5jreHVPgded3KC4dCIfG7t.Gh5qmemco6FS	\N	2023-01-10 16:15:49.206911+07	2023-01-10 16:15:49.206911+07	1
5	adsfs	adsssfaa	adsf@maail.cosa	\N	\N	\N	\N	$2a$10$yu76Yk4ue6uXTdkMWEqie.R/7fePnkzhcgT3J5OL/Dttc7nZMVQFW	\N	2023-01-10 16:16:04.073407+07	2023-01-10 16:16:04.073407+07	1
6	adsfs	adsssfasa	adsf@maail.cossa	\N	\N	\N	\N	asdfasdf	\N	2023-01-10 16:42:21.939157+07	2023-01-10 16:42:21.939157+07	1
7	adsfs	adsssfasas	adsf@maail.cosssa	\N	\N	\N	\N	$2a$10$uemstjQ9YzQkt0jpmLUJheGeAi9NsR.t8RwmOOawhNJJMoGT8qKMe	\N	2023-01-10 16:43:12.93487+07	2023-01-10 16:43:12.93487+07	1
8	adsfs	adsssfasass	adsf@maail.cosssaa	\N	\N	\N	\N	$2a$10$XTSbhAocxO/fl4dfIklK6OF1zK.MAg9B3RDEzFRPxaAD4ayzAO9NK	\N	2023-01-10 16:43:20.471378+07	2023-01-10 16:43:20.471378+07	1
9	adsfs	adsssfasasss	adsf@maail.cosssaas	\N	\N	\N	\N	$2a$10$zC2wcpA5flvv6GihguGUxeh1Duxf5qKrbOxSkfm9924iDs0tudV6S	\N	2023-01-10 16:43:25.517982+07	2023-01-10 16:43:25.517982+07	1
10	adsfs	adsssfasassss	adsf@maail.cossssaas	\N	\N	\N	\N	asdfasdf	\N	2023-01-10 16:43:44.328802+07	2023-01-10 16:43:44.328802+07	1
11	adsfs	adsssfasasssss	adsf@maail.cosssssaas	\N	\N	\N	\N	asdfasdf	\N	2023-01-10 16:43:47.646933+07	2023-01-10 16:43:47.646933+07	1
136	adsfs	adsssfasassssss	adsf@maail.cossssssaas	\N	\N	\N	\N	asdfasdf	\N	2023-01-10 16:43:50.654283+07	2023-01-10 16:43:50.654283+07	1
137	adsfs	adsssfasasssssss	adsf@maail.cosssssssaas	\N	\N	\N	\N	asdfasdf	\N	2023-01-10 16:43:54.158061+07	2023-01-10 16:43:54.158061+07	1
138	adsfs	adsssfasassssssss	adsf@maail.cosssssssaass	\N	\N	\N	\N	$2a$10$/rAc0OwKSwOHF7Uv8kvpwegfldGaSnJFUcM0PB7lOPH2J8RX1WOCG	\N	2023-01-10 16:44:20.393309+07	2023-01-10 16:44:20.393309+07	1
16	adsf	adssfas	adsf@maail.comas	\N	\N	\N	\N		\N	2023-01-09 14:33:25.144036+07	2023-01-09 14:33:25.144036+07	1
140	adsfs	adsssfasasssssssss	adsf@maail.cossssssssaass	\N	\N	2023-01-11 00:08:01.407994+07	\N	$2a$10$ld40b1MHIHXKCNZ35aTC1.t7bg4Sb24pr1fsWUtQxyW1Pt0DYNYt6	\N	2023-01-10 20:35:17.26402+07	2023-01-11 00:08:01.408327+07	1
\.


--
-- Name: product_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_users_id_seq', 14, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 140, true);


--
-- Name: product_user product_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_user
    ADD CONSTRAINT product_users_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: idx_products_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_created_at ON public.products USING btree (created_at);


--
-- Name: idx_products_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_product_id ON public.products USING btree (product_id);


--
-- Name: idx_products_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_slug ON public.products USING btree (slug);


--
-- Name: idx_products_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_updated_at ON public.products USING btree (updated_at);


--
-- Name: idx_users_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_created_at ON public.users USING btree (created_at);


--
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_email ON public.users USING btree (email);


--
-- Name: idx_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_id ON public.users USING btree (id);


--
-- Name: idx_users_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_phone ON public.users USING btree (phone);


--
-- Name: idx_users_telegram; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_telegram ON public.users USING btree (telegram);


--
-- Name: idx_users_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_updated_at ON public.users USING btree (updated_at);


--
-- Name: idx_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_username ON public.users USING btree (username);


--
-- Name: product_id_product_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_id_product_user_idx ON public.product_user USING btree (product_id);


--
-- Name: user_id_product_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_id_product_user_idx ON public.product_user USING btree (user_id);


--
-- PostgreSQL database dump complete
--

