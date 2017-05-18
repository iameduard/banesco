import pyodbc
cstring = 'DRIVER={Microsoft Access Driver (*.mdb)};DBQ=E:\Anaconda\Cuadromando.mdb'
conn = pyodbc.connect(cstring)
cursor = conn.cursor()
sql="SELECT * FROM Capas"
cur=cursor.execute(sql)
for r in cur:
	r1,r2=r
	print r2
conn.close()