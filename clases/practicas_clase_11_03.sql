-- Trigger: con base en los nombres (2) y apellidos (2) del empleado teenr
-- el nombre completo, tanto al agregar como al actualizar

insert into nuevo_empleado(id, nombre, direccion, salario)
values (234567, 'Maria Sánchez Ruíz', 'calle 40#30-20', 2000000)

-- agregar las columnas necesarias y actualizar info

alter table nuevo_empleado 
	add column nombre_completo varchar(60);
	
alter table nuevo_empleado 
	add column apellido varchar(15);
	
alter table nuevo_empleado 
	add column nombre2 varchar(15);
	
alter table nuevo_empleado 
	rename column nombre to nombre1;
	
alter table nuevo_empleado 
	add column apellido2 varchar(15);

select * from nuevo_empleado;

-- actualizar los datos para que se ajusten a las nuevas columnas

update nuevo_empleado set apellido1 = 'Suarez'
	where id = 908070;
	
update nuevo_empleado set apellido1 = 'Sánchez'
	where id = 234567;
	
update nuevo_empleado set apellido2 = 'Ruiz'
	where id = 234567;

-- creación del trigger

create function llenar_nombre()
	returns trigger 
	as 
	$llenar_nombre$
	begin 
		new.nombre_completo := new.apellido1 || ' ' || new.apellido2 || ' ' || new.nombre1 || ' ' || new.nombre2;
		return new;
	end;
	$llenar_nombre$
	language plpgsql;
	

create trigger llenar_nombre_tr
before insert or update
	on nuevo_empleado
	for each statement
	execute procedure llenar_nombre();
	
drop trigger llenar_nombre_tr on nuevo_empleado;

create trigger llenar_nombre_tr
before insert or update
	on nuevo_empleado
	for each row
	execute procedure llenar_nombre();

select * from nuevo_empleado;

update nuevo_empleado set apellido1 = 'Suarez'
	where id = 908070;
	
update nuevo_empleado set apellido2 = 'Gómez'
	where id = 908070;
	
update nuevo_empleado set nombre2 = 'Luis'
	where id = 908070;
	
update nuevo_empleado set nombre1 = 'José'
	where id = 908070;
	
select * from nuevo_empleado;

-- Trigger: cuando se elimina un dato
-- los datos quedan como empleado antiguo 

-- Table: public.nuevo_empleado

-- DROP TABLE public.nuevo_empleado;

CREATE TABLE public.viejo_empleado
(
    id integer NOT NULL,
    nombre1 character varying(30) COLLATE pg_catalog."default" NOT NULL,
    direccion character varying(30) COLLATE pg_catalog."default" NOT NULL,
    salario real NOT NULL,
    bonificacion real,
    nombre2 character varying(15) COLLATE pg_catalog."default",
    nombre_completo character varying(60) COLLATE pg_catalog."default",
    apellido1 character varying(15) COLLATE pg_catalog."default",
    apellido2 character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT nuevo_viejo_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.viejo_empleado
    OWNER to postgres;

-- Trigger: llenar_nombre_tr
-- DROP TRIGGER llenar_nombre_tr ON public.nuevo_empleado;

CREATE TRIGGER llenar_nombre_tr
    BEFORE INSERT OR UPDATE 
    ON public.viejo_empleado
    FOR EACH ROW
    EXECUTE PROCEDURE public.llenar_nombre();

-- drop function archivar_empleado()
create function archivar_empleado()
	returns trigger 
	as
	$$
	begin
		insert into viejo_empleado values(old.id, old.nombre1, old.direccion, old.salario, 
										  old.bonificacion, old.nombre2, old.nombre_completo,
										  old.apellido1, old.apellido2);
		return old;
	end;
	$$
	language plpgsql;

select * from viejo_empleado;

-- creación del trigger par aborrado
--drop trigger empleado_antiguo_antiguo_tr on nuevo_empleado;

create trigger empleado_antiguo_antiguo_tr
	after delete 
	on nuevo_empleado
	for each row
	execute procedure archivar_empleado();
	
select * from nuevo_empleado;

delete from nuevo_empleado where id = 234567;
select * from viejo_empleado;
