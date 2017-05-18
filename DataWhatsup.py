import operator
import sys

salto=3

if salto==0:
	#Latencia
	fr=open("4A.csv")
	c=";"
	for line in fr.xreadlines():
		line = line.strip()
		ll=line.split(',')
		try:
			print ll[0]+c+ll[1]+c+ll[2]+","+ll[3]+c+ll[4]+','+ll[5]
		except Exception, e:
			continue
elif salto==1:
	#CPU
	fr=open("3A.csv")
	c=";"
	for line in fr.xreadlines():
		line = line.strip()
		ll=line.split(',')
		try:
			print ll[0]+c+ll[1]+c+ll[2]+","+ll[3]+c+ll[4]+','+ll[5]
		except Exception, e:
			continue
elif salto==2:
	#Memoria
	fr=open("2A.csv")
	c=";"
	for line in fr.xreadlines():
		line = line.strip()
		ll=line.split(',')
		try:
			print ll[0]+c+ll[1]+c+ll[2]+","+ll[3]+c+ll[4]+','+ll[5]+c+ll[6]
		except Exception, e:
			continue
elif salto==3:
	#Trafico
	fr=open("1A.csv")
	c=";"
	for line in fr.xreadlines():
		line = line.strip()
		ll=line.split(',')
		try:
			print ll[0]+c+ll[1]+c+ll[2]+c+ll[3]+","+ll[4]+c+ll[5]+c+ll[6]+","+ll[7]+c+ll[8]+","+ll[9]+c+ll[10]+c+ll[11]
		except Exception, e:
			continue