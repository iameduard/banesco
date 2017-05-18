select distinct TAB2.DD,TAB2.MM,TAB2.YY,TAB1.JOB 
from 
as400_jobs_cant_ejecu TAB1, 
(select 
SUBSTR(To_Char(To_Date(start_ts,'DD-MM-YYYY HH24:MI:SS'),'DD/MM/YYYY'),1,2) DD, 
SUBSTR(To_Char(To_Date(start_ts,'DD-MM-YYYY HH24:MI:SS'),'DD/MM/YYYY'),4,2) MM, 
SUBSTR(To_Char(To_Date(start_ts,'DD-MM-YYYY HH24:MI:SS'),'DD/MM/YYYY'),7,4) YY
FROM
AS400JOBS
) TAB2

MINUS

(
SELECT 
SUBSTR(To_Char(To_Date(start_ts,'DD-MM-YYYY HH24:MI:SS'),'DD/MM/YYYY'),1,2) DD, 
SUBSTR(To_Char(To_Date(start_ts,'DD-MM-YYYY HH24:MI:SS'),'DD/MM/YYYY'),4,2) MM, 
SUBSTR(To_Char(To_Date(start_ts,'DD-MM-YYYY HH24:MI:SS'),'DD/MM/YYYY'),7,4) YY,
JOBS
FROM
AS400JOBS
where SUBSTR(JOBS,1,2) in ('SC','SP') and status in ('C') and
JOBS IN ('SC0001CL','SC0002M','SC0010','SC0111CL','SC0113','SC0141CL','SC0143CL','SC0152','SC0160CLB','SC0201CL','SP0008CL','SP0013CL','SP0018CL','SP0061CL','SP0062CL','SP0082CL','SP0096CL','SP0099CL','SP0140CL','SP0142CL','SP0150CL','SP0172CL','SP0190','SP9000CL','SP9001CL','SP9012CL')
);