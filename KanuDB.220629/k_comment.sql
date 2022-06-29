--------------------------------------------------------
--  파일이 생성됨 - 수요일-6월-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table K_COMMENT
--------------------------------------------------------

  CREATE TABLE "ADMIN"."K_COMMENT" 
   (	"C_ID" NUMBER, 
	"C_COMMENT" VARCHAR2(3000 BYTE) COLLATE "USING_NLS_COMP", 
	"C_DATE" DATE, 
	"ID" NUMBER, 
	"EMAIL" VARCHAR2(1000 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
REM INSERTING into ADMIN.K_COMMENT
SET DEFINE OFF;
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (227,'방가방가',to_date('22/06/21','RR/MM/DD'),338953,'hoo788@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (230,'코멘트',to_date('22/06/21','RR/MM/DD'),752623,'q@q');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (233,'너무너무 재밋겟다',to_date('22/06/22','RR/MM/DD'),507086,'test11@a.a');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (256,'Harry Potter',to_date('22/06/22','RR/MM/DD'),674,'b@b.b');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (203,'1111',to_date('22/06/21','RR/MM/DD'),338953,'dlsfi2424@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (231,'버즈 라이트 이어',to_date('22/06/22','RR/MM/DD'),718789,'hoo788@gamil.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (232,'안녕하세요 규찬이에요 2',to_date('22/06/22','RR/MM/DD'),675353,'hoo788@gamil.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (260,'덤블도어',to_date('22/06/22','RR/MM/DD'),338953,'rolrol@gmail.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (261,'오오 오이형님 !',to_date('22/06/22','RR/MM/DD'),453395,'rolrol@gmail.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (201,'사라질까요',to_date('22/06/21','RR/MM/DD'),338953,'dlsfi2424@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (225,'Harry Potter~',to_date('22/06/21','RR/MM/DD'),767,'b@b.b');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (248,'zzz',to_date('22/06/22','RR/MM/DD'),831946,'test11@a.a');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (226,'Abracadabra',to_date('22/06/21','RR/MM/DD'),767,'b@b.b');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (228,'사랑합니다',to_date('22/06/21','RR/MM/DD'),338953,'hoo788@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (235,'아직 한발 남았다..',to_date('22/06/22','RR/MM/DD'),51608,'hoo788@gamil.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (238,'안타까운 사고네요..',to_date('22/06/22','RR/MM/DD'),589761,'pak5893@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (239,'다시봐도 명작 ..!',to_date('22/06/22','RR/MM/DD'),610150,'pak5893@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (253,'스파이더 헤드 보고싶다',to_date('22/06/22','RR/MM/DD'),615469,'kwonyuj1996@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (245,'안녕하세ㅛ',to_date('22/06/22','RR/MM/DD'),479718,'q@q');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (254,'차단당한 계정은 댓글이 출력되지 않아야합니다.',to_date('22/06/22','RR/MM/DD'),718789,'pak5893@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (191,'댓글',to_date('22/06/21','RR/MM/DD'),675353,'test1');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (246,'재미없당',to_date('22/06/22','RR/MM/DD'),818397,'q@q');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (258,'집에 가고싶다.',to_date('22/06/22','RR/MM/DD'),338953,'kokoa@kokoa.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (229,'1111',to_date('22/06/21','RR/MM/DD'),718789,'test11@a.a');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (234,'메이는 13살',to_date('22/06/22','RR/MM/DD'),508947,'hoo788@gamil.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (236,'매버릭은 파일럿',to_date('22/06/22','RR/MM/DD'),361743,'pak5893@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (247,'-관리자-
모두들 나가주세요. 혼자있고 싶네요',to_date('22/06/22','RR/MM/DD'),338953,'abc@acc.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (257,'Harry Potter Returns~',to_date('22/06/22','RR/MM/DD'),899082,'b@b.b');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (251,'메이의 새빨간 비밀~
귀여워요~',to_date('22/06/22','RR/MM/DD'),508947,'kwonyuj1996@gmail.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (252,'닥터 스트레인지~',to_date('22/06/22','RR/MM/DD'),453395,'kwonyuj1996@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (259,'재밌겠다',to_date('22/06/22','RR/MM/DD'),453395,'kokoa@kokoa.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (200,'테스트',to_date('22/06/21','RR/MM/DD'),338953,'dlsfi2424@naver.com');
Insert into ADMIN.K_COMMENT (C_ID,C_COMMENT,C_DATE,ID,EMAIL) values (202,null,to_date('22/06/21','RR/MM/DD'),338953,'dlsfi2424@naver.com');
--------------------------------------------------------
--  DDL for Index SYS_C0024369
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."SYS_C0024369" ON "ADMIN"."K_COMMENT" ("C_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  Constraints for Table K_COMMENT
--------------------------------------------------------

  ALTER TABLE "ADMIN"."K_COMMENT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."K_COMMENT" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."K_COMMENT" ADD PRIMARY KEY ("C_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table K_COMMENT
--------------------------------------------------------

  ALTER TABLE "ADMIN"."K_COMMENT" ADD CONSTRAINT "COMMENT_FK_ID" FOREIGN KEY ("ID")
	  REFERENCES "ADMIN"."K_MOVIES" ("ID") ENABLE;
  ALTER TABLE "ADMIN"."K_COMMENT" ADD CONSTRAINT "COMMENT_FK_EMAIL" FOREIGN KEY ("EMAIL")
	  REFERENCES "ADMIN"."K_USERS" ("EMAIL") ON DELETE CASCADE ENABLE;
