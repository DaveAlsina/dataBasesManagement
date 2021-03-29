1. **Union**
La Unión se encarga de juntar resultados de queris que comparten columnas, más exactamente como ilustra esta sintáxis:

	SELECT expression_1, expression_2, ... expression_n
	FROM tables
	[WHERE condition(s)]
	UNION
	SELECT expression_1, expression_2, ... expression_n
	FROM tables
	[WHERE condition(s)];
		
Note que esta operación de unión no repite duplicados.

2. **Union all**
Unión que hace lo mismo que el proceso con su nombre, pero que en este caso repite duplicados.


	SELECT expression_1, expression_2, ... expression_n
	FROM tables
	[WHERE condition(s)]
	UNION ALL
	SELECT expression_1, expression_2, ... expression_n
	FROM tables
	[WHERE condition(s)];


3. **Intersect**

Combina los resultados de 2 o más selecciones en un solo resultado. El operador de Intersección retorna todo conjunto de filas que se encuentren en ambas tablas.

		SELECT select_list 
		FROM A 
		INTERSECT 
		SELECT select_list 
		FROM B;

4. **Intersect all**

Retorna las filas en común pero no remueve duplicados.

		SELECT * FROM summerFruits
		INTERSECT ALL 
		SELECT * FROM fruits;

5. **Except**

Retorna las filas que están en la primera tabla pero no en la segunda. En otras palabras hace la diferencia entre conjuntos.

		SELECT * FROM summerFruits
		EXCEPT 
		SELECT * FROM fruits;

6. **Except all** 

Lo mismo que el except pero no remueve duplicados.

		SELECT * FROM summerFruits
		EXCEPT ALL
		SELECT * FROM fruits;
























