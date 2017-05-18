import operator
import datetime
import sys

print datetime.datetime.now()

dk0=sys.argv[2]
dk1=sys.argv[1]+"\\"+dk0

print dk1

fr=open(dk1)

dk2=dk1.replace("csv","txt")

print dk2

f2=open(dk2,"w")

cont=0

print "CPU Utilization"

for line in fr.xreadlines():
	if cont>0:
		line = line.strip()
		listFromLine=line.split(',')
		fecha=str(listFromLine[0])
		f2.write(fecha+'|'+listFromLine[1]+'|'+listFromLine[2]+'|'+listFromLine[3]+'|'+listFromLine[4]+'|'+'16'+'|'+fecha[0:6]+'|'+'IBS Core'+'\n')
	cont=cont+1

print cont
fr.close()
f2.close() 

print datetime.datetime.now()