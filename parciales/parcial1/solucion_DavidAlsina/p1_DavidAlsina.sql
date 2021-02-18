-------------------				-------------------
-------------------	CONSULTAS 	-------------------
-------------------				-------------------


-------- 1)

select nombre, apellido from 
estudiante
where genero = 'F';

-------- 2)
select nombre from grupo
where periodo = 1 and anio = 2019;

-------- 3)
select avg(calificacion)::real, nombre  
from
(
	(
		select id_curso, calificacion, nombre from 
			(select calificacion, id_grupo from inscripcion) as ins
			INNER JOIN 
			(select nombre, id as id_gr, id_curso  from grupo) as gr 
		ON ins.id_grupo = gr.id_gr
	) as ins_gr
	
	INNER JOIN
		
	(select id from curso where nombre = 'Manejo de Bases de Datos') as MBD
	ON 	MBD.id = ins_gr.id_curso

) as ins_gr_MBD
group by (nombre)

-------- 4) 

select * from curso 
where id not in 
(
	select id_curso from 
	(
	select id_est, id_grupo from 
		(select codigo as id_est from estudiante) as est
		INNER JOIN
		(select id as id_grupo, codigo_estudiante from inscripcion) as ins
		ON est.id_est = ins.codigo_estudiante

	) as est_ins 

	INNER JOIN
	(select id_curso, id from grupo) as gr 
	ON gr.id = est_ins.id_grupo
)

-------- 5) 

select nombre, apellido from estudiante
where codigo in (select codigo_estudiante from inscripcion 
					where id_grupo in(
									select id from grupo 
									where (periodo = 2 and anio = 2020)
										   and (periodo = 1 and anio = 2021)
					)
				)
				
-------------------						-------------------
-------------------	Creación de vistas 	-------------------
-------------------						-------------------

create view estudiante_grupo_curso_calficacion as
select nombre_est,  apellido, nombre_gr, nombre_curs, calificacion from

	(
	select nombre_est, apellido, nombre_gr, calificacion, id_curso from
		(
			select nombre as nombre_est, apellido, calificacion, id_grupo from 
				(select nombre, apellido, codigo from estudiante) as est
				INNER JOIN
				(select calificacion, codigo_estudiante, id_grupo from inscripcion) as ins
				ON  ins.codigo_estudiante =  est.codigo 

		) as est_ins

		INNER JOIN
		(select id, nombre as nombre_gr, id_curso from grupo where anio = 2019) as gr 
		ON est_ins.id_grupo = gr.id
				
	) as est_ins_gr
	
	INNER JOIN 
	(select nombre as nombre_curs, id from curso) as curs
	ON est_ins_gr.id_curso = curs.id
	
select * from estudiante_grupo_curso_calficacion;






