SELECT SUBSTR(depurado.dtetim,1, 8) AS Fecha, 3600, 
jbtype as Tipo, 
sum(JBTCPU) as CPU, 
round(avg(TAB.SCTNUM),0) as Procesadores, 
round(sum(depurado.JBTCPU)/avg(TAB.SCTNUM)/sum(depurado.INTSEC*1000),0) as CPUUtil,
round(avg(JBPRTY),0) as prioridad
FROM 
(select distinct * from AS400CPUTILIZEIBS where JBPRTY < 50) depurado 
INNER JOIN 
(SELECT DISTINCT DTETIM,SCTNUM FROM AS400CPUTILIZEIBS 
 WHERE SCTNUM IS NOT NULL
 ) TAB 
ON SUBSTR(depurado.DTETIM,1,8) = SUBSTR(TAB.DTETIM,1,8)
group by SUBSTR(depurado.dtetim,1, 8), jbtype
order by SUBSTR(depurado.dtetim,1, 8), jbtype;

SELECT COUNT(*) FROM AS400CPUTILIZEIBS WHERE JBTCPU <> 0;

--CPU UTILIZ TOTAL..

SELECT SUBSTR(depurado.dtetim,1, 8) AS Fecha, 3600, 
jbtype as Tipo, 
sum(JBTCPU) as CPU, 
round(avg(TAB.SCTNUM),0) as Procesadores, 
round(sum(depurado.JBTCPU)/avg(TAB.SCTNUM)/sum(depurado.INTSEC*1000),0) as CPUUtil,
round(avg(JBPRTY),0) as prioridad
FROM 
(select distinct * from AS400CPUTILIZEIBS where JBPRTY < 50) depurado 
INNER JOIN 
(SELECT DISTINCT DTETIM,SCTNUM FROM AS400CPUTILIZEIBS 
 WHERE SCTNUM IS NOT NULL
 ) TAB 
ON SUBSTR(depurado.DTETIM,1,8) = SUBSTR(TAB.DTETIM,1,8)
group by SUBSTR(depurado.dtetim,1, 8), jbtype
order by SUBSTR(depurado.dtetim,1, 8), jbtype;