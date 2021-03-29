-- 
-- crear las tablas sin restricciones primero es útil
-- en caso de no saber que tabla crear primero
-- y tener que relacionarlas.
-- 

-- creación de tablas

create table departamento
(
	id int not null, 
	nombre varchar(40) not null	
);

create table empleado
(
	id int not null, 
	nombre varchar (30) not null,
	cod_dpto int
);

-- cambio en las tablas, agregado de constraints

Alter table departamento 
	add constraint dep_pk 
	primary key( id );
	
Alter table empleado
	add constraint empleado_pk 
	primary key( id );
	
alter table empleado 
	add constraint empleado_fk
		foreign key (cod_dpto)
		references departamento(id);

select * from empleado;
select * from departamento;
