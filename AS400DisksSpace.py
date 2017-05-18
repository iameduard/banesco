import operator

fr=open("G:\BOD\Ene 2015\AS400EthernetLine-IBS-Ene15.csv")
f2=open("G:\BOD\Ene 2015\AS400EthernetLine-IBS-Ene15.txt","w")
cont=0
horas=[]

print "AS400EthernetLine-IBS-Ene15"

for line in fr.xreadlines():
	line = line.strip()
	listFromLine=line.split(',')
	fecha=str(listFromLine[0])
	ss=""
	if cont>0:
		for i in range (0,6):
			ss=ss+listFromLine[i]+';'
		#f2.write(listFromLine[0]+';'+listFromLine[1]+';'+listFromLine[2]+';'+listFromLine[3]+';'+listFromLine[4]+';'+'16'+';'+listFromLine[0][0:6]+';'+'\"IBS Core\"'+';'+'\n')
		f2.write(ss+listFromLine[0][0:6]+';'+'\"IBS Core\"'+'\n')
	cont=cont+1
print cont
fr.close()
f2.close()