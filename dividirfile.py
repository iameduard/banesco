import operator
import sys
import datetime
import time
import os
import codecs
import unicodedata



#with codecs.open("G:/Reporte de Capacidad (Salud Red Wan _ Lan ).txt",encoding="utf-8") as f1:
#	f1.read()

f1=open("G:/Reporte de Capacidad (Salud Red Wan _ Lan ).txt")
fg0=open('G:/salida001.txt','w')
fg1=open('G:/salida002.txt','w')
fg2=open('G:/salida003.txt','w')
fg3=open('G:/salida004.txt','w')

f=(fg0,fg1,fg2,fg3)

#Inicializacion de Variables..

cont=1
k=0
s=""

for line in f1.xreadlines():
	line = line.strip()
	campo=line.split('\t')
	for i in (1,len(campo)):
		s=s+str(campo[i-1])
	if(cont>1000000):
		cont=1
		k=k+1
	s=s.encode('ascii','ignore')
	f[k].write(s+"\n")
	s=""
	cont=cont+1

f1.close()
fg0.close()
fg1.close()
fg2.close()
fg3.close()