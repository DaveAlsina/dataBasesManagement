--------------- 1)  A

select * from
	(select * from
	estudiante as e INNER JOIN departamento as d
	ON e.id_departamento = d.id) as est_dep 
	
	INNER JOIN

	facultad as f
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

select * from
	(
		(											
			(select * from estudiante
				WHERE genero = 'F') as e

			INNER JOIN								--conexion de la tabla estudiante con inscripcion

			inscripcion as i
			ON e.codigo = i.codigo_estudiante

		) as est_inscrip

		INNER JOIN									--conexion de la tabla estudiante_inscripcion con grupo

		grupo as g
		ON g.id = est_inscrip.id_grupo

	) as  est_inscrip_grp

	INNER JOIN										--conexion de la tabla est_inscrip_grp con curso->MBD 

	(select * from curso
		WHERE nombre = 'Manejo de Bases de Datos') as MBD
	ON MBD.id = est_inscrip_grp.id_curso

ORDER BY fecha_nacimiento;


--------------- 1)  D

















