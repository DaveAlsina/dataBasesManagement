--
-- TOC entry 3192 (class 0 OID 16422)
-- Dependencies: 205
-- Data for Name: facultad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facultad (id, nombre) VALUES (1, 'Administracion');
INSERT INTO public.facultad (id, nombre) VALUES (2, 'Ciencias Naturales');
INSERT INTO public.facultad (id, nombre) VALUES (3, 'Economia');
INSERT INTO public.facultad (id, nombre) VALUES (4, 'Ingenieria, Ciencia y Tecnologia');
INSERT INTO public.facultad (id, nombre) VALUES (5, 'Escuela de Medicina');


--
-- TOC entry 3194 (class 0 OID 16430)
-- Dependencies: 207
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamento (id, nombre, id_facultad) VALUES (1, 'Administracion de empresas', 1);
INSERT INTO public.departamento (id, nombre, id_facultad) VALUES (3, 'Biologia', 2);
INSERT INTO public.departamento (id, nombre, id_facultad) VALUES (4, 'Economía', 3);
INSERT INTO public.departamento (id, nombre, id_facultad) VALUES (5, 'Finanzas y Comercio Internacional', 3);
INSERT INTO public.departamento (id, nombre, id_facultad) VALUES (6, 'MACC', 4);
INSERT INTO public.departamento (id, nombre, id_facultad) VALUES (2, 'Marketing y Negocios Digitales', 1);


--
-- TOC entry 3196 (class 0 OID 16448)
-- Dependencies: 209
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (1, 'Programacion de Computadores', 4, 6);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (2, 'Manejo de Bases de Datos', 4, 6);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (3, 'Algebra Abstracta', 4, 6);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (4, 'Algebra Lineal', 3, 6);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (5, 'Macroeconomia', 4, 4);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (6, 'Microeconomia', 4, 4);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (7, 'Economia matematica', 4, 4);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (8, 'Pensamiento Matematico', 2, 6);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (9, 'Emprendimiento Social', 3, 5);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (10, 'Teoria de la computacion', 3, 6);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (11, 'Cálculo Diferencal', 3, 6);
INSERT INTO public.curso (id, nombre, creditos, id_departamento) VALUES (12, 'Cálculo Integral', 3, 6);


--
-- TOC entry 3206 (class 0 OID 16527)
-- Dependencies: 219
-- Data for Name: edificio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.edificio (id, nombre) VALUES (1, 'Claustro');
INSERT INTO public.edificio (id, nombre) VALUES (2, 'Casur');


--
-- TOC entry 3190 (class 0 OID 16414)
-- Dependencies: 203
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (1, 'Alejandra', 'Campo Archbold', '1998-06-26', 'F', 4);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (2, 'Daniel', 'Amaya', '2001-11-18', 'M', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (3, 'Juan Manuel', 'Davila Rivera', '2003-02-15', 'M', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (4, 'Angel', 'Lopez', '2001-05-23', 'M', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (5, 'Giancarlo', 'Gonzalez', '2002-05-29', 'M', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (6, 'Gabriela', 'Cortes', '2000-06-12', 'F', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (7, 'Camilo', 'Tejada', '1995-11-15', 'M', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (8, 'Andrés', 'Díaz', '2002-03-20', 'M', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (9, 'Juan Fernando', 'Rojas', '2003-01-12', 'M', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (10, 'Juan', 'Martinez', '2001-10-31', 'M', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (11, 'Nicolas', 'Dussan', '1993-09-22', 'M', 6);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (12, 'Estefania', 'Valderrama', '1998-07-21', 'F', 3);
INSERT INTO public.estudiante (codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) VALUES (13, 'Luisa', 'Vasquez', '1998-07-21', 'F', 4);


--
-- TOC entry 3198 (class 0 OID 16461)
-- Dependencies: 211
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profesor (id, nombre, apellido, id_departamento) VALUES (1, 'Hector', 'Florez', 6);
INSERT INTO public.profesor (id, nombre, apellido, id_departamento) VALUES (2, 'Claudia', 'Hernandez', 6);
INSERT INTO public.profesor (id, nombre, apellido, id_departamento) VALUES (3, 'Juan', 'Perez', 6);
INSERT INTO public.profesor (id, nombre, apellido, id_departamento) VALUES (4, 'Valerie', 'Gautier', 6);
INSERT INTO public.profesor (id, nombre, apellido, id_departamento) VALUES (6, 'Norma', 'Sarmiento', 6);
INSERT INTO public.profesor (id, nombre, apellido, id_departamento) VALUES (7, 'Carlos', 'Alvarez', 6);
INSERT INTO public.profesor (id, nombre, apellido, id_departamento) VALUES (8, 'Julian', 'Rincon', 6);
INSERT INTO public.profesor (id, nombre, apellido, id_departamento) VALUES (5, 'Jorge', 'Gallego', 4);
INSERT INTO public.profesor (id, nombre, apellido, id_departamento) VALUES (9, 'Pablo', 'Martinez', 5);


--
-- TOC entry 3200 (class 0 OID 16469)
-- Dependencies: 213
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (1, 'G1', 2020, 2, 2, 1);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (2, 'G2', 2020, 2, 2, 3);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (3, 'G1', 2021, 1, 2, 1);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (4, 'G2', 2021, 1, 2, 2);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (5, 'G1', 2020, 2, 1, 7);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (6, 'G2', 2020, 2, 1, 3);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (7, 'G1', 2021, 1, 1, 7);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (8, 'G2', 2021, 1, 1, 1);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (9, 'G1', 2021, 1, 6, 5);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (10, 'G1', 2021, 1, 7, 5);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (11, 'G1', 2021, 1, 11, 4);
INSERT INTO public.grupo (id, nombre, anio, periodo, id_curso, id_profesor) VALUES (12, 'G2', 2021, 1, 11, 6);


--
-- TOC entry 3208 (class 0 OID 16535)
-- Dependencies: 221
-- Data for Name: salon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.salon (id, nombre, id_edificio) VALUES (1, 'Hipatia', 2);
INSERT INTO public.salon (id, nombre, id_edificio) VALUES (2, 'Love Lace', 2);
INSERT INTO public.salon (id, nombre, id_edificio) VALUES (3, '201', 1);
INSERT INTO public.salon (id, nombre, id_edificio) VALUES (4, '202', 1);


--
-- TOC entry 3204 (class 0 OID 16514)
-- Dependencies: 217
-- Data for Name: horario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3202 (class 0 OID 16490)
-- Dependencies: 215
-- Data for Name: inscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (1, 35, 8, 1);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (2, 40, 6, 1);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (3, 45, 1, 2);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (4, 42, 3, 2);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (5, 0, 2, 3);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (6, 0, 4, 4);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (7, 0, 7, 3);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (8, 0, 9, 3);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (9, 0, 10, 4);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (10, 0, 2, 7);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (11, 0, 4, 7);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (12, 0, 6, 7);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (13, 0, 1, 8);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (14, 0, 9, 8);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (15, 0, 10, 8);
INSERT INTO public.inscripcion (id, calificacion, codigo_estudiante, id_grupo) VALUES (16, 0, 11, 8);


