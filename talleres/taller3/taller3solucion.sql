------------------------------------------------------------
-- Ejercicios 1
------------------------------------------------------------

--
-- Ejercicio 1a
--

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2009 and sect.semester = 'Fall'

union

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2010 and sect.semester = 'Spring';

--
-- Ejercicio 1b
--

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2009 and sect.semester = 'Fall'

union all

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2010 and sect.semester = 'Spring';

--
-- Ejercicio 1c
--

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2009 and sect.semester = 'Fall'

intersect

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2010 and sect.semester = 'Spring';


--
-- Ejercicio 1d
--

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2009 and sect.semester = 'Fall'

intersect all

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2010 and sect.semester = 'Spring';

--
-- Ejercicio 1e
--

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2009 and sect.semester = 'Fall'

except

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2010 and sect.semester = 'Spring';


--
-- Ejercicio 1f
--

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2009 and sect.semester = 'Fall'

except all

select title 
from course as cou 
	inner join 
	section as sect 
	on cou.course_id = sect.course_id
where sect.year = 2010 and sect.semester = 'Spring';

--
-- Ejercicio 1g
--

select count(title)
from ( 
	select title from
		department as dep
		inner join 
		course as cours
		on dep.dept_name = cours.dept_name
	where dep.dept_name = 'Physics' 
	
	union all
	
	select title from 
		department as dep
		inner join 
		course as cours
		on dep.dept_name = cours.dept_name
	where dep.dept_name = 'Comp. Sci.' 

 ) as compSci_phy;

------------------------------------------------------------
-- Ejercicios 2
------------------------------------------------------------

--
-- Ejercicio 2a 	
--

select distinct title
from
	course as cou 
	
	inner join 
	
	section as sect 
	on cou.course_id = sect.course_id
	where (sect.year = 2009 and sect.semester = 'Fall') or
		  (sect.year = 2010 and sect.semester = 'Spring');

--
-- Ejercicio 2b	
--

select name, salary
from instructor as ins  
where ins.salary > (
					select min(salary) 
					from instructor as ins
						inner join 
						teaches as tea 
						on ins.id = tea.id 
					where ins.dept_name = 'Biology'
					);
						
--
-- Ejercicio 2c
--

select name, salary
from instructor as ins  
where ins.salary > (
						select max(salary)
							from instructor as ins
							inner join 
							teaches as tea 
							ON ins.id = tea.id
						where ins.dept_name = 'Biology'
					);
					
--
-- Ejercicio 2d
--

select name
from(
		select * from
		instructor as ins
	
		left join
	
		teaches as tea
		on ins.id = tea.id
	) as ins_teaches
where ins_teaches.course_id isnull;

------------------------------------------------------------
-- Ejercicios 3
------------------------------------------------------------

--
-- Ejercicio 3a
--

create table section2(
	course_id character varying(7),
	sec_id integer,
	semester character varying(10),
	year integer,
	building character varying(20),
	room_no integer,
	time_slot_id character(1),
	day character(1),
	start_time time
);

alter table section2
add foreign key(course_id)
references course(course_id);

alter table section2
add foreign key(building, room_no)
references classroom(building, room_no);

alter table section2
add foreign key(time_slot_id, day, start_time)
references time_slot(time_slot_id, day, start_time);


--
-- Ejercicio 3b
--

create table teaches2(
	
	id integer,
	course_id character varying(7),
	sec_id integer,
	semester character varying(10),
	year integer

);

alter table teaches2
add primary key(id, course_id, sec_id, semester, year);

alter table teaches2
add foreign key(id)
references instructor(id);

alter table teaches2
add foreign key(course_id)
references course(course_id);

alter table teaches2					-- esta no funciona por alguna razón
add foreign key(sec_id, semester, year)
references section2(sec_id, semester, year);







