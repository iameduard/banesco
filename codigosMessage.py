import operator
import sys
import datetime
import time
import os

archivo="H:\MetricaATM_POS\Tiempos de Respuesta ATM-POS Postilion AMEX Julio 2015\Tiempos de Respuesta ATM-POS Postilion AMEX Julio 2015.csv"

print archivo

f1=open(archivo)

lista=[]

for line in f1.xreadlines():
	line = line.strip()
	campo=line.split(';')
	if campo[3] not in lista:
		lista.append(campo[3])

print lista
f1.close()