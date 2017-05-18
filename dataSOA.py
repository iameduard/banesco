import operator
import sys
import datetime
import time

f1=open('H:\BOD\RE_DATOS_SOA\integrabusqaha\integrabusqaha.csv')
f2=open('H:\BOD\RE_DATOS_SOA\integrabusqaha\integrabusqaha2.txt','w')


print datetime.datetime.now()

#Inicializacion de Variables..

for line in f1.readlines():
	#f2.write(line.replace(",","."))
	line = line.strip()
	line = line.replace('","',';')
	line = line.replace('"','')
	f2.write(str(line)+'\n')
	

print datetime.datetime.now()

#CERRAR ARCHIVOS.

f1.close()
f2.close()

		


