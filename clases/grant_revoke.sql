-- creacipon de rol 
create role estudiante
	createdb
	login;
	
--crear usuarios 

create user claudia
	password 'claudia'
	in role estudiante;
	
create user liliana 
	password 'liliana'
	in role estudiante; 
	
create user maria
	password 'maria'
	login;
	
-- permiso de lectura al usuario claudia para la tabla student

grant select  
on student 
to claudia;


-- permiso de lectura al rol estudiante 

grant select 
on table student
to estudiante;

-- permitir natural join con student 1

grant select 
on student1
to claudia;

select * from 
student natural join student1;

-- otorgar todos los permisos a claudia

grant all 
on student
to claudia;

update student 
set dept_name = 'Fisica'
where id = 20304070;


-- quitar  el permiso insert y select al usuario claudia sobre la
-- tabla student 

revoke insert
on student
from claudia;

revoke select
on student
from claudia;

insert into student 
values(77777, 'Fernando Sanchez', 'Fisica');

-- ejemplo transferencia de permisos

grant insert 
on student 
to maria
with grant option;		-- usted también puede dar
						-- permisos

insert into student 
values(77777, 'Fernando Sanchez', 'Fisica');

grant insert
on student
to liliana;

insert into student 
values(88888, 'Fernando Sanchez', 'Fisica');


-- borrar usuario
-- para borrar usuarios hay que revocarle los permisos

drop user maria;

-- para poder revocar todos los permisos a maria
-- hay que quitar los permisos que maria ha dado
revoke all 
on student 
from maria
cascade;

insert into student
values(99999, 'Juana Ramirez', 'MACC');


-- borrar rol estudiante 

revoke all 
on student 
from estudiante
cascade;

drop role estudiante;

