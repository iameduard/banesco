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

mensajes=['091']  
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

f2.write('message,mm,dd,hh,nod1,nod2,ts4,ts1,ts2,ts3\n')

for line in f1.xreadlines():
	#f2.write(line.replace(",","."))
	line = line.strip()
	campo=line.split(';')
	message_type=campo[1]
	originate=campo[4]

	#if message_type not in mensajes:
	#	continue
	#if campo[2] not in nodos1:
	#	continue
	#if campo[3] not in nodos2:
	#	continue
	ts_terminal = campo[5]

	if True:

		if cliente != campo[0]:
			
			if originate=='0':

				if linea0!="":
					f2.write(linea0+'\n')

				cliente	=campo[0]
				ts_terminal = campo[5]
				nodo_orig = campo[2]
				nodo_sink=campo[3]
				nodo_orig_sink = nodo_orig+'&'+nodo_sink
				msg=campo[1]
				t1=campo[6].strip()
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
					linea0 = message_type+','+mm+','+dd+','+hh+','+ nodo_orig+','+nodo_sink+','+str(tp4)
				except:
					contErr=contErr+1		
		else:

			linea1=""
			if msg==campo[1] and originate=='1':
				t3=campo[6].strip()
				t4=campo[7].strip()
				if nodo_orig == campo[2] and nodo_sink == campo[3]:
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
						contErr=contErr+1	

			if linea0 !="":
				if linea1!="":
					f2.write(linea0+','+linea1+'\n') #Graba el registro con los tiempos...
				else:
					f2.write(linea0+",,,"+'\n')
				linea0=""  
			
			cliente='&&&&&&&' 
	
	#f4.write(line+'\n')		
	cont=cont+1
	if cont%1000000 == 0:
		print cont

print "numero de registros procesados: "+str(cont)

print datetime.datetime.now()

#CERRAR ARCHIVOS.

f1.close()
f2.close()
#f3.close()
		


