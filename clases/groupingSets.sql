-- grouping sets ---- (columnas a agrupar)
-- select
-- from 
-- group by 
-- grouping sets

select * from sales; 

--- consultar la cantidad por item de sales

select item_name, sum(quantity)
from sales 
group by item_name;

-- consultar la cantidad por color e item en la tabla sales

select item_name, color, sum(quantity)
from sales 
group by item_name, color;


-- consutlar todos los datos juntos de los agrupamientos anteriores
-- union all
-- (long way to go)

select item_name, color, clothes_size, sum(quantity)
from sales 
group by item_name, color, clothes_size

union all

select item_name, color, null, sum(quantity)
from sales 
group by item_name, color

union all

select item_name, null, null, sum(quantity)
from sales 
group by item_name

union all 

select null, color, null, sum(quantity)
from sales 
group by color

union all 

select null, null, clothes_size, sum(quantity)
from sales 
group by clothes_size;


-- cláusula: grouping sets

select item_name, color, clothes_size, sum(quantity)
from sales 
group by 
	grouping sets (
					(item_name, color, clothes_size),
					(item_name, color),
					(item_name, clothes_size),
					(color, clothes_size),
					(item_name),
					(color),
					(clothes_size),
					()
				  );
				  
-- crear un cubo con las dimensiones item_name, color, clothes_size
-- cube

select item_name, color, clothes_size, sum(quantity)
from sales
group by cube (item_name, color, clothes_size) 

-- Rollup para tabla sales

select item_name, color, clothes_size, sum(quantity)
from sales 
group by rollup (item_name, color, clothes_size);










