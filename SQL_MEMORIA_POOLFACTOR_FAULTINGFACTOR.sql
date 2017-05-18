
select SUBSTR(dtetim,1,8) as Fecha, sum(intsec) as intervalo,
ponbr as PoolNumber,
sum(podbf + pondbf) as Faults,
sum(podbf) as podbf,
sum(pondbf) as pondbf,
round(avg(posiz/1024/1024),0) as Memoria
from (select distinct * from AS400POOLFAULTING2EIBS ) depurado
group by SUBSTR(dtetim,1,8), ponbr 
order by SUBSTR(dtetim,1,8), ponbr ;

SELECT COUNT(*) FROM AS400POOLFAULTING2EIBS;

SELECT COUNT(*) FROM AS400FAULTINGFACTOR2EIBS;


--FAULTING FACTOR...

SELECT SUBSTR(dtetim,1,8) as Fecha, 
avg(

CASE WHEN PONDBF > JSNDWJSNDBW
THEN 
100 * (podbf_pondbf * 
( 
((
CASE WHEN (dssrvt) <= 0
THEN
1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts)
ELSE
(dssrvt / (dsrds + dswrts))
END

)) +
((

CASE WHEN (dssrvt) <= 0
THEN
1000 * cuenta * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec))
ELSE
(dswt / (dsrds+dswrts))
END
))
)) 
/
((sysptu + (( PONDBF + JSNDWJSNDBW ) * 
( ( 
((

CASE WHEN (dssrvt) <= 0
THEN
1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts)
ELSE
(dssrvt / (dsrds + dswrts))
END

)) +
((

CASE WHEN (dssrvt) <= 0
THEN
1000 * cuenta * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec))
ELSE
(dswt / (dsrds+dswrts))
END

))
)))))

ELSE 
(
100 * (PONDBF * 
( 
((

CASE WHEN (dssrvt) <= 0
THEN 
1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts)
ELSE
(dssrvt / (dsrds + dswrts))
END

)) +

((

CASE WHEN (dssrvt) <= 0 
THEN
1000 * cuenta * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec))
ELSE 
(dswt / (dsrds+dswrts))
END
))
)) 
/
((sysptu + (JSNDWJSNDBW *
(( 
((
CASE WHEN (dssrvt) <= 0
THEN
1000 *  ((((dssmpl-dsnbsy)/dsnbsy)/((dsrds+dswrts)/intsec)) * (dsrds + dswrts)) /  (dsrds + dswrts)
ELSE
(dssrvt / (dsrds + dswrts))
END
)) +
((
CASE WHEN (dssrvt) <= 0
THEN
1000 * cuenta * (((dsquel/dssmpl))-((dssmpl-dsnbsy)/(dssmpl))/((dsrds+dswrts)/intsec))
ELSE
(dswt / (dsrds+dswrts))
END
)
))))))
)

END) as FaultingFactor
from (select distinct * from AS400_VIEW_FAULTING_FACTOR ) memoria,
(select count(intsec) as cuenta from AS400_VIEW_FAULTING_FACTOR
group by SUBSTR(dtetim,1,8)) total
group by SUBSTR(dtetim,1,8)
order by SUBSTR(dtetim,1,8);


SELECT COUNT(*) FROM AS400_VIEW_FAULTING_FACTOR;

CREATE VIEW AS400_VIEW_FAULTING_FACTOR AS SELECT * FROM AS400FAULTINGFACTOR2EIBS 
WHERE dsrds+dswrts   > 0 AND
      intsec         > 0 AND 
      dsnbsy         > 0 AND
      dssmpl         > 0 ;