-- create table sales

create table sales(
	item_name varchar(10) not null,
	color varchar(10) not null,
	clothes_size varchar(10) not null, 
	quantity smallint not null 
)

--inserts
insert into sales values('dress', 'dark', 'small', 2);
insert into sales values('dress', 'dark', 'medium', 6);
insert into sales values('dress', 'dark', 'large', 12);
insert into sales values('dress', 'pastel', 'small', 4);
insert into sales values('dress', 'pastel', 'medium', 3);
insert into sales values('dress', 'pastel', 'large', 3);
insert into sales values('dress', 'white', 'small', 2);
insert into sales values('dress', 'white', 'medium', 3);
insert into sales values('dress', 'white', 'large', 0);
insert into sales values('pants', 'dark', 'small', 14);
insert into sales values('pants', 'dark', 'medium', 6);
insert into sales values('pants', 'dark', 'large', 0);
insert into sales values('pants', 'pastel', 'small', 1);
insert into sales values('pants', 'pastel', 'medium', 0);
insert into sales values('pants', 'pastel', 'large', 1);
insert into sales values('pants', 'white', 'small', 3);
insert into sales values('pants', 'white', 'medium', 0);
insert into sales values('pants', 'white', 'large', 2);
insert into sales values('shirt', 'dark', 'small', 2);
insert into sales values('shirt', 'dark', 'medium', 6);
insert into sales values('shirt', 'dark', 'large', 6);
insert into sales values('shirt', 'pastel', 'small', 4);
insert into sales values('shirt', 'pastel', 'medium', 1);
insert into sales values('shirt', 'pastel', 'large', 2);
insert into sales values('shirt', 'white', 'small', 17);
insert into sales values('shirt', 'white', 'medium', 1);
insert into sales values('shirt', 'white', 'large', 10);
insert into sales values('skirt', 'dark', 'small', 2);
insert into sales values('skirt', 'dark', 'medium', 5);
insert into sales values('skirt', 'dark', 'large', 1);
insert into sales values('skirt', 'pastel', 'small', 11);
insert into sales values('skirt', 'pastel', 'medium', 9);
insert into sales values('skirt', 'pastel', 'large', 15);
insert into sales values('skirt', 'white', 'small', 2);
insert into sales values('skirt', 'white', 'medium', 5);
insert into sales values('skirt', 'white', 'large', 3);

delete from sales where item_name = 'pant' and color = 'white' and clothes_size = 'medium'
delete from sales where item_name = 'pant' and color = 'white' and clothes_size = 'large'

--create extension 

create extension tablefunc;

drop extension tablefunc;

-- crear tabla cruzada 

select item_name::text, color::text, sum(quantity)::numeric
from sales
group by item_name, color
order by 1, 2;

select * 
into ventas
from crosstab ('select item_name::text, color::text, sum(quantity)::numeric
						from sales
						group by item_name, color
						order by 1, 2;')
as final_result(item_name text, dark numeric, pastel numeric, white numeric);

select * from ventas;



