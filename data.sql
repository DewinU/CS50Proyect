--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prueba.books (
    idlib integer NOT NULL,
    calidad character varying(50) NOT NULL,
    tipo character varying(50) NOT NULL,
    titulo character varying(50) NOT NULL,
    autor character varying(50) NOT NULL,
    anho integer NOT NULL,
    editorial character varying(50) NOT NULL,
    precio numeric NOT NULL
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: books_idlib_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.books ALTER COLUMN idlib ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.books_idlib_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

Insert into  books (idlib, calidad, tipo, titulo, autor, anho, editorial, precio) VALUES(


4	Excelentes condiciones	Ingeniería	Leithold - El Cálculo	Leithold, Louis	7	Oxford	1500
5	Seminuevo	Primaria	Geografía Dinámica de Nicaragua	Incer Barquero, Jaime	4	Hispamer    600
6	Usado	Secundaria	Español - Destrezas y Habilidad 10	Santillana	2013	Santillana	700
7	Seminuevo	Secundaria	Química 2	Barbachano, María	2	Pearson	500
8	Nuevo	Secundaria	Física	Wilson Buffa Lou	6	Pearson	2000
9	Usado	Secundaria	Economía	Gozález,  Ernesto	2014	Distribuidora Cultural	300
10	Usado - Dañado	Secundaria	Metodología de la Investigación	Pimienta, Julio	3	Pearson	200
11	Usado	Literatura	Morning Girl	Dorris, Michael	1992	Hyperion Books for Children	400
12	Nuevo	Secundaria	Historia de Nicaragua	Tijerino, Kinloch	5	Inhca	1300
13	Semnuevo	Secundaria	Biología 11	Guevara, Sigfrido	2015	Bolonia Printing S.A	560
14	Usado	Otro	Essential Words for TOEIC	Lougheed, Lin	6	Barrons	300
15	Nuevo	Otro	Grammar in Context 3	Elbaum, Sandra	6	National Geographic	1650
16	Usado	Literatura	Cantos de Vida y Esperanza	Darío, Ruben	2016	Distribuidora Cultura	450
17	Seminuevo	Literatura	Crónicas de una muerte anunciada	Marquéz, Gabriel García	16	Editorial Sudamericana	468
18	Nuevo	Literatura	La niña blanca y los pájaros sin pies	Aguilar, Rosario	4	Hispamer	430
19	Seminuevo	Literatura	Yerma	García Lorca, Federico	2005	Distribuidora Cultural	643
20	Usado	Literatura	Niebla	De Unamuno, Miguel	2008	Distribuidora Cultural	329
21	Usado	Literatura	Julia y los recuerdos del silencio	Pasos, Ricardo	5	Hispamer	700
\.


--
-- Name: books_idlib_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_idlib_seq', 21, true);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (idlib);


--
-- PostgreSQL database dump complete
--

