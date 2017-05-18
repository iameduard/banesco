import operator
import sys
import datetime
import time

f1=open('H:\BOD\postilion\PostilionFlujoMensajesJun\PostilionFlujoMensajesJunio15.csv')
f2=open('H:\BOD\postilion\PostilionFlujoMensajesJun\PostilionFlujoMensajesJunio15.txt','w')
#f1=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\entrada.txt')
#f2=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\salidaw.txt','w')
f3=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\e.txt','w')
f4=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\salNegativas.txt','w')
#f4=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\Archivo.txt','w')

mensajes=['0200', '0100', '0120', '0220', '0520', '0420', '0600', '0620', '0320']  
nodos1=['AtmApp', 'S7BSrc', 'MDSSrc', 'BODPosExt', 'BODPos', 'WebSrc', 'BODPosCNB', '\x00']
nodos2=['BODSinkATM', 'BODSinkS7B', 'BODSinkMDS', 'S7BSink', 'MDSSink', 'NIL', 'BODSinkPOS', 'BODAMEX', 'CCCSink', 'S7BAMEX', 'DigiSink', 'MoviSink', 'WebCCCSink', 'BODSinkCNB', 'BODSinkIHP'] 

h_mensajes={'0200':1, '0100':2, '0120':3, '0220':4, '0520':5, '0420':6, '0600':7, '0620':8, '0320':9}
h_nodos1={'AtmApp':1, 'S7BSrc':2, 'MDSSrc':3, 'BODPosExt':4, 'BODPos':5, 'WebSrc':6, 'BODPosCNB':7,'\x00':0}
h_nodos2={'BODSinkATM':1, 'BODSinkS7B':2, 'BODSinkMDS':3, 'S7BSink':4, 'MDSSink':5, 'NIL':0, 'BODSinkPOS':6, 'BODAMEX':7, 'CCCSink':8, 'S7BAMEX':9, 'DigiSink':10, 'MoviSink':11, 'WebCCCSink':12, 'BODSinkCNB':13, 'BODSinkIHP':14}


print datetime.datetime.now()

#Inicializacion de Variables..

cont=1
cliente='&&&&&&&'
sw=0
msg="@@@@@@@"
linea0=""
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

				if linea0!="":
					f2.write(linea0+'\n')

				cliente	=campo[0]
				ts_terminal = campo[1]
				try:
					nodo_orig = campo[3]
					h_nodo_orig=h_nodos1[nodo_orig]
				except:
					h_nodo_orig=99
				try:
					nodo_sink=campo[6]
					h_nodo_sink=h_nodos2[nodo_sink]
				except:
					h_nodo_sink=99

				#nodo_orig_sink = nodo_orig+'&'+nodo_sink
				h_nodo_orig_sink=str(h_nodo_orig*100+h_nodo_sink)

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
					linea0 = message_type+','+mm+','+dd+','+hh+','+ str(h_nodo_orig)+','+str(h_nodo_sink)+','+str(h_nodo_orig_sink)+','+str(tp4)
				except:
					f3.write(str(cont)+': Timestamp invalido:'+cliente+'\n')			
		else:

			linea1=""
			if msg==campo[2] and originate=='1':
				t3=campo[4].strip()
				t4=campo[7].strip()
				if nodo_orig == campo[3] and nodo_sink == campo[6]:
					try:
						d3 = datetime.datetime.strptime(t3, '%Y-%m-%d %H:%M:%S.%f')
						d4 = datetime.datetime.strptime(t4, '%Y-%m-%d %H:%M:%S.%f')
						dm3= time.mktime(d3.timetuple()) * 1000 + d3.microsecond / 1000
						dm4= time.mktime(d4.timetuple()) * 1000 + d4.microsecond / 1000
						tp1 = int(dm3 - dm1)
						tp2 = int(dm4 - dm3)
						tp3 = int(dm2 - dm4)
						linea1 = str(tp1)+','+str(tp2)+','+str(tp3)
					except:
						f3.write(str(cont)+': Timestamp invalido:'+cliente+'\n')	

			if linea0 !="":
				if linea1!="":
					if tp4 > 0:
						f2.write(linea0+','+linea1+'\n') #Graba el registro con los tiempos...
					else:
						f4.write(linea0+','+linea1+'\n')
				else:
					if tp4 > 0:
						f2.write(linea0+'\n')
					else:
						f4.write(linea0+'\n')
				linea0=""  
			
			cliente='&&&&&&&' 
	
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
		

