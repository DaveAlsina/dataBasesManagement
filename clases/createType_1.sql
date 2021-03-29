create table student(

	id integer not null, 
	name character varying (60), 
	dept_name character varying(20),
	tot_cred integer default 0,
	primary key(id)
);


--
-- Ejemplos tipos de datos de usuario
--

create type estado as ENUM('Activo', 'Inactivo');

alter table student 
add column status estado;

select * from student; 

update student set status = 'Activo' where 
id = 98765;

-- Error 
update student set status = 'NA', where 
id = 12345; 

--
-- crear dominio (son mejores de usar en comparacion con types)
--

-- verifica que no hayan espacios y que no sean valores 
-- nulos

-- !~ (significa negación)
create domain name_d as 
	varchar not null check (value !~ '\s');

-- crea tabla para probar domino
create table student1(

	id integer not null, 
	name name_d, 			-- asocia el dominio a la columna
	dept_name character varying(20),
	tot_cred integer default 0,
	primary key(id)
);
-- no se puede asociar a una misma columna el tipo de dato y el dominio juntos

insert into student1 (id, name, dept_name)
values (98765, 'JuanVargas', 'Fisica');

-- Error
insert into student1 (id, name, dept_name)
values (98765, 'Juan Vargas', 'Fisica');

select * from student1; 






