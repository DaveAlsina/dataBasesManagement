-------------------------------------------
-- Ejericicio 1----------------------------
-------------------------------------------

/* a) el usuario instructor es el ÃÂºnico que 
puede hacer todas las operaciones sobre 
la tabla takes
*/

create role instructor
	login;

grant all on takes
	to instructor;

create user instructor1
	password 'instructor1'
	in role instructor;


select * from takes; -- si tiene permisos

-- no tiene permisos
select * from time_slot;
select * from student;
select * from section;
select * from department;
select * from course;
select * from classroom;
select * from advisor;
select * from prereq;
select * from teaches;
select * from instructor;

	
revoke all on takes 
from instructor
cascade;

drop user instructor1;


/* b) el usuario estudiante puede consultar los
datos de todas las tablas de la BD y es el
ÃÂºnico que puede hacer todas las operaciones con los datos de la tabla student
*/

create user estudiante
	password 'estudiante'
	login;

grant all on student 
	to estudiante;

grant select on all tables in schema public
to estudiante;

-- permisos que tiene sobre student
insert into student
values (123456789, 'weng', 'Comp. Sci.', 100);

update student set tot_cred = 110 
where id = 123456789;

delete from student
where id = 123456789;

-- permisos de select que tiene sobre todas las
-- tablas

select * from takes;
select * from time_slot;
select * from student;
select * from section;
select * from department;
select * from course;
select * from classroom;
select * from advisor;
select * from prereq;
select * from teaches;
select * from instructor;

-- no puede agregar columnas a la tabla
-- pero puede hacer todas las operaciones con
-- los datos de la tabla
alter table student
add column ganasDeVivir char;

/* c) el usuario coordinador es el ÃÂºnico que 
puede hacer todas las operaciones con los datos
de las tablas: 'teaches, section, classroom, 
time_slot' y puede consultar los datos de las tablas teaches, section, classroom y time_slot.
*/

create user coordinador
	password 'coordinador'
	login;

grant select on teaches, section, classroom, time_slot 
to coordinador;

grant all on teaches, section, classroom, time_slot 
to coordinador;


select * from time_slot;
select * from section;
select * from classroom;
select * from teaches;

-- prueba para classroom

insert into classroom 
values('loli',101,500);

update classroom 
set classroom.building = 'lola'
where classroom.building = 'loli';

delete from classroom 
where classroom.building = 'loli';

--prueba para time_slot

insert into time_slot values('A','T','8:00','8:55');

update time_slot
set end_time = '8:45'
where time_slot_id = 'A' 
and day = 'T' and end_time = '8:55';

delete from time_slot as t
where t.time_slot_id = 'A' 
and end_time = '8:55';

--prueba para section

insert into section values('BIO-101', 3, 'Summer', 2009, 'Painter', 514,'B','M','9:00');

update section 
set sec_id = 4 
where sec_id = 3 and 
course_id = 'BIO-101';

delete from section 
where section.course_id = 'BIO-101'
and section.sec_id = 4;

--prueba para teaches
delete from teaches as t
where t.id = 12121;

insert into teaches values(12121,'FIN-201',1,'Spring',2010);


-------------------------------------------
-- Ejericicio 2----------------------------
-------------------------------------------

-- a) Los datos asociados a las inscripciones y notas de acuerdo con un semestre y aÃ±os

create or replace function inscripciones_notas(sem character varying, yr integer)
returns table (id integer, course_id character varying(7), sec_id integer, semester character varying(10), year integer, grade character varying(2))
	as 
	$$
		select * from public.takes as ta
		where ta.semester = sem 
		and ta.year = yr;
	$$
language sql;

select inscripciones_notas('Spring',2010);

-- b) Calcular el incremento del 10 % del salario para un instructor dado su id 

create or replace function raise_salary_instr(identifier int)
returns real
	as
	$$
	begin
		return (select salary from instructor i where i.id = identifier)*0.1;
	end
	$$
language plpgsql;

select raise_salary_instr(12121);

-- c) Calcular la cantidad de cursos tomados por un estudiante dado su id. 

create or replace function num_courses(identifier int)
returns int
	as 
	$$
	begin
		return (select count(course_id) from takes 
				where takes.id = identifier);
	end		
	$$
language plpgsql;


select id from student;
select num_courses(12345);


-- d) Listar los prerrequisitos de un curso conociendo su nombre.

create or replace function prerreqs(tit character varying(40))
returns table (prerreqs character varying(7))
	as 
	$$
		select prereq_id 
		from 
			(select * from course where course.title = tit)
			as cours
			natural join prereq;
	$$
language sql;
			
select prerreqs('Genetics');

-------------------------------------------
-- Ejericicio 3----------------------------
-------------------------------------------

-- a)  Calcular automácamente la duraci´on de un espacio de clase cuando se agrega
-- o cuando se actualiza.
-- http://sqlines.com/postgresql/how-to/datediff
-- https://stackoverflow.com/questions/39859642/how-to-print-new-value-with-trigger-postgres

create or replace function duration()
	returns trigger
	as
	$$
	declare 
		dur integer;
	begin
		select (date_part('hour',  new.end_time::time - new.start_time::time)*60
			   + date_part('minute', new.end_time::time - new.start_time::time))
		into dur;

		raise notice 'Ahora el horario tiene duración: % minuntos', dur;
		return null;
	end;
	$$
language plpgsql;

create trigger duration_tr
	after insert or update
	on time_slot
	for each row
	execute function duration();


select * from time_slot;

insert into time_slot
values ('A', 'R', '8:00', '9:00');

delete from time_slot 
where time_slot_id = 'A' and day ='R';

-- b) Actualizar la cantidad de créditos para un estudiante cada vez que tome un
curso

create or replace function updt_creds_on_take()
	returns trigger 
	as 
	$$
	declare 
		curr_creds integer;
		new_creds integer;
	begin 
		select tot_cred from student as s
		where s.id = new.id
		into curr_creds;
		
		select credits
			from (select course_id from takes where takes.course_id = new.course_id)
			as tk_cour
			natural join course
		into new_creds;
		
		update student 
		set tot_cred  = curr_creds + new_creds
		where student.id = new.id;
		
		return null;
	end
	$$
language plpgsql;

create trigger updt_creds_on_take_tr
	after insert or update
	on takes
	for each row
	execute function updt_creds_on_take();

select * from student; 
select * from course; 
select * from takes;

select * from student
where id = 128;

insert into takes
values(128, 'CS-190', 2, 'Spring', 2009, 'A' )





