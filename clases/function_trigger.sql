create function suma(integer, integer)
	returns integer
	as 'select $1 + $2;'
language SQL;
	
select suma(100, 400);


create function masuno(i integer)
	returns integer
	as 
	$$
	begin 
		return i+1;
	end
	$$
language plpgsql;

select masuno(250);

select masuno(
	(select salario :: integer 
		from public.nuevo_empleado
		where id = 908070)
);

create or replace function mostrar_empleados()
	returns setof public.nuevo_empleado
	as
	$$
	select * from public.nuevo_empleado;
	$$
	language sql;

create or replace function mostrar_empleados2()
	returns table (id int, nombre varchar, direccion varchar, salario real)
	as
	$$
	select * from nuevo_empleado;
	$$
	language sql;
	
create function obtener_id_empleados()
	returns setof integer
	as
	$$
	select id from nuevo_empleado;
	$$
	language sql;	
	
	

select obtener_id_empleados();
select mostrar_empleados();

--
-- Propósito trigger: calcular la bonificación del empleado 
-- cuando se agrega o se actualizan los datos del empleado

alter table nuevo_empleado
	add column bonificacion real;

-- 
-- Función para trigger
--

--bonificación del 5% para todos los empleados

create function bonificación() --(recordar que los trigger reciben params)
	returns trigger
	as 
	$$
	begin
		new.bonificacion := new.salario * 0.05;
		return new
	end;
	$$
	language plpgsql;
	
-- Trigger

create trigger bonificacion_tr
	before insert or update 
	on nuevo_empleado
	for each row 
	execute procedure bonificacion();
	




