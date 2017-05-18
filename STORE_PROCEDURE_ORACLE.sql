CREATE OR REPLACE PROCEDURE export_to_csv
 
IS
   v_file         UTL_FILE.FILE_TYPE;
   v_string       VARCHAR2 (4000);

   CURSOR c_bod_cpu
   IS
   SELECT 
       CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
       CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END
       END SERVICIO,
       CARGA,
       case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2)  end yy,
       case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2)  end mm,
       case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2)  end dd,
       case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2)  end hh,
       processor,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY pct_processor_time),2) P95_PCT_PROCESSOR_TIME,
       ROUND(AVG(pct_processor_time),2) AVG_PCT_PROCESSOR_TIME,
       ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY pct_user_time),2) P95_PCT_USER_TIME,
       ROUND(AVG(pct_user_time),2) AVG_PCT_USER_TIME
    FROM bod_cpu
    WHERE substr(recording_time,13,2)='00' AND PROCESSOR='_Total' AND RECORDING_TIME IS NOT NULL--Selecciona la medicion de la hora..
    GROUP BY
    CASE WHEN CARGA IN ('BODCOMPE124','BODUAP02','BODUAP03') THEN 'UAP' ELSE 
    CASE WHEN CARGA IN ('BODTRUNC01','BODTRUNC02','BODTRUNC03','BODTRUNC04','BODTRUNC05','BODTRUNC11','BODTRUNC12') THEN 'SO' ELSE 'OTRO' END END,
    CARGA,
    case when substr(recording_time,1,3)='116' then substr(recording_time,2,2) else substr(replace(RECORDING_TIME,'/2016','/16'),7,2) end,
    case when substr(recording_time,1,3)='116' then substr(recording_time,4,2) else substr(recording_time,1,2) end ,
    case when substr(recording_time,1,3)='116' then substr(recording_time,6,2) else substr(recording_time,4,2) end ,
    case when substr(recording_time,1,3)='116' then substr(recording_time,8,2) else substr(replace(RECORDING_TIME,'/2016','/16'),10,2) end,
    processor
    ORDER BY YY,MM,DD,HH;

BEGIN
   v_file := UTL_FILE.fopen ('C:\TMP','bod_cpu_070916.csv','w', 1000);
   
   -- if you do not want heading then remove below two lines
   v_string := 'Emp Code, Emp Name, Dept, Salary, Commission';
   UTL_FILE.put_line (v_file, v_string);

   FOR cur IN c_emp
   LOOP
      v_string :=
            cur.SERVICIO
         || ','
         || cur.CARGA
         || ','
         || cur.YY
         || ','
         || cur.MM
         || ','
         || cur.DD
         || ','
         || cur.HH
         || ','
         || cur.processor
         || ','
         || cur.P95_PCT_PROCESSOR_TIME
         || ','
         || cur.AVG_PCT_PROCESSOR_TIME
         || ','
         || cur.P95_PCT_USER_TIME
         || ','
         || cur.AVG_PCT_USER_TIME;
      UTL_FILE.put_line (v_file, v_string);
   END LOOP;

   UTL_FILE.fclose (v_file);
EXCEPTION
   WHEN OTHERS
   THEN
      IF UTL_FILE.is_open (v_file)
      THEN
         UTL_FILE.fclose (v_file);
      END IF;
END;