#import os
#os.system('cls')

import cx_Oracle
fw=open("tablasBCO.txt","w")
ip = '10.124.6.68'
port = 1521
SID = 'capacidad'
dsn_tns = cx_Oracle.makedsn(ip, port, SID)
#USUARIO B.C.O
userBCO='cpit_own'
passBCO='capacidad'
#USUARIO B.P.A
userBPA='visuser'
passBPA='visuser'

####################

#CONEXION A BCO
db = cx_Oracle.connect(userBPA, passBPA, dsn_tns)

#CONEXION A BPA
#db = cx_Oracle.connect(userBCA, passBCA, dsn_tns)

#Query que consulta en los servidores que estan colectando...

sql="SELECT * from (select trim(network_id) servicio, server from (select indexx,network_id,case when upper(trim(host_name)) is null then upper(trim(node_alias)) else upper(trim(host_name)) end server from caxnode) B inner join (select distinct systems from caxnoded where intvl in (select indexx from caxintvl where to_date(int_start_date,'yy/mm/dd')=to_date(to_char(sysdate-2,'dd/mm/yyyy'),'dd/mm/yyyy'))) A on B.indexx=A.systems where server not like 'ZZZ%' and network_id not in ('localhost') order by network_id,server) "

###################
curs=db.cursor()
curs.execute(sql)
print curs.description
########## Lista vacia
listaColect=[]
listaColect0=[]
cont=0

for row in curs:
	servicio, servidor=row
	#print row

	if cont==0:
		cont=1
		servicio_old=servicio
	if servicio_old == servicio:
		listaColect.append(servidor)
		#print listaColect
	else:
		listaColect0.append([servicio_old,listaColect])
		#print listaColect0
		servicio_old=servicio
		listaColect=[]
		listaColect.append(servidor)

dic_colect=dict(listaColect0)
#print "\n"*10
#print dic_colect

#Query que consulta en la Base...

sql="SELECT  * from (select distinct trim(network_id) servicio,case when upper(trim(host_name)) is null then upper(trim(node_alias)) else upper(trim(host_name)) end server from caxnode) where server not like 'ZZZ%' and servicio not in ('localhost') and upper(servicio) not like 'REPRO%' order by 1"

###################
curs=db.cursor()
curs.execute(sql)
#print curs.description
########## Lista vacia
listaBase=[]
listaBase0=[]
contB=0

#Buscar los servidores de la Base en el diccionario de los que estan colectando, si no aparece falto por colecta

cont=0

for row in curs:
	servicio, servidor=row
	if servicio in dic_colect:
		lista=dic_colect[servicio]
		if servidor not in lista:
			if servicio <>servicio_old:
				print "\nDel Servicio: "+str(servicio)+" "*(20-len(servicio))+" Faltaron colectar los servidores:"
				servicio_old=servicio
			print servidor

####### CERRAR BASE DE DATOS #####
db.close()
fw.close()
