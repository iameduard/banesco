SELECT COUNT(*) FROM BOD_DLOG;

     
select processor,
      PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY pct_processor_time) P95 from bod_cpu group by processor;

select distinct substr(replace(RECORDING_TIME,'/2016','/16'),7,2) as yy,
       substr(recording_time,1,2) as mm ,
       substr(recording_time,4,2) as dd ,
       substr(recording_time,10,2) as hh
from bod_cpu;


select cast(recording_time as timestamp) from bod_cpu;

select distinct extract(year from cast(recording_time as timestamp)) from bod_cpu;

SELECT 
       CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
       CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END
       END SERVICIO,
       CARGA,
       case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
       case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2)  end mm,
       case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2)  end dd,
       --case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2)  end hh,
       processor,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY pct_processor_time),2) P95_PCT_PROCESSOR_TIME,
       ROUND(AVG(pct_processor_time),2) AVG_PCT_PROCESSOR_TIME,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY pct_user_time),2) P95_PCT_USER_TIME,
       ROUND(AVG(pct_user_time),2) AVG_PCT_USER_TIME
from bod_cpu
where substr(recording_time,13,2)='00' AND PROCESSOR='_Total' AND RECORDING_TIME IS NOT NULL--Selecciona la medicion de la hora..
group by 
CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END END,
CARGA,
case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2) end,
case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2) end ,
case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2) end ,
--case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2) end,
processor
ORDER BY YY,MM;


select 
       CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
       CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END
       END SERVICIO,
       CARGA,
       case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
       case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2)  end mm,
       --case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2)  end dd,
       --case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2)  end hh,
       --server_name,
       TOTAL_MEMORY_SIZE_MB,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY memory_usage_pct),2) P95_MEMORY_USAGE_PCT,
       ROUND(AVG(memory_usage_pct),2) AVG_MEMORY_USAGE_PCT
from bod_mem
where substr(recording_time,13,2)='00' --Selecciona la medicion de la hora..
group by 
CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END END,
CARGA,
case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2) end,
case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2) end ,
--case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2) end ,
--case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2) end,
--server_name,
TOTAL_MEMORY_SIZE_MB
ORDER BY SERVICIO,CARGA,YY,MM;

select 
       CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
       CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END
       END SERVICIO,
       CARGA,
       case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
       case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2)  end mm,
       case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2)  end dd,
       case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2)  end hh,
       server_name,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PAGE_READS_BY_SEC),2) P95_PAGE_READS_BY_SEC,
       ROUND(AVG(PAGE_READS_BY_SEC),2) AVG_PAGE_READS_BY_SEC,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PAGE_WRITES_BY_SEC),2) P95_PAGE_WRITES_BY_SEC,
       ROUND(AVG(PAGE_WRITES_BY_SEC),2) AVG_PAGE_WRITES_BY_SEC,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PAGES_INPUT_BY_SEC),2) P95_PAGES_INPUT_BY_SEC,
       ROUND(AVG(PAGES_INPUT_BY_SEC),2) AVG_PAGES_INPUT_BY_SEC,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PAGES_OUTPUT_BY_SEC),2) P95_PAGES_OUTPUT_BY_SEC,
       ROUND(AVG(PAGES_OUTPUT_BY_SEC),2) AVG_PAGES_OUTPUT_BY_SEC,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PAGES_BY_SEC),2) P95_PAGES_BY_SEC,
       ROUND(AVG(PAGES_BY_SEC),2) AVG_PAGES_BY_SEC
from BOD_MEMO_PAGE
where substr(recording_time,13,2)='00' --Selecciona la medicion de la hora..
group by 
CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END END,
CARGA,
case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2) end,
case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2) end ,
case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2) end ,
case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2) end,
server_name
ORDER BY SERVICIO,CARGA,YY,MM;

select recording_time from bod_cpu where substr(recording_time,1,3)='116';

select 
       CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
       CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END
       END SERVICIO,
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
where substr(recording_time,13,2)='00' --Selecciona la medicion de la hora..
AND   LOGICAL_DISK_NAME NOT IN '_Total'
group by 
CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END END,
CARGA,
case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2) end,
case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2) end ,
--case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2) end ,
--case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2) end,
LOGICAL_DISK_NAME,
--PHYSICAL_DISK_NUMBER,
TOTAL_SIZE
ORDER BY SERVICIO,CARGA,YY,MM;



select 
       CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
       CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END
       END SERVICIO,
       CARGA,
       case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
       case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2)  end mm,
       --case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2)  end dd,
       --case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2)  end hh,
       PHYSICAL_DISK_NAME,
       --DISK_NUMBER,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY DISK_QUEUE_LENGTH),2) P95_DISK_QUEUE_LENGTH,
       ROUND(AVG(DISK_QUEUE_LENGTH),2) AVG_DISK_QUEUE_LENGTH,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PCT_DISK_READ_TIME),2) P95_PCT_DISK_READ_TIME,
       ROUND(AVG(PCT_DISK_READ_TIME),2) AVG_PCT_DISK_READ_TIME,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PCT_DISK_WRITE_TIME),2) P95_PCT_DISK_WRITE_TIME,
       ROUND(AVG(PCT_DISK_WRITE_TIME),2) AVG_PCT_DISK_WRITE_TIME,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PCT_DISK_IDLE_TIME),2) P95_PCT_DISK_IDLE_TIME,
       ROUND(AVG(PCT_DISK_IDLE_TIME),2) AVG_PCT_DISK_IDLE_TIME,
       ROUND(AVG(AVG_DISK_MS_BY_TRANSFER),2) AVG_DISK_MS_BY_TRANSFER
from BOD_DFIS
group by
CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END END,
CARGA,
case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2) end,
case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2) end ,
--case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2) end ,
--case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2) end,
PHYSICAL_DISK_NAME
--DISK_NUMBER
ORDER BY SERVICIO,CARGA,YY,MM;

SELECT DISTINCT SUBSTR(replace(RECORDING_TIME,'/2016','/16'),7,2) YY FROM BOD_DFIS;

SELECT * FROM BOD_DFIS WHERE substr(recording_time,7,2) ='20';

SELECT * FROM BOD_DFIS WHERE substr(recording_time,7,2) ='16';

select 
       CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
       CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END
       END SERVICIO,
       --CARGA,
       REPLACE(REPLACE(SERVER_NAME,'Primary:',''),':NT'),
       case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,2,2) else substr(replace(WRITETIME,'/2016','/16'),7,2)  end yy,
       case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,4,2) else substr(WRITETIME,1,2)  end mm,
       --case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,6,2) else substr(WRITETIME,4,2)  end dd,
       --case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,8,2) else substr(replace(WRITETIME,'/2016','/16'),10,2)  end hh,
       PROCESS_NAME,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PCT_PROCESSOR_TIME),2) P95_PCT_PROCESSOR_TIME,
       ROUND(AVG(PCT_PROCESSOR_TIME),2) AVG_PCT_PROCESSOR_TIME
from BOD_PROC where PCT_PROCESSOR_TIME <=100
group by 
CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END END,
--CARGA,
REPLACE(REPLACE(SERVER_NAME,'Primary:',''),':NT'),
case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,2,2) else substr(replace(WRITETIME,'/2016','/16'),7,2) end,
case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,4,2) else substr(WRITETIME,1,2) end ,
--case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,6,2) else substr(WRITETIME,4,2) end ,
--case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,8,2) else substr(replace(WRITETIME,'/2016','/16'),10,2) end,
PROCESS_NAME
ORDER BY SERVICIO,YY,MM;

delete from bod_proc where PCT_PROCESSOR_TIME > 10000;

select 
       CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
       CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END
       END SERVICIO,
       CARGA,
       case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
       case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end mm,
       --case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end dd,
       --case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2)  end hh,
       NETWORK_INTERFACE_INSTANCE,
       CURRENT_BANDWIDTH,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY BANDWIDTH_UTILIZ_PCT),2) P95_BANDWIDTH_UTILIZ_PCT,
       ROUND(AVG(BANDWIDTH_UTILIZ_PCT),2) AS AVG_BANDWIDTH_UTILIZ_PCT,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY BYTES_TOTAL_SEC),2) P95_BYTES_TOTAL_SEC,
       ROUND(AVG(BYTES_TOTAL_SEC),2) AVG_BYTES_TOTAL_SEC
from BOD_TELECOM
group by 
CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END END,
CARGA,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2) end,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2) end ,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2) end ,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2) end,
NETWORK_INTERFACE_INSTANCE,
CURRENT_BANDWIDTH
ORDER BY SERVICIO,YY,MM;

UPDATE BOD_TELECOM SET CARGA=REPLACE(CARGA,'.xlsx',''); 

SELECT COUNT(*) FROM BOD_TELECOM;

SELECT DISTINCT CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END
END SERVICIO, CARGA FROM BOD_CPU ORDER BY 1;

SELECT * FROM BOD_METRICAS;

SELECT 
SERVICIO,
SERVIDOR,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PROCESSORTIME_PCT_AVG),2) P95_PROCESSORTIME_PCT_AVG,
ROUND(AVG(PROCESSORTIME_PCT_AVG),2) APROCESSORTIME_PCT_AVG,
null P95_PCT_USER_TIME,
null AVG_PCT_USER_TIME
FROM BOD_METRICAS3
WHERE OBJETO='Processor'
GROUP BY
SERVICIO,
SERVIDOR,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end ,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end
;


SELECT 
SERVICIO,
SERVIDOR,
ENTIDAD,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PROCESSORQUEUELENGTH_AVG),2) P95_PROCESSORQUEUELENGTH_AVG,
ROUND(AVG(PROCESSORQUEUELENGTH_AVG),2) AVG_PROCESSORQUEUELENGTH_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY SYSTEMUPTIME_AVG),2) P95_SYSTEMUPTIME_AVG,
ROUND(AVG(SYSTEMUPTIME_AVG),2) AVG_SYSTEMUPTIME_AVG
FROM BOD_METRICAS3
WHERE OBJETO='System'
GROUP BY
SERVICIO,
SERVIDOR,
ENTIDAD,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end 
--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end 
--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end
;

SELECT 
SERVICIO,
SERVIDOR,
ENTIDAD,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PCTBANDWIDTHUSEDTOTAL_PCT_AVG),2) P95_PCTBANDWIDTHUSEDTOTAL,
ROUND(AVG(PCTBANDWIDTHUSEDTOTAL_PCT_AVG),2) AVG_PCTBANDWIDTHUSEDTOTAL
FROM BOD_METRICAS3
WHERE OBJETO='Network Adapter' 
GROUP BY
SERVICIO,
SERVIDOR,
ENTIDAD,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end 
--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end
;


SELECT 
SERVICIO,
SERVIDOR,
ENTIDAD,
--INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PAGES_SEC_AVG),2) P95_PAGES_SEC_AVG,
ROUND(AVG(PAGES_SEC_AVG),2) AVG_PAGES_SEC_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY MEMORYUSED_PCT_AVG),2) P95_MEMORYUSED_PCT_AVG,
ROUND(AVG(MEMORYUSED_PCT_AVG),2) AV_MEMORYUSED_PCT_AVG
FROM BOD_METRICAS3
WHERE OBJETO='Memory' 
GROUP BY
SERVICIO,
SERVIDOR,
ENTIDAD,
--INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end  --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end
;


SELECT 
SERVICIO,
SERVIDOR,
ENTIDAD,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PROCESSORTIME_PCT_AVG),2) P95_PROCESSORTIME_PCT_AVG,
ROUND(AVG(PROCESSORTIME_PCT_AVG),2) AVG_PROCESSORTIME_PCT_AVG
FROM BOD_METRICAS3
WHERE OBJETO='Processor Information'
GROUP BY
SERVICIO,
SERVIDOR,
ENTIDAD,
--INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end ,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end
;


SELECT 
SERVICIO,
SERVIDOR,
ENTIDAD,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_AVG),2) P95_IDLETIME_PCT_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_MINIMO),2) P95_IDLETIME_PCT_MINIMO,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_MAXIMO),2) P95_IDLETIME_PCT_MAXIMO,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_AVG),2) P95_AVGDISKSECTRANSFER_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_MINIMO),2) P95_AVGDISKSECTRANSFER_MINIMO,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_AVG),2) P95_CURRENTDISKQUEUELENGTH_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_MINIMO),2) P95_CURRENTDISKQUEUELENGTH_MINIMO,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_MAXIMO),2) P95_CURRENTDISKQUEUELENGTH_MAXIMO,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY FREESPACE_PCT_AVG),2) P95_FREESPACE_PCT_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY FREESPACE_PCT_MINIMO),2) P95_FREESPACE_PCT_MINIMO,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY FREESPACE_PCT_MAXIMO),2) P95_FREESPACE_PCT_MAXIMO
FROM BOD_METRICAS3
WHERE OBJETO='LogicalDisk'
GROUP BY
SERVICIO,
SERVIDOR,
ENTIDAD,
--INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end ,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end
;


SELECT 
OBJETO,
DS_SYSNM,
DS_SUSNM_DISPOSITIVO,
ID_DEVICE,
SNETWORK_ADDRESS,
DS_SUBOBJNAME,
SLFPHYSADDRESS,
case when substr(TS,1,3)='116' then substr(TS,2,2) else substr(replace(TS,'/2016','/16'),7,2)  end yy,
case when substr(TS,1,3)='116' then substr(TS,4,2) else substr(TS,1,2)  end mm,
--case when substr(TS,1,3)='116' then substr(TS,6,2) else substr(TS,4,2)  end dd,
--case when substr(TS,1,3)='116' then substr(TS,8,2) else substr(replace(TS,'/2016','/16'),10,2)  end hh,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY BYTEIN),2) P95_BYTEIN,
ROUND(AVG(BYTEIN),2) AVG_BYTEIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY BYTEOUT),2) P95_BYTEOUT,
ROUND(AVG(BYTEOUT),2) AVG_BYTEOUT,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY SPEEDEIN),2) P95_SPEEDEIN,
ROUND(AVG(SPEEDEIN),2) AVG_SPEEDEIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY SPEEDOUT),2) P95_SPEEDOUT,
ROUND(AVG(SPEEDOUT),2) AVG_SPEEDOUT,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CASE WHEN SPEEDOUT > 0 THEN BYTEOUT/SPEEDOUT ELSE NULL END),6)*100 PCT_P95_UTIL_CANAL_OUT,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CASE WHEN SPEEDEIN > 0 THEN BYTEIN/SPEEDEIN ELSE NULL END),6)*100 PCT_P95_UTIL_CANAL_IN
FROM BOD_COMPE_MET
WHERE OBJETO IN ('TRAFICO')
GROUP BY
OBJETO,
DS_SYSNM,
DS_SUSNM_DISPOSITIVO,
ID_DEVICE,
SNETWORK_ADDRESS,
DS_SUBOBJNAME,
SLFPHYSADDRESS,
case when substr(TS,1,3)='116' then substr(TS,2,2) else substr(replace(TS,'/2016','/16'),7,2)  end,
case when substr(TS,1,3)='116' then substr(TS,4,2) else substr(TS,1,2)  end 
--,
--case when substr(TS,1,3)='116' then substr(TS,6,2) else substr(TS,4,2)  end 
--,
--case when substr(TS,1,3)='116' then substr(TS,8,2) else substr(replace(TS,'/2016','/16'),10,2)  end 
ORDER BY YY,MM
--,DD
--,HH
;