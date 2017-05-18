SELECT 
SUBSTR(depurado.dtetim,1,8) as FechaHora, 
round(avg(depurado.intsec),0) as Intervalo,  
depurado.jbssys as SubSistema,
sum(depurado.JBTCPU) as CPU, 
round(avg(depurado.sctnum),0) as Procesadores,
round(sum(depurado.JBTCPU)/avg(TAB.sctnum)/(avg(depurado.INTSEC)*1000),0) as CPUUtil,
round(avg(depurado.JBPRTY),0) as prioridad
FROM 
(select distinct * from AS400CPUTILIZSUBSEIBS 
WHERE SUBSTR(DTETIM,1,4) IN ('1511','1512','1601','1608','1609') 
) depurado 
INNER JOIN 
(SELECT DISTINCT DTETIM,SCTNUM FROM AS400CPUTILIZEIBS 
 WHERE SCTNUM IS NOT NULL AND SUBSTR(DTETIM,1,4) IN ('1511','1512','1601','1608','1609')
 ) TAB 
ON SUBSTR(depurado.DTETIM,1,8) = SUBSTR(TAB.DTETIM,1,8)
group by SUBSTR(depurado.dtetim,1,8), depurado.jbssys
order by depurado.jbssys, SUBSTR(depurado.dtetim,1,8)
;