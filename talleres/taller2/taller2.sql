--------------- 1)  A

select * from
	(select * from
	estudiante as e INNER JOIN departamento as d
	ON e.id_departamento = d.id) as est_dep 
	
	INNER JOIN

	(select * from facultad) as f
	ON f.id = est_dep.id_facultad
	
	WHERE  f.nombre = 'Ingenieria, Ciencia y Tecnologia'
	ORDER BY apellido;


--------------- 1)  B

select * from 

(select * from
 profesor 
 ORDER BY nombre) as pro

INNER JOIN

	(
		(select * from grupo
		WHERE anio = 2021 AND periodo = 1) as grup

		INNER JOIN

		(select *  from curso
		WHERE nombre = 'Manejo de Bases de Datos') as curs

		ON curs.id = grup.id_curso

	)	as group_course

ON pro.id_departamento = group_course.id_departamento;



--------------- 1)  C

select nombre, apellido from	--seleccion de la información de interés
	(
		select nombre, apellido, id_grupo, id_curso, fecha_nacimiento from 
		(
			(select * from estudiante
							WHERE genero = 'F') as e 		-- seleccion de las mujeres

			INNER JOIN 										-- conexion de estudiantes mujeres con
															-- sus datos de inscripción
			(select * from inscripcion) as ins						
			ON e.codigo = ins.codigo_estudiante
		) as e_ins

		INNER JOIN											-- conexion de estudiantes mujeres inscritas
															-- con su grupo de inscripoción
		
		(select id, id_curso from grupo) as gr 				-- seleccion de los id que se van a usar 
		ON gr.id = e_ins.id_grupo							-- de la tabla grupo 
		
	) as est_ins_gr

	INNER JOIN 												-- conexión de las estudiantes inscritas 
															-- en sus grupos con la materia MBD
	(select id from curso
	 WHERE nombre = 'Manejo de Bases de Datos') as MBD		-- seleccion del curso de interés MBD
	 ON est_ins_gr.id_curso = MBD.id
	 
ORDER BY fecha_nacimiento ASC;								-- ordenamiento del resultado


--------------- 1)  D

select nombre, apellido, fecha_nacimiento from
	(
		(
			(select nombre, apellido, fecha_nacimiento, codigo from 
			estudiante) as est
			INNER JOIN 													-- conexion de estudiantes con
																		-- sus datos de inscripción
			(select * from inscripcion) as ins						
			ON est.codigo = ins.codigo_estudiante
		) as est_ins

			INNER JOIN											-- conexion de estudiantes inscritos
																-- con su grupo de inscripoción

			(select id, id_curso from grupo) as gr 				-- seleccion de los id que se van a usar 
			ON gr.id = est_ins.id_grupo							-- de la tabla grupo

	) as  est_ins_gr
		
		INNER JOIN 											-- conexión de las estudiantes inscritos 
															-- en sus grupos con la materia MBD
	 (select id from curso
	 WHERE nombre = 'Manejo de Bases de Datos') as MBD		-- seleccion del curso de interés MBD
	 ON est_ins_gr.id_curso = MBD.id

WHERE extract(year from age(CURRENT_DATE, fecha_nacimiento)) < 18
ORDER BY fecha_nacimiento DESC;

-- fuente: https://www.postgresql.org/docs/12/functions-datetime.html 

--------------- 1)  E
select nombre, apellido from

	( 	
		(select * from
			(select nombre, apellido, codigo from estudiante) as est   --extracción de info importante del estudiante
			INNER JOIN	
			(select * from inscripcion 
			 where calificacion < 3) as ins  					--extracción de estudiantes que perdieron
			ON ins.codigo_estudiante = est.codigo				--relación entre estudiantes que perdieron 
																--y su inscripción
		) as est_ins

		INNER JOIN								-- conexion de estudiantes inscritos
												-- con su grupo de inscripoción

		(select id, id_curso						-- selección de los grupos del 20201
		 from grupo									-- extracción de los datos relevantes para linkear
		 where anio = 2020 and periodo = 1) as gr 	-- con la tabla curso (no hay gente en 20201)

		ON gr.id = est_ins.id_grupo					-- de la tabla grupo
	)as est_ins_gr

	INNER JOIN 
	
	(select id from curso							-- seleccion del curso de interés MBD
	 WHERE nombre = 'Manejo de Bases de Datos') as MBD		
	 ON est_ins_gr.id_curso = MBD.id
	
--------------- 1)  F
select nombre from curso										
where curso.id in(												
		select id_curso from 									-- extrae el id del curso 
		(
			select id_grupo from horario as hr					--obtiene id_grupo de los salones casur
			where hr.id_salon in  
			(
				select id from salon							--Obtiene el id del salon casur
				where id_edificio in (select id from edificio
									  where nombre = 'Casur')
			)
		) as hr_sl_edf

		INNER JOIN								-- conecta hr_sl_edf con la tabla grupo

		(select id, id_curso from grupo) as gr	-- selecciona solo lo necesario de la tabla grupo
		ON hr_sl_edf.id_grupo = gr.id
	) 

Order by nombre;

--------------- 1)  G

select nombre, apellido from
(
	select nombre, apellido, id_grupo from
	(
		select nombre, apellido, codigo from estudiante			--seleccion de los estudiantes de MACC
		where id_departamento in
			(
				select id from departamento as dep
				where nombre = 'MACC'
			)
	)as est_macc

	INNER JOIN
	(select id_grupo, codigo_estudiante from inscripcion) as ins
	ON est_macc.codigo = ins.codigo_estudiante
	
) as est_macc_ins
where est_macc_ins.id_grupo in (select id_grupo from horario where dia = 3)
	






