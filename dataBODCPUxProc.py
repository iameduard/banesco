import operator
import datetime
import sys

print datetime.datetime.now()

dk0=sys.argv[2]
dk1=sys.argv[1]+"\\"+dk0

fr=open(dk1)
dk2=dk1.replace("csv","txt")
f2=open(dk2,"w")

cont=0

print "CPU x Procesador"
ll=""
cont=0

for line in fr.xreadlines():
	if cont>0:
		line = line.strip()
		listFromLine=line.split(',')
		fecha=str(listFromLine[0])
		ll=""
		for k in range(1,34):
			#print cont, listFromLine[k]
			ll=ll+listFromLine[k]+'|'
		f2.write(fecha+'|'+ll+"IBS CORE"+'\n')
	cont=cont+1

print cont
fr.close()
f2.close() 

print datetime.datetime.now()