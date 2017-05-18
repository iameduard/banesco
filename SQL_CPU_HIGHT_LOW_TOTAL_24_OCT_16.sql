SELECT 
SUBSTR(depurado.dtetim,1, 8)                                                                            FECHA, 
AVG(INTSEC)                                                                                             INTSEC, 
sum(JBTCPU)                                                                                             CPU, 
round(avg(depurado.SCTNUM),0)                                                                           DEPURADO_PROC,
round(avg(TAB.SCTNUM),0)                                                                                TAB_PROC, 
depurado.HLP,
round(sum(depurado.JBTCPU)/avg(TAB.SCTNUM)/sum(depurado.INTSEC*1000),0)                                 CPU
FROM 
(select distinct 
DTETIM,INTSEC,JBTCPU,JBTYPE,JBPRTY,CASE WHEN JBPRTY <  50 THEN 'HIGHT PRIORITY' ELSE 'LOW PRIORITY' END HLP,SCTNUM
from AS400CPUTILIZEIBS where JBTCPU > 0) depurado 
INNER JOIN 
(SELECT DISTINCT DTETIM,SCTNUM FROM AS400CPUTILIZEIBS 
 WHERE SCTNUM IS NOT NULL AND JBTCPU > 0
 ) TAB 

ON SUBSTR(depurado.DTETIM,1,8) = SUBSTR(TAB.DTETIM,1,8)

group by 
SUBSTR(depurado.dtetim,1,8),
depurado.HLP
order by SUBSTR(depurado.dtetim,1,8);