import sys
import datetime

salida='sal'+str(datetime.date.today())+'.txt'

#if len(sys.argv)>1:

sys.stdout=open(salida,"w")


fi=open("entrada1.csv","r")
fo=open("salida1.csv","w")


encabezado=[]
encabezado=fi.readline().split(';')

for li in fi.readlines():
	lii = li.split(';')
	for k in range(1,60):
		#print k
		ll=encabezado[k]+";"+lii[0]+";"+lii[k]+"\n"
		print ll+"\n"
		fo.writelines(ll)

fi.close()
fo.close()
