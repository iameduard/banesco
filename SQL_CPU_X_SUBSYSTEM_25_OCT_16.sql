SELECT 
SUBSTR(depurado.dtetim,1,8) as FechaHora, 
round(avg(depurado.intsec),0) as Intervalo, 
AS400_APP_JOB.APP,
depurado.jbssys as SubSistema,
sum(depurado.JBTCPU/1000) as CPU, 
round(avg(sctnum),0) as Procesadores,
round(sum(depurado.JBTCPU/1000)/AVG(depurado.sctnum)/sum(depurado.INTSEC*1000),3) as CPUUtil_AVG,
round(sum(depurado.JBTCPU/1000)/AVG(depurado.sctnum)/(3600*1000),3) as CPUUtil_AVG_3600,
round(min(depurado.JBPRTY),0) as minprioridad,
round(max(depurado.JBPRTY),0) as maxprioridad
FROM 
(select distinct * from AS400CPUSUBSYS_TEMP) depurado 
LEFT OUTER JOIN AS400_APP_JOB
ON 
depurado.JBNAME=AS400_APP_JOB.JOBNAME
group by SUBSTR(depurado.dtetim,1,8), AS400_APP_JOB.APP,depurado.jbssys
order by depurado.jbssys, SUBSTR(depurado.dtetim,1,8);


SELECT DISTINCT SUBSTR(DTETIM,1,4) FROM AS400CPUSUBSYS_TEMP;

-- ACTUALIZAR REGISTROS EN AS400CPUSUBSYS_TEMP OJO!!!!!

SELECT 
SUBSTR(depurado.dtetim,1,8) as FechaHora, 
round(avg(depurado.intsec),0) as Intervalo, 
--AS400_APP_JOB.APP,
depurado.jbssys as SubSistema,
sum(depurado.JBTCPU) as CPU, 
round(avg(TAB.sctnum),0) as Procesadores,
round(sum(depurado.JBTCPU)/AVG(depurado.sctnum)/sum(depurado.INTSEC*1000),3) as CPUUtil_AVG,
round(sum(depurado.JBTCPU)/AVG(depurado.sctnum)/(3600*1000),3) as CPUUtil_AVG_3600,
round(avg(depurado.JBPRTY),0) as prioridad
FROM 
(select distinct * from AS400CPUSUBSYS_TEMP WHERE SCTNUM IS NOT NULL
AND SUBSTR(depurado.dtetim,1,8)=' ') depurado 
INNER JOIN AS400_APP_JOB
ON depurado.JBNAME = AS400_APP_JOB.JOBNAME
group by SUBSTR(depurado.dtetim,1,8), AS400_APP_JOB.APP, depurado.jbssys
order by depurado.jbssys, SUBSTR(depurado.dtetim,1,8)
;
