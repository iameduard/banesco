SELECT * FROM BOD_DFIS
WHERE
case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2) end ='16' 
AND
case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2) end ='05'
AND
case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2) end='24'
AND
case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2) end='10'
AND
CARGA='BODTRUNC01'
AND PHYSICAL_DISK_NAME NOT LIKE '%Total%';