import operator
import sys
import datetime
import time

print datetime.datetime.now()

f1=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\PostilionFlujoMensajes.csv')
f2=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\data01.txt','w')
f3=open('H:\BOD\postilion\PostilionFlujoMensajesMay-15-01\Salnodos.txt','w')

cont=1
#fr=open("header.txt")
nod1=[]
nod2=[]
message=[]

for line in f1.xreadlines():
	#f2.write(line.replace(",","."))
	line1=line.strip()
	campo=line.split(';')
	nodo_orig = campo[3]
	nodo_sink = campo[6]
	msg=campo[2]
	t1=campo[4].strip()
	t2=campo[7].strip()
	try:
		d1 = datetime.datetime.strptime(t1, '%Y-%m-%d %H:%M:%S.%f')
		d2 = datetime.datetime.strptime(t2, '%Y-%m-%d %H:%M:%S.%f')
		dm1= time.mktime(d1.timetuple()) * 1000 + d1.microsecond / 1000
		dm2= time.mktime(d2.timetuple()) * 1000 + d2.microsecond / 1000
		tp4 = dm2 - dm1
	except:
		f2.write('Nro Regitro: '+str(cont)+' timestamp ts1:'+t1+'; ts2:'+t2+'\n')	

	if nodo_orig not in nod1:
		nod1.append(nodo_orig)
	if nodo_sink not in nod2:
		nod2.append(nodo_sink)
	if msg not in message:
		message.append(msg)
	if tp4 > 60000:
		f2.write('Nro Regitro: '+str(cont)+' timestamp ts1:'+t1+'; ts2:'+t2+'\n')

	cont = cont + 1

f3.write('nodo 1'+ str(nod1))
f3.write('nodo 2'+ str(nod2))
f3.write('message'+ str(message))

print 'nodo 1'
print nod1
print 'nodo 2'
print nod2
print 'message'
print message

#print cont
f1.close()
f2.close()
f3.close()

print datetime.datetime.now()

