import psycopg2

try:
    conexion = psycopg2.connect(host="localhost", 
                                 port="5432", 
                                 database="parcial1", 
                                 user="postgres", 
                                 password="dave2002")
    conexion.autocommit = False
    cursor = conexion.cursor()
    #Sentencia para consultar el id del grupo 1 del curso Manejo de Bases de Datos en el periodo 2021-1.     
    sql = """select gru.id 
          from grupo gru join curso cur on (gru.id_curso = cur.id)
          where gru.nombre = 'G1' and cur.nombre = 'Manejo de Bases de Datos' and anio = 2021 and periodo = 1"""

    #Se ejecuta la sentencia. El resultado es 3, pero está en una lista de tuplas
    cursor.execute(sql)
    resultados = cursor.fetchall()
    idGrupo = resultados[0][0]
    print (idGrupo)
    
    #Sentencia para insertar el horario jueves 16-18 en el salon Hipatia que tiene id 1
    sql = """insert into horario (dia, hora_inicio, hora_fin, id_grupo, id_salon)
    values (4, 16, 18, """ + str(idGrupo) + """, 1)"""
    
    #Se ejecuta la sentencia. Se inserta el registro
    cursor.execute(sql)    
    
    #Sentencia para insertar el horario viernes 15-18 en el salon con id 5, el cual no existe
    sql = """insert into horario (dia, hora_inicio, hora_fin, id_grupo, id_salon)
    values (4, 16, 18, """ + str(idGrupo) + """, 5)"""
    
    #Se ejecuta la sentencia. Genera excepción entonces hace el rollback
    cursor.execute(sql)    
    
    conexion.commit()
    print("Transaccion exitosa")

except Exception as e:
    print ("Error en la transaccion", e)
    conexion.rollback();

finally:
    cursor.close()
    conexion.close()
    print ("Conexion cerrada")






