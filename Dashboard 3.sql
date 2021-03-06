SELECT DISTINCT SERVIDOR FROM BOD_METRICAS2;

SELECT DISTINCT FECHAHORA,case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
SERVICIO,SERVIDOR,ENTIDAD, OBJETO
FROM BOD_METRICAS2 WHERE SERVIDOR='BODAPPS9'
ORDER BY YY,MM,DD;

SELECT DISTINCT ENTIDAD ,SUBSTR(FECHAHORA,6,2)||'/'||SUBSTR(FECHAHORA,9,2)||'/'||SUBSTR(FECHAHORA,3,2)||' '||SUBSTR(FECHAHORA,12,2)||':00' FROM BOD_METRICAS2 WHERE SERVIDOR='BODAPPS9' AND ENTIDAD='BODAPPS9.bod.com.ve';

SELECT DISTINCT ENTIDAD ,replace(trim(FECHAHORA),'  ',' ') FROM BOD_METRICAS2 WHERE SERVIDOR='BODAPPS9';

UPDATE bod_METRICAS2 SET FECHAHORA= replace(trim(FECHAHORA),'  ',' ') WHERE SERVIDOR='BODAPPS9' AND ENTIDAD='BODAPPS9.bod.com.ve';

SELECT 
SERVICIO,
SERVIDOR,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY PROCESSORQUEUELENGTH_AVG),2) P95_PROCESSORQUEUELENGTH_AVG,
ROUND(AVG(PROCESSORQUEUELENGTH_AVG),2) AVG_PROCESSORQUEUELENGTH_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY SYSTEMUPTIME_AVG),2) P95_SYSTEMUPTIME_AVG,
ROUND(AVG(SYSTEMUPTIME_AVG),2) AVG_SYSTEMUPTIME_AVG
FROM BOD_METRICAS
WHERE OBJETO='System'
GROUP BY
SERVICIO,
SERVIDOR,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end 
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end 
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end
;

UPDATE BOD_METRICAS SET FECHAHORA = REPLACE(FECHAHORA,'/ ','/16') WHERE 
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)END IN (0,1,2);


SELECT * FROM BOD_METRICAS 
WHERE case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)END IN (0,1,2);