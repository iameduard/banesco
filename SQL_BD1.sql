SELECT 
SUBSTR(depurado.dtetim,1, 8) AS Fecha, 
sum(depurado.JBTCPU) as CPU, 
round(avg(depurado.SCTNUM),0) as Procesadores, 
CASE WHEN JBPRTY < 50  THEN 'HIGHT' ELSE 'LOW' END HIGHT_LOW,
sum(depurado.JBTCPU/1000) AS SUM_JBTCPU,
AVG(TAB.SCTNUM) AS AVG_SCTNUM,
sum(depurado.JBTCPU/1000)/AVG(TAB.SCTNUM) 
--CASE WHEN JBPRTY < 50  THEN SUM(depurado.INTSEC*1000) ELSE SUM(depurado.INTSEC*1000) END AS IHIGHT
--IHIGHT + ILOW AS INTSEC_TOTAL --,
--CASE WHEN JBPRTY < 50  THEN round(sum(depurado.JBTCPU/1000)/IHIGHT/AVG(TAB.SCTNUM),6)*10000 END CPU_HIGHT,
--CASE WHEN JBPRTY >= 50 THEN round(sum(depurado.JBTCPU/1000)/ILOW/AVG(TAB.SCTNUM),6)*10000 END CPU_LOW ,
--round(sum(depurado.JBTCPU/1000)/(IHIGHT+ILOW)/AVG(TAB.SCTNUM),6)*10000 as CPUUtil 
--round(avg(JBPRTY),0) as prioridad
FROM 
(select distinct * from AS400CPUTILIZEIBS where SUBSTR(DTETIM,1,4) NOT IN ('1606','1607') ) depurado 
INNER JOIN 
(SELECT DISTINCT DTETIM,SCTNUM FROM AS400CPUTILIZEIBS 
 WHERE SCTNUM IS NOT NULL
 ) TAB 
ON SUBSTR(depurado.DTETIM,1,8) = SUBSTR(TAB.DTETIM,1,8)
group by SUBSTR(depurado.dtetim,1, 8),
CASE WHEN JBPRTY < 50  THEN 'HIGHT' ELSE 'LOW' END
order by SUBSTR(depurado.dtetim,1, 8),CASE WHEN JBPRTY < 50 THEN 'HIGHT' ELSE 'LOW' END;


SELECT 
SUBSTR(depurado.dtetim,1, 8) AS Fecha,
--jbtype as Tipo, 
sum(depurado.JBTCPU) as CPU, 
round(avg(depurado.SCTNUM),0) as Procesadores, 
CASE WHEN JBPRTY < 50 THEN 'HIGHT' ELSE 'LOW' END PRIORITY,
round(sum(depurado.JBTCPU/1000)/sum(depurado.INTSEC*1000)/AVG(TAB.SCTNUM),6)*10000 as CPUUtil 
--round(avg(JBPRTY),0) as prioridad
FROM 
(select distinct * from AS400CPUTILIZEIBS where SUBSTR(DTETIM,1,4) NOT IN ('1606','1607') ) depurado 
INNER JOIN 
(SELECT DISTINCT DTETIM,SCTNUM FROM AS400CPUTILIZEIBS 
 WHERE SCTNUM IS NOT NULL
 ) TAB 
ON SUBSTR(depurado.DTETIM,1,8) = SUBSTR(TAB.DTETIM,1,8)
group by SUBSTR(depurado.dtetim,1, 8),CASE WHEN JBPRTY < 50 THEN 'HIGHT' ELSE 'LOW' END
order by SUBSTR(depurado.dtetim,1, 8),CASE WHEN JBPRTY < 50 THEN 'HIGHT' ELSE 'LOW' END;

SELECT 
SUBSTR(dtetim,1, 8) AS Fecha,
SUM(INTSEC) *10000
FROM AS400CPUTILIZEIBS WHERE SUBSTR(DTETIM,1,4) NOT IN ('1606','1607')GROUP BY SUBSTR(dtetim,1, 8)
ORDER BY 1;

SELECT * FROM AS400CPUTILIZEIBS WHERE SUBSTR(DTETIM,1,8)='15111000';

SELECT DISTINCT DTETIM,SCTNUM FROM AS400CPUTILIZEIBS 
 WHERE SCTNUM IS NOT NULL;
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