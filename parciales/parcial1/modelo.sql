--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5

-- Started on 2021-02-17 12:58:56

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
-- TOC entry 209 (class 1259 OID 17039)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    creditos smallint NOT NULL,
    id_departamento integer
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17037)
-- Name: curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_id_seq OWNER TO postgres;

--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 208
-- Name: curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_id_seq OWNED BY public.curso.id;


--
-- TOC entry 207 (class 1259 OID 17021)
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamento (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    id_facultad integer
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17019)
-- Name: departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamento_id_seq OWNER TO postgres;

--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 206
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamento_id_seq OWNED BY public.departamento.id;


--
-- TOC entry 219 (class 1259 OID 17118)
-- Name: edificio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.edificio (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL
);


ALTER TABLE public.edificio OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17116)
-- Name: edificio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.edificio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edificio_id_seq OWNER TO postgres;

--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 218
-- Name: edificio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.edificio_id_seq OWNED BY public.edificio.id;


--
-- TOC entry 203 (class 1259 OID 17005)
-- Name: estudiante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiante (
    codigo integer NOT NULL,
    nombre character varying(45) NOT NULL,
    apellido character varying(45) NOT NULL,
    fecha_nacimiento date NOT NULL,
    genero character(1) NOT NULL,
    id_departamento integer
);


ALTER TABLE public.estudiante OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17003)
-- Name: estudiante_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiante_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estudiante_codigo_seq OWNER TO postgres;

--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 202
-- Name: estudiante_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiante_codigo_seq OWNED BY public.estudiante.codigo;


--
-- TOC entry 205 (class 1259 OID 17013)
-- Name: facultad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facultad (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL
);


ALTER TABLE public.facultad OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17011)
-- Name: facultad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facultad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facultad_id_seq OWNER TO postgres;

--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 204
-- Name: facultad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facultad_id_seq OWNED BY public.facultad.id;


--
-- TOC entry 213 (class 1259 OID 17060)
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    anio smallint NOT NULL,
    periodo smallint NOT NULL,
    id_curso integer,
    id_profesor integer
);


ALTER TABLE public.grupo OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17058)
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_id_seq OWNER TO postgres;

--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 212
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_id_seq OWNED BY public.grupo.id;


--
-- TOC entry 217 (class 1259 OID 17105)
-- Name: horario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horario (
    id integer NOT NULL,
    dia smallint NOT NULL,
    hora_inicio smallint NOT NULL,
    hora_fin smallint NOT NULL,
    id_grupo integer,
    id_salon integer
);


ALTER TABLE public.horario OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17103)
-- Name: horario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horario_id_seq OWNER TO postgres;

--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 216
-- Name: horario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horario_id_seq OWNED BY public.horario.id;


--
-- TOC entry 215 (class 1259 OID 17081)
-- Name: inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion (
    id integer NOT NULL,
    calificacion smallint DEFAULT 0 NOT NULL,
    codigo_estudiante integer,
    id_grupo integer
);


ALTER TABLE public.inscripcion OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17079)
-- Name: inscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscripcion_id_seq OWNER TO postgres;

--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 214
-- Name: inscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripcion_id_seq OWNED BY public.inscripcion.id;


--
-- TOC entry 211 (class 1259 OID 17052)
-- Name: profesor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesor (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    apellido character varying(45) NOT NULL,
    id_departamento integer
);


ALTER TABLE public.profesor OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17050)
-- Name: profesor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesor_id_seq OWNER TO postgres;

--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 210
-- Name: profesor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesor_id_seq OWNED BY public.profesor.id;


--
-- TOC entry 221 (class 1259 OID 17126)
-- Name: salon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salon (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    id_edificio integer
);


ALTER TABLE public.salon OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17124)
-- Name: salon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salon_id_seq OWNER TO postgres;

--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 220
-- Name: salon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salon_id_seq OWNED BY public.salon.id;


--
-- TOC entry 2745 (class 2604 OID 17042)
-- Name: curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN id SET DEFAULT nextval('public.curso_id_seq'::regclass);


--
-- TOC entry 2744 (class 2604 OID 17024)
-- Name: departamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento ALTER COLUMN id SET DEFAULT nextval('public.departamento_id_seq'::regclass);


--
-- TOC entry 2751 (class 2604 OID 17121)
-- Name: edificio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edificio ALTER COLUMN id SET DEFAULT nextval('public.edificio_id_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 17008)
-- Name: estudiante codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante ALTER COLUMN codigo SET DEFAULT nextval('public.estudiante_codigo_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 17016)
-- Name: facultad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultad ALTER COLUMN id SET DEFAULT nextval('public.facultad_id_seq'::regclass);


--
-- TOC entry 2747 (class 2604 OID 17063)
-- Name: grupo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_id_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 17108)
-- Name: horario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario ALTER COLUMN id SET DEFAULT nextval('public.horario_id_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 17084)
-- Name: inscripcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion ALTER COLUMN id SET DEFAULT nextval('public.inscripcion_id_seq'::regclass);


--
-- TOC entry 2746 (class 2604 OID 17055)
-- Name: profesor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor ALTER COLUMN id SET DEFAULT nextval('public.profesor_id_seq'::regclass);


--
-- TOC entry 2752 (class 2604 OID 17129)
-- Name: salon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salon ALTER COLUMN id SET DEFAULT nextval('public.salon_id_seq'::regclass);


--
-- TOC entry 2917 (class 0 OID 17039)
-- Dependencies: 209
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.curso VALUES (1, 'Programacion de Computadores', 4, 6);
INSERT INTO public.curso VALUES (2, 'Manejo de Bases de Datos', 4, 6);
INSERT INTO public.curso VALUES (3, 'Algebra Abstracta', 4, 6);
INSERT INTO public.curso VALUES (4, 'Algebra Lineal', 3, 6);
INSERT INTO public.curso VALUES (5, 'Macroeconomia', 4, 4);
INSERT INTO public.curso VALUES (6, 'Microeconomia', 4, 4);
INSERT INTO public.curso VALUES (7, 'Economia matematica', 4, 4);
INSERT INTO public.curso VALUES (8, 'Pensamiento Matematico', 2, 6);
INSERT INTO public.curso VALUES (9, 'Emprendimiento Social', 3, 5);
INSERT INTO public.curso VALUES (10, 'Teoria de la computacion', 3, 6);
INSERT INTO public.curso VALUES (11, 'CÃ¡lculo Diferencal', 3, 6);
INSERT INTO public.curso VALUES (12, 'CÃ¡lculo Integral', 3, 6);


--
-- TOC entry 2915 (class 0 OID 17021)
-- Dependencies: 207
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamento VALUES (1, 'Administracion de empresas', 1);
INSERT INTO public.departamento VALUES (3, 'Biologia', 2);
INSERT INTO public.departamento VALUES (4, 'EconomÃ­a', 3);
INSERT INTO public.departamento VALUES (5, 'Finanzas y Comercio Internacional', 3);
INSERT INTO public.departamento VALUES (6, 'MACC', 4);
INSERT INTO public.departamento VALUES (2, 'Marketing y Negocios Digitales', 1);


--
-- TOC entry 2927 (class 0 OID 17118)
-- Dependencies: 219
-- Data for Name: edificio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.edificio VALUES (1, 'Claustro');
INSERT INTO public.edificio VALUES (2, 'Casur');


--
-- TOC entry 2911 (class 0 OID 17005)
-- Dependencies: 203
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estudiante VALUES (1, 'Alejandra', 'Campo Archbold', '1998-06-26', 'F', 4);
INSERT INTO public.estudiante VALUES (2, 'Daniel', 'Amaya', '2001-11-18', 'M', 6);
INSERT INTO public.estudiante VALUES (3, 'Juan Manuel', 'Davila Rivera', '2003-02-15', 'M', 6);
INSERT INTO public.estudiante VALUES (4, 'Angel', 'Lopez', '2001-05-23', 'M', 6);
INSERT INTO public.estudiante VALUES (5, 'Giancarlo', 'Gonzalez', '2002-05-29', 'M', 6);
INSERT INTO public.estudiante VALUES (6, 'Gabriela', 'Cortes', '2000-06-12', 'F', 6);
INSERT INTO public.estudiante VALUES (7, 'Camilo', 'Tejada', '1995-11-15', 'M', 6);
INSERT INTO public.estudiante VALUES (8, 'AndrÃ©s', 'DÃ­az', '2002-03-20', 'M', 6);
INSERT INTO public.estudiante VALUES (9, 'Juan Fernando', 'Rojas', '2003-01-12', 'M', 6);
INSERT INTO public.estudiante VALUES (10, 'Juan', 'Martinez', '2001-10-31', 'M', 6);
INSERT INTO public.estudiante VALUES (11, 'Nicolas', 'Dussan', '1993-09-22', 'M', 6);
INSERT INTO public.estudiante VALUES (12, 'Estefania', 'Valderrama', '1998-07-21', 'F', 3);
INSERT INTO public.estudiante VALUES (13, 'Luisa', 'Vasquez', '1998-07-21', 'F', 4);


--
-- TOC entry 2913 (class 0 OID 17013)
-- Dependencies: 205
-- Data for Name: facultad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facultad VALUES (1, 'Administracion');
INSERT INTO public.facultad VALUES (2, 'Ciencias Naturales');
INSERT INTO public.facultad VALUES (3, 'Economia');
INSERT INTO public.facultad VALUES (4, 'Ingenieria, Ciencia y Tecnologia');
INSERT INTO public.facultad VALUES (5, 'Escuela de Medicina');


--
-- TOC entry 2921 (class 0 OID 17060)
-- Dependencies: 213
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grupo VALUES (1, 'G1', 2020, 2, 2, 1);
INSERT INTO public.grupo VALUES (2, 'G2', 2020, 2, 2, 3);
INSERT INTO public.grupo VALUES (3, 'G1', 2021, 1, 2, 1);
INSERT INTO public.grupo VALUES (4, 'G2', 2021, 1, 2, 2);
INSERT INTO public.grupo VALUES (5, 'G1', 2020, 2, 1, 7);
INSERT INTO public.grupo VALUES (6, 'G2', 2020, 2, 1, 3);
INSERT INTO public.grupo VALUES (7, 'G1', 2021, 1, 1, 7);
INSERT INTO public.grupo VALUES (8, 'G2', 2021, 1, 1, 1);
INSERT INTO public.grupo VALUES (9, 'G1', 2021, 1, 6, 5);
INSERT INTO public.grupo VALUES (10, 'G1', 2021, 1, 7, 5);
INSERT INTO public.grupo VALUES (11, 'G1', 2021, 1, 11, 4);
INSERT INTO public.grupo VALUES (12, 'G2', 2021, 1, 11, 6);
INSERT INTO public.grupo VALUES (13, 'G1', 2019, 1, 11, 4);
INSERT INTO public.grupo VALUES (14, 'G1', 2019, 1, 7, 5);
INSERT INTO public.grupo VALUES (15, 'G1', 2019, 1, 1, 7);
INSERT INTO public.grupo VALUES (16, 'G1', 2020, 1, 2, 1);
INSERT INTO public.grupo VALUES (17, 'G2', 2020, 1, 2, 1);
INSERT INTO public.grupo VALUES (18, 'G1', 2020, 1, 2, 3);


--
-- TOC entry 2925 (class 0 OID 17105)
-- Dependencies: 217
-- Data for Name: horario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.horario VALUES (1, 2, 7, 10, 4, 2);
INSERT INTO public.horario VALUES (2, 4, 7, 9, 4, 2);
INSERT INTO public.horario VALUES (3, 4, 16, 18, 3, 2);
INSERT INTO public.horario VALUES (4, 5, 14, 16, 3, 2);


--
-- TOC entry 2923 (class 0 OID 17081)
-- Dependencies: 215
-- Data for Name: inscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inscripcion VALUES (1, 35, 8, 1);
INSERT INTO public.inscripcion VALUES (2, 40, 6, 1);
INSERT INTO public.inscripcion VALUES (3, 45, 1, 2);
INSERT INTO public.inscripcion VALUES (4, 42, 3, 2);
INSERT INTO public.inscripcion VALUES (5, 0, 2, 3);
INSERT INTO public.inscripcion VALUES (6, 0, 4, 4);
INSERT INTO public.inscripcion VALUES (7, 0, 7, 3);
INSERT INTO public.inscripcion VALUES (8, 0, 9, 3);
INSERT INTO public.inscripcion VALUES (9, 0, 10, 4);
INSERT INTO public.inscripcion VALUES (10, 0, 2, 7);
INSERT INTO public.inscripcion VALUES (11, 0, 4, 7);
INSERT INTO public.inscripcion VALUES (12, 0, 6, 7);
INSERT INTO public.inscripcion VALUES (13, 0, 1, 8);
INSERT INTO public.inscripcion VALUES (14, 0, 9, 8);
INSERT INTO public.inscripcion VALUES (15, 0, 10, 8);
INSERT INTO public.inscripcion VALUES (16, 0, 11, 8);


--
-- TOC entry 2919 (class 0 OID 17052)
-- Dependencies: 211
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profesor VALUES (1, 'Hector', 'Florez', 6);
INSERT INTO public.profesor VALUES (2, 'Claudia', 'Hernandez', 6);
INSERT INTO public.profesor VALUES (3, 'Juan', 'Perez', 6);
INSERT INTO public.profesor VALUES (4, 'Valerie', 'Gautier', 6);
INSERT INTO public.profesor VALUES (6, 'Norma', 'Sarmiento', 6);
INSERT INTO public.profesor VALUES (7, 'Carlos', 'Alvarez', 6);
INSERT INTO public.profesor VALUES (8, 'Julian', 'Rincon', 6);
INSERT INTO public.profesor VALUES (5, 'Jorge', 'Gallego', 4);
INSERT INTO public.profesor VALUES (9, 'Pablo', 'Martinez', 5);


--
-- TOC entry 2929 (class 0 OID 17126)
-- Dependencies: 221
-- Data for Name: salon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.salon VALUES (1, 'Hipatia', 2);
INSERT INTO public.salon VALUES (2, 'Love Lace', 2);
INSERT INTO public.salon VALUES (3, '201', 1);
INSERT INTO public.salon VALUES (4, '202', 1);


--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 208
-- Name: curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_id_seq', 1, false);


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 206
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamento_id_seq', 1, false);


--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 218
-- Name: edificio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.edificio_id_seq', 1, false);


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 202
-- Name: estudiante_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiante_codigo_seq', 1, false);


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 204
-- Name: facultad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facultad_id_seq', 1, false);


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 212
-- Name: grupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_id_seq', 1, false);


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 216
-- Name: horario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horario_id_seq', 4, true);


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 214
-- Name: inscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripcion_id_seq', 1, false);


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 210
-- Name: profesor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesor_id_seq', 1, false);


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 220
-- Name: salon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salon_id_seq', 1, false);


--
-- TOC entry 2760 (class 2606 OID 17044)
-- Name: curso curso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pk PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 17026)
-- Name: departamento departamento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pk PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 17123)
-- Name: edificio edificio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edificio
    ADD CONSTRAINT edificio_pk PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 17010)
-- Name: estudiante estudiante_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pk PRIMARY KEY (codigo);


--
-- TOC entry 2756 (class 2606 OID 17018)
-- Name: facultad facultad_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_pk PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 17068)
-- Name: grupo grupo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pk PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 17110)
-- Name: horario horario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_pk PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 17087)
-- Name: inscripcion inscripcion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_pk PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 17057)
-- Name: profesor profesor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pk PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 17131)
-- Name: salon salon_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salon
    ADD CONSTRAINT salon_pk PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 17069)
-- Name: grupo curso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT curso_fk FOREIGN KEY (id_curso) REFERENCES public.curso(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2773 (class 2606 OID 17032)
-- Name: estudiante departamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento) REFERENCES public.departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2775 (class 2606 OID 17045)
-- Name: curso departamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento) REFERENCES public.departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2776 (class 2606 OID 17098)
-- Name: profesor departamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento) REFERENCES public.departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2783 (class 2606 OID 17132)
-- Name: salon edificio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salon
    ADD CONSTRAINT edificio_fk FOREIGN KEY (id_edificio) REFERENCES public.edificio(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2779 (class 2606 OID 17088)
-- Name: inscripcion estudiante_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT estudiante_fk FOREIGN KEY (codigo_estudiante) REFERENCES public.estudiante(codigo) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2774 (class 2606 OID 17027)
-- Name: departamento facultad_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT facultad_fk FOREIGN KEY (id_facultad) REFERENCES public.facultad(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2780 (class 2606 OID 17093)
-- Name: inscripcion grupo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT grupo_fk FOREIGN KEY (id_grupo) REFERENCES public.grupo(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2781 (class 2606 OID 17111)
-- Name: horario grupo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT grupo_fk FOREIGN KEY (id_grupo) REFERENCES public.grupo(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2778 (class 2606 OID 17074)
-- Name: grupo profesor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT profesor_fk FOREIGN KEY (id_profesor) REFERENCES public.profesor(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2782 (class 2606 OID 17137)
-- Name: horario salon_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT salon_fk FOREIGN KEY (id_salon) REFERENCES public.salon(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2021-02-17 12:58:57

--
-- PostgreSQL database dump complete
--

