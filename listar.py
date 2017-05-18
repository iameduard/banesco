import operator
import sys

f1=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\PostilionFlujoMensajes.csv')
#f2=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\sal090615.txt','w')
cont=0
#fr=open("header.txt")
fechas=[]

for line in f1.xreadlines():
	#f2.write(line.replace(",","."))
	line1=line.strip()
	line2=line1.split(';')
	if line2[0] not in fechas:
		fechas.append(line2[0])

print fechas

#print cont
#f2.close()
#fr.close()

