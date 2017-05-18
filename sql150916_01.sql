SELECT 
SERVICIO,
SERVIDOR,
ENTIDAD,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_AVG),2) P95_IDLETIME_PCT_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_MINIMO),2) P95_IDLETIME_PCT_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_MAXIMO),2) P95_IDLETIME_PCT_MAX,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_AVG),2) P95_AVGDISKSECTRANSFER,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_MINIMO),2) P95_AVGDISKSECTRANSFER_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_MAXIMO),2) P95_AVGDISKSECTRANSFER_MAX,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_AVG),2) P95_CURRENTDISKQUEUELENGTH,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_MINIMO),2) P95_CURRENTDISKQUEUELENGTH_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_MAXIMO),2) P95_CURRENTDISKQUEUELENGTH_MAX,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100-FREESPACE_PCT_AVG),2) P95_PCT_USED,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100-FREESPACE_PCT_MINIMO),2) P95_PCT_USED_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100-FREESPACE_PCT_MAXIMO),2) P95_PCT_USED_MAX
FROM BOD_METRICAS
WHERE OBJETO LIKE '%Disk%'
GROUP BY
SERVICIO,
SERVIDOR,
ENTIDAD,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end

UNION

SELECT 
SERVICIO,
SERVIDOR,
ENTIDAD,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_AVG),2) P95_IDLETIME_PCT_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_MINIMO),2) P95_IDLETIME_PCT_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_MAXIMO),2) P95_IDLETIME_PCT_MAX,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_AVG),2) P95_AVGDISKSECTRANSFER,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_MINIMO),2) P95_AVGDISKSECTRANSFER_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_MAXIMO),2) P95_AVGDISKSECTRANSFER_MAX,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_AVG),2) P95_CURRENTDISKQUEUELENGTH,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_MINIMO),2) P95_CURRENTDISKQUEUELENGTH_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_MAXIMO),2) P95_CURRENTDISKQUEUELENGTH_MAX,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100-FREESPACE_PCT_AVG),2) P05_PCT_USED,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100-FREESPACE_PCT_MINIMO),2) P05_PCT_USED_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100-FREESPACE_PCT_MAXIMO),2) P05_PCT_USED_MAX
FROM BOD_METRICAS2
WHERE OBJETO LIKE '%Disk%'
GROUP BY
SERVICIO,
SERVIDOR,
ENTIDAD,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end

UNION

SELECT 
SERVICIO,
SERVIDOR,
ENTIDAD,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2)  end yy,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2)  end mm,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2)  end dd,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2)  end hh ,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_AVG),2) P95_IDLETIME_PCT_AVG,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_MINIMO),2) P95_IDLETIME_PCT_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY IDLETIME_PCT_MAXIMO),2) P95_IDLETIME_PCT_MAX,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_AVG),2) P95_AVGDISKSECTRANSFER,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_MINIMO),2) P95_AVGDISKSECTRANSFER_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AVGDISKSECTRANSFER_MAXIMO),2) P95_AVGDISKSECTRANSFER_MAX,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_AVG),2) P95_CURRENTDISKQUEUELENGTH,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_MINIMO),2) P95_CURRENTDISKQUEUELENGTH_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CURRENTDISKQUEUELENGTH_MAXIMO),2) P95_CURRENTDISKQUEUELENGTH_MAX,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100-FREESPACE_PCT_AVG),2) P05_PCT_USED,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100-FREESPACE_PCT_MINIMO),2) P05_PCT_USED_MIN,
ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY 100-FREESPACE_PCT_MAXIMO),2) P05_PCT_USED_MAX
FROM BOD_METRICAS3
WHERE OBJETO LIKE '%Disk%'
GROUP BY
SERVICIO,
SERVIDOR,
ENTIDAD,
INSTANCIA,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,2,2) else substr(replace(FECHAHORA,'/2016','/16'),7,2) end,
case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,4,2) else substr(FECHAHORA,1,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,6,2) else substr(FECHAHORA,4,2) end --,
--case when substr(FECHAHORA,1,3)='116' then substr(FECHAHORA,8,2) else substr(replace(FECHAHORA,'/2016','/16'),10,2) end
;

