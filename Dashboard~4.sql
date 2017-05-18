select 
       CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
       CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE
       CASE WHEN CARGA IN ('BODBDAPPS8') THEN 'bac y lbtr' ELSE 'OTRO' END END END SERVICIO,
       CARGA,
       case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
       case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2)  end mm,
       --case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2)  end dd,
       --case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2)  end hh,
       LOGICAL_DISK_NAME,
       --PHYSICAL_DISK_NUMBER,
       TOTAL_SIZE,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PCT_USED),2) P95_PCT_USED,
       ROUND(AVG(PCT_USED),2) AS AV_PCT_USED,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY DISK_QUEUE_LENGTH_REQUESTS),2) P95_DISK_QUEUE_LENGTH_REQUESTS,
       ROUND(AVG(DISK_QUEUE_LENGTH_REQUESTS),2) AVG_DISK_QUEUE_LENGTH_REQUESTS,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PCT_DISK_TIME),2) P95_PCT_DISK_TIME,
       ROUND(AVG(PCT_DISK_TIME),2) AVG_PCT_DISK_TIME,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PCT_DISK_READ_TIME),2) P95_PCT_DISK_READ_TIME,
       ROUND(AVG(PCT_DISK_READ_TIME),2) AVG_PCT_DISK_READ_TIME,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PCT_DISK_WRITE_TIME),2) P95_PCT_DISK_WRITE_TIME,
       ROUND(AVG(PCT_DISK_WRITE_TIME),2) AVG_PCT_DISK_WRITE_TIME,
       ROUND(AVG(AVG_DISK_MS_BY_READ),2) AVG_DISK_MS_BY_READ
from BOD_DLOG
WHERE
--CARGA LIKE '%BODTRUNC%'--Selecciona la medicion de la hora.. AND
LOGICAL_DISK_NAME NOT IN '_Total'
group by 
CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE
CASE WHEN CARGA IN ('BODBDAPPS8') THEN 'bac y lbtr' ELSE 'OTRO' END END END,
CARGA,
case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2) end,
case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2) end ,
--case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2) end ,
--case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2) end,
LOGICAL_DISK_NAME,
--PHYSICAL_DISK_NUMBER,
TOTAL_SIZE
ORDER BY SERVICIO,CARGA,YY,MM;


SELECT DISTINCT 
CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE
CASE WHEN CARGA IN ('BODBDAPPS8') THEN 'bac y lbtr' ELSE 'OTRO' END END END SERVICIO, CARGA
FROM BOD_DLOG;