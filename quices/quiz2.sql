create or replace function increase_budget()
returns trigger as 
$$
begin 

	update department 
	set budget = budget + (budget)*0.1
	where department.dept_name = new.dept_name; 

	return new;
end;
$$
language plpgsql;

create trigger increase_budget_dep
	after insert 
	on course
	for each row 
	execute procedure increase_budget();
	
-- selects para ver los datos de la tabla y notar los cambios
select * from course; 
select * from department;

-- insersiones de testeo
insert into course 
values ('CS-399', 'NLP', 'Comp. Sci.', 3);

insert into course
values ('CS-398', 'Intro. AI', 'Comp. Sci.', 3);

-- para ver los cambios
select * from department;