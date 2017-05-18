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



#mensajes=['0200', '0100', '0120', '0220', '0520', '0420', '0600', '0620', '0320']  
print datetime.datetime.now()

#Inicializacion de Variables..

cont=1
cliente='&&&&&&&'
sw=0
msg="@@@@@@@"
linea0=""
linea1=""
contErr=0

#fr=open("header.txt")

f2.write('mm,dd,hh,nod1,nod2,codigo\n')

for line in f1.xreadlines():

	line = line.strip()
	campo=line.split(';')
	ts_terminal = campo[2]
	mm = ts_terminal[5:7]
	dd = ts_terminal[8:10]
	hh = ts_terminal[11:13]
	nodo_orig = campo[4]
	nodo_sink=campo[7]

	"""if nodo_sink =='Suaf-Sink' or nodo_sink =='SinkOP':
		nodo_sink='Bankbu'
	else:
		nodo_sink='AMEX'

	if nodo_orig =='Credicard-srP':
		nodo_orig='Credicard'
	else:
		nodo_sink='Otro'  """

	codISO=campo[9]
	linea0 = mm+','+dd+','+hh+','+ nodo_orig+','+nodo_sink+','+codISO
	f2.write(linea0+'\n')
	cont=cont+1

print "numero de registros procesados: "+str(cont)

print datetime.datetime.now()

#CERRAR ARCHIVOS.

f1.close()
f2.close()
#f3.close()
		


