SELECT 
UPPER(SERVICIO),
SERVIDOR,
OBJETO,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
COUNT(*)
FROM BOD_METRICAS_UNION
GROUP BY 
SERVICIO,
SERVIDOR,
OBJETO,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end
UNION

SELECT
CASE WHEN TRIM(CARGA) IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODBDAPPS8') THEN 'bac y lbtr' ELSE 'OTRO' END END END SERVICIO,
CARGA SERVIDOR,
'CPU' OBJETO,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end mm,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
COUNT(*)
FROM BOD_CPU
GROUP BY
CARGA,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end --,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end
UNION

SELECT
CASE WHEN TRIM(CARGA) IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODBDAPPS8') THEN 'bac y lbtr' ELSE 'OTRO' END END END SERVICIO,
CARGA SERVIDOR,
'DISCOS FISICOS' OBJETO,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end mm,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
COUNT(*)
FROM BOD_DFIS
GROUP BY
CARGA,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end --,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end
UNION

SELECT
CASE WHEN TRIM(CARGA) IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODBDAPPS8') THEN 'bac y lbtr' ELSE 'OTRO' END END END SERVICIO,
CARGA SERVIDOR,
'DISCOS LOGICOS' OBJETO,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end mm,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
COUNT(*)
FROM BOD_DLOG
GROUP BY
CARGA,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end --,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end
UNION

SELECT
CASE WHEN TRIM(CARGA) IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODBDAPPS8') THEN 'bac y lbtr' ELSE 'OTRO' END END END SERVICIO,
CARGA SERVIDOR,
'MEMORIA' OBJETO,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end mm,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
COUNT(*)
FROM BOD_MEM
GROUP BY
CARGA,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end --,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end
UNION

SELECT
CASE WHEN TRIM(CARGA) IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODBDAPPS8') THEN 'bac y lbtr' ELSE 'OTRO' END END END SERVICIO,
CARGA SERVIDOR,
'PROCESSOR' OBJETO,
case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,2,2) else substr(replace(WRITETIME,'/2016','/16'),7,2)  end yy,
case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,4,2) else substr(WRITETIME,1,2)  end mm,
--case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,6,2) else substr(WRITETIME,4,2)  end dd,
--case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,8,2) else substr(replace(WRITETIME,'/2016','/16'),10,2)  end hh ,
COUNT(*)
FROM BOD_PROC
GROUP BY
CARGA,
case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,2,2) else substr(replace(WRITETIME,'/2016','/16'),7,2)  end,
case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,4,2) else substr(WRITETIME,1,2)  end --,
--case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,6,2) else substr(WRITETIME,4,2)  end--,
--case when substr(WRITETIME,1,3)='116' then substr(WRITETIME,8,2) else substr(replace(WRITETIME,'/2016','/16'),10,2)  end
UNION

SELECT
CASE WHEN TRIM(CARGA) IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 
CASE WHEN TRIM(CARGA) IN ('BODBDAPPS8') THEN 'bac y lbtr' ELSE 'OTRO' END END END SERVICIO,
CARGA SERVIDOR,
'TELECOM' OBJETO,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end mm,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
COUNT(*)
FROM BOD_TELECOM
GROUP BY
CARGA,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end,
case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,4,2) else substr(RECORDING_TIME,1,2)  end --,
--case when substr(RECORDING_TIME,1,3)='116' then substr(RECORDING_TIME,6,2) else substr(RECORDING_TIME,4,2)  end--,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end
;
