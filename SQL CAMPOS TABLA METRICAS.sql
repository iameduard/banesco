SELECT
COUNT(SERVIDOR),
COUNT(SERVICIO),
COUNT(FECHAHORA),
COUNT(ENTIDAD),
COUNT(OBJETO),
COUNT(INSTANCIA),
COUNT(PAGES_SEC_AVG),
COUNT(PAGES_SEC_MINIMO),
COUNT(PAGES_SEC_MAXIMO),
COUNT(MEMORYUSED_PCT_AVG),
COUNT(MEMORYUSED_PCT_MINIMO),
COUNT(MEMORYUSED_PCT_MAXIMO),
COUNT(PROCESSORTIME_PCT_AVG),
COUNT(PROCESSORTIME_PCT_MINIMO),
COUNT(PROCESSORTIME_PCT_MAXIMO),
COUNT(IDLETIME_PCT_AVG),
COUNT(IDLETIME_PCT_MINIMO),
COUNT(IDLETIME_PCT_MAXIMO),
COUNT(AVGDISKSECTRANSFER_AVG),
COUNT(AVGDISKSECTRANSFER_MINIMO),
COUNT(AVGDISKSECTRANSFER_MAXIMO),
COUNT(CURRENTDISKQUEUELENGTH_AVG),
COUNT(CURRENTDISKQUEUELENGTH_MINIMO),
COUNT(CURRENTDISKQUEUELENGTH_MAXIMO),
COUNT(FREESPACE_PCT_AVG),
COUNT(FREESPACE_PCT_MINIMO),
COUNT(FREESPACE_PCT_MAXIMO),
COUNT(PCTBANDWIDTHUSEDTOTAL_PCT_AVG),
COUNT(PCTBANDWIDTHUSEDTOTAL_PCT_MIN),
COUNT(PCTBANDWIDTHUSEDTOTAL_PCT_MAX),
COUNT(PROCESSORQUEUELENGTH_AVG),
COUNT(PROCESSORQUEUELENGTH_MINIMO),
COUNT(PROCESSORQUEUELENGTH_MAXIMO)
FROM BOD_METRICAS3
WHERE OBJETO LIKE '%Disk%';
