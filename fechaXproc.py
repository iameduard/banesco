import operator
#import Set

fr=open("G:\BOD\Feb 2015\AS400CPUtilXprc-IB-Feb15.csv")
f2=open("G:\BOD\Feb 2015\FECHASCPUtilXprc-IB-Feb15.txt","w")
cont=0
cont1=0
horas=[]

conj=set()

for line in fr.xreadlines():
	line = line.strip()
	listFromLine=line.split(',')
	fecha=str(listFromLine[0])
	for i in range (8,17):
		if listFromLine[i]=="0":
			f2.write(fecha[0:6]+'\n')
			conj.add(fecha[0:6])
			cont1=cont1+1
			break
print "AS400CPUtilXprc-IB-Feb15.csv **"
print conj
fr.close()
f2.close()