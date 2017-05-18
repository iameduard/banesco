SELECT 
SUBSTR(depurado.dtetim,1,8) as FechaHora, 
round(avg(depurado.intsec),0) as Intervalo, 
--AS400_APP_JOB.APP,
--depurado.jbssys as SubSistema,
sum(depurado.JBTCPU) as CPU, 
round(avg(depurado.sctnum),0) as Procesadores,
round(sum(depurado.JBTCPU)/STATS_MODE(depurado.sctnum)/sum(depurado.INTSEC*1000),3) as CPUUtil_MODA,
round(sum(depurado.JBTCPU)/AVG(depurado.sctnum)/sum(depurado.INTSEC*1000),3) as CPUUtil_AVG,
round(sum(depurado.JBTCPU)/STATS_MODE(depurado.sctnum)/(3600*1000),3) as CPUUtil_MODA_3600,
round(sum(depurado.JBTCPU)/AVG(depurado.sctnum)/(3600*1000),3) as CPUUtil_AVG_3600,
round(avg(depurado.JBPRTY),0) as prioridad
FROM 
(select distinct * from AS400CPUSUBSYS_TEMP WHERE SCTNUM IS NOT NULL) depurado
GROUP BY SUBSTR(depurado.dtetim,1,8) ;

INNER JOIN AS400_APP_JOB
ON depurado.JBNAME = AS400_APP_JOB.JOBNAME
group by SUBSTR(depurado.dtetim,1,8), AS400_APP_JOB.APP, depurado.jbssys
order by depurado.jbssys, SUBSTR(depurado.dtetim,1,8)
;

SELECT DISTINCT SUBSTR(DTETIM,1,4) FROM AS400CPUSUBSYS_TEMP;

-- ACTUALIZAR REGISTROS EN AS400CPUSUBSYS_TEMP OJO!!!!!

INSERT INTO AS400CPUSUBSYS_TEMP
(SELECT * FROM AS400CPUTILIZSUBSEIBS
WHERE SUBSTR(DTETIM,1,4) IN ('1608') );

SELECT * FROM AS400CPUSUBSYS_TEMP;

DELETE FROM AS400CPUSUBSYS_TEMP;



-- 1511 - 14.473.507 filas insertadas.
-- 1512 - 35.537.692 filas insertadas.
-- 1608 - 41.417.082 filas insertadas.
-- 1609 - 41.417.082 filas insertadas.
