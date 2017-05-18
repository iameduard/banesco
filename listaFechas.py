import operator
import sys

fr=open("H:\BOD\EFT_RED_Mar15_May_13_15\EFT - RED Trafico Mar2015 - May_13-15.txt")
cont=0
listaBase=[]
#fr=open("header.txt")
for line in fr.xreadlines():
	line = line.strip()
	listFromLine=line.split(',')
	fecha=listFromLine[0][0:10]
	cont = cont + 1
	if cont > 1000 == 0: print cont , fecha
	if fecha not in listaBase:
		listaBase.append(fecha)	
listaBase.sort()
print listaBase
fr.close()
aF