-- 테이블에 일부 문제가 있어 수정함
--------------------------------------------------------
--  파일이 생성됨 - 토요일-7월-25-2020   
--------------------------------------------------------
DROP TABLE "J20200701"."S_COMM";
--------------------------------------------------------
--  DDL for Table S_COMM
--------------------------------------------------------

  CREATE TABLE "J20200701"."S_COMM" 
   (	"R_IDX" NUMBER, 
	"S_IDX" VARCHAR2(100 BYTE), 
	"ID" VARCHAR2(30 BYTE), 
	"R_OP" VARCHAR2(50 BYTE), 
	"R_CONTENT" VARCHAR2(4000 BYTE), 
	"R_REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "J20200701"."S_COMM"."R_IDX" IS '응답번호';
 
   COMMENT ON COLUMN "J20200701"."S_COMM"."S_IDX" IS '설문번호';
 
   COMMENT ON COLUMN "J20200701"."S_COMM"."ID" IS '회원아이디';
 
   COMMENT ON COLUMN "J20200701"."S_COMM"."R_OP" IS '투표항목';
 
   COMMENT ON COLUMN "J20200701"."S_COMM"."R_CONTENT" IS '내용';
 
   COMMENT ON COLUMN "J20200701"."S_COMM"."R_REGDATE" IS '작성일자';
 
   COMMENT ON TABLE "J20200701"."S_COMM"  IS '설문응답';
REM INSERTING into J20200701.S_COMM
SET DEFINE OFF;
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (1,'1','hongil2','1','뭐야 이게',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (2,'1','hongil5','2','당연히 오딘이 이기지',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (3,'2','hongil9','1','이걸 말이라고 하나',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (4,'3','hongil2','1','당근이죠',to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (5,'4','hongil5','1','제 생각은 그렇지만 다른 분들 생각도 궁금해요',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (6,'5','hongil7','2','ㄳㄳ',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (7,'6','hongil2','2','이게 뭐에요',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (8,'5','hongil4','1','잘못 눌렀어요',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (9,'8','hongil7','2','댓글 기능 테스트입니다',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (R_IDX,S_IDX,ID,R_OP,R_CONTENT,R_REGDATE) values (10,'10','hongil11','3','가을이죠 당연하',to_date('20/07/25','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index PK_S_COMM
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."PK_S_COMM" ON "J20200701"."S_COMM" ("S_IDX", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table S_COMM
--------------------------------------------------------

  ALTER TABLE "J20200701"."S_COMM" ADD CONSTRAINT "PK_S_COMM" PRIMARY KEY ("S_IDX", "ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "J20200701"."S_COMM" MODIFY ("R_IDX" NOT NULL ENABLE);
 
  ALTER TABLE "J20200701"."S_COMM" MODIFY ("S_IDX" NOT NULL ENABLE);
 
  ALTER TABLE "J20200701"."S_COMM" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table S_COMM
--------------------------------------------------------

  ALTER TABLE "J20200701"."S_COMM" ADD CONSTRAINT "S_COMM_FK1" FOREIGN KEY ("S_IDX")
	  REFERENCES "J20200701"."SUR" ("S_IDX") ENABLE;
 
  ALTER TABLE "J20200701"."S_COMM" ADD CONSTRAINT "S_COMM_FK2" FOREIGN KEY ("ID")
	  REFERENCES "J20200701"."MEMBER" ("ID") ENABLE;
