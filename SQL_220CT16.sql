INSERT INTO AS400CPUSUBSYS_TEMP
(SELECT * FROM AS400CPUTILIZSUBSEIBS
WHERE SUBSTR(DTETIM,1,4) IN ('1608') );

SELECT * FROM AS400CPUSUBSYS_TEMP;

DELETE FROM AS400CPUSUBSYS_TEMP;



-- 1511 - 14.473.507 filas insertadas.
-- 1512 - 35.537.692 filas insertadas.
-- 1608 - 41.417.082 filas insertadas.
-- 1609 - 41.417.082 filas insertadas.