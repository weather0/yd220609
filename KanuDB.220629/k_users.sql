--------------------------------------------------------
--  파일이 생성됨 - 수요일-6월-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table K_USERS
--------------------------------------------------------

  CREATE TABLE "ADMIN"."K_USERS" 
   (	"EMAIL" VARCHAR2(1000 BYTE) COLLATE "USING_NLS_COMP", 
	"PW" VARCHAR2(200 BYTE) COLLATE "USING_NLS_COMP", 
	"SIGNDATE" DATE DEFAULT CURRENT_TIMESTAMP, 
	"NICK" VARCHAR2(200 BYTE) COLLATE "USING_NLS_COMP", 
	"PREFERENCE1" NUMBER DEFAULT 0, 
	"PREFERENCE2" NUMBER DEFAULT 0, 
	"PREFERENCE3" NUMBER DEFAULT 0, 
	"AUTHORITY" VARCHAR2(200 BYTE) COLLATE "USING_NLS_COMP" DEFAULT user, 
	"BLOCKCHECK" VARCHAR2(2 BYTE) COLLATE "USING_NLS_COMP" DEFAULT 'n', 
	"REPORT" VARCHAR2(2 BYTE) COLLATE "USING_NLS_COMP" DEFAULT 'n', 
	"FILENAME" VARCHAR2(500 BYTE) COLLATE "USING_NLS_COMP", 
	"DIRECTORYFILENAME" VARCHAR2(500 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;

   COMMENT ON COLUMN "ADMIN"."K_USERS"."NICK" IS '닉네임';
   COMMENT ON COLUMN "ADMIN"."K_USERS"."AUTHORITY" IS '권한';
   COMMENT ON COLUMN "ADMIN"."K_USERS"."BLOCKCHECK" IS '계정 밴여부';
   COMMENT ON COLUMN "ADMIN"."K_USERS"."REPORT" IS '신고 여부 판별';
   COMMENT ON COLUMN "ADMIN"."K_USERS"."FILENAME" IS '프로필파일';
   COMMENT ON COLUMN "ADMIN"."K_USERS"."DIRECTORYFILENAME" IS '프로필디렉토리

';
REM INSERTING into ADMIN.K_USERS
SET DEFINE OFF;
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('kwonyuj1996@naver.com','myJava0508',to_date('22/06/21','RR/MM/DD'),'YuJin',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('khdgs','14315',to_date('22/06/21','RR/MM/DD'),'fdas',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('test@aa.aa','asd123!@#',to_date('22/06/22','RR/MM/DD'),'테스트',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('abc@acc.com','123',to_date('22/06/14','RR/MM/DD'),'admin테스트',0,0,0,'admin','n','y','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('b@b.b','123',to_date('22/06/14','RR/MM/DD'),'test22',16,16,99,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('kwonyuj1996@gmail.com','Kanumovie0508@',to_date('22/06/22','RR/MM/DD'),'유지니',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('test2@a.a','123',to_date('22/06/18','RR/MM/DD'),'test2',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('hoo788@gmail.com','6BXsDoRb2g',to_date('22/06/21','RR/MM/DD'),'도도새',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('kyokyo@naver.com','q1w2e31!',to_date('22/06/22','RR/MM/DD'),'tokyo',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('kokoa@kokoa.com','kokoakokoa1!',to_date('22/06/22','RR/MM/DD'),'awfe',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('rolrol@gmail.com','1q2w3e4r1!',to_date('22/06/22','RR/MM/DD'),'롤롤',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('test1','111',to_date('22/06/14','RR/MM/DD'),'종혁이',14,12,28,'user','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('test11@a.a','asd123!@#',to_date('22/06/16','RR/MM/DD'),'test33',12,16,28,'USER','n','y','cathi.png','cathi1.png');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('test1111@add.adf','asdf!@#!34',to_date('22/06/21','RR/MM/DD'),'asdfdsaf',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('wd@wadwdea.com','waef@EFsdf3r',to_date('22/06/22','RR/MM/DD'),'feef',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('toto@toto.com','totototo1!',to_date('22/06/22','RR/MM/DD'),'toto',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('hoo788@gamil.com','1234',to_date('22/06/13','RR/MM/DD'),'도도새',14,12,28,'user','y','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('rmsgud135796@naver.com','1234',to_date('22/06/13','RR/MM/DD'),'하이',14,12,28,'user','y','n','MVC2.jpg','MVC2.jpg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('dlsfi2424@naver.com','1234',to_date('22/06/13','RR/MM/DD'),'하이',14,12,28,'user','y','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('rbcksdl@naver.com','1234',to_date('22/06/13','RR/MM/DD'),'규찬',14,12,28,'user','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('lolo@naver.com','lolololo1!',to_date('22/06/22','RR/MM/DD'),'롤롤!',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('aweawef@efoajwf.com','wjfekj23jfawijf#',to_date('22/06/22','RR/MM/DD'),'kkkanu',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('file@f.f','123',to_date('22/06/16','RR/MM/DD'),'filetest',12,16,99,'USER','n','n','cathi.png','cathi5.png');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('awefawef','123',to_date('22/06/20','RR/MM/DD'),'awefawefa',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('del1@d.d','123',to_date('22/06/20','RR/MM/DD'),'123',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('q@q','123',to_date('22/06/20','RR/MM/DD'),'동육낙볶',14,18,12,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('hoo788@naver.com','q9E$m9hpRA',to_date('22/06/21','RR/MM/DD'),'카카오계정',18,12,28,'USER','n','n','chun.jpg','chun1.jpg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('rolrol@naver.com','112233qq!',to_date('22/06/22','RR/MM/DD'),'영화보쟈',0,0,0,'USER','n','n','default.jpeg','default.jpeg');
Insert into ADMIN.K_USERS (EMAIL,PW,SIGNDATE,NICK,PREFERENCE1,PREFERENCE2,PREFERENCE3,AUTHORITY,BLOCKCHECK,REPORT,FILENAME,DIRECTORYFILENAME) values ('pak5893@naver.com','rmsgud!!',to_date('22/06/22','RR/MM/DD'),'GH PARK',12,28,14,'USER','n','y','default.jpeg','default.jpeg');
--------------------------------------------------------
--  DDL for Index SYS_C0024353
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."SYS_C0024353" ON "ADMIN"."K_USERS" ("EMAIL") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  Constraints for Table K_USERS
--------------------------------------------------------

  ALTER TABLE "ADMIN"."K_USERS" ADD PRIMARY KEY ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
