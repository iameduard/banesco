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



#f1=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\entrada.txt')
#f2=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\salidaw.txt','w')
#f3=open('H:\BOD\postilion\PostilionFlujoMensajesAbril15-02\e.txt','w')
#f4=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\Archivo.txt','w')

mensajes=['0200','0100','0420']  
nodos1=['AtmApp', 'S7BSrc', 'MDSSrc', 'BODPosExt', 'BODPos', 'WebSrc', 'BODPosCNB', '\x00']
nodos2=['BODSinkATM', 'BODSinkS7B', 'BODSinkMDS', 'S7BSink', 'MDSSink', 'NIL', 'BODSinkPOS', 'BODAMEX', 'CCCSink', 'S7BAMEX', 'DigiSink', 'MoviSink', 'WebCCCSink', 'BODSinkCNB', 'BODSinkIHP'] 


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

f2.write('message,mm,dd,hh,nod1,nod2,cantidad\n')

for line in f1.xreadlines():
	#f2.write(line.replace(",","."))
	line = line.strip()
	campo=line.split(';')
	ts_terminal=campo[2]
	message_type=campo[3]
	orig=campo[4]
	des=campo[7]
	mm = ts_terminal[5:7]
	dd = ts_terminal[8:10]
	hh = ts_terminal[11:13]
	linea0=mm+","+dd+","+hh+","+message_type+","+orig+","+des
	#print linea0
	f2.write(linea0+'\n')
	cont=cont+1

	if cont%1000000 == 0:
		print cont

print "numero de registros procesados: "+str(cont)

print datetime.datetime.now()

#CERRAR ARCHIVOS.

f1.close()
f2.close()

		


