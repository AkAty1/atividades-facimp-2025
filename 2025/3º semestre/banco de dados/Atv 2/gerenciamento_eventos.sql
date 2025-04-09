--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-25 09:31:13

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
-- TOC entry 218 (class 1259 OID 16472)
-- Name: eventos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventos (
    id integer NOT NULL,
    nome text NOT NULL,
    data_evento date NOT NULL,
    local text NOT NULL,
    detalhes text
);


ALTER TABLE public.eventos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16519)
-- Name: eventos_fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventos_fornecedores (
    id integer NOT NULL,
    evento_id integer NOT NULL,
    fornecedor_id integer NOT NULL
);


ALTER TABLE public.eventos_fornecedores OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16518)
-- Name: eventos_fornecedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eventos_fornecedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eventos_fornecedores_id_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 225
-- Name: eventos_fornecedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eventos_fornecedores_id_seq OWNED BY public.eventos_fornecedores.id;


--
-- TOC entry 217 (class 1259 OID 16471)
-- Name: eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eventos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eventos_id_seq OWNER TO postgres;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 217
-- Name: eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eventos_id_seq OWNED BY public.eventos.id;


--
-- TOC entry 222 (class 1259 OID 16492)
-- Name: fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedores (
    id integer NOT NULL,
    nome text NOT NULL,
    servico text NOT NULL
);


ALTER TABLE public.fornecedores OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16491)
-- Name: fornecedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fornecedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fornecedores_id_seq OWNER TO postgres;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 221
-- Name: fornecedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fornecedores_id_seq OWNED BY public.fornecedores.id;


--
-- TOC entry 224 (class 1259 OID 16501)
-- Name: inscricoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscricoes (
    id integer NOT NULL,
    evento_id integer NOT NULL,
    participante_id integer NOT NULL,
    data_inscricao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.inscricoes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16500)
-- Name: inscricoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscricoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscricoes_id_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 223
-- Name: inscricoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscricoes_id_seq OWNED BY public.inscricoes.id;


--
-- TOC entry 220 (class 1259 OID 16481)
-- Name: participantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participantes (
    id integer NOT NULL,
    nome text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.participantes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16480)
-- Name: participantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.participantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.participantes_id_seq OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 219
-- Name: participantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.participantes_id_seq OWNED BY public.participantes.id;


--
-- TOC entry 4762 (class 2604 OID 16475)
-- Name: eventos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos ALTER COLUMN id SET DEFAULT nextval('public.eventos_id_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 16522)
-- Name: eventos_fornecedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos_fornecedores ALTER COLUMN id SET DEFAULT nextval('public.eventos_fornecedores_id_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 16495)
-- Name: fornecedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores ALTER COLUMN id SET DEFAULT nextval('public.fornecedores_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 16504)
-- Name: inscricoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscricoes ALTER COLUMN id SET DEFAULT nextval('public.inscricoes_id_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 16484)
-- Name: participantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participantes ALTER COLUMN id SET DEFAULT nextval('public.participantes_id_seq'::regclass);


--
-- TOC entry 4930 (class 0 OID 16472)
-- Dependencies: 218
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eventos (id, nome, data_evento, local, detalhes) FROM stdin;
2	Workshop de IA	2025-07-10	Rio de Janeiro	Treinamento sobre Inteligência Artificial
\.


--
-- TOC entry 4938 (class 0 OID 16519)
-- Dependencies: 226
-- Data for Name: eventos_fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eventos_fornecedores (id, evento_id, fornecedor_id) FROM stdin;
3	2	2
\.


--
-- TOC entry 4934 (class 0 OID 16492)
-- Dependencies: 222
-- Data for Name: fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fornecedores (id, nome, servico) FROM stdin;
1	Buffet Gourmet	Catering
2	TechSound	Áudio e iluminação
\.


--
-- TOC entry 4936 (class 0 OID 16501)
-- Dependencies: 224
-- Data for Name: inscricoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscricoes (id, evento_id, participante_id, data_inscricao) FROM stdin;
3	2	2	2025-03-25 08:40:07.121397
\.


--
-- TOC entry 4932 (class 0 OID 16481)
-- Dependencies: 220
-- Data for Name: participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participantes (id, nome, email) FROM stdin;
1	Carlos Souza	carlos@email.com
2	Ana Lima	ana@email.com
\.


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 225
-- Name: eventos_fornecedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eventos_fornecedores_id_seq', 3, true);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 217
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eventos_id_seq', 2, true);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 221
-- Name: fornecedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fornecedores_id_seq', 2, true);


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 223
-- Name: inscricoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscricoes_id_seq', 3, true);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 219
-- Name: participantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.participantes_id_seq', 2, true);


--
-- TOC entry 4779 (class 2606 OID 16524)
-- Name: eventos_fornecedores eventos_fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos_fornecedores
    ADD CONSTRAINT eventos_fornecedores_pkey PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 16479)
-- Name: eventos eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 16499)
-- Name: fornecedores fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 16507)
-- Name: inscricoes inscricoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscricoes
    ADD CONSTRAINT inscricoes_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 16490)
-- Name: participantes participantes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participantes
    ADD CONSTRAINT participantes_email_key UNIQUE (email);


--
-- TOC entry 4773 (class 2606 OID 16488)
-- Name: participantes participantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participantes
    ADD CONSTRAINT participantes_pkey PRIMARY KEY (id);


--
-- TOC entry 4782 (class 2606 OID 16525)
-- Name: eventos_fornecedores eventos_fornecedores_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos_fornecedores
    ADD CONSTRAINT eventos_fornecedores_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id) ON DELETE CASCADE;


--
-- TOC entry 4783 (class 2606 OID 16530)
-- Name: eventos_fornecedores eventos_fornecedores_fornecedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos_fornecedores
    ADD CONSTRAINT eventos_fornecedores_fornecedor_id_fkey FOREIGN KEY (fornecedor_id) REFERENCES public.fornecedores(id) ON DELETE CASCADE;


--
-- TOC entry 4780 (class 2606 OID 16508)
-- Name: inscricoes inscricoes_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscricoes
    ADD CONSTRAINT inscricoes_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id) ON DELETE CASCADE;


--
-- TOC entry 4781 (class 2606 OID 16513)
-- Name: inscricoes inscricoes_participante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscricoes
    ADD CONSTRAINT inscricoes_participante_id_fkey FOREIGN KEY (participante_id) REFERENCES public.participantes(id) ON DELETE CASCADE;


-- Completed on 2025-03-25 09:31:13

--
-- PostgreSQL database dump complete
--

