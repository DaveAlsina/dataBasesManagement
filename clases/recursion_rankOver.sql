alter table nuevo_empleado 
add column id_jefe integer; 

alter table nuevo_empleado 
add constraint jefe_fk 
foreign key (id_jefe)
references nuevo_empleado(id);


INSERT INTO public.nuevo_empleado(
	id, nombre1, nombre2,apellido1, apellido2, direccion, salario)
	VALUES (456789, 'Hugo', 'Armando', 'Duarte', 'Rodríguez', 'Calle 20 # 10-40', 4500000);
INSERT INTO public.nuevo_empleado(
	id, nombre1, nombre2,apellido1, apellido2, direccion, salario)
	VALUES (567890, 'Fabian', 'Rodrigo','Cárdenas', 'Ruiz', 'Calle 20 # 10-40', 7000000);
INSERT INTO public.nuevo_empleado(
	id, nombre1, nombre2,apellido1, apellido2, direccion, salario)
	VALUES (123456,'Mónica','María', 'Díaz', 'Suárez', 'Calle 20 # 10-40', 1500000);
INSERT INTO public.nuevo_empleado(
	id, nombre1, nombre2,apellido1, apellido2, direccion, salario)
	VALUES (345678,'Diana','Marcela', 'Díaz', 'Suárez', 'Calle 20 # 10-40', 4500000);


-- Jefe Fabian, subordinados Hugo, Diana
UPDATE nuevo_empleado SET id_jefe = 567890 
  WHERE id = 456789 or id = 345678; 

-- Jefe Hugo, subordinados Mónica y José
UPDATE nuevo_empleado SET id_jefe = 456789 
  WHERE id = 123456 or id = 908070; 

-- Jefe Diana, subordinados Juana
UPDATE nuevo_empleado SET id_jefe = 345678 
  WHERE id = 789234;


with recursive t(n) as (
	values(1)
	union all 
	select n+1 from t where n <100
)

select sum(n) from t;

-- CLASIFICAR LOS EMPLEADOS POR NIVELES DE JERARQUÍA

with recursive jefes as (
	-- query base
	select id, nombre_completo, id_jefe, 1 as nivel 
	from nuevo_empleado where id = 567890

	union all
	
	select ne.id, ne.nombre_completo, ne.id_jefe, jefes.nivel+1 as nivel
	from nuevo_empleado as ne join jefes 
	on ne.id_jefe = jefes.id
)

select * from jefes;
select * from nuevo_empleado;

-- AGREGACIÓN AVANZADA
-- RANK()

select salario, rank() over(order by salario) as posicion
from nuevo_empleado;

select id_jefe, salario, rank() over(
							partition by id_jefe --es análogo a un group by, particiona por jefe
							order by salario     --para cada partición se hace el ranqueo.
							) as posicion
from nuevo_empleado;


