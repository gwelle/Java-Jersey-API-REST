--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: address; Type: TABLE; Schema: public; Owner: guillaumewelle
--

CREATE TABLE public.address (
    id integer NOT NULL,
    city character varying(255),
    street character varying(255),
    zipcode character varying(255)
);


ALTER TABLE public.address OWNER TO guillaumewelle;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: guillaumewelle
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO guillaumewelle;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guillaumewelle
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- Name: developer; Type: TABLE; Schema: public; Owner: guillaumewelle
--

CREATE TABLE public.developer (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.developer OWNER TO guillaumewelle;

--
-- Name: developer_id_seq; Type: SEQUENCE; Schema: public; Owner: guillaumewelle
--

CREATE SEQUENCE public.developer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.developer_id_seq OWNER TO guillaumewelle;

--
-- Name: developer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guillaumewelle
--

ALTER SEQUENCE public.developer_id_seq OWNED BY public.developer.id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: guillaumewelle
--

CREATE TABLE public.location (
    id integer NOT NULL,
    city character varying(255),
    street character varying(255),
    zipcode character varying(255)
);


ALTER TABLE public.location OWNER TO guillaumewelle;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: guillaumewelle
--

CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO guillaumewelle;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guillaumewelle
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: guillaumewelle
--

CREATE TABLE public.persons (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.persons OWNER TO guillaumewelle;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: guillaumewelle
--

CREATE SEQUENCE public.persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_id_seq OWNER TO guillaumewelle;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guillaumewelle
--

ALTER SEQUENCE public.persons_id_seq OWNED BY public.persons.id;


--
-- Name: persons_location; Type: TABLE; Schema: public; Owner: guillaumewelle
--

CREATE TABLE public.persons_location (
    addresses_id integer NOT NULL,
    users_id integer NOT NULL
);


ALTER TABLE public.persons_location OWNER TO guillaumewelle;

--
-- Name: sports; Type: TABLE; Schema: public; Owner: guillaumewelle
--

CREATE TABLE public.sports (
    id integer NOT NULL,
    name character varying(20),
    type character varying(255)
);


ALTER TABLE public.sports OWNER TO guillaumewelle;

--
-- Name: sports_id_seq; Type: SEQUENCE; Schema: public; Owner: guillaumewelle
--

CREATE SEQUENCE public.sports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sports_id_seq OWNER TO guillaumewelle;

--
-- Name: sports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guillaumewelle
--

ALTER SEQUENCE public.sports_id_seq OWNED BY public.sports.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: guillaumewelle
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(200),
    password character varying(200),
    role character varying DEFAULT 'USER'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    gender character varying(255),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO guillaumewelle;

--
-- Name: users_address; Type: TABLE; Schema: public; Owner: guillaumewelle
--

CREATE TABLE public.users_address (
    user_id integer NOT NULL,
    addresses_id integer NOT NULL
);


ALTER TABLE public.users_address OWNER TO guillaumewelle;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: guillaumewelle
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO guillaumewelle;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guillaumewelle
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_sports; Type: TABLE; Schema: public; Owner: guillaumewelle
--

CREATE TABLE public.users_sports (
    users_id integer NOT NULL,
    sports_id integer NOT NULL
);


ALTER TABLE public.users_sports OWNER TO guillaumewelle;

--
-- Name: address id; Type: DEFAULT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: developer id; Type: DEFAULT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.developer ALTER COLUMN id SET DEFAULT nextval('public.developer_id_seq'::regclass);


--
-- Name: location id; Type: DEFAULT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- Name: persons id; Type: DEFAULT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.persons ALTER COLUMN id SET DEFAULT nextval('public.persons_id_seq'::regclass);


--
-- Name: sports id; Type: DEFAULT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.sports ALTER COLUMN id SET DEFAULT nextval('public.sports_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: guillaumewelle
--

COPY public.address (id, city, street, zipcode) FROM stdin;
1	Paris	Paris	75001
\.


--
-- Data for Name: developer; Type: TABLE DATA; Schema: public; Owner: guillaumewelle
--

COPY public.developer (id, user_id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: guillaumewelle
--

COPY public.location (id, city, street, zipcode) FROM stdin;
\.


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: guillaumewelle
--

COPY public.persons (id, email, password, role) FROM stdin;
\.


--
-- Data for Name: persons_location; Type: TABLE DATA; Schema: public; Owner: guillaumewelle
--

COPY public.persons_location (addresses_id, users_id) FROM stdin;
\.


--
-- Data for Name: sports; Type: TABLE DATA; Schema: public; Owner: guillaumewelle
--

COPY public.sports (id, name, type) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: guillaumewelle
--

COPY public.users (id, email, password, role, created_at, gender, updated_at) FROM stdin;
1	guillaume.welle.sio@gmail.com	cb297e33c365dc71a685bfd3dee03dc9	ADMIN	2023-08-28 23:37:35.874166	HOMME	\N
2	benjamin.welle@gmail.com	1122125a8a672e765fb95ded8ced33d2	USER	2023-08-28 23:37:35.877984	HOMME	\N
3	victorien.sobele@gmail.com	c72d79ea0a77fe2bfe0731c87079ddcf	USER	2023-08-28 23:37:35.878418	HOMME	\N
5	thomas.moreau@hotmail.com	b0cb7fc05abb7a98b0062b3a9a28980e	USER	2023-08-31 10:09:32.297278	HOMME	\N
6	maguy@upec-creteil.fr	4dba599d357a32f6791ca60d227b7f68	USER	2023-08-31 11:27:03.535347	FEMME	\N
4	guillaume.welle@yahoo.com	8d1232ed3ffa2700f192febed34792d7	USER	2023-08-31 10:05:25.134656	HOMME	\N
7	aurore.morin@gmail.com	b52d06b46de39560c69ee2260d7c0a3d	USER	2023-10-19 18:20:38.266132	FEMME	\N
8	imoni.tessa@gmail.com	e344d6dec9d5e214ff7fbf2a70fd09f2	USER	2023-10-19 18:46:36.487972	FEMME	2023-10-19 18:46:36.488102
\.


--
-- Data for Name: users_address; Type: TABLE DATA; Schema: public; Owner: guillaumewelle
--

COPY public.users_address (user_id, addresses_id) FROM stdin;
1	1
\.


--
-- Data for Name: users_sports; Type: TABLE DATA; Schema: public; Owner: guillaumewelle
--

COPY public.users_sports (users_id, sports_id) FROM stdin;
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guillaumewelle
--

SELECT pg_catalog.setval('public.address_id_seq', 1, true);


--
-- Name: developer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guillaumewelle
--

SELECT pg_catalog.setval('public.developer_id_seq', 1, false);


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guillaumewelle
--

SELECT pg_catalog.setval('public.location_id_seq', 1, false);


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guillaumewelle
--

SELECT pg_catalog.setval('public.persons_id_seq', 1, false);


--
-- Name: sports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guillaumewelle
--

SELECT pg_catalog.setval('public.sports_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guillaumewelle
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: developer developer_pkey; Type: CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.developer
    ADD CONSTRAINT developer_pkey PRIMARY KEY (id);


--
-- Name: developer developer_type_key; Type: CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.developer
    ADD CONSTRAINT developer_type_key UNIQUE (type);


--
-- Name: developer developer_user_id_key; Type: CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.developer
    ADD CONSTRAINT developer_user_id_key UNIQUE (user_id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: sports sports_pkey; Type: CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.sports
    ADD CONSTRAINT sports_pkey PRIMARY KEY (id);


--
-- Name: users_address uk_qru38d7ttujpgirmbbba69nqk; Type: CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.users_address
    ADD CONSTRAINT uk_qru38d7ttujpgirmbbba69nqk UNIQUE (addresses_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: developer developer_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.developer
    ADD CONSTRAINT developer_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_address fk2873eq6r6t2smo4mjmhxldjk0; Type: FK CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.users_address
    ADD CONSTRAINT fk2873eq6r6t2smo4mjmhxldjk0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_sports fk7c9mf167bny4p13s4smw028vu; Type: FK CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.users_sports
    ADD CONSTRAINT fk7c9mf167bny4p13s4smw028vu FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: users_sports fka9scjcj5s8j1byf5lonam5chc; Type: FK CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.users_sports
    ADD CONSTRAINT fka9scjcj5s8j1byf5lonam5chc FOREIGN KEY (sports_id) REFERENCES public.sports(id);


--
-- Name: persons_location fkcnr3d7u4sk49x0eqv336262eh; Type: FK CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.persons_location
    ADD CONSTRAINT fkcnr3d7u4sk49x0eqv336262eh FOREIGN KEY (addresses_id) REFERENCES public.location(id);


--
-- Name: persons_location fkejyk9muvy8rcb4sd5t1uh2fa6; Type: FK CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.persons_location
    ADD CONSTRAINT fkejyk9muvy8rcb4sd5t1uh2fa6 FOREIGN KEY (users_id) REFERENCES public.persons(id);


--
-- Name: users_address fknjck1537u9x6qec73vpk1hllc; Type: FK CONSTRAINT; Schema: public; Owner: guillaumewelle
--

ALTER TABLE ONLY public.users_address
    ADD CONSTRAINT fknjck1537u9x6qec73vpk1hllc FOREIGN KEY (addresses_id) REFERENCES public.address(id);


--
-- PostgreSQL database dump complete
--

