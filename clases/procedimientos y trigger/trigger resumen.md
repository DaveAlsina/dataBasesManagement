$$

Trigger\; =
\begin{cases}
	\text{Ejecución: Automatica dado un evento en los datos}\\
	\text{Definición previa -> postgresql-SP (devuelve un objeto trigger)}\\
	\text{(no tiene parámetros)}
\end{cases}
$$

El evento ante el que se responde puede ser: Insert, delete, update.

Existen las variables **NEW** y **OLD**, *new* se refiere a los     registros nuevos ingresados a la tabla (y se le relaciona el insert), respecto al *old* (se le relaciona el delete y el update).

Con este **NEW** y **OLD** puedo por ejemplo decir: new.nombre_de_la_columna UPDATE ...