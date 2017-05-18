-RESPALDO DE BASE DE DATOS ORACLE 11G EXPRESS EDITION CONTENTIVA DE TABLAS DE BOD JOB
--------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400_APP_JOB
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400_APP_JOB" 
   (	"APP" VARCHAR2(60 BYTE), 
	"JOBNAME" VARCHAR2(60 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400_FECHA_INTSEC
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400_FECHA_INTSEC" 
   (	"DTETIM" VARCHAR2(20 BYTE), 
	"INTSEC" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400_JOBS_CANT_EJECU
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400_JOBS_CANT_EJECU" 
   (	"JOB" VARCHAR2(20 BYTE), 
	"CANT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400_JOBS_INI_FIN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400_JOBS_INI_FIN" 
   (	"JOBS" VARCHAR2(20 BYTE), 
	"HORA_INI" VARCHAR2(20 BYTE), 
	"HORA_FIN" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400_JOBS_RETRASO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400_JOBS_RETRASO" 
   (	"JOB" VARCHAR2(20 BYTE), 
	"START_TIME" VARCHAR2(20 BYTE), 
	"DURACION" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400_JOBS_RETRASO_BACOSI
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400_JOBS_RETRASO_BACOSI" 
   (	"JOB" VARCHAR2(20 BYTE), 
	"START_TIME" VARCHAR2(20 BYTE), 
	"DURACION" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400_PERIODOS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400_PERIODOS" 
   (	"YYYY" NUMBER, 
	"MM" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400CPU
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400CPU" 
   (	"DTETIM" VARCHAR2(20 BYTE), 
	"INTSEC" NUMBER, 
	"JBTCPU" NUMBER, 
	"JBTYPE" VARCHAR2(10 BYTE), 
	"JBPRTY" NUMBER, 
	"SCTNUM" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table AS400CPU
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."AS400CPU" MODIFY ("DTETIM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."AS400CPU" MODIFY ("JBTCPU" NOT NULL ENABLE);

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400CPUTILXPRCIBS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400CPUTILXPRCIBS" 
   (	"DTETIM" VARCHAR2(20 BYTE), 
	"INTSEC" NUMBER, 
	"SCPU01" NUMBER, 
	"SCPU02" NUMBER, 
	"SCPU03" NUMBER, 
	"SCPU04" NUMBER, 
	"SCPU05" NUMBER, 
	"SCPU06" NUMBER, 
	"SCPU07" NUMBER, 
	"SCPU08" NUMBER, 
	"SCPU09" NUMBER, 
	"SCPU10" NUMBER, 
	"SCPU11" NUMBER, 
	"SCPU12" NUMBER, 
	"SCPU13" NUMBER, 
	"SCPU14" NUMBER, 
	"SCPU15" NUMBER, 
	"SCPU16" NUMBER, 
	"SCPU17" NUMBER, 
	"SCPU18" NUMBER, 
	"SCPU19" NUMBER, 
	"SCPU20" NUMBER, 
	"SCPU21" NUMBER, 
	"SCPU22" NUMBER, 
	"SCPU23" NUMBER, 
	"SCPU24" NUMBER, 
	"SCPU25" NUMBER, 
	"SCPU26" NUMBER, 
	"SCPU27" NUMBER, 
	"SCPU28" NUMBER, 
	"SCPU29" NUMBER, 
	"SCPU30" NUMBER, 
	"SCPU31" NUMBER, 
	"SCPU32" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400FAULTINGFACTOR2EIBS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400FAULTINGFACTOR2EIBS" 
   (	"DTETIM" VARCHAR2(20 BYTE), 
	"INTSEC" NUMBER, 
	"INTSECCOUNT" NUMBER, 
	"DSSMPL" NUMBER, 
	"DSNBSY" NUMBER, 
	"DSQUEL" NUMBER, 
	"DSRDS" NUMBER, 
	"DSWRTS" NUMBER, 
	"PONDBF" NUMBER, 
	"SYSPTU" NUMBER, 
	"JSNDWJSNDBW" NUMBER, 
	"DSSRVT" NUMBER, 
	"DSWT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table AS400FAULTINGFACTOR2EIBS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."AS400FAULTINGFACTOR2EIBS" MODIFY ("DTETIM" NOT NULL ENABLE);

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400FAULTINGTOTALMEMOE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400FAULTINGTOTALMEMOE" 
   (	"DTETIM" VARCHAR2(20 BYTE), 
	"INTSEC" NUMBER, 
	"PODBF" NUMBER, 
	"PONDBF" NUMBER, 
	"POSIZ" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table AS400FAULTINGTOTALMEMOE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."AS400FAULTINGTOTALMEMOE" MODIFY ("DTETIM" NOT NULL ENABLE);

  
  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400JOBS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400JOBS" 
   (	"X" VARCHAR2(5 BYTE), 
	"JOBS" VARCHAR2(20 BYTE), 
	"SYSTEM" VARCHAR2(40 BYTE), 
	"STATUS" VARCHAR2(5 BYTE), 
	"DESCRIPTION" VARCHAR2(60 BYTE), 
	"TS" VARCHAR2(20 BYTE), 
	"DURATION" NUMBER, 
	"JOB_NUMBER" VARCHAR2(20 BYTE), 
	"JOB_USER" VARCHAR2(20 BYTE), 
	"START_TS" VARCHAR2(20 BYTE), 
	"END_TS" VARCHAR2(20 BYTE), 
	"GROUP_NAME" VARCHAR2(20 BYTE), 
	"MESSAGE" VARCHAR2(60 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400MUESTRA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400MUESTRA" 
   (	"YY" NUMBER, 
	"MM" NUMBER, 
	"DD" NUMBER, 
	"HH" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AS400TABLA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AS400TABLA" 
   (	"YY" NUMBER, 
	"MM" NUMBER, 
	"DD" NUMBER, 
	"HH" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOD_CPU
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BOD_CPU" 
   (	"RECORDING_TIME" VARCHAR2(20 BYTE), 
	"PROCESSOR" VARCHAR2(20 BYTE), 
	"PCT_PROCESSOR_TIME" BINARY_DOUBLE, 
	"PCT_USER_TIME" NUMBER, 
	"CARGA" VARCHAR2(40 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOD_DFIS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BOD_DFIS" 
   (	"RECORDING_TIME" VARCHAR2(20 BYTE), 
	"PHYSICAL_DISK_NAME" VARCHAR2(20 BYTE), 
	"DISK_NUMBER" VARCHAR2(10 BYTE), 
	"DISK_QUEUE_LENGTH" NUMBER, 
	"PCT_DISK_READ_TIME" NUMBER, 
	"PCT_DISK_WRITE_TIME" NUMBER, 
	"PCT_DISK_IDLE_TIME" NUMBER, 
	"AVG_DISK_MS_BY_TRANSFER" NUMBER, 
	"AVERAGE_DISK_QUEUE_LENGTH" NUMBER, 
	"PCT_DISK_TIME" NUMBER, 
	"DISK_TRANSFERS_BY_SEC" NUMBER, 
	"AVG_DISK_BYTES_BY_TRANSFER" NUMBER, 
	"CARGA" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BOD_DFIS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOD_DFIS" MODIFY ("RECORDING_TIME" NOT NULL ENABLE);

  
  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOD_DLOG
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BOD_DLOG" 
   (	"RECORDING_TIME" VARCHAR2(20 BYTE), 
	"LOGICAL_DISK_NAME" VARCHAR2(20 BYTE), 
	"PHYSICAL_DISK_NUMBER" VARCHAR2(10 BYTE), 
	"TOTAL_SIZE" NUMBER, 
	"PCT_USED" NUMBER(3,0), 
	"DISK_QUEUE_LENGTH_REQUESTS" NUMBER, 
	"CARGA" VARCHAR2(20 BYTE), 
	"PCT_DISK_TIME" NUMBER, 
	"PCT_DISK_READ_TIME" NUMBER, 
	"PCT_DISK_WRITE_TIME" NUMBER, 
	"AVG_DISK_MS_BY_READ" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BOD_DLOG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOD_DLOG" MODIFY ("RECORDING_TIME" NOT NULL ENABLE);

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOD_MEM
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BOD_MEM" 
   (	"RECORDING_TIME" VARCHAR2(20 BYTE), 
	"TOTAL_MEMORY_SIZE_MB" NUMBER(10,0), 
	"MEMORY_USAGE_PCT" NUMBER, 
	"SERVER_NAME" VARCHAR2(40 BYTE), 
	"CARGA" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BOD_MEM
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOD_MEM" MODIFY ("RECORDING_TIME" NOT NULL ENABLE);

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOD_MEMO_PAGE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BOD_MEMO_PAGE" 
   (	"RECORDING_TIME" VARCHAR2(20 BYTE), 
	"SERVER_NAME" VARCHAR2(60 BYTE), 
	"PAGE_READS_BY_SEC" NUMBER, 
	"PAGE_WRITES_BY_SEC" NUMBER, 
	"PAGES_INPUT_BY_SEC" NUMBER, 
	"PAGES_OUTPUT_BY_SEC" NUMBER, 
	"PAGES_BY_SEC" NUMBER, 
	"CARGA" VARCHAR2(40 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BOD_MEMO_PAGE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOD_MEMO_PAGE" MODIFY ("RECORDING_TIME" NOT NULL ENABLE);

  
  --------------------------------------------------------
-- Archivo creado  - jueves-enero-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOD_PROC
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BOD_PROC" 
   (	"WRITETIME" VARCHAR2(20 BYTE), 
	"SERVER_NAME" VARCHAR2(40 BYTE), 
	"PROCESS_NAME" VARCHAR2(40 BYTE), 
	"PCT_PROCESSOR_TIME" NUMBER, 
	"CARGA" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BOD_PROC
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOD_PROC" MODIFY ("WRITETIME" NOT NULL ENABLE);

  
  