--------------------------------------------------------
--  파일이 생성됨 - 수요일-6월-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table K_HISTORY
--------------------------------------------------------

  CREATE TABLE "ADMIN"."K_HISTORY" 
   (	"HISTORY_ID" NUMBER, 
	"ID" NUMBER, 
	"EMAIL" VARCHAR2(1000 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
REM INSERTING into ADMIN.K_HISTORY
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C0024364
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."SYS_C0024364" ON "ADMIN"."K_HISTORY" ("HISTORY_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  Constraints for Table K_HISTORY
--------------------------------------------------------

  ALTER TABLE "ADMIN"."K_HISTORY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."K_HISTORY" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."K_HISTORY" ADD PRIMARY KEY ("HISTORY_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table K_HISTORY
--------------------------------------------------------

  ALTER TABLE "ADMIN"."K_HISTORY" ADD CONSTRAINT "HISTORY_FK_ID" FOREIGN KEY ("ID")
	  REFERENCES "ADMIN"."K_MOVIES" ("ID") ENABLE;
  ALTER TABLE "ADMIN"."K_HISTORY" ADD CONSTRAINT "HISTORY_FK_EMAIL" FOREIGN KEY ("EMAIL")
	  REFERENCES "ADMIN"."K_USERS" ("EMAIL") ENABLE;
