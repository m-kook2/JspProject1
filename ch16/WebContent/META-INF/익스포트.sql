--------------------------------------------------------
--  파일이 생성됨 - 금요일-8월-14-2020   
--------------------------------------------------------
DROP TABLE "J20200701"."BOARD" cascade constraints;
DROP TABLE "J20200701"."BOOK_MIND" cascade constraints;
DROP TABLE "J20200701"."COMM" cascade constraints;
DROP TABLE "J20200701"."CS" cascade constraints;
DROP TABLE "J20200701"."MEMBER" cascade constraints;
DROP TABLE "J20200701"."MOVIE_INFO" cascade constraints;
DROP TABLE "J20200701"."REVIEW" cascade constraints;
DROP TABLE "J20200701"."SUR" cascade constraints;
DROP TABLE "J20200701"."S_COMM" cascade constraints;
DROP PROCEDURE "J20200701"."BOOK_MIND_ARRAY";
DROP PROCEDURE "J20200701"."MEM_ORDER_BY";
DROP PROCEDURE "J20200701"."SUR_ARRANGE";
DROP PROCEDURE "J20200701"."SUR_MINUS";
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "J20200701"."BOARD" 
   (	"NUM" NUMBER, 
	"WRITER" VARCHAR2(20 BYTE), 
	"SUBJECT" VARCHAR2(20 BYTE), 
	"CONTENT" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"READCOUNT" NUMBER, 
	"PASSWD" VARCHAR2(20 BYTE), 
	"REF" NUMBER, 
	"RE_STEP" NUMBER, 
	"RE_LEVEL" NUMBER, 
	"IP" VARCHAR2(20 BYTE), 
	"REG_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOOK_MIND
--------------------------------------------------------

  CREATE TABLE "J20200701"."BOOK_MIND" 
   (	"ID" VARCHAR2(30 BYTE), 
	"M_IDX" NUMBER, 
	"IDX" NUMBER, 
	"REG_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "J20200701"."BOOK_MIND"."ID" IS '회원아이디';
   COMMENT ON COLUMN "J20200701"."BOOK_MIND"."M_IDX" IS '영화번호';
   COMMENT ON COLUMN "J20200701"."BOOK_MIND"."IDX" IS '순번';
   COMMENT ON COLUMN "J20200701"."BOOK_MIND"."REG_DATE" IS '등록날짜';
   COMMENT ON TABLE "J20200701"."BOOK_MIND"  IS '즐겨찾기-찜하기';
--------------------------------------------------------
--  DDL for Table COMM
--------------------------------------------------------

  CREATE TABLE "J20200701"."COMM" 
   (	"C_IDX" NUMBER, 
	"ID" VARCHAR2(30 BYTE), 
	"C_CONTENT" VARCHAR2(4000 BYTE), 
	"C_SYMPATHY" NUMBER, 
	"C_UNSYMPATHY" NUMBER, 
	"C_GRADE" NUMBER, 
	"C_DATE" DATE, 
	"DEL_YN" VARCHAR2(2 BYTE), 
	"M_IDX" NUMBER, 
	"STEP" NUMBER, 
	"DEP" NUMBER, 
	"OVERLAP" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "J20200701"."COMM"."C_IDX" IS '댓글번호';
   COMMENT ON COLUMN "J20200701"."COMM"."ID" IS '회원아이디';
   COMMENT ON COLUMN "J20200701"."COMM"."C_CONTENT" IS '댓글내용';
   COMMENT ON COLUMN "J20200701"."COMM"."C_SYMPATHY" IS '공감수';
   COMMENT ON COLUMN "J20200701"."COMM"."C_UNSYMPATHY" IS '비공감수';
   COMMENT ON COLUMN "J20200701"."COMM"."C_GRADE" IS '평점';
   COMMENT ON COLUMN "J20200701"."COMM"."C_DATE" IS '작성일자';
   COMMENT ON COLUMN "J20200701"."COMM"."DEL_YN" IS '삭제여부';
   COMMENT ON COLUMN "J20200701"."COMM"."M_IDX" IS '영화번호';
   COMMENT ON COLUMN "J20200701"."COMM"."STEP" IS '스탭';
   COMMENT ON COLUMN "J20200701"."COMM"."DEP" IS '깊이';
   COMMENT ON COLUMN "J20200701"."COMM"."OVERLAP" IS '중복';
   COMMENT ON TABLE "J20200701"."COMM"  IS '댓글';
--------------------------------------------------------
--  DDL for Table CS
--------------------------------------------------------

  CREATE TABLE "J20200701"."CS" 
   (	"C_IDX" NUMBER(*,0), 
	"WRITER" VARCHAR2(20 BYTE), 
	"SUBJECT" VARCHAR2(30 BYTE), 
	"CONTENT" VARCHAR2(100 BYTE), 
	"REG_DATE" DATE, 
	"REF" NUMBER, 
	"RE_STEP" NUMBER, 
	"RE_LEVEL" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "J20200701"."CS"."REF" IS '답변글끼리 그룹';
   COMMENT ON COLUMN "J20200701"."CS"."RE_STEP" IS 'ref내의 순서';
   COMMENT ON COLUMN "J20200701"."CS"."RE_LEVEL" IS '들여쓰기';
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "J20200701"."MEMBER" 
   (	"ID" VARCHAR2(30 BYTE), 
	"IDX" NUMBER(20,0), 
	"PASSWORD" VARCHAR2(30 BYTE), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"NICKNAME" VARCHAR2(30 BYTE), 
	"GENDER" VARCHAR2(30 BYTE), 
	"REG_DATE" VARCHAR2(30 BYTE), 
	"DEL_YN" VARCHAR2(30 BYTE), 
	"STATUS" VARCHAR2(30 BYTE), 
	"PIC" VARCHAR2(30 BYTE), 
	"ZIP" VARCHAR2(200 BYTE), 
	"ADDR" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "J20200701"."MEMBER"."ID" IS '회원아이디';
   COMMENT ON COLUMN "J20200701"."MEMBER"."IDX" IS '순번';
   COMMENT ON COLUMN "J20200701"."MEMBER"."PASSWORD" IS '비밀번호';
   COMMENT ON COLUMN "J20200701"."MEMBER"."EMAIL" IS '이메일';
   COMMENT ON COLUMN "J20200701"."MEMBER"."NICKNAME" IS '닉네임';
   COMMENT ON COLUMN "J20200701"."MEMBER"."GENDER" IS '성별';
   COMMENT ON COLUMN "J20200701"."MEMBER"."REG_DATE" IS '가입일';
   COMMENT ON COLUMN "J20200701"."MEMBER"."DEL_YN" IS '탈퇴여부';
   COMMENT ON COLUMN "J20200701"."MEMBER"."STATUS" IS '회원상태';
   COMMENT ON COLUMN "J20200701"."MEMBER"."PIC" IS '사진';
   COMMENT ON COLUMN "J20200701"."MEMBER"."ZIP" IS '우편번호';
   COMMENT ON COLUMN "J20200701"."MEMBER"."ADDR" IS '주소';
   COMMENT ON TABLE "J20200701"."MEMBER"  IS '회원 ';
--------------------------------------------------------
--  DDL for Table MOVIE_INFO
--------------------------------------------------------

  CREATE TABLE "J20200701"."MOVIE_INFO" 
   (	"M_IDX" NUMBER, 
	"M_NAME" VARCHAR2(100 BYTE), 
	"M_GENRE" VARCHAR2(100 BYTE), 
	"M_DATE" DATE, 
	"M_NATION" VARCHAR2(100 BYTE), 
	"M_TIME" NUMBER(30,0), 
	"M_RATE" VARCHAR2(30 BYTE), 
	"M_STORY" VARCHAR2(4000 BYTE), 
	"M_CAST" VARCHAR2(200 BYTE), 
	"M_DIRECTOR" VARCHAR2(100 BYTE), 
	"M_PHOTO" VARCHAR2(2000 BYTE), 
	"M_VIDEO" VARCHAR2(2000 BYTE), 
	"M_POSTER" VARCHAR2(2000 BYTE), 
	"ID" VARCHAR2(100 BYTE), 
	"DEL_YN" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_IDX" IS '영화번호';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_NAME" IS '영화이름';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_GENRE" IS '영화장르';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_DATE" IS '영화개봉일';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_NATION" IS '영화국적';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_TIME" IS '상영시간';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_RATE" IS '등급';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_STORY" IS '줄거리';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_CAST" IS '출연진';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_DIRECTOR" IS '영화감독';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_PHOTO" IS '포토';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_VIDEO" IS '동영상';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."M_POSTER" IS '포스터';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."ID" IS '관리자아이디';
   COMMENT ON COLUMN "J20200701"."MOVIE_INFO"."DEL_YN" IS '삭제여부';
   COMMENT ON TABLE "J20200701"."MOVIE_INFO"  IS '영화정보';
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "J20200701"."REVIEW" 
   (	"P_IDX" NUMBER, 
	"P_TITLE" VARCHAR2(20 BYTE), 
	"P_CONTENT" VARCHAR2(4000 BYTE), 
	"P_DATE" DATE, 
	"ID" VARCHAR2(30 BYTE), 
	"M_IDX" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "J20200701"."REVIEW"."P_IDX" IS '게시글 번호';
   COMMENT ON COLUMN "J20200701"."REVIEW"."P_TITLE" IS '제목';
   COMMENT ON COLUMN "J20200701"."REVIEW"."P_CONTENT" IS '내용';
   COMMENT ON COLUMN "J20200701"."REVIEW"."P_DATE" IS '작성일자';
   COMMENT ON COLUMN "J20200701"."REVIEW"."ID" IS '관리자아이디';
   COMMENT ON COLUMN "J20200701"."REVIEW"."M_IDX" IS '영화번호';
   COMMENT ON TABLE "J20200701"."REVIEW"  IS '리뷰게시판';
--------------------------------------------------------
--  DDL for Table SUR
--------------------------------------------------------

  CREATE TABLE "J20200701"."SUR" 
   (	"S_IDX" NUMBER, 
	"S_SUB" VARCHAR2(100 BYTE), 
	"S_SDATE" DATE, 
	"S_EDATE" DATE, 
	"S_CONTENT" VARCHAR2(2000 BYTE), 
	"S_OP1" VARCHAR2(50 BYTE), 
	"S_OP2" VARCHAR2(50 BYTE), 
	"S_OP3" VARCHAR2(50 BYTE), 
	"S_OP4" VARCHAR2(50 BYTE), 
	"S_OP5" VARCHAR2(50 BYTE), 
	"ID" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "J20200701"."SUR"."S_IDX" IS '설문번호';
   COMMENT ON COLUMN "J20200701"."SUR"."S_SUB" IS '제목';
   COMMENT ON COLUMN "J20200701"."SUR"."S_SDATE" IS '시작일';
   COMMENT ON COLUMN "J20200701"."SUR"."S_EDATE" IS '종료일';
   COMMENT ON COLUMN "J20200701"."SUR"."S_CONTENT" IS '소개글';
   COMMENT ON COLUMN "J20200701"."SUR"."S_OP1" IS '항목1';
   COMMENT ON COLUMN "J20200701"."SUR"."S_OP2" IS '항목2';
   COMMENT ON COLUMN "J20200701"."SUR"."S_OP3" IS '항목3';
   COMMENT ON COLUMN "J20200701"."SUR"."S_OP4" IS '항목4';
   COMMENT ON COLUMN "J20200701"."SUR"."S_OP5" IS '항목5';
   COMMENT ON COLUMN "J20200701"."SUR"."ID" IS '관리자아이디';
   COMMENT ON TABLE "J20200701"."SUR"  IS '설문조사 게시판';
--------------------------------------------------------
--  DDL for Table S_COMM
--------------------------------------------------------

  CREATE TABLE "J20200701"."S_COMM" 
   (	"S_IDX" NUMBER, 
	"ID" VARCHAR2(30 BYTE), 
	"R_IDX" NUMBER, 
	"R_OP" VARCHAR2(50 BYTE), 
	"R_CONTENT" VARCHAR2(4000 BYTE), 
	"R_REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "J20200701"."S_COMM"."S_IDX" IS '설문번호';
   COMMENT ON COLUMN "J20200701"."S_COMM"."ID" IS '회원아이디';
   COMMENT ON COLUMN "J20200701"."S_COMM"."R_IDX" IS '응답번호';
   COMMENT ON COLUMN "J20200701"."S_COMM"."R_OP" IS '투표항목';
   COMMENT ON COLUMN "J20200701"."S_COMM"."R_CONTENT" IS '내용';
   COMMENT ON COLUMN "J20200701"."S_COMM"."R_REGDATE" IS '작성일자';
   COMMENT ON TABLE "J20200701"."S_COMM"  IS '설문응답';
REM INSERTING into J20200701.BOARD
SET DEFINE OFF;
Insert into J20200701.BOARD (NUM,WRITER,SUBJECT,CONTENT,EMAIL,READCOUNT,PASSWD,REF,RE_STEP,RE_LEVEL,IP,REG_DATE) values (1,'1','1','1','test@naver.com',2,'1',1,0,0,'0:0:0:0:0:0:0:1',to_date('20/07/22','RR/MM/DD'));
REM INSERTING into J20200701.BOOK_MIND
SET DEFINE OFF;
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil3',5,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil3',6,2,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',9,3,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',10,4,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',11,5,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',12,6,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',13,7,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',14,8,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',15,9,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',16,10,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',17,11,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',18,12,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil2',19,13,to_date('20/07/28','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',30,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',29,2,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',28,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',27,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',26,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',25,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',24,7,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',23,8,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',22,9,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',21,10,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',20,11,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',19,12,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil10',18,13,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil3',7,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil3',8,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil3',9,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil3',10,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil3',11,7,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil3',12,8,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil3',13,9,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',14,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',5,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',6,2,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',7,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',8,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',9,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',10,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',111,7,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',12,8,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',13,9,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil5',15,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil6',2,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil6',3,2,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil6',4,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil6',5,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil6',6,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil7',1,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil8',11,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil8',12,2,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil8',13,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil8',14,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil8',15,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil8',16,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil8',17,7,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil9',18,2,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',10,2,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',11,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',12,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',13,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',14,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',15,7,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',16,8,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',17,9,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',18,10,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil9',20,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil9',21,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil9',22,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil9',23,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil7',2,2,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil7',3,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil7',4,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil7',5,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil7',6,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil5',16,2,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil5',17,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil5',18,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil5',19,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',16,3,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',17,4,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',18,5,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',19,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',21,8,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',22,9,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',23,10,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',24,11,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',25,12,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',26,13,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',27,14,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',28,15,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil4',14,10,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil5',20,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil6',1,6,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil7',7,7,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil8',10,8,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil9',19,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('hongil11',19,1,to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.BOOK_MIND (ID,M_IDX,IDX,REG_DATE) values ('admin',29,16,to_date('20/07/16','RR/MM/DD'));
REM INSERTING into J20200701.COMM
SET DEFINE OFF;
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (3,'admin','7번째 영화의 세번째 댓글',4,1,6,to_date('20/08/06','RR/MM/DD'),'N',7,0,0,'admin|hongil2|hongi');
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (4,'admin','7번째 영화의 세번째 댓글의 첫번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,3,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (5,'admin','7번째 영화의 세번째 댓글의 두번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,3,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (7,'admin','7번쨰 영화의 첫댓글의 첫번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,1,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (8,'admin','7번쨰 영화의 첫댓글의 두번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,1,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (9,'admin','7번쨰 영화의 두번째 댓글의 첫번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,2,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (10,'admin','7번쨰 영화의 두번째 댓글의 두번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,2,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (1,'admin','7번쨰 영화의  첫댓글',1,0,10,to_date('20/08/06','RR/MM/DD'),'N',7,0,0,'admin');
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (2,'admin','7번쨰 영화의 두번째 댓글',0,1,8,to_date('20/08/06','RR/MM/DD'),'N',7,0,0,'admin');
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (11,'hongil2','7번째 영화의 네번째 댓글',0,0,8,to_date('20/08/14','RR/MM/DD'),'N',7,0,0,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (12,'hongil2','10번째 영화 게시판의 첫댓글',0,0,8,to_date('20/08/14','RR/MM/DD'),'N',10,0,0,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (14,'admin','10번째 영화 게시판의 세번째 댓글',0,0,9,to_date('20/08/14','RR/MM/DD'),'N',10,0,0,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (15,'admin','10번째 영화 게시판의 세번째 댓글의 첫번째 답글',0,0,null,to_date('20/08/14','RR/MM/DD'),'N',10,14,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (16,'admin','10번째 영화 게시판의 세번째 댓글의 두번째 답글',0,0,null,to_date('20/08/14','RR/MM/DD'),'N',10,14,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (17,'hongil2','10번째 영화 게시판의 세번째 댓글의 세번째 답글',0,0,null,to_date('20/08/14','RR/MM/DD'),'N',10,14,1,null);
REM INSERTING into J20200701.CS
SET DEFINE OFF;
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (12,'hongil2','마음에 안들어요ㅎ','				hongil3 댓글 진짜 ㅡㅡㅎ',to_date('20/08/03','RR/MM/DD'),12,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (9,'hongil3','이게 뭐야','hongil4 탈퇴부탁해요',to_date('20/08/01','RR/MM/DD'),9,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (11,'hongil3','짜증나요','hongil2 인성보소',to_date('20/08/03','RR/MM/DD'),11,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (8,'hongil4','화가 나네요','hongil3 댓글 보셨나요',to_date('20/08/01','RR/MM/DD'),8,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (7,'hongil5','말이 되나요','관리자님 일 좀 하세요',to_date('20/08/01','RR/MM/DD'),7,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (6,'hongil6','관리자님','hongil11 탈퇴 ㄱㄱ',to_date('20/08/01','RR/MM/DD'),6,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (5,'hongil7','이건 좀..','아니지않나요?댓글관리좀',to_date('20/07/07','RR/MM/DD'),5,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (4,'hongil8','글쎄요','hongil6 아닌거같아요',to_date('20/07/07','RR/MM/DD'),4,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (3,'hongil9','와 진짜','관리자님 힘내세요',to_date('20/07/07','RR/MM/DD'),3,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (2,'hongil10','장난하나요','이 사이트 너무 좋잖아 ㅎㅎ',to_date('20/07/07','RR/MM/DD'),2,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,'hongil11','신고합니다','팝콘리뷰 내 마음 속에 신고',to_date('20/07/07','RR/MM/DD'),1,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (15,'admin','답글','넵!',to_date('20/08/03','RR/MM/DD'),9,1,1);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (16,'hongil2','ff','ff',to_date('20/08/03','RR/MM/DD'),16,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (13,'admin','답글','저희 사이트를 사랑해주셔서 감사합니다^^',to_date('20/08/03','RR/MM/DD'),2,1,1);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (14,'admin','답글','항상 사랑해주세요',to_date('20/08/03','RR/MM/DD'),2,2,2);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (10,'admin','회원님들','진정하세요',to_date('20/08/03','RR/MM/DD'),10,0,0);
REM INSERTING into J20200701.MEMBER
SET DEFINE OFF;
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('admin',1,'2468','email1@gmail.com','nickname2','남자','2020/07/01','N','2','who.jpg','1234-5678','서울시 강남구');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil2',2,'2468','email2@gmail.com','nickname3','여자','2010/07/01','N','1','mangu.jpg','3434-45','서울시 송파구');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil3',3,'2468','email4@3gmail.com','nickname4','남자','2030/07/01','N','1','chulsu.jpg','5643-098','경기도 용인시');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil4',4,'2468','email5@gmail.com','nickname6','남자','2019/07/01','N','1','bike.jpg','1345-65','서울시 영등포구');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil5',5,'2468','email6@gmail.com','nickname7','여자','2018/07/01','N','1','jjangu.png','764-765','경기도 남양주시');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil6',6,'2468','email6@gmail.com','nickname9','남자','2021/07/01','N','3','oops.jpg','546-2345','서울시 강동구');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil7',7,'2468','email8@gmail.com','nickname5','여자','2019/07/01','N','3','wow.jpg','324-876','서울시 광진구');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil8',8,'2468','email9@gmail.com','nickname54','남자','2018/07/01','N','1','sun.jpg','724-1234','미국 맨하탄');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil9',9,'2468','email@5gmail.com','nickname54','여자','2023/07/01','N','3','universer.jpg','324-8435','프랑스 파리');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil10',10,'2468','email75@gmail.com','nickname43','여자','2020/07/01','N','1','main2.jpg','134-5456','르완다 카이옌치');
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil11',11,'2468','email@43gmail.com','nickname78','남자','2020/07/01','N','1','ho.jpg','867-235','독일 프랑크프루트');
REM INSERTING into J20200701.MOVIE_INFO
SET DEFINE OFF;
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (10,'터미네이터 2:오리지널','SF, 액션, 스릴러',to_date('91/07/06','RR/MM/DD'),'미국',137,'15','"인간과 기계의 대전쟁.. 그를 지키지 않으면 미래 또한 없다!

미래, 인류와 기계의 전쟁은 계속 되는 가운데 
 스카이넷은 인류 저항군 사령관 존 코너를 없애기 위해 
 액체 금속형 로봇인 T-1000을 과거의 어린 존 코너에게로 보낸다. 
  
 미래의 인류 운명을 쥔 어린 존 코너. 
 스카이넷의 T-1000은 거침없이 숨 가쁜 추격을 시작하는데…"','아놀드 슈왈제네거, 린다 해밀턴, 에드워드 필롱, 로버트 패트릭','제임스 카메론','photo10.jpg','https://www.youtube.com/embed/MzOcGTPyKr0','poster10.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (12,'덕구','드라마',to_date('18/04/05','RR/MM/DD'),'한국',91,'0','"""당신에게도 소중한 사람이 있습니까?""

어린 손자와 살고 있는 일흔 살 덕구 할배는
 자신에게 주어진 시간이 얼마 남지 않음을 알게 된다.
 세상에 덩그러니 남겨질 두 아이들을 위해
 할배는 자신을 대신할 사람을 찾아주기로 하고,
 홀로 먼 길을 떠나 특별한 선물을 준비하는데.."','이순재, 정지훈, 장광, 성병숙','방수인','photo12.jpg','https://www.youtube.com/embed/lMd5MxnTTo0','poster12.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (16,'아이즈 온 미 : 더 무비','다큐',to_date('20/06/10','RR/MM/DD'),'한국',104,'0','"위즈원 덕분에 이 순간이 HIGHLIGHT!

2018년 10월, 데뷔와 동시에 국내외 음원 및 음반차트 석권, 음악방송 1위, 신인상 수상 등 연일 기록을 경신하며 대세 그룹으로 자리잡은 아이즈원(IZ*ONE), 12명의 소녀들이 스크린에 등장! 
 아이즈원(IZ*ONE)과 위즈원이 함께한 잊을 수 없는 콘서트 현장부터 콘서트 VCR 현장 메이킹, 유닛 신곡 녹음현장, 신곡 안무연습, 현장 리허설 장면 등 다양한 비하인드도 이번 영화를 통해 공개 된다.
 위즈원에게 특별한 추억과 선물이 될 영화, <아이즈 온 미 : 더 무비>가 온다!"','권은비, 미야와키 사쿠라, 강혜원, 최예나',null,'photo16.jpg','https://www.youtube.com/embed/1JsvqaWd_2U','poster16.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (19,'사운드 오브 뮤직','멜로, 로맨스, 뮤지컬, 드라마',to_date('69/10/29','RR/MM/DD'),'미국',172,'0','"알프스에서 들려오는 환상의 하모니! 
세상에서 가장 사랑스러운 합창이 시작된다! 다 함께 도-레-미~♪♬

음악을 사랑하는 말괄량이 견습 수녀 ‘마리아’는 원장 수녀의 권유로 해군 명문 집안 폰 트랩가의 가정교사가 된다. ‘마리아’는 좀처럼 마음의 문을 열지 않는 폰 트랩가의 일곱 아이들에게 노래를 가르치며 점차 교감하게 되고, 엄격한 ‘폰 트랩 대령’ 역시 마음의 문을 열게 된다. 그러던 어느 날, ‘마리아’는 자신이 ‘폰 트랩 대령’을 사랑하고 있다는 사실을 깨닫게 되고, 자신만의 비밀을 간직한 채 아이들의 곁을 떠나 다시 수녀원에 들어가기로 결심하는데…"','줄리 앤드류스, 크리스토퍼 플러머, 엘레노 파커, 리처드 헤이든','로버트 와이즈','photo19.jpg','https://www.youtube.com/embed/2S4AxVjLLuI','poster19.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (24,'위대한 쇼맨','드라마, 뮤지컬',to_date('17/12/20','RR/MM/DD'),'미국',104,'12','"불가능한 꿈, 그 이상의 쇼!

쇼 비즈니스의 창시자이자, 꿈의 무대로 전세계를 매료시킨 남자 
 ‘바넘’의 이야기에서 영감을 받아 탄생한 오리지널 뮤지컬 영화 <위대한 쇼맨>. 
 <레미제라블> 이후 다시 뮤지컬 영화로 돌아온 휴 잭맨부터 잭 에프론, 미셸 윌리엄스, 레베카 퍼거슨, 젠다야까지 
 할리우드 최고의 배우들이 합류해 환상적인 앙상블을 선보인다. 
 여기에 <미녀와 야수> 제작진과 <라라랜드> 작사팀의 합류로 
 더욱 풍성해진 비주얼과 스토리, 음악까지 선보일 <위대한 쇼맨>은 
 ‘우리는 누구나 특별하다’는 메시지로 관객들에게 재미는 물론, 감동까지 선사할 것이다. 
  
 THIS IS ME! 우리는 누구나 특별하다!"','휴 잭맨, 잭 에프론, 미셀 윌리엄스, 레베카 퍼거슨','마이클 그레이시','photo24.jpg','https://www.youtube.com/embed/cnIOq6P8PUU','poster24.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (27,'센과 치히로의 행방불명','애니메이션, 판타지, 모험, 가족',to_date('02/06/28','RR/MM/DD'),'일본',126,'0','"금지된 세계의 문이 열렸다! 
  
 이사 가던 날, 수상한 터널을 지나자 인간에게는 금지된 신들의 세계로 오게 된 치히로.. 
 신들의 음식을 먹은 치히로의 부모님은 돼지로 변해버린다. 
  
 “걱정마, 내가 꼭 구해줄게…” 
  
 겁에 질린 치히로에게 다가온 정체불명의 소년 하쿠. 
 그의 따뜻한 말에 힘을 얻은 치히로는 인간 세계로 돌아가기 위해 사상 초유의 미션을 시작하는데…"','히이라기 루미, 이리노 미유, 나츠키 마리, 나이토 타카시','미야자키 하야오','photo27.jpg','https://www.youtube.com/embed/lwrG3HQXTFw','poster27.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (29,'타이타닉','멜로, 로맨스, 드라마',to_date('98/02/20','RR/MM/DD'),'미국',194,'15','"“내 인생의 가장 큰 행운은 도박에서 딴 티켓으로 당신을 만난 거야”
단 하나의 운명, 단 한 번의 사랑,
영원으로 기억될 세기의 러브 스토리

우연한 기회로 티켓을 구해 타이타닉호에 올라탄 자유로운 영혼을 가진 화가 잭(레오나르도 디카프리오)은 
 막강한 재력의 약혼자와 함께 1등실에 승선한 로즈(케이트 윈슬렛)에게 한 눈에 반한다. 
 진실한 사랑을 꿈꾸던 로즈 또한 생애 처음 황홀한 감정에 휩싸이고, 둘은 운명 같은 사랑에 빠지는데…"','레오나르도 디카프리오, 케이트 윈슬렛, 빌리 제인, 캐시 베이츠','제임스 카메론','photo29.jpg','https://www.youtube.com/embed/xMqz1d4eKSk','poster29.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (2,'가버나움','드라마',to_date('19/01/24','RR/MM/DD'),'프랑스',126,'15','"나를 세상에 태어나게 한 
 ""부모님을 고소하고 싶어요..."" 
 -출생기록조차 없이 살아온 어쩌면 12살 소년 ''자인''으로부터
"
','자인 알 라피아,요르다노스 시프로우,보루와티프 트레저 반콜,나딘 라바키','나딘 라바키','photo2.jpg','https://www.youtube.com/embed/6m3AoljRIJU','poster2.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (6,'아일라','드라마, 전쟁',to_date('18/06/21','RR/MM/DD'),'터키',123,'15','"포화 속 생에 다시 없을 운명 같은 만남, 그리고… 60년간의 그리움
 한국전쟁 참전병 ‘슐레이만’과 5살 소녀 ‘아일라’의 가슴 뜨거운 감동 실화!

1950년 한국전쟁에 파병된 ‘슐레이만’은 칠흑 같은 어둠 속 홀로 남겨진 5살 소녀를 발견한다.
 전쟁과 부모를 잃은 충격 속에 말을 잃은 소녀. ‘슐레이만’은 소녀에게 터키어로 ‘달’이라는 뜻의 ‘아일라’라는 이름을 지어주고 함께 부대로 향한다. 서로에게 무엇과도 바꿀 수 없는 가장 소중한 존재가 된 두 사람. 그러나 행복도 잠시, ‘슐레이만’은 종전과 함께 고국으로 돌아가라는 명령을 받게 되고, ‘아일라’를 끝까지 지켜내기 위해 모두의 반대 속에 자신의 선택을 감행하게 되는데…
 
 전 세계를 감동시킨 위대한 이야기가 찾아온다!"','김설, 이스마일 하지오글루, 세틴 테킨도르, 알리 아타이','잔 울카이','photo6.jpg','https://www.youtube.com/embed/2KYFcT4oVJA','poster6.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (14,'나 홀로 집에','모험, 범죄, 가족, 코미디',to_date('91/07/06','RR/MM/DD'),'미국',105,'0','"이제 혼자 남은 꼬마 캐빈의 기발한 집지키기 전쟁이 시작된다!

크리스마스 시즌의 시카고. 말썽꾸러기라 집안 가족들로부터 욕을 듣고 따돌림 당하는 케빈은 늘 자신은 혼자 살거라면서 가족들이 모두 없어졌으면 좋겠다고 생각한다. 자기의 치즈 피자를 먹은 형과 싸워 소동을 일으키자 엄마는 케빈을 3층 다락방으로 올려보낸다. 케빈의 가족들과 케빈의 집에 온 손님들은 다음 날에 크리스마스 연휴를 이용해 프랑스의 친척 집으로 떠날 계획이었다. 
 그날 밤, 바람이 세차게 불어 전화선과 전기선이 끊긴다. 케빈의 가족들은 늦잠을 자게 되어 비행기 시간을 맞추기 위해 허둥대다가 그만 3층 다락방에서 잠이 든 케빈을 두고 떠난다. 잠에서 깬 케빈은 혼자 남은 것을 알고 하느님이 자신의 소원을 들어주었다고 기뻐한다. 비행기를 타고 가던 케빈의 어머니는 무엇인가 빠뜨린 기분에 고민하다가 케빈을 두고 왔음에 놀란다. 하지만 전화선이 불통이라, 어쩔 수 없다가 프랑스에 도착한 식구들은 목적지로 가고 엄마는 케빈이 걱정이 되어 집으로 돌아갈 비행기표를 사기 위해 안간힘을 쓰지만 연말연휴라 좌석이 없었다. 
 혼자 집에 남은 케빈은 형과 누나 방을 구경하면서 즐거워한다. 그리고 노래를 부르고 트리도 만들면서 자축한다. 그런데 빈집털이 2인조 도둑이 케빈의 집을 호시탐탐 노리고 있다는 것을 알게 되는데..."','맥컬리 컬킨, 조 페시, 다니엘 스턴, 존 허드','크리스 콜럼버스','photo14.jpg','https://www.youtube.com/embed/KpUtdG7XnQY','poster14.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (4,'원더','드라마',to_date('17/12/27','RR/MM/DD'),'미국',113,'0','"“넌 못생기지 않았어, 네게 관심있는 사람은 알게 될 거야”
헬멧 속에 숨었던 아이 ‘어기'', 세상 밖으로 나오다!

누구보다 위트 있고 호기심 많은 매력 부자 ‘어기''(제이콥 트렘블레이).
 하지만 남들과 다른 외모로 태어난 ‘어기''는 모두가 좋아하는 크리스마스 대신 얼굴을 감출 수 있는 할로윈을 더 좋아한다.
 10살이 된 아들에게 더 큰 세상을 보여주고 싶었던 엄마 ‘이사벨’(줄리아 로버츠)과 아빠 ‘네이트’(오웬 윌슨)는 
 ‘어기''를 학교에 보낼 준비를 하고, 동생에게 모든 것을 양보해왔지만 
 누구보다 그를 사랑하는 누나 ‘비아''도 ‘어기''의 첫걸음을 응원해준다.
 
 그렇게 가족이 세상의 전부였던 ‘어기''는 처음으로 헬멧을 벗고 낯선 세상에 용감하게 첫발을 내딛지만 
 첫날부터 ‘남다른 외모''로 화제의 주인공이 되고, 사람들의 시선에 큰 상처를 받는다.
 그러나 ‘어기''는 27번의 성형(?)수술을 견뎌낸 긍정적인 성격으로 다시 한번 용기를 내고, 
 주변 사람들도 하나둘 변하기 시작하는데..."','제이콥 트렘블레이, 줄리아 로버츠, 오웬 윌슨, 이자벨라 비도빅','스티븐 크보스키','photo4.jpg','https://www.youtube.com/embed/cOsTkVLXcmY','poster4.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (1,'그린북','드라마',to_date('19/01/09','RR/MM/DD'),'미국',130,'12','"언제 어디서든 바른 생활! 완벽한 천재 뮤지션 ‘돈 셜리’
원칙보다 반칙! 다혈질 운전사 ‘토니’
취향도, 성격도 완벽히 다른 두 남자의 특별한 우정이 시작된다!

1962년 미국, 입담과 주먹만 믿고 살아가던 토니 발레롱가(비고 모텐슨)는 교양과 우아함 그 자체인 
 천재 피아니스트 돈 셜리(마허샬라 알리) 박사의 운전기사 면접을 보게 된다. 
  
 백악관에도 초청되는 등 미국 전역에서 콘서트 요청을 받으며 명성을 떨치고 있는 돈 셜리는 
 위험하기로 소문난 미국 남부 투어 공연을 떠나기로 결심하고, 
 투어 기간 동안 자신의 보디가드 겸 운전기사로 토니를 고용한다. 
  
 거친 인생을 살아온 토니 발레롱가와 교양과 기품을 지키며 살아온 돈 셜리 박사. 
 생각, 행동, 말투, 취향까지 달라도 너무 다른 두 사람은 
 그들을 위한 여행안내서 ‘그린북’에 의존해 특별한 남부 투어를 시작하는데…
"','비고 모텐슨,마허샬라 알리,린다 카델리니,세바스찬 매니스캘코','피터 패럴리','photo1.jpg','https://www.youtube.com/embed/juHmLAQVmOE','poster1.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (3,'베일리 어게인','모험, 코미디, 드라마',to_date('18/11/22','RR/MM/DD'),'미국',100,'0','"이번 생은 처음인 우리에게
 견생 4회차, 베일리의 빅허그♥

귀여운 소년 ‘이든’의 단짝 반려견 ‘베일리’는 행복한 생을 마감한다. 
 하지만 눈을 떠보니 다시 시작된 견생 2회차, 아니 3회차?! 
 1등 경찰견 ‘엘리’에서 찰떡같이 마음을 알아주는 소울메이트 ‘티노’까지! 
 다시 태어날 때마다 성별과 생김새, 직업(?)에 이름도 바뀌지만, 
 여전히 영혼만은 사랑 충만! 애교 충만! 주인바라기 ‘베일리’ 
  
 어느덧 견생 4회차, 방랑견이 되어 떠돌던 ‘베일리’는 
 마침내 자신이 돌아온 진짜 이유를 깨닫고 어딘가로 달려가기 시작하는데…
"','조시 게드, 데니스 퀘이드, K.J. 아파, 브라이스 게이사르','라세 할스트롬','photo3.jpg','https://www.youtube.com/embed/fCN2Gh_40tE','poster3.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (5,'포드 V 페라리','액션, 드라마',to_date('19/12/04','RR/MM/DD'),'미국',152,'12','"자존심을 건 대결의 시작!

1960년대, 매출 감소에 빠진 ‘포드’는 판매 활로를 찾기 위해 
 스포츠카 레이스를 장악한 절대적 1위 ‘페라리’와의 인수 합병을 추진한다. 
 막대한 자금력에도 불구, 계약에 실패하고 엔초 페라리로부터 모욕까지 당한 헨리 포드 2세는 
 르망 24시간 레이스에서 페라리를 박살 낼 차를 만들 것을 지시한다. 
  
 불가능을 즐기는 두 남자를 주목하라! 
  
 세계 3대 자동차 레이싱 대회이자 ‘지옥의 레이스’로 불리는 르망 24시간 레이스. 
 출전 경험조차 없는 ‘포드’는 대회 6연패를 차지한 ‘페라리’에 대항하기 위해 
 르망 레이스 우승자 출신 자동차 디자이너 ‘캐롤 셸비’(맷 데이먼)를 고용하고, 
 그는 누구와도 타협하지 않지만 열정과 실력만큼은 최고인 
 레이서 ‘켄 마일스’(크리스찬 베일)를 자신의 파트너로 영입한다. 
  
 포드의 경영진은 제 멋대로인 ‘켄 마일스’를 눈엣가시처럼 여기며 
 자신들의 입맛에 맞춘 레이스를 펼치기를 강요하지만 
 두 사람은 어떤 간섭에도 굴하지 않고 불가능을 뛰어넘기 위한 질주를 시작하는데… 
  
 그 어떤 각본보다 놀라운 실화가 펼쳐진다!"','맷 데이먼, 크리스찬 베일, 케이트리오나 발피, 존 번탈','제임스 맨골드','photo5.jpg','https://www.youtube.com/embed/k6uo3eHbGUI','poster5.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (7,'주전장','다큐',to_date('19/07/25','RR/MM/DD'),'미국',121,'0','"자, 주 전장(戰場)에 오신 것을 환영합니다!

일본의 인종차별 문제를 다룬 영상을 올린 후 
 우익들의 공격 대상이 된 일본계 미국인 유튜버, 미키 데자키. 
  
 그는 일본군’위안부’에 관한 기사를 쓴 기자가 우익들에게 인신공격 당하는 것을 보며 
 왜 그토록 이들이 이 문제를 감추려고 하는지 궁금해졌다. 
 호기심을 안고 찾아간 그들은 무시무시한 이야기를 전하고 
 그들의 주장을 반격하는 또 다른 인물들을 만나면서 숨겨진 비밀을 발견하게 되는데… 
  
 숨 쉴 틈 없는 전쟁이 시작된다!
"','사쿠라이 요시코, 스기타 미오, 와타나베 미나, 켄트 길버트','미키 데자키','photo7.jpg','https://www.youtube.com/embed/DXQemwLJlnA','poster7.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (8,'당갈','드라마, 액션',to_date('18/04/25','RR/MM/DD'),'인도',161,'12','"“남자든 여자든 금메달은 금메달인데!”
누구도 예상하지 못한 감동의 명승부!

전직 레슬링 선수였던 ‘마하비르 싱 포갓(아미르 칸)’은 아버지의 반대로 금메달의 꿈을 이루지 못한 채 레슬링을 포기한다. 
 아들을 통해 꿈을 이루겠다는 생각은 내리 딸만 넷이 태어나면서 좌절된다. 
 그러던 어느 날, 두 딸이 또래 남자아이들을 신나게 때린 모습에서 잠재력을 발견하고 레슬링 특훈에 돌입한다. 
 사람들의 따가운 시선과 조롱에도 불구하고 첫째 기타(파티마 사나 셰이크)와 둘째 바비타(산야 말호트라)는 
 아버지의 훈련 속에 재능을 발휘, 승승장구 승리를 거두며 국가대표 레슬러로까지 성장해 마침내 국제대회에 출전하는데..."','아미르 칸, 파티마 사나 세이크, 산야 말호트라, 사크시 탄와르','니테쉬 티와리','photo8.jpg','https://www.youtube.com/embed/LAuxZniIUKI','poster8.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (9,'쇼생크 탈출','드라마',to_date('95/01/28','RR/MM/DD'),'미국',142,'15','"두려움은 너를 죄수로 가두고 희망은 너를 자유롭게 하리라

촉망 받던 은행 부지점장 ‘앤디(팀 로빈슨 分)’는 아내와 그 애인을 살해한 혐의로 종신형을 받고 쇼생크 교도소에 수감된다. 
 강력범들이 수감된 이곳에서 재소자들은 짐승 취급 당하고, 혹여 간수 눈에 잘못 보였다가는 개죽음 당하기 십상이다. 
 처음엔 적응 못하던 ‘앤디’는 교도소 내 모든 물건을 구해주는 ‘레드(모건 프리먼 分)’와 친해지며 교도소 생활에 적응하려 하지만, 악질 재소자에게 걸려 강간까지 당한다. 
 그러던 어느 날, 간수장의 세금 면제를 도와주며 간수들의 비공식 회계사로 일하게 되고, 마침내는 소장의 검은 돈까지 관리해주게 된다. 
 덕분에 교도소 내 도서관을 열 수 있게 되었을 무렵, 신참내기 ‘토미(길 벨로우스 分)’로부터 ‘앤디’의 무죄를 입증할 기회를 얻지만, 노튼 소장은 ‘앤디’를 독방에 가두고 ‘토미’를 무참히 죽여버리는데..."','팀 로빈스, 모건 프리먼, 밥 건튼, 윌리암 새들러','프랭크 다라본트','photo9.jpg','https://www.youtube.com/embed/p8tgEikbrvc','poster9.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (11,'보헤미안 랩소디','드라마',to_date('18/10/31','RR/MM/DD'),'미국',134,'12','"“나는 스타가 되지 않을 것이다, 전설이 될 것이다”

공항에서 수하물 노동자로 일하며 음악의 꿈을 키우던 이민자 출신의 아웃사이더 ‘파록버사라’ 
 보컬을 구하던 로컬 밴드에 들어가게 되면서 ‘프레디 머큐리’라는 이름으로 밴드 ‘퀸’을 이끌게 된다. 
  
 시대를 앞서가는 독창적인 음악과 화려한 퍼포먼스로 관중들을 사로잡으며 성장하던 ‘퀸’은 
 라디오와 방송에서 외면을 받을 것이라는 음반사의 반대에도 불구하고 
 무려 6분 동안 이어지는 실험적인 곡 ‘보헤미안 랩소디’로 대성공을 거두며 월드스타 반열에 오른다. 
  
 그러나 독보적인 존재감을 뿜어내던 ‘프레디 머큐리’는 솔로 데뷔라는 유혹에 흔들리게 되고 
 결국 오랜 시간 함께 해왔던 멤버들과 결별을 선언하게 되는데… 
  
 세상에서 소외된 아웃사이더에서 전설의 록밴드 ‘퀸’이 되기까지, 
 우리가 몰랐던 그들의 진짜 이야기가 시작된다!"','라미 말렉,루시 보인턴,궐림 리,벤 하디','브라이언 싱어','photo11.jpg','https://www.youtube.com/embed/XTZko22Ze3o','poster11.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (13,'월-E','애니메이션, SF, 코미디, 가족, 모험',to_date('08/08/06','RR/MM/DD'),'미국',104,'0','"예측불허! 차세대 영웅, 그가 지구 구하기에 나섰다!

텅 빈 지구에 홀로 남아 수백 년이란 시간을 외롭게 일만 하며 보내던 월-E (WALL-E: Waste Allocation Load Lifter Earth-Class, 지구 폐기물 수거-처리용 로봇). 그런 그가 매력적인 탐사 로봇 ‘이브’와 마주친 순간, 잡동사니 수집만이 낙이던 인생에도 소중한 목표가 생긴다. 이브는 지구의 미래를 결정할 열쇠가 우연히 월-E의 손에 들어간 사실을 알게 되고, 고향별로 돌아갈 날만 애타게 기다리는 인간들에게 이를 보고하기 위해 서둘러 우주로 향한다. 한편 월-E는 이브를 뒤쫓아 은하를 가로지르며, 스크린 사상 가장 짜릿한 상상이 넘치는 어드벤처를 선사한다. 이제껏 꿈에서도 볼 수 없었던 미래 세계를 배경으로 우주에서 펼쳐지는 월-E의 환상적인 모험! 애완용 바퀴벌레, 용맹스럽지만 어딘가 나사가 빠진 듯한 사회 부적응 로봇 군단 등 일련의 유쾌한 캐릭터들이 여기에 동참한다.
"','벤 버트 , 엘리사 나이트, 제프 갈린, 프레드 윌러드','앤드류 스탠튼','photo13.jpg','https://www.youtube.com/embed/hkta4xYaj1k','poster13.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (15,'라이언 일병 구하기','전쟁, 액션, 드라마',to_date('98/09/12','RR/MM/DD'),'미국',170,'15','"임무는 단 한 사람(The Mission is a Man)

1944년 6월 6일 노르망디 상륙 작전. 오마하 해변에 대기하고 있던 병사들은 한치 앞도 내다볼 수 없는 긴장된 상황과 두려움에 무기력함을 감출 수 없었다. 노르망디 해변을 응시하는 밀러 대위(Captain Miller: 톰 행크스 분) 그리고 전쟁 중 가장 어려운 임무를 수행해야할 두려움에 지친 그의 대원들. 지옥을 방불케하는 치열한 총격전이 벌어지고 수 많은 병사들이 총 한번 제대로 쏘지 못하고 쓰러져간다. 마침내 밀러 대위를 위시한 그들은 몇번의 죽을 고비를 넘기고 맡은 바 임무를 완수한다.
  같은 시각, 2차 대전이 종전으로 치닫는 치열한 전황 속에서 미 행정부는 전사자 통보 업무를 진행하던 중 충격적인 사실을 발견하게 된다. 4형제 모두 이 전쟁에 참전한 라이언 가에서 며칠간의 시차를 두고 3형제가 이미 전사하고 막내 제임스 라이언 일병(Private Ryan: 맷 데몬 분)만이 프랑스 전선에 생존해 있음을 알게 된 것이다. 네명의 아들 가운데 이미 셋을 잃은 라이언 부인을 위해 미 행정부는 막내 제임스를 구하기 위한 매우 특별한 작전을 지시한다. 결국 사령부에서 막내를 찾아 집으로 보낼 임무는 밀러에게 부여되고, 이것은 이제껏 수행했던 임무보다 훨씬 어렵고 힘든 것이었다.
  밀러는 여섯 명의 대원들과 통역병 업햄(Corporal Timothy Upham: 제레미 데이비스 분) 등 새로운 팀을 구성, 작전에 투입된다. 라이언의 행방을 찾아 최전선에 투입된 밀러와 대원들은 미군에게 접수된 마을을 지나던 중 의외로 쉽게 그를 찾아낸다. 하지만 임무 완수의 기쁨도 잠시. 그는 제임스 라이언과 성만 같은 다른 인물로 밝혀진다. 다음 날, 밀러 일행은 우연히 한 부상병을 통해 제임스 라이언이 라멜 지역의 다리를 사수하기 위해 작전에 투입됐고, 현재는 독일군 사이에 고립돼 있다는 사실을 듣게 된다.
  단 한명의 목숨을 구하기 위해 여덟 명이 위험을 감수해야할 상황에서 대원들은 과연 ‘라이언 일병 한 명의 생명이 그들 여덟 명의 생명보다 더 가치가 있는 것인가?’라는 끊임없는 혼란에 빠진다. 하지만 지휘관으로서 작전을 끝까지 책임지고 성공적으로 완수해야 할 밀러는 부하들을 설득해 다시 라이언 일병이 있다는 곳으로 향한다. 도중에 독일군과의 간헐적인 전투를 치르면서 결국 밀러 일행은 라멜 외곽지역에서 극적으로 라이언 일병을 찾아낸다. 하지만 라이언은 다리를 사수해야할 동료들을 사지에 남겨두고 혼자 돌아가는 것을 거부하는데."','톰 행크스, 에드워드 번즈, 톰 시즈모어, 제레미 데이비스','스티븐 스필버그','photo15.jpg','https://www.youtube.com/embed/t2_BmIGC2Js','poster15.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (17,'살인의 추억','범죄, 미스터리, 스릴러, 코미디, 드라마',to_date('03/04/25','RR/MM/DD'),'한국',132,'15','"연쇄살인 실화극 | 1986년 시골마을, 두 형사에겐 모든 것이 처음이었다. | 당신은 지금 어디에 있는가 | 미치도록 잡고 싶었다. 당신은 누구인가 | 미치도록 잡고 싶었습니다. 당신은 누구십니까

1986년 경기도. 젊은 여인이 무참히 강간, 살해당한 시체로 발견된다. 2개월 후, 비슷한 수법의 강간살인사건이 연이어 발생하면서 사건은 세간의 주목을 받기 시작하고, 일대는 연쇄살인이라는 생소한 범죄의 공포에 휩싸인다.
  사건 발생지역에 특별수사본부가 설치되고, 수사본부는 구희봉 반장(변희봉 분)을 필두로 지역토박이 형사 박두만(송강호 분)과 조용구(김뢰하 분), 그리고 서울 시경에서 자원해 온 서태윤(김상경 분)이 배치된다. 육감으로 대표되는 박두만은 동네 양아치들을 족치며 자백을 강요하고, 서태윤은 사건 서류를 꼼꼼히 검토하며 사건의 실마리를 찾아가지만, 스타일이 다른 두 사람은 처음부터 팽팽한 신경전을 벌인다. 용의자가 검거되고 사건의 끝이 보일 듯 하더니, 매스컴이 몰려든 현장 검증에서 용의자가 범행 사실을 부인하면서 현장은 아수라장이 되고, 구반장은 파면 당한다.
  수사진이 아연실색할 정도로 범인은 자신의 흔적을 남기지 않는다. 살해하거나 결박할 때도 모두 피해자가 착용했거나 사용하는 물품을 이용한다. 심지어 강간사 일 경우, 대부분 피살자의 몸에 떨어져 있기 마련인 범인의 음모 조차 단 하나도 발견되지 않는다. 후임으로 신동철 반장(송재호 분)이 부임하면서 수사는 활기를 띠기 시작한다. 박두만은 현장에 털 한 오라기 남기지 않는다는 점에 착안, 근처의 절과 목욕탕을 뒤지며 무모증인 사람을 찾아 나서고, 사건 파일을 검토하던 서태윤은 비오는 날, 빨간 옷을 입은 여자가 범행대상이라는 공통점을 밝혀낸다.
  선제공격에 나선 형사들은 비오는 밤, 여경에게 빨간 옷을 입히고 함정 수사를 벌인다. 그러나 다음날 아침 돌아오는 것은 또다른 여인의 끔찍한 사체. 사건은 해결의 실마리를 다시 감추고 냄비처럼 들끊는 언론은 일선 형사들의 무능을 지적하면서 형사들을 더욱 강박증에 몰아넣는데."','송강호, 김상경, 김뢰하, 송재호','봉준호','photo17.jpg','https://www.youtube.com/embed/iEXKd-RgE6s','poster17.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (18,'빽 투 더 퓨쳐','SF, 코미디',to_date('87/07/17','RR/MM/DD'),'미국',120,'12','"힐 밸리(Hill Valley)에 사는 주인공 마티 맥플라이(Marty McFly: 마이클 J. 폭스 분)는 록큰롤, 스케이트보드, 그리고 자동차를 좋아하는 명랑 쾌할한 고교생으로, 아버지 죠지(George Douglas McFly: 크리스핀 글로버 분)와 어머니 로레인(Lorraine Baines: 리아 톰슨 분), 그리고 형과 누나가 있는 가정의 평범한 청소년이다. 평소 친하게 지내던 괴상한 발명가 에메트 브라운 박사(Dr. EmmDr. Emmett L. ""Doc"" Brown: 크리스토퍼 로이드 분)가 스포츠카 드로리안(DeLorean)을 개조해 타임머신을 만들지만, 뜻밖의 사고로 브라운 박사가 테러범들에게 총을 맞고 위험해진 마티는 급기야 30년 전으로 간다. 
 극장 간판에는 2류 배우인 로널드 레이건이 보이고 청년인 아버지와 어머니를 보게 된다. 그러나 젊은 아버진 여전히 멍청하고, 무엇보다 어머니가 미래의 아들인 마티를 좋아해 야단이다. 마티가 미래로 가는 것을 도와 줄 사람은 30년 전인 젊은 브라운 박사뿐. 댄스 파티가 열리는 날에 아버지와 어머니가 만났던 것을 기억한 마티는 두 사람을 결합시키고자 어머니와 파티장으로 간다. 그런데, 심술장이 밥(Biff Tannen: 토마스 F. 윌슨 분)이 나타나 어머니를 겁탈하려 하나 화가 난 아버지가 일격에 때려 눕혀 그때부터 소심했던 아버지의 성격이 바낀다. 무사히 부모님은 만나 마티의 존재는 없었지지 않지만 마티의 ''미래로의 귀환(Back to the future)''이 어려워지는 사태를 맞는데...."','마이클 J. 폭스, 크리스토퍼 로이드, 리 톰슨, 크리스핀 글로버','로버트 저메키스','photo18.jpg','https://www.youtube.com/embed/I1iHTwKgbkg','poster18.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (20,'매트릭스','SF, 액션',to_date('99/05/15','RR/MM/DD'),'미국',136,'12','"서기 2199년,
인공지능 AI에 의해 인류가 재배되고 있다!

인간의 기억마저 AI에 의해 입력되고 삭제 되는 세상.진짜보다 더 진짜 같은 가상 현실 ‘매트릭스’ 
 그 속에서 진정한 현실을 인식할 수 없게 재배되는 인간들. 
 그 ‘매트릭스’를 빠져 나오면서 AI에게 가장 위험한 인물이 된 
 ''모피어스’는 자신과 함께 인류를 구할 마지막 영웅 ‘그’를 찾아 헤맨다. 
  
 마침내 ‘모피어스’는 낮에는 평범한 회사원으로, 밤에는 해커로 활동하는 청년 ‘네오’를 ‘그’로 지목하는데… 
  
 꿈에서 깨어난 자들, 
 이제 그들이 만드는 새로운 세상이 열린다!"','키아누 리브스, 로렌스 피시번, 캐리 앤 모스, 휴고 위빙','릴리 워쇼스키','photo20.jpg','https://www.youtube.com/embed/9mn4seqI8Vs','poster20.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (21,'인생은 아름다워','드라마, 코미디',to_date('99/03/06','RR/MM/DD'),'이탈리아',116,'0','"로마에 갓 상경한 시골 총각 ‘귀도’는 운명처럼 만난 여인 ‘도라’에게 첫눈에 반한다. 
 넘치는 재치와 유머로 약혼자가 있던 그녀를 사로잡은 ‘귀도’는 ‘도라’와 단란한 가정을 꾸리며 분신과도 같은 아들 ‘조수아’를 얻는다. 
  
 ‘조수아’의 다섯 살 생일, 갑작스레 들이닥친 군인들은 ‘귀도’와 ‘조수아’를 수용소 행 기차에 실어버리고, 소식을 들은 ‘도라’ 역시 기차에 따라 오른다. ‘귀도’는 아들을 달래기 위해 무자비한 수용소 생활을 단체게임이라 속이고 1,000점을 따는 우승자에게는 진짜 탱크가 주어진다고 말한다. 
  
 불안한 하루하루가 지나 어느덧 전쟁이 끝났다는 말을 들은 ‘귀도’는 마지막으로 ‘조수아’를 창고에 숨겨둔 채 아내를 찾아 나서는데… 
  
 전세계를 울린 위대한 사랑, 
 마법처럼 놀라운 이야기가 찾아온다!"','로베르토 베니니, 니콜레타 브라스키, 조르지오 깐따라니, 마리사 파레데스','로베르토 베니니','photo21.jpg','https://www.youtube.com/embed/LC903LkokMA','poster21.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (22,'헬프','드라마',to_date('11/11/03','RR/MM/DD'),'미국',146,'0','"1963년, 미국 남부 미시시피 잭슨
 흑인 가정부는 백인 주인과 화장실도 같이 쓸 수 없다?!
 아무도 가정부의 삶에 대해 묻지 않았다. 그녀가 책을 쓰기 전까지는…
 돈 많은 남자와 결혼해 정원과 가정부가 딸린 집의 안주인이 되는 게 최고의 삶이라 여기는 친구들과 달리 대학 졸업 후 작가의 꿈을 이루기 위해 지역 신문사에 취직한 ‘스키터(엠마 스톤)’. 살림 정보 칼럼의 대필을 맡게 된 그녀는 베테랑 가정부 ‘에이빌린(바이올라 데이비스)’에게 도움을 요청한다. 
 다른 인생은 꿈꿔보지도 못한 채 가정부가 되어 17명의 백인 아이를 헌신적으로 돌봤지만 정작 자신의 아들은 사고로 잃은 ‘에이빌린’. ‘스키터’에게 살림 노하우를 알려주던 그녀는 어느 누구도 관심 갖지 않았던 자신과 흑인 가정부들의 인생을 책으로 써보자는 위험한 제안을 받는다. 
 때 마침 주인집의 화장실을 썼다는 황당한 이유로 쫓겨난 가정부 ‘미니(옥타비아 스펜서)’가 두 여자의 아슬아슬하지만 유쾌한 반란에 합류한다. 차별과 불만을 이야기 하는 것조차 불법이 되고 생명을 위협받는 일이 되는 시대에, 태어나 처음으로 누군가에게 자신들의 이야기를 털어 놓기 시작하는 ‘에이빌린’과 ‘미니’. 그녀들의 용기 있는 고백은 세상을 발칵 뒤집을 만한 책을 탄생시키는데…"','엠마 스톤, 비올라 데이비스, 옥타비아 스펜서, 브라이스 달라스 하워드','데이트 테일러','photo22.jpg','https://www.youtube.com/embed/jO7ljUxiuuY','poster22.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (23,'포레스트 검프','드라마, 코미디',to_date('94/10/15','RR/MM/DD'),'미국',142,'12','"인생은 초콜릿 상자와 같은 거야. 네가 무엇을 고를지 아무도 모른단다…''

불편한 다리, 남들보다 조금 떨어지는 지능을 가진 외톨이 소년 ‘포레스트 검프’ 헌신적이고 강인한 어머니의 보살핌과 콩깍지 첫사랑 소녀 ‘제니’와의 만남으로 사회의 편견과 괴롭힘 속에서도 따뜻하고 순수한 마음을 지니고 성장한다. 
 여느 날과 같이 또래들의 괴롭힘을 피해 도망치던 포레스트는 누구보다 빠르게 달릴 수 있는 자신의 재능을 깨닫고 늘 달리는 삶을 살아간다. 포레스트의 재능을 발견한 대학에서 그를 미식축구 선수로 발탁하고, 졸업 후에도 뛰어난 신체능력으로 군에 들어가 누구도 예상치 못한 성과를 거둬 무공훈장을 수여받는 등 탄탄한 인생 가도에 오르게 된 포레스트. 
 하지만 영원히 행복할 것만 같았던 시간도 잠시, 어머니가 병에 걸려 죽음을 맞이하고 첫사랑 제니 역시 그의 곁을 떠나가며 다시 한번 인생의 전환점을 맞이하게 되는데… 과연, 포레스트는 진정한 삶의 행복을 발견할 수 있을까? 
  
 진정한 삶의 가치와 의미를 제시하는 감동 바이블! 
 올 가을, 다시 한번 세상에서 가장 눈부신 달리기가 시작된다! “Run! Forrest Run!”"','톰 행크스, 로빈 라이트, 게리 시나이즈, 미켈티 윌리암슨','로버트 저메키스','photo23.jpg','https://www.youtube.com/embed/wM67yX1-0NI','poster23.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (25,'클래식','멜로, 로맨스, 드라마',to_date('03/01/30','RR/MM/DD'),'한국',132,'12','"우연히, 우연히, 우연히... 그러나... 반드시 잊혀진 약속이 깨어났다.

같은 대학에 다니는 지혜(손예진)와 수경은 연극반 선배 상민(조인성)을 좋아한다. 하지만 호들갑스런 수경이 상민에게 보낼 편지의 대필을 부탁하고, 지혜는 수경의 이름으로 상민을 향한 자신의 감정을 고백한다. 지혜의 편지로 맺어진 수경과 상민이 가까워지면서 지혜는 괜한 죄의식에 상민을 멀리 하려 하지만, 우연하게도 자꾸만 마주치게 된다. 
  
 오래 전, 사랑은 이미 시작되었다... 한편, 아빠를 일찍 여읜 지혜는 지금은 해외 여행 중인 엄마 주희와 단둘이 살다. 엄마의 빈자리를 털기 위해 다락방을 청소하던 지혜는 우연히 엄마의 비밀 상자를 발견하게 된다. 주희의 첫사랑의 기억이 고스란히 담겨있는 비밀 상자를 보면서 지혜는 엄마의 클래식한 사랑을 조금씩 알게 된다. 
  
 귀를 기울이면, 그들의 안타까운 사랑이 들려온다!! 1968년 여름... 방학을 맞아 시골 삼촌댁에 간 준하(조승우)는 그곳에서 성주희(손예진)를 만나, 한눈에 그녀에게 매료된다. 그런 주희가 자신에게만 은밀하게 ''귀신 나오는 집''에 동행해줄 것을 부탁해온다. 흔쾌히 수락한 준하는 흥분된 마음을 가까스로 누르며 주희와의 약속 장소에 나간다. 그런데 갑작스런 소나기를 만나 배가 떠내려가면서 귀가 시간이 늦어지고, 이 일로 주희는 집안 어른에게 심한 꾸중을 듣고 수원으로 보내진다. 작별 인사도 못하고 헤어진 주희를 향한 준하의 마음은 안타깝기만 하다. 그렇게 방학이 끝나고 학교로 돌아온 준하는 친구 태수에게 연애편지의 대필을 부탁받는데, 상대가 주희란 사실에 깜짝 놀란다. 하지만 태수에게 그 사실을 말하지 못하고, 태수의 이름으로 자신의 마음을 담아 주희에게 편지를 쓴다. 운명이 던져준 또 한번의 인연 편지를 대신 써주며 사랑이 깊어간 엄마와 자신의 묘하게도 닮은 첫사랑. 이 우연의 일치에 내심 의아해하는 지혜는 상민에 대한 생각이 더욱 깊어만 간다. 하지만 이미 친구의 연인이 되어버린 그를 포기하기로 마음먹는데..."','손예진, 조승우, 조인성, 이기우','곽재용','photo25.jpg','https://www.youtube.com/embed/Jb1eMxccojs','poster25.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (26,'글래디에이터','액션, 드라마',to_date('00/06/03','RR/MM/DD'),'미국',154,'15','"느낄 수 있는가, 이 거대한 스펙터클의 전율을... !

{절정기의 로마제국은 그 영토가 광대하여 아프리카 사막에서 잉글랜드 북쪽까지 걸쳐 있었다. 그 당시 세계는 그 총인구의 1/4이 로마 황제의 지배 하에 있었다. 때는 서기 180년, 마르커스 아우렐리우스(Marcus Aurelius) 황제의 12년에 걸친 게르마니아(Germania) 정벌이 거의 마무리되던 무렵이었다. 마지막 하나 남은 적의 요새만 함락하면 이제 로마 제국은 평화가 온다.}
  평화로운 ''5현제 시대''가 막바지에 이른 서기 180년 로마. 어두운 삼림. 수백명의 부대가 숨을 죽이고 서 있다. 마치 폭풍전야와 같이. 장군의 신호가 울리고 거대한 함성소리와 함께 하늘에는 불화살, 불타는 점토 항아리가 난무하고, 땅위는 수많은 병사들의 피로 물든다. 철인(哲人) 황제 마르쿠스 아우렐리우스(Marcus Aurelius: 리차드 해리스 분)가 아들처럼 친애하는 장군 막시무스(General Maximus: 러셀 크로우 분)는 다뉴브 강가 전투에서 대승한다.
  죽을 날이 머지않은 황제 마르쿠스 아우렐리우스는 막시무스를 총애하여, 아들이 아닌 그에게 왕위를 넘겨주기로 한다. 그러나 황제의 아들 코모두스는 이에 질투와 분노를 느껴 급기야 황제를 살해한다. 왕좌를 이어받은 코모두스는 막시무스와 그의 가족을 죽이라고 명령한다. 가족을 모두 잃고 혼자 겨우 살아남게 된 막시무스는 노예로 전락하고, 투기장의 검투사로 매일 훈련을 받는다. 그에게 남은 건 오로지 새로 즉위한 황제 코모두스에 대한 복수 뿐. 검투사로서 매 경기마다 승리로 이끌면서 살아남자 그의 명성과 인기는 날로 높아간다.
  로마로 돌아온 그는 아내와 아들을 죽인 코모두스에 대한 복수를 다짐한다. 그러던 어느날, 오래전 사랑했던 황제의 누이 루실라(Lucilla: 코니 닐슨 분)를 다시 만나게 된다. 어느 새 민중의 영웅이 된 막시무스. 코모두스는 그가 아직 살아있음을 알고 분노하지만 민중이 두려워 그를 죽이지 못한다. 드디어 막시무스는 예전의 부하들과 은밀히 만나 사랑하는 아내와 아들, 존경하던 황제를 살해한 난폭한 황제 코모두스에 대한 복수를 결의한다. 아직도 막시무스를 사랑하고 있는 루실라는 동생 코모두스를 배신하고 막시무스의 반란을 도우려 하는데."','로셀 크로우, 호아킨 피닉스, 코니 닐슨, 올리버 리드','리들리 스콧','photo26.jpg','https://www.youtube.com/embed/N8hcXQpa52Y','poster26.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (28,'토이 스토리 3','애니메이션, 모험, 코미디, 가족, 판타지',to_date('10/08/05','RR/MM/DD'),'미국',102,'0','"전세계가 감동한 가장 위대한 탈출 | 이별은 없어! 우리는 반드시 함께 돌아가야 해!

모든 장난감들이 겪는 가장 슬픈일은 바로 주인이 성장해 더이상 자신들과 놀아주지 않는 것. 우디와 버즈에게도 그 위기가 찾아온다. 앤디가 대학에 진학, 집을 떠나게 된 것. 헤어짐의 불안에 떨던 토이들은 앤디 엄마의 실수로 집을 나오게 된 이들은 우여곡절 끝에 탁아소에 기증되는 신세가 된다! 
 그런데 오마이갓, 어린이집 애들 장난이 아니게 난폭하고 험하다. 그리고 상상도 못했던 거대한 음모까지 숨겨져 있는 어린이집 장난감의 세계. 그러다 앤디가 여전히 자신들을 사랑한다는 사실을 알게 된 토이 군단은 앤디 곁으로 돌아가기 위해 생애 가장 큰 모험을 결심한다. 우디를 중심으로 똘똘뭉친 토이들 과연 이들의 위대한 탈출은 성공할 것인가!"','톰 행크스, 팀 알렌, 조안 쿠삭, 네드 비티','리 언크라치','photo28.jpg','https://www.youtube.com/embed/yIK4tGW3MV8','poster28.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (30,'알라딘','모험, 판타지, 뮤지컬, 로맨스, 멜로, 가족',to_date('19/05/23','RR/MM/DD'),'미국',128,'0','"머나먼 사막 속 신비의 아그라바 왕국의 시대. 
 좀도둑 ‘알라딘’은 마법사 ‘자파’의 의뢰로 마법 램프를 찾아 나섰다가 
 주인에게 세 가지 소원을 들어주는 지니를 만나게 되고, 
 자스민 공주의 마음을 얻으려다 생각도 못했던 모험에 휘말리게 되는데…"','메나 마수드, 나오미 스콧, 윌 스미스, 마르완 켄자리','가이 리치','photo30.jpg','https://www.youtube.com/embed/KrM3vS5sy2w','poster30.jpg','admin','N');
REM INSERTING into J20200701.REVIEW
SET DEFINE OFF;
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (1,'그린 북','영화 그린 북이 각종 영화상을 휩쓸 때부터 예상은 했지만 정말 대단한 영화였다. 
늦게 영화를 봤는데 그린 북을 보는 내내 미소가 끊이지 않았고 먹먹하다가도 따듯해졌다.
시상식을 휩쓰는 영화에 대한 고정관념이 지루할 것이라는 것인데 영화 그린 북도 조금 지루할 거라 생각했다.서정적인 드라마풍의 영화가 아니라 전혀 지루하지 않았고, 코믹한 부분도 많고 감동도 넘쳐서 시간 가는 줄 몰랐다. 올해 본 영화 중에 가장 흡족하게 봤다고 자신 있게 추천할 수 있는 영화 그린 북 Green Book 나의 영원한 아라곤인 비고 모텐슨이 운전기사 캐릭터로 나온다는 것만 알고 영화를 봤는데 과거를 배경으로 하는 시대극에 단순한 드라마가 아니었다.
영화 그린 북은 정말 다른 성격의 두 사람인 운전사와 피아니스트가 두 달간의 미국 남부 콘서트를 위해 로드트립을 하면서 어쩔 수 없이 같이 지내게 되는 과정을 재미있으면서도 현실적으로 다뤘다.
영화를 보면서 실화일 것 같다는 생각이 들었는데 실제로 실화를 바탕으로 했다.
실존 인물들의 이름이 그대로 사용되고 주인공의 아들인 닉 발레롱가가 제작에도 참여해
두 사람이 나눈 대화에서부터 집의 구조 등 최대한 현실적으로 반영을 하려고 했다고 한다.
영화의 제목인 그린 북이 무엇을 뜻하는지 전혀 모르다가 영화 초반에 설명이 나올 때 머리를 한대 맞은 기분이었다. 
그린 북은 미국 남부지역을 여행하는 흑인들에게 안전한 정보를 알려주는 지침서라고 했다.
영화의 배경인 1962년은 50년이 조금 넘은 오래지 않은 시대인데 인종차별은 매우 심각했다. 
얼마나 인종차별이 심했으면 흑인들이 남부 지역을 무사히 여행할 수 있게 숙박, 식당 정보가 적힌 책이 출간될 정도인지 지금 시대에 생각하면 매우 충격적이지만 실제로는 영화보다 더 하면 더했지 결코 덜 하지 않았을 것이라 생각하니 짠했다. 그리고 50년이 지나 표면적으로는 인종차별이 많이 개선된 것처럼 보이지만 여전히 사라지지 않은 사회문제라 안타까웠다.
비고 모텐슨은 토니 발레롱가 역을 위해 체중을 많이 늘였는데 연기력은 정말 대단했다.
이 캐릭터는 이탈리아계 미국인으로 가정적이지만 말을 함부로 하고 주먹이 먼저 나서는 다소 거친 사람이다. 일명 해결사로 불리며 입과 주먹으로 생활을 꾸려 나가는 캐릭터인데 토니가 대사를 하면 나는 자꾸 할 말을 잃게 되었다. 흑인에게 본인이 흑인에 더 가까운 삶을 살고 있다고 해서 듣는 흑인이 어이 상실하게 하는 것은 물론 러시아인에게 당케 쇤이라고 계속 독일어를 하며 남의 말은 거의 듣지 않는 무대 포이다. 그렇지만 천성은 순수한 편이고 입담이 좋아서 전혀 밉지 않은 캐릭터라 재미있었다. 이런 토니와 정 반대로 천재 피아니스트인 돈 셜리 박사는 교양 있고 기품이 넘치는 상류층 같은 캐릭터이다. 하지만 흑인이라는 이유로 미국 남부 지역에서는 인간 이하의 취급을 받고
흑인 뮤지션들을 모르고 일반적인 흑인들과 성향이 다르기 때문에 토니에게 흑인 답지 않다는 지적도 받는다. 한 예로 흑인들이 켄터키 프라이드치킨을 좋아한다는 아주 인종차별적인 편견이 있는데
돈 셜리 박사는 프라이드치킨을 한 번도 먹어본 적이 없다고 해서 토니를 당황하게 만든다.
영화에서는 조금 코믹하게 표현되었지만 인종차별의 한 예를 굉장히 잘 담아낸 장면이라고 생각되었다. ',to_date('20/08/14','RR/MM/DD'),'admin',1);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (3,'베일리 어게인','영화 베일리어게인은 2017년도에 개봉한 모험, 코미디, 드라마 영화로
100분이라는 영화치고 짧은 러닝타임을 달리는 영화인데요.
베일리 역으로는 목소리 조시게드가 등장하고 데니스 퀘이드, K.J. 아파, 브라이스 게이사르,
 브릿 로버트슨, 페기 립튼 등의 배우들이 등장하는 영화로 견생에 대한 줄거리 영화입니다.
저도 애완견을 키우는 입장으로써 저에게 힐링을 안겨주는 정말 따뜻한 영화였는데요.
100분 이라는 시간동안 울고 웃으며 잠시나마 나의 반려동물의 마음을 조금이라도 더
헤아릴 수 있는 시간이 아니었나 싶습니다.

이번 생은 처음인 우리에게
견생 4회차, 베일리의 빅허그♥
귀여운 소년 ‘이든’의 단짝 반려견 ‘베일리’는 행복한 생을 마감한다.
 하지만 눈을 떠보니 다시 시작된 견생 2회차, 아니 3회차?!
 1등 경찰견 ‘엘리’에서 찰떡같이 마음을 알아주는 소울메이트 ‘티노’까지!
 다시 태어날 때마다 성별과 생김새, 직업(?)에 이름도 바뀌지만,
 여전히 영혼만은 사랑 충만! 애교 충만! 주인바라기 ‘베일리’
 
 어느덧 견생 4회차, 방랑견이 되어 떠돌던 ‘베일리’는
 마침내 자신이 돌아온 진짜 이유를 깨닫고 어딘가로 달려가기 시작하는데…

- 출처 :  NAVER 영화 -
뉴욕타임즈 52주, USA TO DAY 베스트셀러를 원작으로 한 이 영화는
스티븐 스필버그 스튜디오 ''엠블린 엔터테이먼트'' 에서 제작되었습니다.
애초에 미국에서만 백 만부 이상 판매될 정도로 많은 독자들에게 선택받은
 베스트셀러 <베일리 어게인>을 바탕으로 영화한 작품이기 때문에 영화 또한
많은 사람들에게 사랑 받을 수 있엇던 것 같은데요. 예전에 비해 우리의 삶에 깊게 스며든 반려견에 대한
내용을 매우 현실적이면서도 진실적으로 담아낸 이야기를 제공해주기 때문에 동물을 사랑하는
사람이라면, 태어나서 한 번이라도 반려동물을 길러 본 적 있는 사람들에게 감동과 웃음, 사랑을
선사해주는 영화라고 할 수 있겠습니다.
',to_date('20/08/14','RR/MM/DD'),'admin',3);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (2,'가버나움','영화 <가버나움>(2019)은 한 마디로 충격적이다. 영화가 아닌 다큐멘터리를 보는 듯하고, 주인공의 말과 행동은 연기가 아닌 듯하다. 아니다 다를까. 자인 역의 자인 알 라피아를 비롯해 모든 인물이 전문 연기자가 아닌, 해당 역할과 비슷한 환경, 경험을 가진 실제 인물들로 캐스팅됐다고 한다. 


이 영화의 제목 ''가버나움''은 이스라엘의 갈릴리 바닷가에 있던 마을로 성서에 의하면 예수는 이 곳에서 가난한 자, 약한 자를 위하여 수많은 기적을 베풀었다. 그럼에도 불구하고 많은 사람이 회개하고 믿지 않았기 때문에 예수는 성읍이 몰락할 것이라고 예언하였고 실제로 6세기에 퇴락하여 사람이 살지 않게 되었다고 한다.


상징성이 있는 제목이다. 이 영화의 배경은 레마논 빈민가 마을이다. 이곳에서 살고 있는 12살 자인은 출생 신고도 되어 있지 않은 채 부모의 보호는커녕 하루 종일 일 하느라 정신이 없다. 물론 학교도 가지 않는다. 


무책임한 부모와 돌봐야 할 동생들만 있는 집이었지만 자인은 그렇게 사는 것이 자신의 운명이라는 듯 어리고 여린 몸으로 무겁고 가혹한 삶을 감당해내고 있었다. 

그러던 중 살뜰히 보살피던 어린 여동생 사하르가 나이 많은 남자에게 팔려가게 되자 결국 집을 뛰쳐나와 거리를 헤맨다. 


여동생을 지켜주기에는 힘이 없고, 자립하기에는 너무 어린 나이다. 가족 곁을 떠난 자인의 손을 잡아준 건 불법 체류자로 불안한 삶을 이어가던 라힐이었다.


라힐에게는 사람들에게 알려지면 안 되는 아이 요나스가 있다.


라힐의 집에서 지내게 된 자인이 일 하러 나가는 그녀 대신 요나스의 보호자가 된다. 


가난하고 외로운 아이들이지만 세상 모든 아이들은 이토록 예쁘고 반짝반짝 빛난다. 두 아이를 보고 있는 내내 너무 안쓰러워 가슴 아프고 그럼에도 불구하고 또 너무 귀여워서 절로 미소가 지어졌다. 


이렇게라도 둘이 함께 있을 수 있다면 좋으련만 요나스의 엄마 라힐은 불법 체류자로 갑자기 붙잡히게 되고, 두 아이만 남겨졌다. 


여동생 사하르를 지켜 주지 못해 집을 나왔던 자인은 요나스조차 지켜낼 힘이 없다. 


상처와 이별의 아픔만을 준 그곳을 떠나려 했던 자인은 여동생 사하르의 죽음을 알게 되고 결국 무책임한 부모를 고발한다. 

나를 세상에 태어나게 한 

 부모님을 고소하고 싶어요.


''사랑받고 존중받고 싶었다''는 자인의 말이 너무 가슴 아팠다. 죽은 여동생 사하르 대신 또 아이를 가졌다는 엄마의 무책임한 말에 기가 막혔다. 


영화 <가버나움>은 어른들이 만들어낸 이 지옥 같은 세상에서 힘겹게 살아가고 있는 많은 아이들을 생각하게 한다. 내가 누리고 있는 것들에 감사하면서도 나누지 못하는 것이 못내 미안해지기도 한다.
[출처] 어른들이 만들어낸 지옥 같은 세상에서도 빛나는 아이들! 영화 <가버나움>|작성자 유쾌한 주용씨

',to_date('20/08/14','RR/MM/DD'),'admin',2);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (4,'원더','조금은 다르게 태어난 어기의 이야기. 





남들과는 조금 다르게 태어난 어기는

 항상 얼굴을 가리기 위해 

우주 헬멧을 쓰고 다닌다.

학교를 다니지 않고 집에서 

엄마에게 수업을 받았던 

어기는 5학년이 된 해에 

처음으로 학교를 가기로 한다. 





학교 첫 날, 반 애들에게 놀림을 받은

 어기는 또 다시 상처를 받게 되고 ,

집에 와서 괜한 심술을 부린다. 

?

?

어기의 부모님은 따뜻한 사람들이다. 

어기를 달래며 자신감을 북돋아준다. 

?

?


너무 귀여운 잭 윌 ㅜㅜ

?







놀리는 친구들도 있었고 친구와의 

갈등도 있었지만 마침내

어기는 학교에 완벽하게 적응을 하게 되고 

좋은 친구들도 사귀게 된다. 

?

이 영화에서는 각 등장인물들의 

입장들에 관한 내용들이 나온다. 

항상 어기에게 많은 관심을 갖던 

부모님에게 항상 우선순위에서 

밀려난 누나의 이야기도 나오고

어기와 작은 갈등이 있었던 친구 잭 윌 이야기 등 등 

귀엽고 따뜻한 내용이다.

?

지루한 부분도 없고 중간 중간에 

웃긴 부분들도 있었고 

내 시선으로 인해 누군가 불편하지 않았을까 하는 

반성을 하기도 했다. 

?

?

?

"옳음과 친절함 중 하나를 선택할 땐 

친절함을 선택하라"

?

"돋보이는 것들은 원래 잘 섞이지 못해"

?

"그 사람이 어떤 사람인지 알고 싶다면 

그저 바라보면 된다"

?

힘겨운 싸움을 하는

모두에게 친절하라.

영화. 원더

초반부터 눈물 뚝 뚝 났고 

여기 나온 대부분의 등장인물들이

너무 따뜻하고 어기도 매력있고 

아이들의 순수함도 너무 귀엽고

감동적이어서 많은 사람들이 보면 좋을 것 같다. 

?

각자의 역할들을 

너무 잘 보여주는 영화.

엄마는 엄마대로 아빠는 아빠대로 

어기는 어기대로 

선생님은 선생님대로

친구들은 친구들 대로 ! 

올바른 영화 .

?

?

그리고 앞으로는 조금 더 친절해지기로 ! ',to_date('20/08/14','RR/MM/DD'),'admin',4);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (5,'포드 V 페라리','심지어 일부 "음모론"에 의하면...

전설적인 레이스 카 드라이버가 충돌에서 살아남았다고 말한다.


1965년 세브링 12시간 레이스의 켄 마일.

?

"암에 걸려 죽는 것보다 레이싱카에서 죽는게 낫다."

?

켄 마일스(Ken Miles)는 

영화 "포드 v 페라리(Ford v Ferrari, 2019)"의 원작인

A.J. 베임(A.J. Baime)의 저서 [지옥처럼 가다 : 포드, 페라리, 그리고 르망에서의 속도와 영광을 위한 전투 (Go Like Hell : Ford, Ferrari, and Their Battle for Speed and Glory at Le Mans)]에서 

이렇게 말했다고 한다.

?


Go Like Hell : Ford, Ferrari, and Their Battle for Speed and Glory at Le Mansㅡby A.J.Baime

?

그리고...

크리스찬 베일(Christian Bale)이 연기한

켄 마일스는

하늘색 자동차 운전석에서... 끝난다.

?

그는 영화 끝에서 비극적인 사고로 죽는다.

그러나, 영화에서 보는 것보다 켄 마일스의 미스테리한 죽음에 대한 실제 이야기가 훨씬 더 많다고 한다.


?

"포드 v. 페라리" 이야기는 포드 경영진의 자부심/자존심과 기업의 복수/설욕으로 현대 자동차 역사와 관련된 긴 이야기 중 하나가 되었다.

"포드 v. 페라리"는 아카데미 시상식에서 작품상 후보로 지명되면서 이 이야기에 새로운 관심을 불러 일으켰다.

(2020 오스카 작품상은 봉준호 감독의 기생충)

?

이것은 자동차를 제외하면, 1960년대 미국에 널리 퍼져있던 우주 경주, 달 로켓 발사와 같은 야망에 대한 이야기이기도 하다.

포드는 세계에서 가장 중요한 레이스인 르망(Le Mans)에서 페라리를 이길 차를 만들려고 했다. 당시 페라리는 5년 연속 우승을 하고 있었다.

?


?

제임스 맨골드(James Mangold) 감독의 영화 "포드 v 페라리)는 1960년대 중반 미국 거대 제조업체인 포드(Ford)가 르망(Le Mans)을 통치하던 이탈리아의 페라리 (Ferrari)를 상대로 한 경쟁에 대한 이야기를 전한다.

?

간단히 말해서 : 페라리는 포드에 의해 구매될 예정이었다.

빅 보스 엔초 페라이(Enzo Ferrari)는 자신의 소중한 레이싱 팀을 잃게된다는 사실을 알게되면서 이 계획은 거부된다.

?

그래서 포드는 맷 데이먼(Matt Damon)이 연기한 당시 미국의 유명한 레이싱 카 제작자인 캐롤 쉘비(Carroll Shelby)에게 르망에서 페라리를 이길 차를 개발해달라고 요청한다.

?

그러나 시간은 흐른다.

캐롤 쉘비는 프로젝트에 도움이 필요했고, 그 자동차의 엔지니어 겸 드라이버 역할을 할 수있는 사람을 고용하게 된다 

ㅡ 켄 마일스(Ken Miles) ; 레이스 트랙과 게라지에서 믿을 수는 없었지만, 영국 버밍엄(Brummie) 악센트가 있는 훌륭한 2차대전의 재향군인이었다.

?


?

물론 영화는 험난한 프랑스 시골길, 밤과 낮, 비와 햇빛 속에서 열리는 세계에서 가장 중요한 내구 레이스인 르망 24 시간의 잔혹함을 담은 길고 사실적이고 매혹적인 레이스 장면을 제공한다.

?

그러나 결국 영화의 핵심은 실제로 일어난 사람에 대한 이야기를 재구성하는 것이다.

그럼에도 불구하고 역사의 측면에서 은혜롭고 공평하지는 않다.',to_date('20/08/14','RR/MM/DD'),'admin',5);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (6,'아일라','너무 울어서 눈이 아플 정도다. 이렇게 슬프면서 감동적인 전쟁실화 영화는 정말 간만에 보는 거 같다.

사실 이 영화는 개봉했을 때부터 보고 싶었으나 타이밍을 조금 놓쳤더니 그새 상영관이 너무 줄어 볼 수가 없었다..(도대체 이 나라는 어째서ㅠㅠ) 그러던 중, 올레 티비의 티비포인트가 좀 남아서 영화를 찾아보다가 바로 결제했다. 



<간단한 줄거리 및 나의 사족>

영화 <아일라>는 한국전쟁 중 유엔군으로 파병을 온 터키 군인 슐레이만이 우연히 마을사람 모두 학살 된 곳에서 여자 아이를 발견하고 그 여자 아이를 몇년동안 키운 이야기다. 전쟁으로 인해 너무 많은 사람들이 죽고, 심지어 자기 부모님이 죽는 모습까지 봐서 그런거였을까, 아일라는 한동안 말을 아예 못했다. 그러다 슐레이만과 그의 동료 군인들의 사랑을 무럭무럭 먹더니 어느순간 터키어를 술술하고 부대의 마스코트 역할까지 톡톡히 한다. 아일라 역할을 한 배우 김설양은 어찌나 깜찍하고 귀여운지 모른다. 



슐레이만은 고국으로 돌아가는 날짜까지 미뤄가며 아일라와 어떻게든 더 같이 있고 싶어했지만 결국 아일라를 데리고 갈 수 없었다. 어찌 되었든 아일라는 한국 아이였으니 말이다. 반드시 되돌아와 아일라를 찾겠다는 약속만 남긴 채 슐레이만은 터키로 돌아간다. 



슐레이만은 터키로 돌아와서 여자친구에게 버림 받고 (여자친구보다 한국 꼬마애를 더 중요하게 여겼다는 이유로..), 무슨 생각인지 아버지에게 짝을 찾아주면 바로 결혼하겠다더니 결국 자기를 좋아하고 있던 누렛과 결혼을 한다. (약간 읭?스러운 부분이었으나 그 시대는 그런일이 흔했으니 넘어가자) 근데 사실 감동적인 부분은 바로 이 슐레이만의 아내 ''누렛'' 이다. 슐레이만의 약속이면 그건 자기의 약속이기도 하며, 슐레이만의 딸이면 자기의 딸이기도 하다면서 아일라를 단 하루도 잊지 못했을 슐레이만을 열심히 위로해주고 열심히 도와준다. 슐레이만.. 이 복받은 사람.. 



그렇게 세월은 흐르고 흘러 아일라를 찾지 못한 채 60년이 흘러버렸고, 한국기자의 적극적인 도움으로 아일라를 재회할 수 있게 된다. 그러고 영화는 끝이 난다... 
',to_date('20/08/14','RR/MM/DD'),'admin',6);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (7,'주전장','이거 상영하는지 모르시는 분들 많을텐데요. 일본계 미국인 유튜버 미키 데자키가 제작한 위안부 문제에 관한 다큐멘타리입니다. 위안부 문제에 관심이 없던 그가 양쪽 진영의 대표자들을 만나 인터뷰하면서 그 주장을 하나하나 분석하는 내용으로 구성되어 있습니다. 

?

재미있는 다큐냐라고 하면 그건 살짝 유보적인데요. 일단 위안부 문제에 관련해서라면 저는 어느 정도 알고 있었기에 익숙한 내용이 많았습니다. 그리고 여러 주장들을 자세히 다루기 때문에 빠른 속성강의를 듣는 듯한 숨찬 느낌도 있습니다. 일뽕들이 위안부 부정하는 근거로 걸핏하면 들이내미는  “일본군 전쟁 포로 심문 보고서 제 49호” 같은 것까지 꼼꼼하게 다루고 있습니다.

?


?

그래도 제3자적 입장에서 최대한 분석적이고 객관적이려고 노력한 영화이니만큼 볼 가치는 충분합니다. 과장되고 왜곡된 내용으로 감성팔이만 하는 한국 반일영화보다는 훨씬 가치있는 영화이기 때문에 학교에서 교재로 쓰기 딱 좋은 것 같습니다.

?

[주전장]의 뛰어난 점은 양쪽의 주장만 분석하는데서 그치는 게 아니라 그러한 주장을 하는 세력의 실체까지 파고 들고 있다는 점입니다. 그래서 위안부를 부정하는 배후세력의 맨얼굴을 확인할 수 있는 좋은 기회죠. 인종차별, 가부장제, 사이비종교성, 폭력성 등 메이지시대의 사고방식을 그대로 유지하고 있는 극우세력의 현 주소를 그대로 보여주고 있습니다. 그리고 이들 극우세력의 부활에 미국이 크게 한몫했음도 빼놓지 않고 있고요.

?


?

사실 감독은 이러한 일본의 극우화 움직임에 더 관심이 많아 보이는 것 같기도 합니다. 위안부 문제는 이를 조준하기 위한 하나의 가늠쇠가 된 것 같기도 한데요. 

?

어쨌든 쓰레기 같은 반일국뽕영화가 아니고 진짜 각잡고 제대로 역사문제를 다루는 흔치 않은 영화인만큼 많이들 보셨으면 좋겠습니다. 그리고 유사한 주제로 제가 전에 올린 포스팅도 참고해 주시고요.',to_date('20/08/14','RR/MM/DD'),'admin',7);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (8,'당갈','이 영화는 2010년 영연방 대회에서 55kg부문 금메달을 딴 기타 포갓, 그리고 51kg부문 은메달을 딴 바비타 포갓을 주위의 편견과 시선을 극복하며 훌륭한 여성 레슬링 선수로 키워 낸 아버지이자 코치인 마하비르 싱 포갓의 실화를 바탕으로 한 이야기이다. 


2018년 김정숙 여사와도 함께 만나기도 했던 당갈의 실제 주인공들

기타는 2010년, 국제대회에서 인도의 여성 레슬러 사상 첫 금메달을 딴 뒤, 2012년에 올림픽 출전권을 획득하였고, 두 자매는 이후 국제대회에서 29개의 메달을 획득하게 된다. 









여성 레슬러 역할을 맡은 두 배우는 3000명이 넘는 사람들이 몰린 오디션을 거쳐 선발이 되었고 약 8개월동안, 강도높은 훈련을 통해 실제 레슬링 선수와 비교해도 손색이 없을 정도로 영화에서 등장하는 역할에 완벽히 흡수된 듯한 모습이었다. 

?

인도의 국민배우로 불리는 아미르 칸 배우가 딸들의 아버지인 마하비르 역을 맡았는데 엄청난 카리스마와 함께 영화 촬영기간 도중 살을 급격하게 찌우며 영화의 초반과 중반 이후, 그의 전혀 다른 몸을 보면서 이 작품을 위해 그가 엄청난 몰입도를 보여주었다는 생각이 들었다. 

?

또한 인도에서 여성은 빨래를 하거나, 청소를 하고, 부엌에서 요리를 하는 등 지극히 제한된 모습으로 사는 경우가 대부분이며 14세가 되면 짐을 치우는듯한 느낌으로 모르는 남성에게 시집을 가서 집안일을 하며 살게 된다.


이처럼 여성 인권이 매우 낮은 인도사회를 비추어 볼 때, 기타와 같은 여성 레슬러가 국제대회에서 수상을 하며 활약하는 모습을 본 많은 사람들은 레슬링을 배우기 위한 붐이 일어났고, 인도 여성들은 자신들도 여성으로써 무언가 할 수 있다는 희망을 가질 수 있게 된 원동력이 되었을거란 생각이 들었다. 

?

영화 제목인 ''당갈''은 힌디어로 ''레슬링 경기''를 뜻하며 영화에서 다양한 인도음악이 등장하여 주인공들의 마음 속 이야기들을 가사에 잘 녹여내어 신나는 리듬으로 풀어내어 흥겹고 재밌었다. 

?

인도영화 특유의 시각적 효과, 신나는 음악이 특히 인상적이었고 배우들의 연기도 너무 좋아서 기억에 오래 남을 것 같다는 생각이 든다. 올해 본 영화들 중에서 최고의 작품을 만난 것 같아 아직도 흥분이 가시지 않은 상태이며 다른 인도영화들도 국내에서 많이 접할 수 있기를 기대해 보며 리뷰를 시작한다.
',to_date('20/08/14','RR/MM/DD'),'admin',8);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (9,'쇼생크 탈출','설마 이 주제로 이야기 하게 될 계기가 올 거라고는 생각하지 못했습니다. 



 얼마 전에 『쇼생크 탈출』을 티비에서 하기에 다시 본 일이 있었습니다. 저는 다시 봐도 재밌는 명작에 대한 이야기를 블로그에 적으려고 하였으나 제 블로그의 리뷰글은 처음 본 것들 위주로 이어져있으니 다시 정주행한 걸 올리는 건 아니다 싶어 아쉽게 리뷰를 접었습니다만 이렇게 기회가 주어지니 이 김에 적어볼까 합니다.





 쇼생크 탈출.

 모두가 한 번 쯤은 이름을 들어본 작품이고 학교에서 많이 보여줬으리라 생각됩니다. 저도 학교에서 본 횟수만 4번이 됩니다. 물론 주로 영화감상 활동을 했기 때문에 더 많이 접했을지도 모릅니다만...



 쇼생크 탈출의 자세한 내용은 몰라도 ''탈옥''에 대한 이야기임은 제목부터 알 수가 있습니다. 하지만 악질범의 탈옥이라는 끔찍한 일은 사회적 물의를 불러일으킬 수 있는데 이 작품이 사랑받던 이유는 탈옥의 정당성을 확보한 이야기이기 때문이죠.



 주인공이 갇힌 쇼생크 교도소는 철저한 관리가 이루어지는 곳이고 교도관들의 진압 강도가 강한 곳으로 집에 가고 싶다고 울부짖는 죄수가 말을 안듣는다고 그 자리에서 때려 죽이거나, 문제있는 죄수를 반불구로 만드는 행동을 자연스럽게 합니다. 주인공또한 옥상에서 추락사 당할 뻔하기도 하죠.

 교도소장또한 비리를 저지르며 돈 세탁을 하기 바빴고 이를 수월하게 도와주는 주인공을 자신의 곁에 계속 붙잡아두기 위해 주인공의 무죄를 증명해줄 수 있는 죄인에게 누명을 씌우고 총살까지 할 정도였습니다.

 물론 이 환경의 악함만으로 정당성을 확보한 게 아니라 주인공이 교도소에 있을 죄가 없음을 명백히 이야기해줬기 때문에 확보할 수가 있었던 거죠.



 이 영화의 특징으로 생각되는 건 느긋함입니다. 다급하게 뭔가 진행되는 일 없이 천천히 늘어지며 이야기가 흘러가는데 이것이 현실감을 확보했다고 봅니다. ''감옥에 갇혀 있으면 시간이 흘러가기 위해 뭔가 할 일을 만들어야 한다.''라는 말따라 감옥의 느리게 가는 시간을 잘 묘사했다고 봅니다.

 하지만 그런 느리게 가는 시간 속에서도 착착 주인공이 하나, 둘 일을 진행해가는 모습을 자세히 보여주고, 또 등장인물들의 내면적 묘사에 큰 공을 들여 보는 스토리 진행은 착실히 나가면서 관객에게 다양한 볼거리를 제공해줍니다.



 작품 내에서 가장 인상깊은 장면을 뽑자면 노 죄수(브룩스)의 자살입니다. 이 장면은 어린 저에게 상당히 충격적이라 쇼생크 탈출하면 비를 맞으며 자유를 느끼는 앤디보다는 변해버린 사회에 적응하지 못하고 낙오되어 죽음을 선택하는 모습이 제일 먼저 떠오르더군요.',to_date('20/08/14','RR/MM/DD'),'admin',9);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (10,'터미네이터2','터미네이터 시리즈의 신작인 <터미네이터: 다크페이트> 개봉의 여파인지 티비에서 시리즈 최고 명작인 <터미네이터 2: 심판의 날>을 해주고 있어서 오랜만에 봤다. 터미네이터는 내가 태어난 해에 개봉한 영화인데다 어릴 때 티비에서 곧잘 해주곤 했어서 꽤 많이 본 기억이 있다. 가장 마지막에 본 것도 작년이었는데... 지금까지 10번 정도는 본 듯.


터미네이터 하면 역시 캘리포니아 주지사가 다 해먹는다는 이미지가 있지만 내게 있어서 터미네이터는 이 액체금속의 T-1000이다. 내 최고의 악당 베스트 5에 들어간다고 해도 과언이 아닐 정도로 이 녀석은 헐리우드 영화에서 손꼽히는 매력을 가진 악당이다. 처음 터미네이터 2를 봤을 때 느꼈던 충격을 아직도 생생히 기억할 정도. 어릴 때는 저 아저씨가 너무 무서워서 이불 속에 꽁꽁 숨어서 봤던 기억도 있다.


가장 인상깊었던 장면은 역시 사라 코너의 병원 탈출 씬. T-1000의 초재생능력이 아낌없이 묘사되는 장면으로, 쇠창살을 통과한다던지 엘리베이터 틈 안으로 날카롭게 변형한 손을 오성과 한음 마냥 불쑥 집어넣고 여는 장면은 지금 봐도 대단하다. 마무리로 T-800이 쏜 샷건에 머리가 갈라지는 장면은 덤. 총을 아무리 쏴대도 끄떡없고 어떻게 해야 죽는지 도통 감이 안 잡히는 이 무적의 악당은 적이 재생능력을 가지면 주인공이 얼마나 무기력해지는지 보여주는 좋은 사례다. 나는 이 영화에 나오는 액체금속이라는 캐릭터가 드래곤볼의 셀이나 마인부우, 혹은 기생수의 캐릭터들에 적지 않은 영향을 줬을 거라 생각한다.




지금 봐도 꽤 괜찮은 수준의 컴퓨터 그래픽 효과를 보여주는데 당시에는 얼마나 충격적이었을지... 또 그걸 표현하기 위해 당대 기술력으로 얼마나 노력했을지 감조차 잡히지 않는다. 더 놀라운 것은 이 액체금속이 갈라지는 씬을 CG가 아닌 아날로그 방식으로 촬영했다는 것. 제임스 카메룬 감독은 정말 영화 하나씩 낼 때마다 혁명이라는 게 무엇인지 보여주는 사람 같다. 헐리우드 영화의 판도를 이 사람 혼자서 몇 번씩이나 바꾸고 있는 걸 보면 정말 영화사에 길이 남길 인물 그 자체다.


화려한 액션과 그래픽 기술도 대단한 영화지만 이 영화가 말하고자 하는 미래에 관한 고찰 또한 눈여겨봐야 할 것이다. 여기서 터미네이터를 위시한 인공지능 로봇은 긍정적인 진화와 부정적인 진화라는 두 가지 행보로 묘사되는데, 전자가 인간과 교감을 해가며 우정을 쌓는 T-800이라면, 후자는 자신에게 프로그래밍된 목적에 방해되는 자는 자비없이 공격하는 T-1000, 또 사라 코너의 꿈속에서 벌어지는 핵폭발 장면 등이다. 특히 이 폭발씬은 필요 이상으로 비극적으로 그려놨는데, 이는 사라 코너의 편집증적인 심리를 훌륭하게 묘사함은 물론 감독이 관객에게 던지는 영화속 단 하나의 경고로 보인다.


이 영화 이후로 나온 후속작들은 전부 흥행에는 성공했을지언정 기대 이하의 평가를 받았고, 나도 3편 이후로는 본 적이 없다. 이번에 새로 나온 에피소드의 제작을 제임스 카메룬이 맡았다고 하니 조만간 챙겨봐야겠다. 나이가 들어도 간지나는 아놀드 아저씨가 다시 한 번 돌아왔다!',to_date('20/08/14','RR/MM/DD'),'admin',10);
REM INSERTING into J20200701.SUR
SET DEFINE OFF;
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (1,'토르 VS 아이언맨',to_date('20/07/24','RR/MM/DD'),to_date('20/08/25','RR/MM/DD'),'토르 대 아이언맨 누가 더 셀가요','토르','아이언맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (2,'헐크 VS 아이언맨',to_date('20/07/01','RR/MM/DD'),to_date('20/07/10','RR/MM/DD'),'헐크가 센가요 아이언맨이 센가요','헐크','아이언맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (3,'아이언맨 VS 로키',to_date('20/07/02','RR/MM/DD'),to_date('20/07/11','RR/MM/DD'),'로키도 센가요?','로키','아이언맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (4,'로키 VS 토르',to_date('20/07/03','RR/MM/DD'),to_date('20/07/12','RR/MM/DD'),'토르가 봐주지 않을까요?','로키','토르',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (5,'오딘 VS 토르',to_date('20/07/04','RR/MM/DD'),to_date('20/07/13','RR/MM/DD'),'오딘이 그래도 토르는 이기겠죠?','오딘','토르',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (6,'타노스 VS 오딘',to_date('20/07/05','RR/MM/DD'),to_date('20/07/14','RR/MM/DD'),'오딘이랑 타노스랑 싸우는 거 안나왔죠?','타노스','오딘',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (7,'호크아이 VS 블랙위도우',to_date('20/07/06','RR/MM/DD'),to_date('20/07/15','RR/MM/DD'),'인간계의 싸움','호크아이','블랙위도우',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (8,'"VS" VS "대"',to_date('20/07/07','RR/MM/DD'),to_date('20/07/16','RR/MM/DD'),'궁금해서 영화도 나왔어요','배트맨','슈퍼맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (9,'스파이더맨 VS 맨스파이더',to_date('20/07/08','RR/MM/DD'),to_date('20/07/17','RR/MM/DD'),'맨스파이더는 누구야?','스파이더맨','맨스파이더',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (10,'영화보기 제일 좋은 계절은?',to_date('20/07/09','RR/MM/DD'),to_date('20/07/18','RR/MM/DD'),'봄여름가을겨울 언제 영화 보세요?','봄','여름','가을','겨울',null,'admin');
REM INSERTING into J20200701.S_COMM
SET DEFINE OFF;
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (1,'hongil2',1,'1','뭐야 이게',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (1,'hongil5',2,'2','당연히 오딘이 이기지',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (2,'hongil9',3,'1','이걸 말이라고 하나',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (3,'hongil2',4,'1','당근이죠',to_date('20/07/16','RR/MM/DD'));
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (4,'hongil5',5,'1','제 생각은 그렇지만 다른 분들 생각도 궁금해요',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (5,'hongil7',6,'2','ㄳㄳ',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (6,'hongil2',7,'2','이게 뭐에요',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (5,'hongil4',8,'1','잘못 눌렀어요',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (8,'hongil7',9,'2','댓글 기능 테스트입니다',to_date('20/07/25','RR/MM/DD'));
Insert into J20200701.S_COMM (S_IDX,ID,R_IDX,R_OP,R_CONTENT,R_REGDATE) values (10,'hongil11',10,'3','가을이죠 당연하',to_date('20/07/25','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index PK_MOVIE_INFO
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."PK_MOVIE_INFO" ON "J20200701"."MOVIE_INFO" ("M_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."PK_MEMBER" ON "J20200701"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_SUR
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."PK_SUR" ON "J20200701"."SUR" ("S_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_S_COMM
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."PK_S_COMM" ON "J20200701"."S_COMM" ("S_IDX", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_BOOK_MIND
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."PK_BOOK_MIND" ON "J20200701"."BOOK_MIND" ("ID", "M_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_COMM
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."PK_COMM" ON "J20200701"."COMM" ("C_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_REVIEW
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."PK_REVIEW" ON "J20200701"."REVIEW" ("P_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table MOVIE_INFO
--------------------------------------------------------

  ALTER TABLE "J20200701"."MOVIE_INFO" MODIFY ("M_IDX" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."MOVIE_INFO" MODIFY ("M_NAME" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."MOVIE_INFO" MODIFY ("M_TIME" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."MOVIE_INFO" ADD CONSTRAINT "PK_MOVIE_INFO" PRIMARY KEY ("M_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "J20200701"."MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "J20200701"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table S_COMM
--------------------------------------------------------

  ALTER TABLE "J20200701"."S_COMM" ADD CONSTRAINT "PK_S_COMM" PRIMARY KEY ("S_IDX", "ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "J20200701"."S_COMM" MODIFY ("R_IDX" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."S_COMM" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."S_COMM" MODIFY ("S_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMM
--------------------------------------------------------

  ALTER TABLE "J20200701"."COMM" ADD CONSTRAINT "PK_COMM" PRIMARY KEY ("C_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "J20200701"."COMM" MODIFY ("C_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CS
--------------------------------------------------------

  ALTER TABLE "J20200701"."CS" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."CS" MODIFY ("SUBJECT" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."CS" MODIFY ("CONTENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUR
--------------------------------------------------------

  ALTER TABLE "J20200701"."SUR" ADD CONSTRAINT "PK_SUR" PRIMARY KEY ("S_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "J20200701"."SUR" MODIFY ("S_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "J20200701"."REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("P_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "J20200701"."REVIEW" MODIFY ("P_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOOK_MIND
--------------------------------------------------------

  ALTER TABLE "J20200701"."BOOK_MIND" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."BOOK_MIND" MODIFY ("M_IDX" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."BOOK_MIND" MODIFY ("IDX" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."BOOK_MIND" ADD CONSTRAINT "PK_BOOK_MIND" PRIMARY KEY ("ID", "M_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SUR
--------------------------------------------------------

  ALTER TABLE "J20200701"."SUR" ADD CONSTRAINT "FK_MEMBER_TO_SUR" FOREIGN KEY ("ID")
	  REFERENCES "J20200701"."MEMBER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table S_COMM
--------------------------------------------------------

  ALTER TABLE "J20200701"."S_COMM" ADD CONSTRAINT "FK_MEMBER_TO_S_COMM" FOREIGN KEY ("ID")
	  REFERENCES "J20200701"."MEMBER" ("ID") ENABLE;
  ALTER TABLE "J20200701"."S_COMM" ADD CONSTRAINT "FK_SUR_TO_S_COMM" FOREIGN KEY ("S_IDX")
	  REFERENCES "J20200701"."SUR" ("S_IDX") ENABLE;
--------------------------------------------------------
--  DDL for Procedure BOOK_MIND_ARRAY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "J20200701"."BOOK_MIND_ARRAY" 
(p_id in book_mind.id%type)
IS
  Cursor tbl_book_mind Is Select  id, m_idx,idx
                          From    book_mind
                          WHERE   id =  p_id
                          order by idx;   
  vId      book_mind.id%type;
  vM_idx   book_mind.m_idx%type;
  vIdx     book_mind.idx%type;
  v_seq    number;
Begin
  DBMS_OUTPUT.ENABLE;
    v_seq := 0;
   --Cursor를 FOR문에서 실행시킨다
  FOR book_mind_list IN tbl_book_mind LOOP
       v_seq := v_seq+1;
       UPDATE  book_mind 
       SET     idx = v_seq
       WHERE   id = book_mind_list.id
       AND     m_idx = book_mind_list.m_idx
       ;
      DBMS_OUTPUT.PUT_LINE('유저명 : ' || book_mind_list.id);
      DBMS_OUTPUT.PUT_LINE('영화 번호 : ' || book_mind_list.m_idx);
      DBMS_OUTPUT.PUT_LINE('순서 번호 : ' || book_mind_list.idx);
  END LOOP;

END;

/
--------------------------------------------------------
--  DDL for Procedure MEM_ORDER_BY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "J20200701"."MEM_ORDER_BY" ( id_desc IN VARCHAR2 ,  m_result OUT VARCHAR2)
IS 
BEGIN
   DBMS_OUTPUT.ENABLE;
   select 'order by ' ||id_desc ||' desc' 
   into   m_result 
   from  dual;
   DBMS_OUTPUT.PUT_LINE('m_result : '|| m_result);
   

END;

/

--------------------------------------------------------
--  파일이 생성됨 - 수요일-8월-19-2020   
--------------------------------------------------------
DROP TABLE "J20200701"."CS" cascade constraints;
--------------------------------------------------------
--  DDL for Table CS
--------------------------------------------------------

  CREATE TABLE "J20200701"."CS" 
   (	"C_IDX" NUMBER(*,0), 
	"WRITER" VARCHAR2(20 BYTE), 
	"SUBJECT" VARCHAR2(30 BYTE), 
	"CONTENT" VARCHAR2(100 BYTE), 
	"REG_DATE" DATE, 
	"REF" NUMBER, 
	"RE_STEP" NUMBER, 
	"RE_LEVEL" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "J20200701"."CS"."REF" IS '답변글끼리 그룹';
   COMMENT ON COLUMN "J20200701"."CS"."RE_STEP" IS 'ref내의 순서';
   COMMENT ON COLUMN "J20200701"."CS"."RE_LEVEL" IS '들여쓰기';
REM INSERTING into J20200701.CS
SET DEFINE OFF;
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (12,'hongil2','마음에 안들어요ㅎ','				hongil3 댓글 진짜 ㅡㅡㅎ',to_date('20/08/03','RR/MM/DD'),12,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (9,'hongil3','이게 뭐야','hongil4 탈퇴부탁해요',to_date('20/08/01','RR/MM/DD'),9,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (11,'hongil3','짜증나요','hongil2 인성보소',to_date('20/08/03','RR/MM/DD'),11,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (8,'hongil4','화가 나네요','hongil3 댓글 보셨나요',to_date('20/08/01','RR/MM/DD'),8,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (7,'hongil5','말이 되나요','관리자님 일 좀 하세요',to_date('20/08/01','RR/MM/DD'),7,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (6,'hongil6','관리자님','hongil11 탈퇴 ㄱㄱ',to_date('20/08/01','RR/MM/DD'),6,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (5,'hongil7','이건 좀..','아니지않나요?댓글관리좀',to_date('20/07/07','RR/MM/DD'),5,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (4,'hongil8','글쎄요','hongil6 아닌거같아요',to_date('20/07/07','RR/MM/DD'),4,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (3,'hongil9','와 진짜','관리자님 힘내세요',to_date('20/07/07','RR/MM/DD'),3,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (2,'hongil10','장난하나요','이 사이트 너무 좋잖아 ㅎㅎ',to_date('20/07/07','RR/MM/DD'),2,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,'hongil11','신고합니다','팝콘리뷰 내 마음 속에 신고',to_date('20/07/07','RR/MM/DD'),1,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (15,'admin','답글','넵!',to_date('20/08/03','RR/MM/DD'),9,1,1);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (16,'admin','답글입니다','감사합니다',to_date('20/08/14','RR/MM/DD'),8,1,1);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (13,'admin','답글','저희 사이트를 사랑해주셔서 감사합니다^^',to_date('20/08/03','RR/MM/DD'),2,2,1);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (10,'admin','회원님들','진정하세요',to_date('20/08/03','RR/MM/DD'),10,0,0);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (17,'admin','답변','ㅇㅇ',to_date('20/08/14','RR/MM/DD'),2,1,1);
Insert into J20200701.CS (C_IDX,WRITER,SUBJECT,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (18,'admin','다답글','ㅇㅇ',to_date('20/08/14','RR/MM/DD'),2,3,2);
--------------------------------------------------------
--  DDL for Index CS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."CS_PK" ON "J20200701"."CS" ("C_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table CS
--------------------------------------------------------

  ALTER TABLE "J20200701"."CS" ADD CONSTRAINT "CS_PK" PRIMARY KEY ("C_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "J20200701"."CS" MODIFY ("C_IDX" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."CS" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."CS" MODIFY ("SUBJECT" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."CS" MODIFY ("WRITER" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CS
--------------------------------------------------------

  ALTER TABLE "J20200701"."CS" ADD CONSTRAINT "CS_FK1" FOREIGN KEY ("WRITER")
	  REFERENCES "J20200701"."MEMBER" ("ID") ENABLE;
