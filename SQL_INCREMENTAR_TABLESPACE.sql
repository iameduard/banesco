select 
substr(TIMESTAMP,3,2)  yy,
substr(TIMESTAMP,6,2)  mm,
--substr(TIMESTAMP,9,2)  dd,
--substr(TIMESTAMP,12,2) hh,
DS_SYSNM_DISPOSITIVO,
DS_SYSNM,
--SNETWORKADDRESS,
--DS_SUBOBJNAME,
ROUND(AVG(DURATION),2) AVG_DURATION,
--SIFPHYSADDRESS,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100*((8*BYTESIN/3600)/SPEEDIN)),4) P95_PCT_BYTESIN_BY_SPEEDIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100*((8*BYTESOUT/3600)/SPEEDOUT)),4) P95_PCT_BYTEOUT_BY_SPEEDOUT
from BOD_RED_TRAFICO_COMPENSACION
WHERE SPEEDIN+SPEEDOUT>0
GROUP BY
substr(TIMESTAMP,3,2),
substr(TIMESTAMP,6,2),
--substr(TIMESTAMP,9,2),
--substr(TIMESTAMP,12,2),
DS_SYSNM_DISPOSITIVO,
DS_SYSNM
;

SELECT * FROM BOD_RED_TRAFICO_COMPENSACION;

SELECT DISTINCT DS_SYSNM_DISPOSITIVO FROM BOD_RED_TRAFICO_COMPENSACION;

select file_name, file_id, relative_fno from dba_data_files;

ALTER TABLESPACE SYSTEM
    ADD DATAFILE 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\apex.dbf' SIZE 2048M
      AUTOEXTEND ON
      NEXT 1024K
      MAXSIZE 4096M;
      
Select t.tablespace_name "Tablespace", t.status "Estado",
ROUND(MAX(d.bytes)/1024/1024,2) "MB Tama�o",
ROUND((MAX(d.bytes)/1024/1024) -
(SUM(decode(f.bytes, NULL,0, f.bytes))/1024/1024),2) "MB Usados",
ROUND(SUM(decode(f.bytes, NULL,0, f.bytes))/1024/1024,2) "MB Libres",
t.pct_increase "% incremento",
SUBSTR(d.file_name,1,80) "Fichero de datos"
FROM DBA_FREE_SPACE f, DBA_DATA_FILES d, DBA_TABLESPACES t
WHERE t.tablespace_name = d.tablespace_name AND
f.tablespace_name(+) = d.tablespace_name 
AND f.file_id(+) = d.file_id GROUP BY t.tablespace_name,
d.file_name, t.pct_increase, t.status ORDER BY 1,3 DESC;

SELECT COUNT(*) FROM BOD_RED_TRAFICO_COMPENSACION;

SELECT * FROM BOD_RED_CPU_COMPENSACION;


SELECT 
substr(TIMESTAMP,9,2)  yy,
substr(TIMESTAMP,4,2)  mm,
--substr(TIMESTAMP,1,2)  dd,
--REPLACE(substr(TIMESTAMP,12,2),':','') hh,
DS_SYSNM,
ROUND(AVG(DURATION),2) AVG_DURATION,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CPU_UTIL),4) P95_CPU_UTIL
FROM BOD_RED_CPU_COMPENSACION
GROUP BY
substr(TIMESTAMP,9,2),
substr(TIMESTAMP,4,2),
--substr(TIMESTAMP,1,2),
--REPLACE(substr(TIMESTAMP,12,2),':',''),
DS_SYSNM
;

SELECT
substr(TIMESTAMP,3,2)  yy,
substr(TIMESTAMP,6,2)  mm,
--substr(TIMESTAMP,9,2)  dd,
--substr(TIMESTAMP,12,2) hh,
DS_SYSNM,
ROUND(AVG(DURATION),2) AVG_DURATION,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY RESPONSE_TIME),4) P95_RESPONSE_TIME
FROM BOD_RED_LATENCIA_COMPENSACION
GROUP BY
substr(TIMESTAMP,3,2),
substr(TIMESTAMP,6,2),
--substr(TIMESTAMP,9,2),
--substr(TIMESTAMP,12,2),
DS_SYSNM;

SELECT 
substr(TIMESTAMP,3,2)  yy,
substr(TIMESTAMP,6,2)  mm,
--substr(TIMESTAMP,9,2)  dd,
--substr(TIMESTAMP,12,2) hh,
DS_SYSNM,
STYPE,
ROUND(AVG(DURATION),0) AVG_DURATION,
ROUND(AVG(MEM_UTIL),0) AVG_MEM_UTIL,
ROUND(AVG(NSIZE),2) AVG_NSIZE,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100*MEM_UTIL/NSIZE),4) P95_PCT_MEM_UTIL
FROM BOD_RED_MEMORIA_COMPENSACION
GROUP BY
substr(TIMESTAMP,3,2)  ,
substr(TIMESTAMP,6,2)  ,
--substr(TIMESTAMP,9,2)  ,
--substr(TIMESTAMP,12,2) ,
DS_SYSNM,
STYPE
;