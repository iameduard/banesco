SELECT 
JOB,
SUBSTR(START_TIME,7,4) YYYY,
SUBSTR(START_TIME,4,2) MM,
ROUND((PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY CAST(DURACION AS NUMBER))),4) RETRASO_P95,
ROUND(AVG(CAST(DURACION AS NUMBER)),4) PROMEDIO_RETRASO
FROM AS400_JOBS_RETRASO_BACOSI
GROUP BY JOB,SUBSTR(START_TIME,7,4),SUBSTR(START_TIME,4,2)
ORDER BY JOB;


select * from as400_jobs_retraso_bacosi WHERE JOB IN 
('CCECDSCD7',
'CCECDSCD8',
'SW94001P');

SELECT DISTINCT JOB,YYYY,MM FROM AS400_JOBS_RETRASO, AS400_PERIODOS ORDER BY JOB, YYYY, MM;

SELECT TAB2.JOB, TAB2.YYYY, TAB2.MM , TAB1.RETRASO_P95, TAB1.PROMEDIO_RETRASO
FROM (SELECT DISTINCT JOB,YYYY,MM FROM AS400_JOBS_RETRASO, AS400_PERIODOS ORDER BY JOB, YYYY, MM) TAB2
LEFT JOIN
(SELECT JOB,SUBSTR(START_TIME,7,4) YYYY,SUBSTR(START_TIME,4,2) MM,
ROUND((PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY DURACION/10)),4) RETRASO_P95,
ROUND(AVG(DURACION/10),4) PROMEDIO_RETRASO FROM AS400_JOBS_RETRASO
GROUP BY JOB,SUBSTR(START_TIME,7,4),SUBSTR(START_TIME,4,2)) TAB1
ON TAB2.JOB=TAB1.JOB AND TAB2.YYYY=TAB1.YYYY AND TAB2.MM=TAB1.MM ;

SELECT DISTINCT JOB,YYYY,MM FROM AS400_JOBS_RETRASO, AS400_PERIODOS ORDER BY JOB, YYYY, MM;

select JOBS, CAST(HORA_FIN AS TIMESTAMP)-CAST(HORA_INI AS TIMESTAMP)  FROM AS400_JOBS_INI_FIN;


delete from AS400_JOBS_RETRASO;