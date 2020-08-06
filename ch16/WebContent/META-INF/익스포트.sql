--------------------------------------------------------
--  파일이 생성됨 - 수요일-8월-05-2020   
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
   COMMENT ON COLUMN "J20200701"."MEMBER"."ZIP" IS '우편번호';
   COMMENT ON COLUMN "J20200701"."MEMBER"."ADDR" IS '주소';
   COMMENT ON TABLE "J20200701"."MEMBER"  IS '회원 ';
--------------------------------------------------------
--  DDL for Table MOVIE_INFO
--------------------------------------------------------

  CREATE TABLE "J20200701"."MOVIE_INFO" 
   (	"M_IDX" NUMBER, 
	"M_NAME" VARCHAR2(50 BYTE), 
	"M_GENRE" VARCHAR2(20 BYTE), 
	"M_DATE" DATE, 
	"M_NATION" VARCHAR2(20 BYTE), 
	"M_TIME" NUMBER(3,0), 
	"M_RATE" VARCHAR2(20 BYTE), 
	"M_STORY" VARCHAR2(4000 BYTE), 
	"M_CAST" VARCHAR2(20 BYTE), 
	"M_DIRECTOR" VARCHAR2(20 BYTE), 
	"M_PHOTO" VARCHAR2(2000 BYTE), 
	"M_VIDEO" VARCHAR2(2000 BYTE), 
	"M_POSTER" VARCHAR2(2000 BYTE), 
	"ID" VARCHAR2(30 BYTE), 
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
	"P_CONTENT" VARCHAR2(500 BYTE), 
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
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (3,'admin','7번째 영화의 세번째 댓글',2,1,6,to_date('20/08/06','RR/MM/DD'),'N',7,0,0,'admin');
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (4,'admin','7번째 영화의 세번째 댓글의 첫번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,3,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (5,'admin','7번째 영화의 세번째 댓글의 두번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,3,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (7,'admin','7번쨰 영화의 첫댓글의 첫번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,1,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (8,'admin','7번쨰 영화의 첫댓글의 두번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,1,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (9,'admin','7번쨰 영화의 두번째 댓글의 첫번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,2,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (10,'admin','7번쨰 영화의 두번째 댓글의 두번째 답글',0,0,null,to_date('20/08/06','RR/MM/DD'),'N',7,2,1,null);
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (1,'admin','7번쨰 영화의  첫댓글',1,0,10,to_date('20/08/06','RR/MM/DD'),'N',7,0,0,'admin');
Insert into J20200701.COMM (C_IDX,ID,C_CONTENT,C_SYMPATHY,C_UNSYMPATHY,C_GRADE,C_DATE,DEL_YN,M_IDX,STEP,DEP,OVERLAP) values (2,'admin','7번쨰 영화의 두번째 댓글',0,1,8,to_date('20/08/06','RR/MM/DD'),'N',7,0,0,'admin');
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
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('admin',1,'2468','email1@gmail.com','nickname2','남자','2020/07/01','N','2','who.jpg',null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil2',2,'2468','email2@gmail.com','nickname3','여자','2010/07/01','N','1','mangu.jpg',null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil3',3,'2468','email4@3gmail.com','nickname4','남자','2030/07/01','N','1','chulsu.jpg',null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil4',4,'2468','email5@gmail.com','nickname6','남자','2019/07/01','N','1',null,null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil5',5,'2468','email6@gmail.com','nickname7','여자','2018/07/01','N','1',null,null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil6',6,'2468','email6@gmail.com','nickname9','남자','2021/07/01','N','3',null,null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil7',7,'2468','email8@gmail.com','nickname5','여자','2019/07/01','N','3',null,null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil8',8,'2468','email9@gmail.com','nickname54','남자','2018/07/01','N','1',null,null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil9',9,'2468','email@5gmail.com','nickname54','여자','2023/07/01','N','3',null,null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil10',10,'2468','email75@gmail.com','nickname43','여자','2020/07/01','N','1',null,null,null);
Insert into J20200701.MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS,PIC,ZIP,ADDR) values ('hongil11',11,'2468','email@43gmail.com','nickname78','남자','2020/07/01','N','1',null,null,null);
REM INSERTING into J20200701.MOVIE_INFO
SET DEFINE OFF;
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (7,'주전장','호러',to_date('20/07/24','RR/MM/DD'),'영국',82,'12','test','나홍인,고민국','연상호','photo7.jpg','https://www.youtube.com/embed/DXQemwLJlnA','poster7.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (8,'당갈','호러',to_date('20/07/24','RR/MM/DD'),'스페인',84,'19','test','나홍인, 고민국','피터 패럴리','photo8.jpg','https://www.youtube.com/embed/LAuxZniIUKI','poster8.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (10,'터미네이터 2:오리지널','액션',to_date('20/07/24','RR/MM/DD'),'독일',88,'0','test','나홍인, 고민국','나딘 라바키','photo10.jpg','https://www.youtube.com/embed/MzOcGTPyKr0','poster10.jpg','admin','Y');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (11,'보헤미안 랩소디','호러',to_date('20/07/24','RR/MM/DD'),'기타',90,'12','test','나홍인, 고민국','댄 스캔론','photo11.jpg','https://www.youtube.com/embed/XTZko22Ze3o','poster11.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (12,'덕구','드라마',to_date('20/07/24','RR/MM/DD'),'한국',92,'12','test','나홍인, 고민국','피터 패럴리','photo12.jpg','https://www.youtube.com/embed/lMd5MxnTTo0','poster12.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (13,'월-E','스릴러',to_date('20/07/24','RR/MM/DD'),'프랑스',94,'19','test','나홍인, 고민국','제임스 맨골드','photo13.jpg','https://www.youtube.com/embed/hkta4xYaj1k','poster13.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (14,'나 홀로 집에','로맨스',to_date('20/07/24','RR/MM/DD'),'중국',96,'12','test','나홍인, 고민국','로칸 피네건','photo14.jpg','https://www.youtube.com/embed/KpUtdG7XnQY','poster14.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (15,'라이언 일병 구하기','로맨스',to_date('20/07/24','RR/MM/DD'),'일본',98,'12','test','나홍인, 고민국','피터 패럴리','photo15.jpg','https://www.youtube.com/embed/t2_BmIGC2Js','poster15.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (16,'아이즈 온 미 : 더 무비','로맨스',to_date('20/07/24','RR/MM/DD'),'인도',100,'12','test','나홍인, 고민국','연상호','photo16.jpg','https://www.youtube.com/embed/1JsvqaWd_2U','poster16.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (17,'살인의 추억','스릴러',to_date('20/07/24','RR/MM/DD'),'이탈리아',102,'12','test','나홍인, 고민국','댄 스캔론','photo17.jpg','https://www.youtube.com/embed/iEXKd-RgE6s','poster17.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (18,'빽 투 더 퓨쳐','스릴러',to_date('20/07/24','RR/MM/DD'),'영국',104,'12','test','나홍인, 고민국','강태광','photo18.jpg','https://www.youtube.com/embed/I1iHTwKgbkg','poster18.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (19,'사운드 오브 뮤직','드라마',to_date('20/07/24','RR/MM/DD'),'스페인',106,'12','test','나홍인, 고민국','구수환','photo19.jpg','https://www.youtube.com/embed/2S4AxVjLLuI','poster19.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (20,'매트릭스','액션',to_date('20/07/24','RR/MM/DD'),'미국',108,'12','test','나홍인, 고민국','제임스 맨골드','photo20.jpg','https://www.youtube.com/embed/9mn4seqI8Vs','poster20.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (21,'인생은 아름다워','로맨스',to_date('20/07/24','RR/MM/DD'),'독일',110,'12','test','나홍인, 고민국','로칸 피네건','photo21.jpg','https://www.youtube.com/embed/LC903LkokMA','poster21.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (22,'헬프','다큐',to_date('20/07/24','RR/MM/DD'),'기타',112,'0','test','나홍인, 고민국','피터 패럴리','photo22.jpg','https://www.youtube.com/embed/jO7ljUxiuuY','poster22.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (23,'포레스트 검프','드라마',to_date('20/07/24','RR/MM/DD'),'한국',114,'15','test','나홍인, 고민국','증국상','photo23.jpg','https://www.youtube.com/embed/wM67yX1-0NI','poster23.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (24,'위대한 쇼맨','액션',to_date('20/07/24','RR/MM/DD'),'프랑스',116,'15','test','나홍인, 고민국','구수환','photo24.jpg','https://www.youtube.com/embed/cnIOq6P8PUU','poster24.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (25,'클래식','호러',to_date('20/07/24','RR/MM/DD'),'중국',118,'15','test','나홍인, 고민국','브라이언 싱어','photo25.jpg','https://www.youtube.com/embed/Jb1eMxccojs','poster25.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (26,'글래디에이터','드라마',to_date('20/07/24','RR/MM/DD'),'일본',120,'15','test','나홍인, 고민국','연상호','photo26.jpg','https://www.youtube.com/embed/N8hcXQpa52Y','poster26.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (27,'센과 치히로의 행방불명','호러',to_date('20/07/24','RR/MM/DD'),'인도',122,'15','test','나홍인, 고민국','브라이언 싱어','photo27.jpg','https://www.youtube.com/embed/lwrG3HQXTFw','poster27.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (28,'토이 스토리 3','액션',to_date('20/07/24','RR/MM/DD'),'이탈리아',124,'19','test','나홍인, 고민국','연상호','photo28.jpg','https://www.youtube.com/embed/yIK4tGW3MV8','poster28.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (29,'타이타닉','드라마',to_date('20/07/24','RR/MM/DD'),'영국',126,'19','test','나홍인, 고민국','증국상','photo29.jpg','https://www.youtube.com/embed/xMqz1d4eKSk','poster29.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (30,'알라딘','호러',to_date('20/07/24','RR/MM/DD'),'스페인',128,'19','test','나홍인, 고민국','브라이언 싱어','photo30.jpg','https://www.youtube.com/embed/KrM3vS5sy2w','poster30.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (1,'그린북','드라마',to_date('20/07/24','RR/MM/DD'),'한국',70,'0','test','나홍인, 고민국','댄 스캔론','photo1.jpg','https://www.youtube.com/embed/juHmLAQVmOE','poster1.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (2,'가버나움','액션',to_date('20/07/24','RR/MM/DD'),'프랑스',72,'12','test','나홍인, 고민국','피터 패럴리','photo2.jpg','https://www.youtube.com/embed/6m3AoljRIJU','poster2.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (3,'베일리 어게인','액션',to_date('20/07/24','RR/MM/DD'),'중국',74,'0','test','나홍인, 고민국','증국상','photo3.jpg','https://www.youtube.com/embed/fCN2Gh_40tE','poster3.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (4,'원더','드라마',to_date('20/07/24','RR/MM/DD'),'일본',76,'0','test','나홍인, 고민국','구수환','photo4.jpg','https://www.youtube.com/embed/cOsTkVLXcmY','poster4.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (5,'포드 V 페라리','스릴러',to_date('20/07/24','RR/MM/DD'),'인도',78,'0','test','나홍인, 고민국','나딘 라바키','photo5.jpg','https://www.youtube.com/embed/k6uo3eHbGUI','poster5.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (6,'아일라','액션',to_date('20/07/24','RR/MM/DD'),'이탈리아',80,'0','test','나홍인, 고민국','댄 스캔론','photo6.jpg','https://www.youtube.com/embed/2KYFcT4oVJA','poster6.jpg','admin','N');
Insert into J20200701.MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID,DEL_YN) values (9,'쇼생크 탈출','스릴러',to_date('20/08/04','RR/MM/DD'),'미국',86,'0','test','출연진 일동','구수환','photo9.jpg','https://www.youtube.com/embed/p8tgEikbrvc','poster9.jpg','admin','N');
REM INSERTING into J20200701.REVIEW
SET DEFINE OFF;
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (1,'그린 북','비고 모텐슨, 마허샬라 알리 주연의 영화 #그린북 은 우리나라에서 2019년1월에 개봉한 웰메이드 드라마영화이다. 이 영화는 2019 아카데미 시상식에서 작품상을 수상하며 그 작품성을 인정받은 영화이다.',to_date('20/07/28','RR/MM/DD'),'admin',1);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (2,'가버나움','영화가 아닌 다큐멘터리를 보는 듯하고, 주인공의 말과 행동은 연기가 아닌 듯하다.',to_date('20/07/24','RR/MM/DD'),'admin',2);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (3,'베일리 어게인','영화 베일리어게인은 2017년도에 개봉한',to_date('20/07/23','RR/MM/DD'),'admin',3);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (4,'원더','원작소설이 있던 <원더>는 원작소설 조차도 전세계 800만 독자를 사로 잡은 베스트셀러인데요!',to_date('20/07/22','RR/MM/DD'),'admin',4);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (5,'포드 V 페라리','우선 이 영화는 실화를 바탕으로 한다.',to_date('20/07/21','RR/MM/DD'),'admin',5);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (6,'아일라','영화 아일라는 6.25. 한국전쟁 중 전쟁 고아가 된 소녀와 터키 한국참전 용사가 만나',to_date('20/07/20','RR/MM/DD'),'admin',6);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (7,'주전장','일본의 인종차별 문제를 언급했다가 우익들에게 맹공격을 당한 일본계 미국인 유투버 미키 데자키는',to_date('20/07/28','RR/MM/DD'),'admin',7);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (8,'당갈','이 영화는 2010년 영연방 대회에서 55kg부문 금메달을 딴 기타 포갓',to_date('20/07/28','RR/MM/DD'),'admin',8);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (9,'쇼생크 탈출','주인공 앤디 듀프레인이 바람핀 아내와 내연남을 죽였다는 판결을 받고 쇼생크 교도소에 수감된다. 수감되면서 겪는 이야기와 그 수감을 알아서 마무리 짓는 이야기. ',to_date('20/07/28','RR/MM/DD'),'admin',9);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (10,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (11,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (12,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (13,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (14,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (15,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (16,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (17,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (18,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (19,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (20,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (21,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (22,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (23,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (24,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (25,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (26,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (27,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (28,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (29,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (30,'터미네이터2','최고의 SF 액션 영화 중 하나이자 감독인 제임스 카메론의',to_date('20/07/28','RR/MM/DD'),'admin',10);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (31,'그린 북','비고 모텐슨, 마허샬라 알리 주연의 영화 #그린북 은 우리나라에서 2019년1월에 개봉한 웰메이드 드라마영화이다. 이 영화는 2019 아카데미 시상식에서 작품상을 수상하며 그 작품성을 인정받은 영화이다.',to_date('20/07/28','RR/MM/DD'),'admin',1);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (32,'가버나움','영화가 아닌 다큐멘터리를 보는 듯하고, 주인공의 말과 행동은 연기가 아닌 듯하다.',to_date('20/07/24','RR/MM/DD'),'admin',2);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (33,'베일리 어게인','영화 베일리어게인은 2017년도에 개봉한',to_date('20/07/23','RR/MM/DD'),'admin',3);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (34,'원더','원작소설이 있던 <원더>는 원작소설 조차도 전세계 800만 독자를 사로 잡은 베스트셀러인데요!',to_date('20/07/22','RR/MM/DD'),'admin',4);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (35,'포드 V 페라리','우선 이 영화는 실화를 바탕으로 한다.',to_date('20/07/21','RR/MM/DD'),'admin',5);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (36,'아일라','영화 아일라는 6.25. 한국전쟁 중 전쟁 고아가 된 소녀와 터키 한국참전 용사가 만나',to_date('20/07/20','RR/MM/DD'),'admin',6);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (37,'주전장','일본의 인종차별 문제를 언급했다가 우익들에게 맹공격을 당한 일본계 미국인 유투버 미키 데자키는',to_date('20/07/28','RR/MM/DD'),'admin',7);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (38,'당갈','이 영화는 2010년 영연방 대회에서 55kg부문 금메달을 딴 기타 포갓',to_date('20/07/28','RR/MM/DD'),'admin',8);
Insert into J20200701.REVIEW (P_IDX,P_TITLE,P_CONTENT,P_DATE,ID,M_IDX) values (39,'쇼생크 탈출','주인공 앤디 듀프레인이 바람핀 아내와 내연남을 죽였다는 판결을 받고 쇼생크 교도소에 수감된다. 수감되면서 겪는 이야기와 그 수감을 알아서 마무리 짓는 이야기. ',to_date('20/07/28','RR/MM/DD'),'admin',9);
REM INSERTING into J20200701.SUR
SET DEFINE OFF;
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (1,'토르 대 아이언맨',to_date('20/07/24','RR/MM/DD'),to_date('20/08/25','RR/MM/DD'),'토르 대 아이언맨 누가 더 셀가요','토르','아이언맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (2,'헐크 대 아이언맨',to_date('20/07/01','RR/MM/DD'),to_date('20/07/10','RR/MM/DD'),'헐크가 센가요 아이언맨이 센가요','헐크','아이언맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (3,'아이언맨 대 로키',to_date('20/07/02','RR/MM/DD'),to_date('20/07/11','RR/MM/DD'),'로키도 센가요?','로키','아이언맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (4,'로키 대 토르',to_date('20/07/03','RR/MM/DD'),to_date('20/07/12','RR/MM/DD'),'토르가 봐주지 않을까요?','로키','토르',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (5,'오딘 대 토르',to_date('20/07/04','RR/MM/DD'),to_date('20/07/13','RR/MM/DD'),'오딘이 그래도 토르는 이기겠죠?','오딘','토르',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (6,'타노스 대 오딘',to_date('20/07/05','RR/MM/DD'),to_date('20/07/14','RR/MM/DD'),'오딘이랑 타노스랑 싸우는 거 안나왔죠?','타노스','오딘',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (7,'호크아이 대 블랙위도우',to_date('20/07/06','RR/MM/DD'),to_date('20/07/15','RR/MM/DD'),'인간계의 싸움','호크아이','블랙위도우',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (8,'배트맨 대 슈퍼맨',to_date('20/07/07','RR/MM/DD'),to_date('20/07/16','RR/MM/DD'),'궁금해서 영화도 나왔어요','배트맨','슈퍼맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values (9,'스파이더맨 대 맨스파이더',to_date('20/07/08','RR/MM/DD'),to_date('20/07/17','RR/MM/DD'),'맨스파이더는 누구야?','스파이더맨','맨스파이더',null,null,null,'admin');
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
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "J20200701"."MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "J20200701"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIE_INFO
--------------------------------------------------------

  ALTER TABLE "J20200701"."MOVIE_INFO" ADD CONSTRAINT "PK_MOVIE_INFO" PRIMARY KEY ("M_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "J20200701"."MOVIE_INFO" MODIFY ("M_POSTER" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."MOVIE_INFO" MODIFY ("M_TIME" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."MOVIE_INFO" MODIFY ("M_NAME" NOT NULL ENABLE);
  ALTER TABLE "J20200701"."MOVIE_INFO" MODIFY ("M_IDX" NOT NULL ENABLE);
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
