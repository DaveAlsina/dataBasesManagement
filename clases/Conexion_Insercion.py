import psycopg2
conn = psycopg2.connect(user="postgres", password="dave2002", database="prueba", host="localhost", port="5432")
print("Conexión correcta!")

cursor = conn.cursor()

cursor.execute("SELECT VERSION();")
version = cursor.fetchone()
print("Conectado a - ", version)

cursor.execute("CREATE TABLE prueba(id SERIAL PRIMARY KEY, nuevo VARCHAR(50),numero INT);")
print("Tabla creada correctamente!")

cursor.execute("INSERT INTO prueba(nuevo, numero) VALUES('Prueba1', 110);")
cursor.execute("INSERT INTO prueba(nuevo, numero) VALUES('Prueba2', 120);")
cursor.execute("INSERT INTO prueba(nuevo, numero) VALUES('Prueba3', 130);")

conn.commit()
print("Tuplas insertadas correctamente!)")
conn.close()

