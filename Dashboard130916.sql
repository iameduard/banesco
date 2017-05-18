SELECT DISTINCT CARGA FROM BOD_CPU;

SELECT DISTINCT objeto FROM BOD_METRICAS3;
where servidor like '%TIA%';


update bod_metricas3 set servicio='sipr3' where servidor like '%TIA%';