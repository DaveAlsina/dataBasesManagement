-- Vista: cursos departamento Physics en fall 2009

-- vista normal que es algo así como
-- un renombre de la consulta que 
-- se quiere ejecutar

create view  cursos_fall2009_phy_v 
as
	select c.course_id, s.sec_id, s.building, s.room_no
	from course c natural join section s
	where c.dept_name = 'Physics'
		and s.semester = 'Fall'
		and s.year = 2009;

select * from cursos_fall2009_phy_v;

--
-- creación de la materialized view
-- 

create materialized view  cursos_fall2009_phy_vm
as
	select c.course_id, s.sec_id, s.building, s.room_no
	from course c natural join section s
	where c.dept_name = 'Physics'
		and s.semester = 'Fall'
		and s.year = 2009;

select * from cursos_fall2009_phy_vm;

-- Agregar datos 

insert into course
values ('PHY-102', 'Mechanical Physics', 'Physics', 4);

insert into section 
values ('PHY-102', 1, 'Fall', 2009, 'Watson', 100, 'A', 'W', '8:00:00');

select * from course;
select * from section;

select * from cursos_fall2009_phy_v;
select * from cursos_fall2009_phy_vm;

--
-- Actualizar datos de la vista materializada
--

-- me interesan los datos
refresh materialized view cursos_fall2009_phy_vm;
select * from cursos_fall2009_phy_vm;

-- solo me interesa la estructura
refresh materialized view cursos_fall2009_phy_vm with no data;
select * from cursos_fall2009_phy_vm;





