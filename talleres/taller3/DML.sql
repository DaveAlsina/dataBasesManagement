--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5

-- Started on 2021-02-24 22:23:36

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

--
-- TOC entry 2898 (class 0 OID 16712)
-- Dependencies: 202
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.department VALUES ('Biology', 'Watson', 90000);
INSERT INTO public.department VALUES ('Comp. Sci.', 'Taylor', 100000);
INSERT INTO public.department VALUES ('Elec. Eng.', 'Taylor', 85000);
INSERT INTO public.department VALUES ('Finance', 'Painter', 120000);
INSERT INTO public.department VALUES ('History', 'Painter', 50000);
INSERT INTO public.department VALUES ('Music', 'Packard', 80000);
INSERT INTO public.department VALUES ('Physics', 'Watson', 70000);


--
-- TOC entry 2899 (class 0 OID 16717)
-- Dependencies: 203
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructor VALUES (10101, 'Srinivasan', 'Comp. Sci.', 65000);
INSERT INTO public.instructor VALUES (12121, 'Wu', 'Finance', 90000);
INSERT INTO public.instructor VALUES (15151, 'Mozart', 'Music', 40000);
INSERT INTO public.instructor VALUES (22222, 'Einstein', 'Physics', 95000);
INSERT INTO public.instructor VALUES (32343, 'El Said', 'History', 60000);
INSERT INTO public.instructor VALUES (33456, 'Gold', 'Physics', 87000);
INSERT INTO public.instructor VALUES (45565, 'Katz', 'Comp. Sci.', 75000);
INSERT INTO public.instructor VALUES (58583, 'Califieri', 'History', 62000);
INSERT INTO public.instructor VALUES (76543, 'Singh', 'Finance', 80000);
INSERT INTO public.instructor VALUES (76766, 'Crick', 'Biology', 72000);
INSERT INTO public.instructor VALUES (83821, 'Brandt', 'Comp. Sci.', 92000);
INSERT INTO public.instructor VALUES (98345, 'Kim', 'Elec. Eng.', 80000);


--
-- TOC entry 2900 (class 0 OID 16727)
-- Dependencies: 204
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student VALUES (128, 'Zhang', 'Comp. Sci.', 102);
INSERT INTO public.student VALUES (12345, 'Shankar', 'Comp. Sci.', 32);
INSERT INTO public.student VALUES (19991, 'Brandt', 'History', 80);
INSERT INTO public.student VALUES (23121, 'Chavez', 'Finance', 110);
INSERT INTO public.student VALUES (44553, 'Peltier', 'Physics', 56);
INSERT INTO public.student VALUES (45678, 'Levy', 'Physics', 46);
INSERT INTO public.student VALUES (54321, 'Williams', 'Comp. Sci.', 54);
INSERT INTO public.student VALUES (55739, 'Sanchez', 'Music', 38);
INSERT INTO public.student VALUES (70557, 'Snow', 'Physics', 0);
INSERT INTO public.student VALUES (76543, 'Brown', 'Comp. Sci.', 58);
INSERT INTO public.student VALUES (76653, 'Aoi', 'Elec. Eng.', 60);
INSERT INTO public.student VALUES (98765, 'Bourikas', 'Elec. Eng.', 98);
INSERT INTO public.student VALUES (98988, 'Tanaka', 'Biology', 120);


--
-- TOC entry 2901 (class 0 OID 16737)
-- Dependencies: 205
-- Data for Name: advisor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.advisor VALUES (128, 45565);
INSERT INTO public.advisor VALUES (12345, 10101);
INSERT INTO public.advisor VALUES (23121, 76543);
INSERT INTO public.advisor VALUES (44553, 22222);
INSERT INTO public.advisor VALUES (45678, 22222);
INSERT INTO public.advisor VALUES (76543, 45565);
INSERT INTO public.advisor VALUES (76653, 98345);
INSERT INTO public.advisor VALUES (98765, 98345);
INSERT INTO public.advisor VALUES (98988, 76766);


--
-- TOC entry 2904 (class 0 OID 16777)
-- Dependencies: 208
-- Data for Name: classroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.classroom VALUES ('Packard', 101, 500);
INSERT INTO public.classroom VALUES ('Painter', 514, 10);
INSERT INTO public.classroom VALUES ('Taylor', 3128, 70);
INSERT INTO public.classroom VALUES ('Watson', 100, 30);
INSERT INTO public.classroom VALUES ('Watson', 120, 50);


--
-- TOC entry 2902 (class 0 OID 16752)
-- Dependencies: 206
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.course VALUES ('BIO-101', 'Intro. to Biology', 'Biology', 4);
INSERT INTO public.course VALUES ('BIO-301', 'Genetics', 'Biology', 4);
INSERT INTO public.course VALUES ('BIO-399', 'Computational Biology', 'Biology', 3);
INSERT INTO public.course VALUES ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4);
INSERT INTO public.course VALUES ('CS-190', 'Game Design', 'Comp. Sci.', 4);
INSERT INTO public.course VALUES ('CS-315', 'Robotics', 'Comp. Sci.', 3);
INSERT INTO public.course VALUES ('CS-319', 'Image Processing', 'Comp. Sci.', 3);
INSERT INTO public.course VALUES ('CS-347', 'Database System Concepts', 'Comp. Sci.', 3);
INSERT INTO public.course VALUES ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3);
INSERT INTO public.course VALUES ('FIN-201', 'Investment Banking', 'Finance', 3);
INSERT INTO public.course VALUES ('HIS-351', 'World History', 'History', 3);
INSERT INTO public.course VALUES ('MU-199', 'Music Video Production', 'Music', 3);
INSERT INTO public.course VALUES ('PHY-101', 'Physical Principles', 'Physics', 4);


--
-- TOC entry 2903 (class 0 OID 16762)
-- Dependencies: 207
-- Data for Name: prereq; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prereq VALUES ('BIO-301', 'BIO-101');
INSERT INTO public.prereq VALUES ('BIO-399', 'BIO-101');
INSERT INTO public.prereq VALUES ('CS-190', 'CS-101');
INSERT INTO public.prereq VALUES ('CS-315', 'CS-101');
INSERT INTO public.prereq VALUES ('CS-319', 'CS-101');
INSERT INTO public.prereq VALUES ('CS-347', 'CS-101');
INSERT INTO public.prereq VALUES ('EE-181', 'PHY-101');


--
-- TOC entry 2905 (class 0 OID 16782)
-- Dependencies: 209
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.time_slot VALUES ('A', 'M', '08:00:00', '08:50:00');
INSERT INTO public.time_slot VALUES ('A', 'W', '08:00:00', '08:50:00');
INSERT INTO public.time_slot VALUES ('A', 'F', '08:00:00', '08:50:00');
INSERT INTO public.time_slot VALUES ('B', 'M', '09:00:00', '09:50:00');
INSERT INTO public.time_slot VALUES ('B', 'W', '09:00:00', '09:50:00');
INSERT INTO public.time_slot VALUES ('B', 'F', '09:00:00', '09:50:00');
INSERT INTO public.time_slot VALUES ('C', 'M', '11:00:00', '11:50:00');
INSERT INTO public.time_slot VALUES ('C', 'W', '11:00:00', '11:50:00');
INSERT INTO public.time_slot VALUES ('C', 'F', '11:00:00', '11:50:00');
INSERT INTO public.time_slot VALUES ('D', 'M', '13:00:00', '13:50:00');
INSERT INTO public.time_slot VALUES ('D', 'W', '13:00:00', '13:50:00');
INSERT INTO public.time_slot VALUES ('D', 'F', '13:00:00', '13:50:00');
INSERT INTO public.time_slot VALUES ('E', 'T', '10:30:00', '11:45:00');
INSERT INTO public.time_slot VALUES ('E', 'R', '10:30:00', '11:45:00');
INSERT INTO public.time_slot VALUES ('F', 'T', '14:30:00', '15:45:00');
INSERT INTO public.time_slot VALUES ('F', 'R', '14:30:00', '15:45:00');
INSERT INTO public.time_slot VALUES ('G', 'M', '16:00:00', '16:50:00');
INSERT INTO public.time_slot VALUES ('G', 'W', '16:00:00', '16:50:00');
INSERT INTO public.time_slot VALUES ('G', 'F', '16:00:00', '16:50:00');
INSERT INTO public.time_slot VALUES ('H', 'W', '10:00:00', '12:30:00');


--
-- TOC entry 2906 (class 0 OID 16787)
-- Dependencies: 210
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.section VALUES ('BIO-101', 1, 'Summer', 2009, 'Painter', 514, 'B', 'M', '09:00:00');
INSERT INTO public.section VALUES ('BIO-301', 1, 'Summer', 2010, 'Painter', 514, 'A', 'M', '08:00:00');
INSERT INTO public.section VALUES ('CS-101', 1, 'Fall', 2009, 'Packard', 101, 'H', 'W', '10:00:00');
INSERT INTO public.section VALUES ('CS-101', 1, 'Spring', 2010, 'Packard', 101, 'F', 'T', '14:30:00');
INSERT INTO public.section VALUES ('CS-190', 1, 'Spring', 2009, 'Taylor', 3128, 'E', 'T', '10:30:00');
INSERT INTO public.section VALUES ('CS-190', 2, 'Spring', 2009, 'Taylor', 3128, 'A', 'W', '08:00:00');
INSERT INTO public.section VALUES ('CS-315', 1, 'Spring', 2010, 'Watson', 120, 'D', 'M', '13:00:00');
INSERT INTO public.section VALUES ('CS-319', 1, 'Spring', 2010, 'Watson', 100, 'B', 'W', '09:00:00');
INSERT INTO public.section VALUES ('CS-319', 2, 'Spring', 2010, 'Taylor', 3128, 'C', 'M', '11:00:00');
INSERT INTO public.section VALUES ('CS-347', 1, 'Fall', 2009, 'Taylor', 3128, 'A', 'F', '08:00:00');
INSERT INTO public.section VALUES ('EE-181', 1, 'Spring', 2009, 'Taylor', 3128, 'C', 'W', '11:00:00');
INSERT INTO public.section VALUES ('FIN-201', 1, 'Spring', 2010, 'Packard', 101, 'B', 'F', '09:00:00');
INSERT INTO public.section VALUES ('HIS-351', 1, 'Spring', 2010, 'Painter', 514, 'C', 'F', '11:00:00');
INSERT INTO public.section VALUES ('MU-199', 1, 'Spring', 2010, 'Packard', 101, 'D', 'W', '13:00:00');
INSERT INTO public.section VALUES ('PHY-101', 1, 'Fall', 2009, 'Watson', 100, 'A', 'M', '08:00:00');


--
-- TOC entry 2908 (class 0 OID 16822)
-- Dependencies: 212
-- Data for Name: takes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.takes VALUES (128, 'CS-101', 1, 'Fall', 2009, 'A');
INSERT INTO public.takes VALUES (128, 'CS-347', 1, 'Fall', 2009, 'A-');
INSERT INTO public.takes VALUES (12345, 'CS-101', 1, 'Fall', 2009, 'C');
INSERT INTO public.takes VALUES (12345, 'CS-190', 2, 'Spring', 2009, 'A');
INSERT INTO public.takes VALUES (12345, 'CS-315', 1, 'Spring', 2010, 'A');
INSERT INTO public.takes VALUES (12345, 'CS-347', 1, 'Fall', 2009, 'A');
INSERT INTO public.takes VALUES (19991, 'HIS-351', 1, 'Spring', 2010, 'B');
INSERT INTO public.takes VALUES (23121, 'FIN-201', 1, 'Spring', 2010, 'C+');
INSERT INTO public.takes VALUES (44553, 'PHY-101', 1, 'Fall', 2009, 'B-');
INSERT INTO public.takes VALUES (45678, 'CS-101', 1, 'Fall', 2009, 'F');
INSERT INTO public.takes VALUES (45678, 'CS-101', 1, 'Spring', 2010, 'B+');
INSERT INTO public.takes VALUES (45678, 'CS-319', 1, 'Spring', 2010, 'B');
INSERT INTO public.takes VALUES (54321, 'CS-101', 1, 'Fall', 2009, 'A-');
INSERT INTO public.takes VALUES (54321, 'CS-190', 2, 'Spring', 2009, 'B+');
INSERT INTO public.takes VALUES (55739, 'MU-199', 1, 'Spring', 2010, 'A-');
INSERT INTO public.takes VALUES (76543, 'CS-101', 1, 'Fall', 2009, 'A');
INSERT INTO public.takes VALUES (76543, 'CS-319', 2, 'Spring', 2010, 'A');
INSERT INTO public.takes VALUES (76653, 'EE-181', 1, 'Spring', 2009, 'C');
INSERT INTO public.takes VALUES (98765, 'CS-101', 1, 'Fall', 2009, 'C-');
INSERT INTO public.takes VALUES (98765, 'CS-315', 1, 'Spring', 2010, 'B');
INSERT INTO public.takes VALUES (98988, 'BIO-101', 1, 'Summer', 2009, 'A');
INSERT INTO public.takes VALUES (98988, 'BIO-301', 1, 'Summer', 2010, NULL);


--
-- TOC entry 2907 (class 0 OID 16807)
-- Dependencies: 211
-- Data for Name: teaches; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teaches VALUES (10101, 'CS-101', 1, 'Fall', 2009);
INSERT INTO public.teaches VALUES (10101, 'CS-315', 1, 'Spring', 2010);
INSERT INTO public.teaches VALUES (10101, 'CS-347', 1, 'Fall', 2009);
INSERT INTO public.teaches VALUES (12121, 'FIN-201', 1, 'Spring', 2010);
INSERT INTO public.teaches VALUES (15151, 'MU-199', 1, 'Spring', 2010);
INSERT INTO public.teaches VALUES (22222, 'PHY-101', 1, 'Fall', 2009);
INSERT INTO public.teaches VALUES (32343, 'HIS-351', 1, 'Spring', 2010);
INSERT INTO public.teaches VALUES (45565, 'CS-101', 1, 'Spring', 2010);
INSERT INTO public.teaches VALUES (45565, 'CS-319', 1, 'Spring', 2010);
INSERT INTO public.teaches VALUES (76766, 'BIO-101', 1, 'Summer', 2009);
INSERT INTO public.teaches VALUES (76766, 'BIO-301', 1, 'Summer', 2010);
INSERT INTO public.teaches VALUES (83821, 'CS-190', 1, 'Spring', 2009);
INSERT INTO public.teaches VALUES (83821, 'CS-190', 2, 'Spring', 2009);
INSERT INTO public.teaches VALUES (83821, 'CS-319', 2, 'Spring', 2010);
INSERT INTO public.teaches VALUES (98345, 'EE-181', 1, 'Spring', 2009);


-- Completed on 2021-02-24 22:23:36

--
-- PostgreSQL database dump complete
--

