#! /usr/bin/env python
import time
import sys
import datetime
import re



entrada=open("E:\SaludLanWan.txt" ,"r")
salida =open("E:\SaludLanWan2.txt","w")

#Obviar el titulo del archivo...

#le=entrada.readlines()

#leer los registros del archivo..
sep='\t' #separador
fact='000000'
i=1

for le in entrada.readlines():
	if i:
		le = le.strip()
		r=le.split("\t")
		ts=r[1].replace(" ","")
		yyyy=ts[0:4]+fact
		mm=ts[5:7]+fact
		dd=ts[8:10]+fact
		hh=ts[10:12]+fact
		salida.write(r[0].upper()+sep+yyyy+sep+mm+sep+dd+sep+hh+sep+r[2]+sep+r[3]+sep+r[4]+sep+r[5]+sep+r[6])
		if yyyy==2015 and mm==12:
			salida.write(r[0].upper()+sep+yyyy+sep+mm+sep+dd+sep+hh+sep+r[2]+sep+r[3]+sep+r[4]+sep+r[5]+sep+r[6])
	i=1

entrada.close()
salida.close()

########### FIN ###############
