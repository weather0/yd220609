--------------------------------------------------------
--  파일이 생성됨 - 수요일-6월-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table K_GENRES
--------------------------------------------------------

  CREATE TABLE "ADMIN"."K_GENRES" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(400 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
REM INSERTING into ADMIN.K_GENRES
SET DEFINE OFF;
Insert into ADMIN.K_GENRES (ID,NAME) values (28,'Action');
Insert into ADMIN.K_GENRES (ID,NAME) values (12,'Adventure');
Insert into ADMIN.K_GENRES (ID,NAME) values (16,'Animation');
Insert into ADMIN.K_GENRES (ID,NAME) values (35,'Comedy');
Insert into ADMIN.K_GENRES (ID,NAME) values (80,'Crime');
Insert into ADMIN.K_GENRES (ID,NAME) values (99,'Documentary');
Insert into ADMIN.K_GENRES (ID,NAME) values (18,'Drama');
Insert into ADMIN.K_GENRES (ID,NAME) values (10751,'Family');
Insert into ADMIN.K_GENRES (ID,NAME) values (14,'Fantasy');
Insert into ADMIN.K_GENRES (ID,NAME) values (36,'History');
Insert into ADMIN.K_GENRES (ID,NAME) values (27,'Horror');
Insert into ADMIN.K_GENRES (ID,NAME) values (10402,'Music');
Insert into ADMIN.K_GENRES (ID,NAME) values (9648,'Mystery');
Insert into ADMIN.K_GENRES (ID,NAME) values (10749,'Romance');
Insert into ADMIN.K_GENRES (ID,NAME) values (878,'Science Fiction');
Insert into ADMIN.K_GENRES (ID,NAME) values (10770,'TV Movie');
Insert into ADMIN.K_GENRES (ID,NAME) values (53,'Thriller');
Insert into ADMIN.K_GENRES (ID,NAME) values (10752,'War');
Insert into ADMIN.K_GENRES (ID,NAME) values (37,'Western');
--------------------------------------------------------
--  DDL for Index SYS_C0024383
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."SYS_C0024383" ON "ADMIN"."K_GENRES" ("ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  Constraints for Table K_GENRES
--------------------------------------------------------

  ALTER TABLE "ADMIN"."K_GENRES" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
