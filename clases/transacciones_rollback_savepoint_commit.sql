-- hacer en una base de datos nueva
-- o sin las tablas creadas (las que se crean
-- en el script).

--
-- Transacción
--

begin; 

create table nuevo_empleado
(
	id int not null,
	nombre varchar(30) not null, 
	direccion varchar(30) not null, 
	salario real not null, 
	primary key (id)	
);

-- punto de guardado, con su nombre 
-- para identificarlo

savepoint inicio;

insert into nuevo_empleado values
(102030, 'Maria Jimenez', 'calle 100 8-70', 10000000);

-- regreso al estado del punto de guardado
-- llamado con el 'to'

rollback to inicio;

insert into nuevo_empleado values
(908070, 'José suarez', 'calle 100 9-50', 15000000);

end transaction;

--
-- modulo de python a usar en las próximas clases psycopg2
--

