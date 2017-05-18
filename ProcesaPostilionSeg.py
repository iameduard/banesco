import operator
import sys
import datetime
import time

dk0=sys.argv[2]
dk1=sys.argv[1]+"\\"+dk0

#os.chdir(sys.argv[1])

f1=open(sys.argv[1]+"\\"+dk0)
dk0="sal"+dk0
f2=open(sys.argv[1]+"\\"+dk0,'w')



print datetime.datetime.now()

#Inicializacion de Variables..

cont=1
linea0=""

#fr=open("header.txt")

f2.write('message,mm,dd,hh,min,seg,nod1,nod2\n')

for line in f1.xreadlines():
	#f2.write(line.replace(",","."))
	line = line.strip()
	campo=line.split(';')
	message_type=campo[3]
	ts_terminal = campo[5]
	nodo_orig = campo[4]
	nodo_sink=campo[7]
	mm = ts_terminal[5:7]
	dd = ts_terminal[8:10]
	hh = ts_terminal[11:13]
	minu = ts_terminal[14:16]
	seg = ts_terminal[17:19]
	linea0 = message_type+','+mm+','+dd+','+hh+','+ minu+','+seg+','+nodo_orig+','+nodo_sink
	f2.write(linea0+'\n')		
	cont=cont+1
	if cont%1000000 == 0:
		print cont

print "numero de registros procesados: "+str(cont)

print datetime.datetime.now()

#CERRAR ARCHIVOS.

f1.close()
f2.close()
#f3.close()
		


