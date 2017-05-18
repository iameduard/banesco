SELECT SUBSTR(dtetim,1,8) as Fecha, 
avg(CASE WHEN PONDBF > JSNDWJSNDBW THEN 100 * (PONDBF * 
(((CASE WHEN (dssrvt) <= 0 THEN 1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts) 
ELSE (dssrvt / (dsrds + dswrts)) END )) + ((CASE WHEN (dssrvt) <= 0 THEN 1000 * cuenta * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec)) 
ELSE (dswt / (dsrds+dswrts)) END )))) 
/(sysptu + (( PONDBF + JSNDWJSNDBW ) *  
((CASE WHEN (dssrvt) <= 0 THEN 
1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts) 
ELSE dssrvt / (dsrds + dswrts) END )
+ (CASE WHEN dssrvt <= 0 THEN 
1000 * cuenta * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec)) ELSE 
dswt / (dsrds+dswrts) END 
)))) ELSE (100 * (PONDBF * ((( CASE WHEN (dssrvt) <= 0 THEN 1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts)
ELSE (dssrvt / (dsrds + dswrts)) END )) + ((CASE WHEN (dssrvt) <= 0 THEN 1000 * cuenta * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec)) 
ELSE (dswt / (dsrds+dswrts)) END )))) 
/ ((sysptu + (JSNDWJSNDBW *
(((( CASE WHEN (dssrvt) <= 0 THEN 1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts) 
ELSE (dssrvt / (dsrds + dswrts)) END )) + ((CASE WHEN (dssrvt) <= 0 THEN 1000 * cuenta * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec)) 
ELSE (dswt / (dsrds+dswrts)) END ))))))) 
) END ) as FaultingFactor
from (select distinct * from AS400_VIEW_FAULTING_FACTOR) memoria,
(select count(intsec) as cuenta from AS400_VIEW_FAULTING_FACTOR
group by SUBSTR(dtetim,1,8))  total
group by SUBSTR(dtetim,1,8)
order by SUBSTR(dtetim,1,8);

