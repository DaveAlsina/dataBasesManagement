-- 1) Escriba las sentencias SQL que permitan obtener los siguientes resultados usando
-- consultas recursivas:
-- 
-- a) Hallar todos los prerequisitos del curso Robotics

create or replace function prereqs_course(subject character varying)
	returns table(course_id character varying(7), title character varying(40), nivel integer)
	as 
	'
	with recursive course_reqs as(
		-- query base 
		select course_id, 0 as nivel
			from course 
			where title = subject

		union 

		select prereq_id, cr.nivel + 1 as nivel
			from course_reqs as cr 
			inner join
			prereq as pr 
			on cr.course_id = pr.course_id
	)	
	
	-- selecciona solo el id, el título y el nivel 
	-- de las materias que son prerrequisito
	
	select cou.course_id, title, nivel
	from course as cou
	inner join 
	course_reqs as cr
	on cou.course_id = cr.course_id
	where cr.nivel > 0					-- descarta la materia de la cual 
										-- estamos buscando los prerrequisitos
	'
language sql;


select * from prereqs_course('Robotics');
select * from prereqs_course('Genetics');
select * from course;

-- 1) Escriba las sentencias SQL que permitan obtener los siguientes resultados usando
-- consultas recursivas:
-- 
-- b) Hallar todos los prerequisitos de cada una de las asignaturas del departamento
-- Comp. Sci.

-- por la forma del problema todo apunta a que tendré que usar fuerza bruta
-- para hallar los requisitos de cada materia independietemente debo usar recusión
-- y se piden todos los requisitos de un conjunto de materias, eso implica 
-- aplicar recursión sobre cada problema pequeño e irlo juntando todo.




create or replace function prereqs_course_general(cou_code character varying(7))
	returns table(course_id character varying(7), title varchar, is_prereq_of character varying(7),  nivel integer)
	as 
	'
	with recursive course_reqs as(
		-- query base 
		select cou.course_id, cou_code as is_prereq_of, 0 as nivel
			from course as cou
			where cou.course_id = cou_code

		union 

		select prereq_id, cou_code as is_prereq_of, cr.nivel + 1 as nivel
			from course_reqs as cr 
			inner join
			prereq as pr 
			on cr.course_id = pr.course_id
	)	

 	-- selecciona solo el id, el título y el nivel 
	-- de las materias que son prerrequisito
	
	select cou.course_id, cou.title, cr.is_prereq_of, cr.nivel
			from course as cou
			inner join 
			course_reqs as cr
			on cou.course_id = cr.course_id
			where cr.nivel > 0;					-- descarta la materia de la cual 
												-- estamos buscando los prerrequisitos
	'
language sql;
	
select * from  prereqs_course_general('CS-319');
	
--
--
--

create or replace function prereqs_dep(department_name character varying(20))
	returns table(course_id character varying(7), title varchar, is_prereq_of character varying(7),  nivel integer)
	as 
	'
	with recursive course_reqs as(
		-- query base 
		select cou.course_id, cou.course_id as is_prereq_of, 0 as nivel
			from course as cou
			where cou.course_id in (select course_id
									from course as cou
									inner join 
									( select dept_name from department
										where dept_name = $1 
									) as deps
									 on cou.dept_name = deps.dept_name)

		union all

		select prereq_id, cr.course_id as is_prereq_of, cr.nivel + 1 as nivel
			from course_reqs as cr 
			inner join
			prereq as pr 
			on cr.course_id = pr.course_id
	)	

 	-- selecciona solo el id, el título y el nivel 
	-- de las materias que son prerrequisito
	
	select cou.course_id, cou.title, cr.is_prereq_of, cr.nivel
			from course as cou
			inner join 
			course_reqs as cr
			on cou.course_id = cr.course_id
			where cr.nivel > 0;					-- descarta la materia de la cual 
												-- estamos buscando los prerrequisitos
	'
language sql;
	
select * from  prereqs_dep('Comp. Sci.');
	
	
	
	
	
	
	
	
	
	
	
	
	
-- intento fallido de hacer fuerza bruta	

create or replace function prereqs_dep()
returns @prereqs_ table(course_id character varying(7), title character varying(40), is_prereq_of character varying(7), nivel integer)
as
$$
declare rec record;
declare command text;
declare @prereqs_ table(course_id character varying(7), title character varying(40), is_prereq_of character varying(7), nivel integer);
begin

	command := 'select course_id, title, cou.dept_name
					from course as cou
					inner join 
					( select dept_name from department
						where dept_name = $1 
					) as deps
					 on cou.dept_name = deps.dept_name;';
					 
	for rec in execute command using 'Comp. Sci.'
	loop 
			@prereqs_
			union all
			select * from  prereqs_course_general(rec.course_id);
	end loop;
end;
$$
language plpgsql;



