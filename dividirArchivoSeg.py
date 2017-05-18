import operator
import sys
import datetime
import time
import os



#import streamio

#import os
#os.getcwd()
#os.chdir(default_path)

dir=sys.argv[1]

print dir+'\\'+sys.argv[2]

f1=open(dir+'\\'+sys.argv[2])
fg0=open(dir+'\\rppostilion001.txt','w')
fg1=open(dir+'\\rppostilion002.txt','w')
fg2=open(dir+'\\rppostilion003.txt','w')
fg3=open(dir+'\\rppostilion004.txt','w')
fg4=open(dir+'\\rppostilion005.txt','w')
fg5=open(dir+'\\rppostilion006.txt','w')
fg6=open(dir+'\\rppostilion007.txt','w')
fg7=open(dir+'\\rppostilion008.txt','w')
fg8=open(dir+'\\rppostilion009.txt','w')
fg9=open(dir+'\\rppostilion010.txt','w')
fg10=open(dir+'\\rppostilion011.txt','w')
fg11=open(dir+'\\rppostilion012.txt','w')
fg12=open(dir+'\\rppostilion013.txt','w')
fg13=open(dir+'\\rppostilion014.txt','w')
fg14=open(dir+'\\rppostilion015.txt','w')
fg15=open(dir+'\\rppostilion016.txt','w')
fg16=open(dir+'\\rppostilion017.txt','w')
fg17=open(dir+'\\rppostilion018.txt','w')
fg18=open(dir+'\\rppostilion019.txt','w')
fg19=open(dir+'\\rppostilion020.txt','w')
fg20=open(dir+'\\rppostilion.txt','w')

#f1=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\entrada.txt')
#f2=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\salidaw.txt','w')
##f3=open('H:\BOD\postilion\PostilionFlujoMensajesAbril15-03\e.txt','w')
#f4=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\Archivo.txt','w')

mensajes=['0200','0100','0420']  
nodos1=['AtmApp', 'S7BSrc', 'MDSSrc', 'BODPosExt', 'BODPos', 'WebSrc', 'BODPosCNB', '\x00']
nodos2=['BODSinkATM', 'BODSinkS7B', 'BODSinkMDS', 'S7BSink', 'MDSSink', 'NIL', 'BODSinkPOS', 'BODAMEX', 'CCCSink', 'S7BAMEX', 'DigiSink', 'MoviSink', 'WebCCCSink', 'BODSinkCNB', 'BODSinkIHP'] 


def cero(registro):
	fg0.write(registro)
def uno(registro):
	fg1.write(registro)
def dos(registro):
	fg2.write(registro)
def tres(registro):
	fg3.write(registro)
def cuatro(registro):
	fg4.write(registro)
def cinco(registro):
	fg5.write(registro)
def seis(registro):
	fg6.write(registro)
def siete(registro):
	fg7.write(registro)
def ocho(registro):
	fg8.write(registro)
def nueve(registro):
	fg9.write(registro)
def diez(registro):
	fg10.write(registro)
def once(registro):
	fg11.write(registro)
def doce(registro):
	fg12.write(registro)
def trece(registro):
	fg13.write(registro)
def catorce(registro):
	fg14.write(registro)
def quince(registro):
	fg15.write(registro)
def dieciseis(registro):
	fg16.write(registro)
def diecisiete(registro):
	fg17.write(registro)
def dieciocho(registro):
	fg18.write(registro)
def diecinueve(registro):
	fg19.write(registro)

#options={'AtmApp':AtmApp, 'S7BSrc':S7BSrc, 'MDSSrc':MDSSrc, 'BODPosExt':BODPosExt, 'BODPos':BODPos, 'WebSrc':WebSrc, 'BODPosCNB':BODPosCNB}
options={'00':cero,'01':uno,'02':dos,'03':tres,'04':cuatro,'05':cinco,'06':seis,'07':siete,'08':ocho,'09':nueve,'10':diez,'11':once,'12':doce,'13':trece,'14':catorce,'15':quince,'16':dieciseis,'17':diecisiete,'18':dieciocho,'19':diecinueve}

print datetime.datetime.now()

#Inicializacion de Variables..

cont=1

for line in f1.xreadlines():

	line = line.strip()
	campo=line.split(';')
	cliente	=campo[0]
	ts_terminal = campo[2]
	message_type=campo[3]
	nodo_orig = campo[4]
	t1=campo[5].strip()
	originate=campo[6]
	nodo_sink=campo[7]
	t2=campo[8].strip()
	registro=cliente+";"+message_type+";"+nodo_orig+";"+nodo_sink+";"+originate+";"+ts_terminal+";"+str(t1)+";"+str(t2)+'\n'
	#codigo=str(int(cliente[-2])%2)+cliente[-1]
	fg20.write(registro)
	#options[codigo](registro)
	cont=cont+1
	
print "numero de registros procesados: "+str(cont)

print datetime.datetime.now()

#CERRAR ARCHIVOS.

f1.close()
fg0.close()
fg1.close()
fg2.close()
fg3.close()
fg4.close()
fg5.close()
fg6.close()
fg7.close()
fg8.close()
fg9.close()
fg10.close()
fg11.close()
fg12.close()
fg13.close()
fg14.close()
fg15.close()
fg16.close()
fg17.close()
fg18.close()
fg19.close()
fg20.close()


#streamio.sort.mergesort("postilion007.txt", output="ordenado007.txt", key=None, maxitems=None, progress=True)
