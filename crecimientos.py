#! /usr/bin/env python
import time
import cx_Oracle
import sys

sys.stdout=open("200116.txt","a")

ip = '10.132.207.157'
port = 1521
SID = 'capacidad'
dsn_tns = cx_Oracle.makedsn(ip, port, SID)
#USUARIO B.P.A
userBPA='visuser'
passBPA='visuser'


#CONEXION A BPA

try:
	db = cx_Oracle.connect(userBPA, passBPA, dsn_tns)
except cx_Oracle.DatabaseError as e:
	error,=e.args
	if error.code==101:
		print "Por favor valide sus credenciales"
	else:
		print "Error de conexion con la Base de Datos"
	raw_input("Pulsa una tecla para continuar...") 
	exit() 

print "Fecha y hora actuales: ", time.ctime(),"\n"

print "DISCOS LOGICOS WINDOWS\n"

#Cluster Activo-Activo
#SUM(VAL) SPEC 

#Cluster Activo-Pasivo
#MAX(VAL) SPEC 

#Horario Diurno
#AND (EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI'))>=#Hora_ini
#AND EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI'))<#Hora_fin)

#Horario Nocturno
#AND (EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI'))>=#Hora_ini
#OR EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI'))<#Hora_fin)

#Exclusion fin de semana
#AND TO_CHAR((TO_TIMESTAMP(INT_START_DATE||' '||INT_START_TIME,'YY/MM/DD HH24MI')- #Hora_ini /24),'D') NOT IN ('1','7')

#Exclusion feriados
#AND TO_CHAR((TO_TIMESTAMP(INT_START_DATE||' '||INT_START_TIME,'YY/MM/DD HH24MI')- #Hora_ini /24),'yyyy/mm/dd') NOT IN (SELECT TO_CHAR(feriados,'yyyy/mm/dd') FROM
#	(SELECT fd-48 AS fe1,fd-47 AS fe2,fd-3 AS fe3,fd-2 AS fe4,TO_DATE(f1||'/1/1','yyyy/mm/dd') AS fe5,
#	TO_DATE(f1||'/5/1','yyyy/mm/dd') AS fe6,TO_DATE(f1||'/4/19','yyyy/mm/dd') AS fe7,
#	TO_DATE(f1||'/6/24','yyyy/mm/dd') AS fe8,TO_DATE(f1||'/7/5','yyyy/mm/dd') AS fe9,
#	TO_DATE(f1||'/7/24','yyyy/mm/dd') AS fe10,TO_DATE(f1||'/10/12','yyyy/mm/dd') AS fe11,
#	TO_DATE(f1||'/12/24','yyyy/mm/dd') AS fe12,TO_DATE(f1||'/12/25','yyyy/mm/dd') AS fe13,
#	TO_DATE(f1||'/12/31','yyyy/mm/dd') AS fe14 FROM 
#	(SELECT f1,TO_DATE(f1||'/'||FLOOR((f9+f12-7*f13+114)/31)||'/'||(MOD(f9+f12-7*f13+114,31)+1),'yyyy/mm/dd') AS fd FROM 
#	(SELECT f1,f9,f12,FLOOR((f2+11*f9+22*f12)/451) AS f13 FROM 
#	(SELECT f1,f2,f9,MOD(32+2*f6+2*f10-f9-f11,7) AS f12 FROM
#	(SELECT f1,f2,f6,MOD(19*f2+f3-f5-f8+15,30) AS f9,FLOOR(f4/4) AS f10,MOD(f4,4) AS f11 FROM 
#	(SELECT  f1,MOD(f1,19) AS f2,f3,MOD(f1,100) AS f4,f5,f6,f7,FLOOR((f3-f7+1)/3) AS f8 FROM 
#	(SELECT f1,FLOOR(f3/4) AS f5,MOD(f3,4) AS f6,FLOOR((f3+8)/25) AS f7,f3 FROM
#	(SELECT f1,FLOOR(f1/100) AS f3 FROM (SELECT EXTRACT(YEAR FROM SYSDATE)-1 AS f1 FROM dual UNION SELECT EXTRACT(YEAR FROM SYSDATE)-2 AS f1 FROM dual) F) Fa) Fb) Fc) Fd) Fe) Ff) FE) FDATE
#	UNPIVOT (feriados for fecha in (fe1 AS 1,fe2 AS 2,fe3 AS 3,fe4 AS 4, fe5 AS 5, fe6 AS 6, fe7 AS 7, fe8 AS 8, fe9 AS 9, fe10 AS 10, fe11 AS 11, fe12 AS 12, fe13 AS 13, fe14 AS 14)) FER)


sql="SELECT TO_CHAR(TS,'yyyy-mm') PERIODO,ROUND(AVG(SPEC),3) SPEC FROM " \
"(SELECT TO_TIMESTAMP(TO_CHAR(TS,'dd/mm/yyyy hh24')||':00','dd/mm/yyyy hh24:mi') TS, " \
"MAX(VAL) SPEC " \
" FROM " \
"SELECT SRV,TS,CASE WHEN SPEC_RATING>0 THEN CPU_UTIL/100*SPEC_RATING/NUM_OF_PROC ELSE CPU_UTIL/10000/NUM_OF_PROC END VAL FROM CAXNODED D INNER JOIN " \
"(SELECT INDEXX,UPPER(TRIM(HOST_NAME)) SRV,NUM_OF_PROC,SPEC_RATING FROM CAXNODE WHERE " \
"UPPER(TRIM(HOST_NAME)) IN " \
"('SNODE258','SNODE259')" \
") S ON D.SYSTEMS=S.INDEXX INNER JOIN " \
"(SELECT INDEXX, TO_TIMESTAMP(INT_START_DATE||' '||INT_START_TIME,'yy/mm/dd hh24mi') TS FROM CAXINTVL WHERE INT_DURATION=60 AND " \
"TO_DATE(INT_START_DATE,'yy/mm/dd') BETWEEN '01/12/'||(EXTRACT(YEAR FROM SYSDATE)-2) AND '31/12/'||(EXTRACT(YEAR FROM SYSDATE)-1) " \
" AND (EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI'))>=8 " \
" AND EXTRACT(HOUR FROM TO_TIMESTAMP(INT_START_TIME,'HH24MI'))<19) " \
" ) T ON D.INTVL=T.INDEXX) GROUP BY TO_TIMESTAMP(TO_CHAR(TS,'dd/mm/yyyy hh24')||':00','dd/mm/yyyy hh24:mi')) " \
" GROUP BY TO_CHAR(TS,'yyyy-mm') ORDER BY TO_CHAR(TS,'yyyy-mm') ;"

curs=db.cursor()

try:
	curs.execute(sql)
except cx_Oracle.DatabaseError as e:
	error, =e.args
	print "Sql error"
	raw_input("Pulsa una tecla para continuar...") 
	exit()


for row in curs:
	print row


########### FIN ###############