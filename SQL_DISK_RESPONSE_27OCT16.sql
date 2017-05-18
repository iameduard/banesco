SELECT SUBSTR(dtetim,1,8)  as Fecha, 
dsasp,
avg(dsrds) as leidos,
avg(dswrts) as escritos,
avg((dsrds + dswrts) / intsec) as IO,
avg(
CASE WHEN (dssrvt) <= 0 
THEN 1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts)
ELSE (dssrvt / (dsrds + dswrts))
END) as ServiceTime,
avg(
CASE WHEN (dssrvt) <= 0 
THEN 1000 * cuenta  * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec))
ELSE (dswt / (dsrds+dswrts))
END) as WaitTime,
(avg(
CASE WHEN (dssrvt) <= 0 
THEN 1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts)
ELSE (dssrvt / (dsrds + dswrts))
END) 
+ 
avg(
CASE WHEN (dssrvt) <= 0 
THEN 1000 * cuenta
 * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec))
ELSE (dswt / (dsrds+dswrts))
END)
) as ResponseTime
FROM (select distinct * from AS400DISKRESPONSE_TMP) depurado,
(select count(intsec) as cuenta from AS400DISKRESPONSE_TMP
group by SUBSTR(dtetim,1,8), dsasp) total
where intsec > 0 and (dsrds+dswrts) > 0 and dssmpl > 0 and dsnbsy > 0
group by SUBSTR(dtetim,1,8), dsasp
order by SUBSTR(dtetim,1,8), dsasp
;


SELECT COUNT(*) FROM AS400_VIEW_DISKRESPONSE;

SELECT distinct SUBSTR(DTETIM,1,6) FROM AS400_VIEW_DISKRESPONSE order by 1;

DROP VIEW AS400_VIEW_DISKRESPONSE;

CREATE VIEW AS400_VIEW_FAULTING_FACTOR AS SELECT * FROM AS400FAULTINGFACTOR2EIBS 
WHERE dsnbsy         > 0 AND
      intsec         > 0 AND 
      dsrds + dswrts > 0;
