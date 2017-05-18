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

print "CPU Subsistema"

for line in fr.xreadlines():
	line = line.strip()
	listFromLine=line.split(',')
	fecha=str(listFromLine[0])
	f2.write(fecha+'|'+listFromLine[1]+'|'+listFromLine[2]+'|'+listFromLine[5]+'|'+listFromLine[6]+'|'+'16'+'|'+fecha[0:6]+'|'+'\"IBS Core\"'+'|'+listFromLine[3]+'|'+listFromLine[4]+'\n')
	cont=cont+1

print cont
fr.close()
f2.close() 

print datetime.datetime.now()