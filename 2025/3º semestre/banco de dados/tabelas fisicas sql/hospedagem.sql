--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-25 09:31:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 16537)
-- Name: hospedes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospedes (
    id integer NOT NULL,
    nome text NOT NULL,
    email text NOT NULL,
    telefone text NOT NULL,
    preferencias text
);


ALTER TABLE public.hospedes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16536)
-- Name: hospedes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospedes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hospedes_id_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 217
-- Name: hospedes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospedes_id_seq OWNED BY public.hospedes.id;


--
-- TOC entry 220 (class 1259 OID 16548)
-- Name: quartos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quartos (
    id integer NOT NULL,
    numero text NOT NULL,
    tipo text NOT NULL,
    preco_diaria numeric(10,2) NOT NULL
);


ALTER TABLE public.quartos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16547)
-- Name: quartos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quartos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quartos_id_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 219
-- Name: quartos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quartos_id_seq OWNED BY public.quartos.id;


--
-- TOC entry 222 (class 1259 OID 16559)
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    id integer NOT NULL,
    hospede_id integer NOT NULL,
    quarto_id integer NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16558)
-- Name: reservas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservas_id_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 221
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;


--
-- TOC entry 4752 (class 2604 OID 16540)
-- Name: hospedes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospedes ALTER COLUMN id SET DEFAULT nextval('public.hospedes_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 16551)
-- Name: quartos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quartos ALTER COLUMN id SET DEFAULT nextval('public.quartos_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 16562)
-- Name: reservas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas ALTER COLUMN id SET DEFAULT nextval('public.reservas_id_seq'::regclass);


--
-- TOC entry 4913 (class 0 OID 16537)
-- Dependencies: 218
-- Data for Name: hospedes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospedes (id, nome, email, telefone, preferencias) FROM stdin;
2	Ana Lima	ana@email.com	21988888888	Cama king-size
\.


--
-- TOC entry 4915 (class 0 OID 16548)
-- Dependencies: 220
-- Data for Name: quartos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quartos (id, numero, tipo, preco_diaria) FROM stdin;
1	101	Standard	150.00
2	202	Luxo	350.00
\.


--
-- TOC entry 4917 (class 0 OID 16559)
-- Dependencies: 222
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (id, hospede_id, quarto_id, check_in, check_out) FROM stdin;
2	2	2	2025-07-01	2025-07-07
\.


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 217
-- Name: hospedes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospedes_id_seq', 2, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 219
-- Name: quartos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quartos_id_seq', 2, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 221
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_id_seq', 2, true);


--
-- TOC entry 4756 (class 2606 OID 16546)
-- Name: hospedes hospedes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospedes
    ADD CONSTRAINT hospedes_email_key UNIQUE (email);


--
-- TOC entry 4758 (class 2606 OID 16544)
-- Name: hospedes hospedes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospedes
    ADD CONSTRAINT hospedes_pkey PRIMARY KEY (id);


--
-- TOC entry 4760 (class 2606 OID 16557)
-- Name: quartos quartos_numero_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quartos
    ADD CONSTRAINT quartos_numero_key UNIQUE (numero);


--
-- TOC entry 4762 (class 2606 OID 16555)
-- Name: quartos quartos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quartos
    ADD CONSTRAINT quartos_pkey PRIMARY KEY (id);


--
-- TOC entry 4764 (class 2606 OID 16564)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 16565)
-- Name: reservas reservas_hospede_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_hospede_id_fkey FOREIGN KEY (hospede_id) REFERENCES public.hospedes(id) ON DELETE CASCADE;


--
-- TOC entry 4766 (class 2606 OID 16570)
-- Name: reservas reservas_quarto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_quarto_id_fkey FOREIGN KEY (quarto_id) REFERENCES public.quartos(id) ON DELETE CASCADE;


-- Completed on 2025-03-25 09:31:42

--
-- PostgreSQL database dump complete
--

