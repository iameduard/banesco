SELECT 
SUBSTR(depurado.dtetim,1, 8) AS Fecha,
sum(depurado.JBTCPU) as CPU, 
round(avg(depurado.SCTNUM),0) as Procesadores, 
round(sum(depurado.JBTCPU/1000)/avg(depurado.SCTNUM)/(3600*1000),4) as CPUUtil
FROM 
(select distinct * from AS400CPUTILIZEIBS where SCTNUM IS NOT NULL ) depurado 
group by SUBSTR(depurado.dtetim,1, 8)
order by SUBSTR(depurado.dtetim,1, 8);

--CPU UTILIZ TOTAL..
select * from AS400CPUTILIZEIBS WHERE SUBSTR(DTETIM,1,8)='16082607' AND SCTNUM IS NOT NULL;


SELECT SUBSTR(depurado.dtetim,1, 8) AS Fecha, STATS_MODE(INTSEC),AVG(INTSEC),
sum(JBTCPU) as CPU, 
round(avg(TAB.SCTNUM),0) as Procesadores, 
round(sum(depurado.JBTCPU)/avg(TAB.SCTNUM)/sum(depurado.INTSEC*1000),0) as CPUUtil
FROM 
(select distinct * from AS400CPUTILIZEIBS) depurado 
INNER JOIN 
(SELECT DISTINCT DTETIM,SCTNUM FROM AS400CPUTILIZEIBS 
 WHERE SCTNUM IS NOT NULL AND SUBSTR(DTETIM,3,2) NOT IN ('06','07') AND INTSEC>0
 ) TAB 
ON SUBSTR(depurado.DTETIM,1,8) = SUBSTR(TAB.DTETIM,1,8)
WHERE INTSEC>0
group by SUBSTR(depurado.dtetim,1, 8)
order by SUBSTR(depurado.dtetim,1, 8);