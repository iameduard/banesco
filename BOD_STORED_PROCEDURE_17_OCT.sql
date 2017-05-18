create or replace PROCEDURE update_stcnum
IS
  V_SCTNUM NUMBER := 0;
  V_CONTA  NUMBER := 0;
  CURSOR cpu_general_cur IS
  SELECT SCTNUM FROM AS400CPUTILIZEIBS
  FOR UPDATE OF SCTNUM;
  
BEGIN

  FOR cpu_reg IN cpu_general_cur
  LOOP
  
    V_CONTA := V_CONTA + 1;
    
    --DBMS_OUTPUT.PUT_LINE ('V_SCTNUM ' || V_SCTNUM);
    
    --DBMS_OUTPUT.PUT_LINE ('cpu_reg.sctnum ' || cpu_reg.sctnum);
    
    IF cpu_reg.sctnum is NULL THEN
    
      DBMS_OUTPUT.PUT_LINE ('UPDATE ');
    
      UPDATE AS400CPUTILIZEIBS SET SCTNUM=V_SCTNUM WHERE CURRENT OF cpu_general_cur;
      
    ELSE
    
      V_SCTNUM := cpu_reg.sctnum;
      
    END IF;
    
    IF mod(V_CONTA, 10000) = 0 THEN    -- Commit every 10000 records
    
      COMMIT;
      
    END IF;
    
  END LOOP;
  --Hacer commit cada 10.000 registros
  COMMIT;
  
EXCEPTION

WHEN OTHERS THEN
   ROLLBACK;
END;

/