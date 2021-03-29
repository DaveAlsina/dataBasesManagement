--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5

-- Started on 2021-02-23 08:18:07

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
-- TOC entry 205 (class 1259 OID 16737)
-- Name: advisor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advisor (
    s_id integer NOT NULL,
    i_id integer
);


ALTER TABLE public.advisor OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16777)
-- Name: classroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classroom (
    building character varying(20) NOT NULL,
    room_no integer NOT NULL,
    capacity integer
);


ALTER TABLE public.classroom OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16752)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id character varying(7) NOT NULL,
    title character varying(40) NOT NULL,
    dept_name character varying(20),
    credits integer
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16787)
-- Name: section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.section (
    course_id character varying(7) NOT NULL,
    sec_id integer NOT NULL,
    semester character varying(10) NOT NULL,
    year integer NOT NULL,
    building character varying(20),
    room_no integer,
    time_slot_id character(1),
    day character(1),
    start_time time without time zone
);


ALTER TABLE public.section OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17150)
-- Name: cursos_fall_2009_v; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.cursos_fall_2009_v AS
 SELECT course.course_id,
    section.building,
    section.room_no
   FROM (public.course
     JOIN public.section USING (course_id))
  WHERE (((course.dept_name)::text = 'Physics'::text) AND ((section.semester)::text = 'Fall'::text) AND (section.year = 2009));


ALTER TABLE public.cursos_fall_2009_v OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16712)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    dept_name character varying(20) NOT NULL,
    building character varying(20),
    budget integer
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16717)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    id integer NOT NULL,
    name character varying(20),
    dept_name character varying(20),
    salary integer
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16762)
-- Name: prereq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prereq (
    course_id character varying(7) NOT NULL,
    prereq_id character varying(7) NOT NULL
);


ALTER TABLE public.prereq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17146)
-- Name: promedio_salario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.promedio_salario AS
 SELECT (avg(instructor.salary))::real AS avg
   FROM public.instructor
  GROUP BY instructor.dept_name;


ALTER TABLE public.promedio_salario OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16727)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    dept_name character varying(20),
    tot_cred integer
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16822)
-- Name: takes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.takes (
    id integer NOT NULL,
    course_id character varying(7) NOT NULL,
    sec_id integer NOT NULL,
    semester character varying(10) NOT NULL,
    year integer NOT NULL,
    grade character varying(2)
);


ALTER TABLE public.takes OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16807)
-- Name: teaches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teaches (
    id integer NOT NULL,
    course_id character varying(7) NOT NULL,
    sec_id integer NOT NULL,
    semester character varying(10) NOT NULL,
    year integer NOT NULL
);


ALTER TABLE public.teaches OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16782)
-- Name: time_slot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slot (
    time_slot_id character(1) NOT NULL,
    day character(1) NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone
);


ALTER TABLE public.time_slot OWNER TO postgres;

--
-- TOC entry 2740 (class 2606 OID 16741)
-- Name: advisor advisor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisor
    ADD CONSTRAINT advisor_pkey PRIMARY KEY (s_id);


--
-- TOC entry 2746 (class 2606 OID 16781)
-- Name: classroom classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (building, room_no);


--
-- TOC entry 2742 (class 2606 OID 16756)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- TOC entry 2734 (class 2606 OID 16716)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_name);


--
-- TOC entry 2736 (class 2606 OID 16721)
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 16766)
-- Name: prereq prereq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prereq
    ADD CONSTRAINT prereq_pkey PRIMARY KEY (course_id, prereq_id);


--
-- TOC entry 2750 (class 2606 OID 16791)
-- Name: section section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (course_id, sec_id, semester, year);


--
-- TOC entry 2738 (class 2606 OID 16731)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 16826)
-- Name: takes takes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.takes
    ADD CONSTRAINT takes_pkey PRIMARY KEY (id, course_id, sec_id, semester, year);


--
-- TOC entry 2752 (class 2606 OID 16811)
-- Name: teaches teaches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_pkey PRIMARY KEY (id, course_id, sec_id, semester, year);


--
-- TOC entry 2748 (class 2606 OID 16786)
-- Name: time_slot time_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slot
    ADD CONSTRAINT time_slot_pkey PRIMARY KEY (time_slot_id, day, start_time);


--
-- TOC entry 2758 (class 2606 OID 16747)
-- Name: advisor advisor_i_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisor
    ADD CONSTRAINT advisor_i_id_fkey FOREIGN KEY (i_id) REFERENCES public.instructor(id);


--
-- TOC entry 2757 (class 2606 OID 16742)
-- Name: advisor advisor_s_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisor
    ADD CONSTRAINT advisor_s_id_fkey FOREIGN KEY (s_id) REFERENCES public.student(id);


--
-- TOC entry 2759 (class 2606 OID 16757)
-- Name: course course_dept_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_dept_name_fkey FOREIGN KEY (dept_name) REFERENCES public.department(dept_name);


--
-- TOC entry 2755 (class 2606 OID 16722)
-- Name: instructor instructor_dept_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_dept_name_fkey FOREIGN KEY (dept_name) REFERENCES public.department(dept_name);


--
-- TOC entry 2760 (class 2606 OID 16767)
-- Name: prereq prereq_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prereq
    ADD CONSTRAINT prereq_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 2761 (class 2606 OID 16772)
-- Name: prereq prereq_prereq_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prereq
    ADD CONSTRAINT prereq_prereq_id_fkey FOREIGN KEY (prereq_id) REFERENCES public.course(course_id);


--
-- TOC entry 2763 (class 2606 OID 16797)
-- Name: section section_building_room_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_building_room_no_fkey FOREIGN KEY (building, room_no) REFERENCES public.classroom(building, room_no);


--
-- TOC entry 2762 (class 2606 OID 16792)
-- Name: section section_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 2764 (class 2606 OID 16802)
-- Name: section section_time_slot_id_day_start_time_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_time_slot_id_day_start_time_fkey FOREIGN KEY (time_slot_id, day, start_time) REFERENCES public.time_slot(time_slot_id, day, start_time);


--
-- TOC entry 2756 (class 2606 OID 16732)
-- Name: student student_dept_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_dept_name_fkey FOREIGN KEY (dept_name) REFERENCES public.department(dept_name);


--
-- TOC entry 2768 (class 2606 OID 16827)
-- Name: takes takes_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.takes
    ADD CONSTRAINT takes_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 2769 (class 2606 OID 16832)
-- Name: takes takes_course_id_sec_id_semester_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.takes
    ADD CONSTRAINT takes_course_id_sec_id_semester_year_fkey FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES public.section(course_id, sec_id, semester, year);


--
-- TOC entry 2765 (class 2606 OID 16812)
-- Name: teaches teaches_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 2766 (class 2606 OID 16817)
-- Name: teaches teaches_course_id_sec_id_semester_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_course_id_sec_id_semester_year_fkey FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES public.section(course_id, sec_id, semester, year);


--
-- TOC entry 2767 (class 2606 OID 16837)
-- Name: teaches teaches_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_id_fkey FOREIGN KEY (id) REFERENCES public.instructor(id);


-- Completed on 2021-02-23 08:18:08

--
-- PostgreSQL database dump complete
--

