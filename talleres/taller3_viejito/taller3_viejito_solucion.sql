---
---	(4-(A))
---

-- create table habitante

create table habitante(
	id_habitante serial primary key, 
	nombre varchar(60) not null,
	tipo_documento char(2) not null,
	num_documento varchar(12) not null,
	email varchar(60) unique not null, 
	id_habitante_host integer unique	
);

alter table habitante 
add constraint hab_fk 
foreign key (id_habitante_host)
references habitante(id_habitante_host);

select * from habitante; 

-- create table propiedad

create table propiedad(
	id_propiedad serial primary key, 	
	nombre varchar(60) not null, 
	tipo_propiedad varchar(30) not null, 
	direccion varchar(120) not null
);


-- create table alquiler 

create table alquiler(
	
	id_alquiler serial primary key, 
	inicio_alquiler date not null default now()::date, 
	fin_alquiler date, 
	canon_alquiler numeric not null,
	id_propiedad integer not null, 
	id_habitante integer not null
	
);

alter table propiedad 
add constraint nombr_chk
check(lower(tipo_propiedad) in ('casa', 'apartamento'));

-- alter table propiedad
-- drop constraint nombr_non_neg_chk;

alter table alquiler 
add constraint canon_non_neg_chk
check(canon_alquiler > 0);

alter table alquiler 
add constraint prop_exists
foreign key(id_propiedad)
references propiedad(id_propiedad);

alter table alquiler 
add constraint hab_exists
foreign key(id_habitante)
references habitante(id_habitante);


---
---	(4-(B))
---

select * from propiedad;

insert into propiedad
values (54, 'la gonorrea', 'chozademarihuana', 'laúltimapuñalada');

---
---	(4-(C))
---


insert into propiedad
values ('la gonorrea', 'casa', 'calle#4-409');

insert into propiedad (nombre, tipo_propiedad, direccion)
values ('macc', 'casa', 'maccparidos');

insert into propiedad (nombre, tipo_propiedad, direccion)
values ('vallenato', 'casa', 'en el aire');

select * from propiedad;


---
---	(4-(D))
---











