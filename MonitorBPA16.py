#! /usr/bin/env python
#from __future__ import print_function
import time
import cx_Oracle
import sys
import datetime
import os


sconsola='log'+str(datetime.date.today())+'.txt'
#salida="salXXX.txt"
#if len(sys.argv)>1:

sys.stdout=open(sconsola,"w")


fdesin=open("desincorporados.txt","r")
fbase=open("base.csv","r")
fsal=open("tempMonitor.txt","w+")

ip = '10.132.207.157'
port = 1521
SID = 'capacidad'
dsn_tns = cx_Oracle.makedsn(ip, port, SID)
#USUARIO B.P.A
userBPA='visuser'
passBPA='visuser'

ind=1000

#CONEXION A BPA
db = cx_Oracle.connect(userBPA, passBPA, dsn_tns)
#try:
#	db = cx_Oracle.connect(userBPA, passBPA, dsn_tns)
#except cx_Oracle.DatabaseError as e:
#	error,=e.args
#	if error.code==101:
#		print "Por favor valide sus credenciales"
#	else:
#		print "Error de conexion con la Base de Datos"
#	exit() 

ind=ind+1
fsal.write("AAASALIDA"+str(ind)+"&&&"+"Fecha y hora actuales: "+time.ctime())
ind=ind+1
fsal.write("\n"+"AAASALIDA"+str(ind)+"&&&"+"########## ERRORES DE COLECCIONES POR SERVICIO Y SERVIDORES #####")

#Crear lista con relacion servidor/servicio..
diccionarioServidor=[]

for lbase in fbase.readlines():
	camposBase=lbase.split(";")
	#print camposBase[0],camposBase[1]
	diccionarioServidor.append([camposBase[0],camposBase[1]])

dic_servidores=dict(diccionarioServidor)


#Query que consulta en los servidores que estan COLECTANDO...


sql="SELECT * from (select trim(network_id) servicio, server from (select indexx,network_id,case when upper(trim(host_name)) is null then upper(trim(node_alias)) else upper(trim(host_name)) end server from caxnode) B inner join (select distinct systems from caxnoded where intvl in (select indexx from caxintvl where to_date(int_start_date,'yy/mm/dd')=to_date(to_char(sysdate-2,'dd/mm/yyyy'),'dd/mm/yyyy'))) A on B.indexx=A.systems where server not like 'ZZZ%' and network_id not in ('localhost') order by network_id,server) "

###################
curs=db.cursor()

try:
	curs.execute(sql)
except cx_Oracle.DatabaseError as e:
	error, =e.args
	print "Sql error"
	exit()

#LEER SERVIDORES DESINCORPORADOS...

desincorp=[]

for lined in fdesin.readlines():
	lined = lined.strip()
	desincorp.append(lined)

#print "Servidores desincorporados",desincorp

#raw_input("Pulsa una tecla para continuar...") 
#quit()
########## Lista vacia
listaColect=[]
listaColect0=[]
#Ultimo
dFiles={}
bufferSal=[]
#Ultimo
cont=0

codErrorSal="exit 0"


for row in curs:
	servicio, servidor=row
	#print row
	listaColect.append(servidor)

#Query que consulta en la BASE...

sql="SELECT  * from (select distinct trim(network_id) servicio,case when upper(trim(host_name)) is null then upper(trim(node_alias)) else upper(trim(host_name)) end server from caxnode) where server not like 'ZZZ%' and servicio not in ('localhost') and upper(servicio) not like 'REPRO%' order by 1"

###################
curs=db.cursor()

try:
	curs.execute(sql)
except cx_Oracle.DatabaseError as e:
	error, =e.args
	print "Sql error"
	exit()


servicio_old="#######"

#Buscar los servidores de la Base en el diccionario de los que estan colectando, si no aparece falto por colecta

cont=0
contN=0
contS=0
listaServicios=[]
listaServidores=[]


for row in curs:
	servicio, servidor=row
	#nuevo....
	if servidor[0:3]=="ROP": continue

	try:
		servicio=dic_servidores[servidor].replace('\n','').strip().upper()
	except KeyError as e:
		error, =e.args

	if servidor not in desincorp: #Excluye los servidores desincorporados.....
		if servidor not in listaServidores:
			listaServidores.append(servidor)
			if servidor not in listaColect:
				if servicio not in listaServicios:
					listaServicios.append(servicio)
					ind=ind+1
					dFiles.update({servicio:ind}) 
					lineaSal="\nAAZ"+servicio+str(dFiles[servicio])+"&&&"+"Del Servicio: "+str(servicio)+" "*(16-len(servicio))+" Esta colectando (SI/NO)?:"
					fsal.write(lineaSal)
					codErrorSal="exit 1"
				contN=contN+1
				lineaSal="\nAAZ"+servicio+str(dFiles[servicio]+1)+"&&&"+servidor+"."*(30-len(servidor))+"NO"
				fsal.write(lineaSal)
			else:
				if servicio not in listaServicios:
					listaServicios.append(servicio)
					ind=ind+1
					dFiles.update({servicio:ind}) 
					lineaSal="\nAAZ"+servicio+str(dFiles[servicio])+"&&&"+"Del Servicio: "+str(servicio)+" "*(16-len(servicio))+" Esta colectando (SI/NO)?:"
					fsal.write(lineaSal)
				contS=contS+1
				lineaSal="\nAAZ"+servicio+str(dFiles[servicio]+1)+"&&&"+servidor+"."*(30-len(servidor))+"SI"
				fsal.write(lineaSal)
	#else:
	#	print "Excluido",servidor

servicio="ZZZMETRICAS"

ind=ind+1
fsal.write("\nAAZ"+servicio+str(ind)+"&&&"+" ")
ind=ind+1
fsal.write("\nAAZ"+servicio+str(ind)+"&&&"+"Cantidad Total Servidores   :"+str(contS+contN))
ind=ind+1
fsal.write("\nAAZ"+servicio+str(ind)+"&&&"+" ")
ind=ind+1
fsal.write("\nAAZ"+servicio+str(ind)+"&&&"+"Cantidad Total Colectando   :"+str(contS))
ind=ind+1
fsal.write("\nAAZ"+servicio+str(ind)+"&&&"+" ")
ind=ind+1
fsal.write("\nAAZ"+servicio+str(ind)+"&&&"+"Cantidad Total NO Colectando:"+str(contN))
ind=ind+1
fsal.write("\nAAZ"+servicio+str(ind)+"&&&"+" ")
ind=ind+1
fsal.write("\nAAZ"+servicio+str(ind)+"&&&"+"Porcentaje No Colectando    :"+str(100*contN/(contS+contN))+"%")
ind=ind+1
fsal.write("\nAAZ"+servicio+str(ind)+"&&&"+" ")
#raw_input("Pulsa una tecla para continuar...") 

print "\n########## SALIDAS DEL MONITOR BPA #####\n"


sql="SELECT BASE.SERVIDOR SERVIDOR, CASE WHEN CPU_UTI IS NULL THEN 1 ELSE 0 END CPU_UTI, CASE WHEN MEM_UTI IS NULL THEN 1 ELSE 0 END MEM_UTI, CASE WHEN MEM_PAG IS NULL THEN 1 ELSE 0 END MEM_PAG, CASE WHEN DIS_ESP IS NULL THEN 1 ELSE 0 END DIS_ESP, CASE WHEN DIS_SRT IS NULL THEN 1 ELSE 0 END DIS_SRT, CASE WHEN CPU_UTI IS NULL THEN 1 ELSE 0 END + CASE WHEN MEM_UTI IS NULL THEN 1 ELSE 0 END + CASE WHEN MEM_PAG IS NULL THEN 1 ELSE 0 END + CASE WHEN DIS_ESP IS NULL THEN 1 ELSE 0 END + CASE WHEN DIS_SRT IS NULL THEN 1 ELSE 0 END MAX_ALT FROM (select SERVIDOR from (select distinct network_id servicio,case when upper(trim(host_name)) is null then upper(trim(node_alias)) else upper(trim(host_name)) end SERVIDOR from caxnode) where SERVIDOR not like 'ZZZ%' and servicio not in ('localhost') and upper(servicio) not like 'REPRO%') BASE LEFT OUTER JOIN (SELECT SERVIDOR, CASE WHEN COUNT(CPU_UTI)<24 THEN 1 ELSE 0 END CPU_UTI, CASE WHEN COUNT(MEM_UTI)<24 THEN 1 ELSE 0 END MEM_UTI, CASE WHEN COUNT(MEM_PAG)<24 THEN 1 ELSE 0 END MEM_PAG FROM (SELECT DISTINCT case when upper(trim(host_name)) is null then upper(trim(node_alias)) else upper(trim(host_name)) end SERVIDOR, CASE WHEN CPU_UTIL IS NOT NULL THEN EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI')) ELSE NULL END CPU_UTI, CASE WHEN MEM_UTIL IS NOT NULL THEN EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI')) ELSE NULL END MEM_UTI, CASE WHEN PAGE_RATE IS NOT NULL THEN EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI')) ELSE NULL END MEM_PAG FROM CAXNODED D INNER JOIN CAXNODE S ON D.SYSTEMS=S.INDEXX INNER JOIN CAXINTVL T ON D.INTVL=T.INDEXX WHERE to_date(int_start_date,'yy/mm/dd')=to_date(to_char(sysdate-2,'dd/mm/yyyy'),'dd/mm/yyyy') and int_duration=60 ) WHERE SERVIDOR NOT LIKE 'ZZZ%' GROUP BY SERVIDOR) A ON BASE.SERVIDOR=A.SERVIDOR LEFT OUTER JOIN (SELECT TRIM(SERVIDOR) SERVIDOR,CASE WHEN COUNT(DIS_ESP)<24 THEN 1 ELSE 0 END DIS_ESP FROM (SELECT DISTINCT UPPER(S.NODE_NAME) SERVIDOR, CASE WHEN FILE_SYS_UTIL IS NOT NULL THEN EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI')) ELSE NULL END DIS_ESP FROM CAXFILSD D INNER JOIN CAXFILSS S ON D.FILESYSS=S.INDEXX INNER JOIN CAXINTVL T ON D.INTVL=T.INDEXX WHERE to_date(int_start_date,'yy/mm/dd')=to_date(to_char(sysdate-2,'dd/mm/yyyy'),'dd/mm/yyyy') and int_duration=60 and UPPER(TRIM(FILE_SYS_NAME)) NOT LIKE 'ZZZ%' UNION ALL SELECT DISTINCT UPPER(S.COMPUTER_NAME) SERVIDOR, CASE WHEN T09FREE_SPACE IS NOT NULL THEN EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI')) ELSE NULL END DIS_ESP FROM CAXNODES S INNER JOIN CAXLVLDD M ON S.INDEXX=M.NODES INNER JOIN CAXDSKS D ON D.INDEXX=M.NTDISKS INNER JOIN CAXINTVL T ON M.INTVL=T.INDEXX WHERE to_date(int_start_date,'yy/mm/dd')=to_date(to_char(sysdate-2,'dd/mm/yyyy'),'dd/mm/yyyy') and int_duration=60 and UPPER(TRIM(D.LOGICAL_DISK)) NOT LIKE 'ZZZ%' ) WHERE SERVIDOR NOT LIKE 'ZZZ%' GROUP BY SERVIDOR) B ON BASE.SERVIDOR=B.SERVIDOR LEFT OUTER JOIN (SELECT TRIM(SERVIDOR) SERVIDOR,CASE WHEN COUNT(DIS_SRT)<24 THEN 1 ELSE 0 END DIS_SRT FROM (SELECT DISTINCT UPPER(S.NODE_ID) SERVIDOR, CASE WHEN DISK_SERVICE_TIME IS NOT NULL THEN EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI')) ELSE NULL END DIS_SRT FROM CAXDISKD D INNER JOIN CAXDISK S ON D.DISKS=S.INDEXX INNER JOIN CAXINTVL T ON D.INTVL=T.INDEXX WHERE to_date(int_start_date,'yy/mm/dd')=to_date(to_char(sysdate-2,'dd/mm/yyyy'),'dd/mm/yyyy') and int_duration=60 and UPPER(TRIM(DISK_ALIAS)) NOT LIKE 'ZZZ%'  ) WHERE SERVIDOR NOT LIKE 'ZZZ%' GROUP BY SERVIDOR) C ON BASE.SERVIDOR=C.SERVIDOR  ORDER BY MAX_ALT DESC,CPU_UTI DESC,MEM_UTI DESC,MEM_PAG DESC,DIS_ESP DESC,DIS_SRT DESC,SERVIDOR ASC "

###################
curs=db.cursor()

try:
	curs.execute(sql)
except cx_Oracle.DatabaseError as e:
	error, =e.args
	print ("Sql error")
	print ("exit 1")
	exit()

lineaSal2="\n"
bufferSal.append([lineaSal2])

for row in curs:
	serv, cpu_util, mem_util, mem_pag, dis_esp, dis_tr, max_alt = row
	if max_alt > 0:
		if serv[0:3]<>"ROP":
			error=" "
			if cpu_util==1:
				error=error+": "+"cput_util"
				codErrorSal="exit 1"
			if mem_util==1:
				error=error+": "+"mem_util"
				codErrorSal="exit 1"
			if mem_pag==1:
				error=error+": "+"mem_pag"
				codErrorSal="exit 1"
			if dis_esp==1:
				error=error+": "+"dis_esp"
				codErrorSal="exit 1"
			if dis_tr==1:
				error=error+": "+"dis_tr"
				codErrorSal="exit 1"
			ind=ind+1
			lineaSal2="\n"+servicio+str(ind)+"&&&"+serv+" "*(10-len(serv))+"#"+str(max_alt)+error
			fsal.write(lineaSal2)

####### ORDENAR ARCHIVO ##########

#fsal.close()
#fsal=open("tempMonitor.txt","r")
fsal.seek(0)
lista_definiciones=sorted(fsal)
#fsal.close()
file("tempMonitor.txt","w").writelines(lista_definiciones)
#fsal.close()
#fsal=open("tempMonitor.txt","r")
fsal.seek(0)
salida='monitor'+str(datetime.date.today())+'.txt'
fmonitor=open(salida,"w")
for lineaf in fsal.readlines():
	lineas=lineaf.split("&&&")
	fmonitor.write(lineas[1])

fdesin.close()
fbase.close()
fmonitor.close()
fsal.close()

###### ELIMINA ARCHIVO TEMPORAL #####3

try:
	os.remove("tempMonitor.txt")
except OSError as e:
	print "Archivo no encontrado:",e

###### CALCULO DE ESPACIO EN DISCO ########

sql2 = "SELECT  ts.tablespace_name, SUM(NVL(fs.bytes,0))/1024/1024 AS MB_FREE FROM user_free_space fs, user_tablespaces ts, user_users us WHERE   fs.tablespace_name(+)   = ts.tablespace_name AND ts.tablespace_name LIKE '%VIS%' GROUP BY   ts.tablespace_name " 

curs2=db.cursor()

try:
	curs2.execute(sql2)
except cx_Oracle.DatabaseError as e:
	error, =e.args
	print "Sql error"
	exit()

alarma_esp=lambda TS, N: "****** Alerta de Espacio ******* " if ((TS=="VISDB"and N<5000) or (TS=="VISDB_IDX"and N<4000)) else ""

for row in curs2:
	ts_name, mb_libres = row
	lineats="\nTablespace: "+ts_name+" espacio libre: "+str(mb_libres)+alarma_esp(ts_name.strip(), mb_libres)
	print lineats

####### CERRAR BASE DE DATOS #####

db.close()

print "\n"+"FIN"