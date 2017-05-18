SELECT 
SUBSTR(depurado.dtetim,1,8) as FechaHora, 
round(avg(depurado.intsec),0) as Intervalo, 
AS400_APP_JOB.APP,
depurado.jbssys as SubSistema,
sum(depurado.JBTCPU) as CPU, 
round(avg(TAB.sctnum),0) as Procesadores,
round(sum(depurado.JBTCPU)/STATS_MODE(TAB.sctnum)/sum(depurado.INTSEC*1000),0) as CPUUtil,
round(avg(depurado.JBPRTY),0) as prioridad
FROM 
(select distinct * from AS400CPUSUBSYS_TEMP WHERE) depurado 
INNER JOIN 
(SELECT DISTINCT DTETIM,SCTNUM FROM AS400CPUSUBSYS_TEMP 
 WHERE SCTNUM IS NOT NULL
 ) TAB 
ON SUBSTR(depurado.DTETIM,1,8) = SUBSTR(TAB.DTETIM,1,8)
INNER JOIN AS400_APP_JOB
ON depurado.JBNAME = AS400_APP_JOB.JOBNAME
group by SUBSTR(depurado.dtetim,1,8), AS400_APP_JOB.APP, depurado.jbssys
order by depurado.jbssys, SUBSTR(depurado.dtetim,1,8)
;

-- ACTUALIZAR REGISTROS EN AS400CPUSUBSYS_TEMP OJO!!!!!