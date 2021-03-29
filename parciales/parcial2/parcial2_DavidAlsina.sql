-- 1) Escribir una sentencia SQL que use consulta de conjuntos que permita obtener los
-- nombres de los departamentos que pertenecen a la facultad Administracion y los nombres
-- de los departamentos de la facultad Economia

create or replace function deps_econom_admin()
returns setof character varying
as
$$
select nombre
from departamento 
where id in (select id 
			from facultad 
			where nombre = 'Administracion'
			or nombre = 'Economia');
$$
language sql;

select deps_econom_admin(); -- prueba de funcionamiento

-- para reconocimiento de las tablas y revisión
select * from departamento; 
select * from facultad;


-- 2) Escribir una sentencia SQL que use subconsultas y que permita obtener el nombre,
-- apellido y la calificación de los estudiantes del Departamento MACC que tengan calificaciones
-- mayores que alguna calificación de los estudiantes del departamento Economia.

select *
from (
		select nombre, apellido, calificacion 
		from
			(select nombre, apellido, codigo
			from estudiante 
			where id_departamento in (	select id 
										from departamento 
										where nombre = 'MACC'
									 )
			 ) as macc_est
			inner join 
			inscripcion as i 
			on macc_est.codigo = i.codigo_estudiante	
	 ) as macc_est_nota
where calificacion > some( 
							select  calificacion
							   from 
									(select codigo
									from estudiante 
									where id_departamento in (	select id 
																from departamento 
																where nombre = 'Economía'
															 )
									 ) as econom_est
									inner join 
									inscripcion as i 
									on econom_est.codigo = i.codigo_estudiante	
						 );

-- 3) Escribir un trigger y su función asociada, que permita calcular el promedio de
-- calificaciones de un grupo cada vez que se agregue o actualice un estudiante. Tener en
-- cuenta que el promedio se actualiza en la tabla grupo en una nueva columna denominada
-- prom_calificaciones, que tiene 0 como valor por defecto y que las calificaciones en 0 no se
-- tienen en cuenta en el promedio

-- añadidura de la columna prom_calificaciones
alter table grupo 
add column prom_calificaciones real 
default 0; 

select * from grupo; -- prueba de funcionamiento


create or replace function promedios_grupo()
returns trigger 
as
$$
declare prom real;
begin
	select sum(calificacion)/count(calificacion)::real
	into prom
	from inscripcion 
	where (id_grupo = new.id_grupo) and (calificacion > 0)
	group by id_grupo;
	
	update grupo
	set prom_calificaciones = prom
	where id = new.id_grupo;
	
	return null;
end;
$$
language plpgsql; 

create trigger modif_prom_gr
	after insert or update 
	on inscripcion
	for each row
	execute function promedios_grupo();

-- creacion de un estudiante para testear el código
insert into estudiante(codigo, nombre, apellido, fecha_nacimiento, genero, id_departamento) 
values(14, 'David', 'Alsina', '1600-12-12', 'M', 6)

select * from estudiante;

-- inscripción del estudiante agregado para testear el código
insert into inscripcion
values(17, 50, 14, 3)


select * from grupo; -- prueba de funcionamiento



