SELECT substr(dtetim,1,8) as FechaHora, round(avg(intsec),0) as Intervalo,  
jbssys as SubSistema,
sum(JBTCPU) as CPU, 
round(avg(SCTNUM),0) as Procesadores,
round(sum(JBTCPU)/avg(INTSEC),0) as CPUUtil,
round(avg(JBPRTY),0) as prioridad
FROM (select distinct * from AS400CPUTILIZSUBSEIBS) depurado
group by substr(dtetim,1,8), jbssys
order by  jbssys, substr(dtetim,1,8);

SELECT MIN(JBTCPU)/1000,AVG(JBTCPU)/1000,MAX(JBTCPU)/1000 from AS400CPUTILIZSUBSEIBS;

SELECT SUBSTR(DTETIM,1,2) YY, SUBSTR(DTETIM,3,2) MM, SUBSTR(DTETIM,5,2) DD,SUBSTR(DTETIM,7,2) hh,
SCTNUM, COUNT(*) from AS400CPUTILIZSUBSEIBS 
group by SUBSTR(DTETIM,1,2), SUBSTR(DTETIM,3,2), SUBSTR(DTETIM,5,2),SUBSTR(DTETIM,7,2),SCTNUM;

--Tiempo de Respuesta de Discos.

SELECT SUBSTR(dtetim,1,8)  as Fecha, 
dsasp,
avg(dsrds) as leidos,
avg(dswrts) as escritos,
avg((dsrds + dswrts) / intsec) as IO,
avg(CASE WHEN (dssrvt) <= 0 THEN 1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts) 
ELSE (dssrvt / (dsrds + dswrts)) END) ServiceTime,
avg(CASE WHEN (dssrvt) <= 0 THEN 1000 * cuenta
  * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec)) ELSE (dswt / (dsrds+dswrts)) END )  WaitTime,
(avg(CASE WHEN (dssrvt) <= 0 THEN 1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts)
ELSE (dssrvt / (dsrds + dswrts)) END) + 
avg(CASE WHEN (dssrvt) <= 0 THEN 1000 * cuenta
 * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec)) ELSE (dswt / (dsrds+dswrts)) END
)) ResponseTime
FROM (select distinct * from AS400_Disk_Response) depurado,
(select count(intsec) as cuenta from AS400_Disk_Response
group by SUBSTR(dtetim,1,8), dsasp) total
group by SUBSTR(dtetim,1,8), dsasp
order by SUBSTR(dtetim,1,8), dsasp;


 create view AS400_Disk_Response as
  select *
   from AS400DISKRESPONSEEIBS
   where intsec        > 0 and
         (dsrds+dswrts)> 0 and
         dsnbsy        > 0 and 
         dssmpl        > 0 ;