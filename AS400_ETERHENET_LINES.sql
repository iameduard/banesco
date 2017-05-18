SELECT SUBSTR(DTETIM,1,8) as Fecha, (sum(intsec)) as Intervalo, 
round(avg(etllsp),0) as Velocidad,
sum(ETMBVR) as ByteRX, 
sum(ETMBTR) as ByteTX, 
ETLLND as Red,
((100 * (sum(ETMBVR) + sum(ETMBTR)) / (sum(intsec) * avg(etllsp) / 8))) as Utilizacion
FROM (select distinct * from AS400ETHERNETLINEIBS) depurado
group by SUBSTR(DTETIM,1,8), ETLLND
HAVING (avg(intsec)) > 1.000000
order by ETLLND, SUBSTR(DTETIM,1,8);

SELECT * FROM AS400CPUTILIZEIBS
WHERE SUBSTR(dtetim,1, 8)='15111000';