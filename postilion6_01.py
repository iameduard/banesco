import operator
import sys
import datetime
import time

f1=open('H:\BOD\postilion\PostilionFlujoMensajesJun\PostilionFlujoMensajesJunio15.csv')
f2=open('H:\BOD\postilion\PostilionFlujoMensajesJun\PostilionFlujoMensajesJunio15.txt','w')
f3=open('H:\BOD\postilion\PostilionFlujoMensajesJun\errores.txt','w')
#f4=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\Archivo.txt','w')

mensajes=['0200', '0100', '0120', '0220', '0520', '0420', '0600', '0620', '0320']  
nodos1=['AtmApp', 'S7BSrc', 'MDSSrc', 'BODPosExt', 'BODPos', 'WebSrc', 'BODPosCNB', '\x00']
nodos2=['BODSinkATM', 'BODSinkS7B', 'BODSinkMDS', 'S7BSink', 'MDSSink', 'NIL', 'BODSinkPOS', 'BODAMEX', 'CCCSink', 'S7BAMEX', 'DigiSink', 'MoviSink', 'WebCCCSink', 'BODSinkCNB', 'BODSinkIHP'] 


print datetime.datetime.now()

#Inicializacion de Variables..

cont=1
cliente='&&&&&&&'
sw=0
msg="@@@@@@@"
linea1=""

#fr=open("header.txt")

f2.write('message,mm,dd,hh,nod1,nod2, nod1y2, ts4,ts1,ts2,ts3\n')

for line in f1.xreadlines():
	#f2.write(line.replace(",","."))
	line = line.strip()
	campo=line.split(';')
	message_type=campo[2]
	originate=campo[5]
	if message_type not in mensajes:
		continue
	if campo[3] not in nodos1:
		continue
	if campo[6] not in nodos2:
		continue

	if True:

		if cliente != campo[0]:
			
			if originate=='0':

				cliente	=campo[0]
				ts_terminal = campo[1]
				nodo_orig = campo[3]
				nodo_sink=campo[6]
				nodo_orig_sink = nodo_orig+'&'+nodo_sink
				msg=campo[2]
				t1=campo[4].strip()
				t2=campo[7].strip()
				mm = ts_terminal[5:7]
				dd = ts_terminal[8:10]
				hh = ts_terminal[11:13]


				try:
					d1 = datetime.datetime.strptime(t1, '%Y-%m-%d %H:%M:%S.%f')
					d2 = datetime.datetime.strptime(t2, '%Y-%m-%d %H:%M:%S.%f')
					dm1= time.mktime(d1.timetuple()) * 1000 + d1.microsecond / 1000
					dm2= time.mktime(d2.timetuple()) * 1000 + d2.microsecond / 1000
					tp4 = dm2 - dm1
					tp1 = ''
					tp2 = ''
					tp3 = ''
					linea1 = message_type+','+mm+','+dd+','+hh+','+ nodo_orig+','+nodo_sink+','+nodo_orig_sink+','+str(tp4)

				except:

					f3.write(str(cont)+': Timestamp invalido:'+cliente+'\n')			

		else:

			t3=campo[4].strip()
			t4=campo[7].strip()

			if cliente==campo[0]:
				if msg==campo[2] and originate=='1':
					if nodo_orig == campo[3] and nodo_sink == campo[6]:
						try:
							d3 = datetime.datetime.strptime(t3, '%Y-%m-%d %H:%M:%S.%f')
							d4 = datetime.datetime.strptime(t4, '%Y-%m-%d %H:%M:%S.%f')
							dm3= time.mktime(d3.timetuple()) * 1000 + d3.microsecond / 1000
							dm4= time.mktime(d4.timetuple()) * 1000 + d4.microsecond / 1000
							tp1 = dm3 - dm1
							tp2 = dm4 - dm3
							tp3 = dm2 - dm4
							linea1 = linea1+','+str(tp1)+','+str(tp2)+','+str(tp3)
						except:
							f3.write(str(cont)+': Timestamp invalido:'+cliente+'\n')	

			f2.write(linea1+'\n') #Graba el registro con los tiempos...
	
	#f4.write(line+'\n')		
	cont=cont+1
#	if cont > 100:
#		f1.close()
#		f2.close()
#		f3.close()
#		f4.close()
#		exit()

print "numero de registros procesados: "+str(cont)

print datetime.datetime.now()

#CERRAR ARCHIVOS.

f1.close()
f2.close()
f3.close()
		


