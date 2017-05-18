select * from
(select '14/11/16' fecha, 'job01' job
from dual
union
select '14/11/16' fecha , 'job05' job
from dual
union
select '14/11/16' fecha , 'job04' job
from dual) 
where (fecha, job) not in 
(select '14/11/16' fecha, 'job01' job
from dual
union
select '14/11/16' fecha , 'job02' job
from dual
union
select '14/11/16' fecha , 'job03' job
from dual);

select '14/11/16' fecha, 'job01' job
from dual
union
select '14/11/16' fecha , 'job02' job
from dual
union
select '14/11/16' fecha , 'job03' job
from dual
union
select '14/11/16' fecha , 'job04' job
from dual
union
select '14/11/16' fecha , 'job05' job
from dual

MINUS

(select '14/11/16' fecha, 'job01' job
from dual
union
select '14/11/16' fecha , 'job02' job
from dual
union
select '14/11/16' fecha , 'job04' job
from dual);

SELECT JOB
FROM AS400_JOBS_CANT_EJECU;

SELECT * FROM
AS400JOBS
WHERE 
JOBS IN ('SP0018CL')
AND
STATUS IN ('C');