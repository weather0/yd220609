--------------------------------------------------------
--  파일이 생성됨 - 수요일-6월-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table K_COUNTRIES
--------------------------------------------------------

  CREATE TABLE "ADMIN"."K_COUNTRIES" 
   (	"ID" VARCHAR2(40 BYTE) COLLATE "USING_NLS_COMP", 
	"ENG_NAME" VARCHAR2(400 BYTE) COLLATE "USING_NLS_COMP", 
	"ORDERIDX" NUMBER, 
	"KOREAN_NAME" VARCHAR2(400 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
REM INSERTING into ADMIN.K_COUNTRIES
SET DEFINE OFF;
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('AT','Austria',null,'오스트리아');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('AU','Australia',null,'호주');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('BE','Belgium',null,'벨기에');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('CA','Canada',7,'캐나다');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('CN','China',6,'중국');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('GB','United Kingdom',4,'영국');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('DE','Germany',9,'독일');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('DK','Denmark',null,'덴마크');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('FR','France',10,'프랑스');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('HK','Hong Kong',6,'홍콩');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('KR','South Korea',1,'한국');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('NL','Netherlands',null,'네덜란드');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('JP','Japan',3,'일본');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('RU','Russia',8,'러시아');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('TR','Turkey',null,'터키');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('TW','Taiwan',6,'대만');
Insert into ADMIN.K_COUNTRIES (ID,ENG_NAME,ORDERIDX,KOREAN_NAME) values ('US','United States of America',2,'미국');
--------------------------------------------------------
--  DDL for Index SYS_C0028695
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."SYS_C0028695" ON "ADMIN"."K_COUNTRIES" ("ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  Constraints for Table K_COUNTRIES
--------------------------------------------------------

  ALTER TABLE "ADMIN"."K_COUNTRIES" MODIFY ("ENG_NAME" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."K_COUNTRIES" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;