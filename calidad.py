import operator
import sys
import datetime
import time

f1=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\PostilionFlujoMensajes.csv')
f2=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\calidad.txt','w')


print datetime.datetime.now()

#Inicializacion de Variables..

for line in f1.xreadlines():
	#f2.write(line.replace(",","."))
	line = line.strip()
	campo=line.split(';')
	ts_terminal = campo[1]
	mm = ts_terminal[5:7]
	dd = ts_terminal[8:10]
	hh = ts_terminal[11:13]
	t1=campo[4].strip()
	t2=campo[7].strip()
	if mm=='05' and dd=='04':
		if t1==t2:
			f2.write(str(line)+'\n')
	

print datetime.datetime.now()

#CERRAR ARCHIVOS.

f1.close()
f2.close()

		


