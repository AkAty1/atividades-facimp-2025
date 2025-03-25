--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-25 09:30:31

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
-- TOC entry 222 (class 1259 OID 16454)
-- Name: consultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultas (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    medico_id integer NOT NULL,
    data_consulta date NOT NULL,
    hora_consulta time without time zone NOT NULL
);


ALTER TABLE public.consultas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16453)
-- Name: consultas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consultas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consultas_id_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 221
-- Name: consultas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consultas_id_seq OWNED BY public.consultas.id;


--
-- TOC entry 220 (class 1259 OID 16445)
-- Name: medicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicos (
    id integer NOT NULL,
    nome text NOT NULL,
    especialidade text NOT NULL
);


ALTER TABLE public.medicos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16444)
-- Name: medicos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medicos_id_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 219
-- Name: medicos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicos_id_seq OWNED BY public.medicos.id;


--
-- TOC entry 218 (class 1259 OID 16435)
-- Name: pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacientes (
    id integer NOT NULL,
    nome text NOT NULL,
    data_nascimento date NOT NULL,
    historico_medico text
);


ALTER TABLE public.pacientes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16434)
-- Name: pacientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pacientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pacientes_id_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 217
-- Name: pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pacientes_id_seq OWNED BY public.pacientes.id;


--
-- TOC entry 4754 (class 2604 OID 16457)
-- Name: consultas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas ALTER COLUMN id SET DEFAULT nextval('public.consultas_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 16448)
-- Name: medicos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos ALTER COLUMN id SET DEFAULT nextval('public.medicos_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 16438)
-- Name: pacientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN id SET DEFAULT nextval('public.pacientes_id_seq'::regclass);


--
-- TOC entry 4913 (class 0 OID 16454)
-- Dependencies: 222
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consultas (id, paciente_id, medico_id, data_consulta, hora_consulta) FROM stdin;
2	2	2	2025-04-10	15:30:00
\.


--
-- TOC entry 4911 (class 0 OID 16445)
-- Dependencies: 220
-- Data for Name: medicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicos (id, nome, especialidade) FROM stdin;
1	Dr. Ana Costa	Cardiologista
2	Dr. Pedro Santos	Ortopedista
\.


--
-- TOC entry 4909 (class 0 OID 16435)
-- Dependencies: 218
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pacientes (id, nome, data_nascimento, historico_medico) FROM stdin;
2	Maria Oliveira	1992-07-22	Alergia a penicilina
\.


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 221
-- Name: consultas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consultas_id_seq', 2, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 219
-- Name: medicos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicos_id_seq', 2, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 217
-- Name: pacientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pacientes_id_seq', 2, true);


--
-- TOC entry 4760 (class 2606 OID 16459)
-- Name: consultas consultas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (id);


--
-- TOC entry 4758 (class 2606 OID 16452)
-- Name: medicos medicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (id);


--
-- TOC entry 4756 (class 2606 OID 16442)
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 16465)
-- Name: consultas consultas_medico_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_medico_id_fkey FOREIGN KEY (medico_id) REFERENCES public.medicos(id) ON DELETE CASCADE;


--
-- TOC entry 4762 (class 2606 OID 16460)
-- Name: consultas consultas_paciente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id) ON DELETE CASCADE;


-- Completed on 2025-03-25 09:30:32

--
-- PostgreSQL database dump complete
--

