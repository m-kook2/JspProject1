/* 회원  */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* 설문조사 게시판 */
DROP TABLE SUR 
	CASCADE CONSTRAINTS;

/* 영화정보 */
DROP TABLE MOVIE_INFO 
	CASCADE CONSTRAINTS;

/* 즐겨찾기-찜하기 */
DROP TABLE BOOK_MIND 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE COMM 
	CASCADE CONSTRAINTS;

/* 리뷰게시판 */
DROP TABLE REVIEW 
	CASCADE CONSTRAINTS;

/* 설문응답 */
DROP TABLE S_COMM 
	CASCADE CONSTRAINTS;

/* 회원  */
CREATE TABLE MEMBER (
	ID VARCHAR2(30) NOT NULL, /* 회원아이디 */
	IDX NUMBER(20), /* 순번 */
	PASSWORD VARCHAR2(30), /* 비밀번호 */
	EMAIL VARCHAR2(30), /* 이메일 */
	NICKNAME VARCHAR2(30), /* 닉네임 */
	GENDER VARCHAR2(30), /* 성별 */
	REG_DATE VARCHAR2(30), /* 가입일 */
	DEL_YN VARCHAR2(30), /* 탈퇴여부 */
	STATUS VARCHAR2(30) /* 회원상태 */
);

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		ID ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			ID
		);

COMMENT ON TABLE MEMBER IS '회원 ';

COMMENT ON COLUMN MEMBER.ID IS '회원아이디';

COMMENT ON COLUMN MEMBER.IDX IS '순번';

COMMENT ON COLUMN MEMBER.PASSWORD IS '비밀번호';

COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';

COMMENT ON COLUMN MEMBER.NICKNAME IS '닉네임';

COMMENT ON COLUMN MEMBER.GENDER IS '성별';

COMMENT ON COLUMN MEMBER.REG_DATE IS '가입일';

COMMENT ON COLUMN MEMBER.DEL_YN IS '탈퇴여부';

COMMENT ON COLUMN MEMBER.STATUS IS '회원상태';

/* 설문조사 게시판 */
CREATE TABLE SUR (
	S_IDX VARCHAR2(100) NOT NULL, /* 설문번호 */
	S_SUB VARCHAR2(50), /* 제목 */
	S_SDATE DATE, /* 시작일 */
	S_EDATE DATE, /* 종료일 */
	S_CONTENT VARCHAR2(2000), /* 소개글 */
	S_OP1 VARCHAR2(50), /* 항목1 */
	S_OP2 VARCHAR2(50), /* 항목2 */
	S_OP3 VARCHAR2(50), /* 항목3 */
	S_OP4 VARCHAR2(50), /* 항목4 */
	S_OP5 VARCHAR2(50), /* 항목5 */
	ID VARCHAR2(30) /* 관리자아이디 */
);

CREATE UNIQUE INDEX PK_SUR
	ON SUR (
		S_IDX ASC
	);

ALTER TABLE SUR
	ADD
		CONSTRAINT PK_SUR
		PRIMARY KEY (
			S_IDX
		);

COMMENT ON TABLE SUR IS '설문조사 게시판';

COMMENT ON COLUMN SUR.S_IDX IS '설문번호';

COMMENT ON COLUMN SUR.S_SUB IS '제목';

COMMENT ON COLUMN SUR.S_SDATE IS '시작일';

COMMENT ON COLUMN SUR.S_EDATE IS '종료일';

COMMENT ON COLUMN SUR.S_CONTENT IS '소개글';

COMMENT ON COLUMN SUR.S_OP1 IS '항목1';

COMMENT ON COLUMN SUR.S_OP2 IS '항목2';

COMMENT ON COLUMN SUR.S_OP3 IS '항목3';

COMMENT ON COLUMN SUR.S_OP4 IS '항목4';

COMMENT ON COLUMN SUR.S_OP5 IS '항목5';

COMMENT ON COLUMN SUR.ID IS '관리자아이디';

/* 영화정보 */
CREATE TABLE MOVIE_INFO (
	M_IDX NUMBER NOT NULL, /* 영화번호 */
	M_NAME VARCHAR2(50) NOT NULL, /* 영화이름 */
	M_GENRE VARCHAR2(20), /* 영화장르 */
	M_DATE DATE, /* 영화개봉일 */
	M_NATION VARCHAR2(20), /* 영화국적 */
	M_TIME NUMBER(3) NOT NULL, /* 상영시간 */
	M_RATE VARCHAR2(20), /* 등급 */
	M_STORY VARCHAR2(4000), /* 줄거리 */
	M_CAST VARCHAR2(20), /* 출연진 */
	M_DIRECTOR VARCHAR2(20), /* 영화감독 */
	M_PHOTO VARCHAR2(2000), /* 포토 */
	M_VIDEO VARCHAR2(2000), /* 동영상 */
	M_POSTER VARCHAR2(2000) NOT NULL, /* 포스터 */
	ID VARCHAR2(30) /* 관리자아이디 */
);

CREATE UNIQUE INDEX PK_MOVIE_INFO
	ON MOVIE_INFO (
		M_IDX ASC
	);

ALTER TABLE MOVIE_INFO
	ADD
		CONSTRAINT PK_MOVIE_INFO
		PRIMARY KEY (
			M_IDX
		);

COMMENT ON TABLE MOVIE_INFO IS '영화정보';

COMMENT ON COLUMN MOVIE_INFO.M_IDX IS '영화번호';

COMMENT ON COLUMN MOVIE_INFO.M_NAME IS '영화이름';

COMMENT ON COLUMN MOVIE_INFO.M_GENRE IS '영화장르';

COMMENT ON COLUMN MOVIE_INFO.M_DATE IS '영화개봉일';

COMMENT ON COLUMN MOVIE_INFO.M_NATION IS '영화국적';

COMMENT ON COLUMN MOVIE_INFO.M_TIME IS '상영시간';

COMMENT ON COLUMN MOVIE_INFO.M_RATE IS '등급';

COMMENT ON COLUMN MOVIE_INFO.M_STORY IS '줄거리';

COMMENT ON COLUMN MOVIE_INFO.M_CAST IS '출연진';

COMMENT ON COLUMN MOVIE_INFO.M_DIRECTOR IS '영화감독';

COMMENT ON COLUMN MOVIE_INFO.M_PHOTO IS '포토';

COMMENT ON COLUMN MOVIE_INFO.M_VIDEO IS '동영상';

COMMENT ON COLUMN MOVIE_INFO.M_POSTER IS '포스터';

COMMENT ON COLUMN MOVIE_INFO.ID IS '관리자아이디';

/* 즐겨찾기-찜하기 */
CREATE TABLE BOOK_MIND (
	ID VARCHAR2(30) NOT NULL, /* 회원아이디 */
	M_IDX NUMBER NOT NULL, /* 영화번호 */
	IDX NUMBER NOT NULL, /* 순번 */
	MIND VARCHAR2(20), /* 찜한 영화 */
	REG_DATE DATE /* 등록날짜 */
);

CREATE UNIQUE INDEX PK_BOOK_MIND
	ON BOOK_MIND (
		ID ASC,
		M_IDX ASC
	);

ALTER TABLE BOOK_MIND
	ADD
		CONSTRAINT PK_BOOK_MIND
		PRIMARY KEY (
			ID,
			M_IDX
		);

COMMENT ON TABLE BOOK_MIND IS '즐겨찾기-찜하기';

COMMENT ON COLUMN BOOK_MIND.ID IS '회원아이디';

COMMENT ON COLUMN BOOK_MIND.M_IDX IS '영화번호';

COMMENT ON COLUMN BOOK_MIND.IDX IS '순번';

COMMENT ON COLUMN BOOK_MIND.MIND IS '찜한 영화';

COMMENT ON COLUMN BOOK_MIND.REG_DATE IS '등록날짜';

/* 댓글 */
CREATE TABLE COMM (
	C_IDX NUMBER NOT NULL, /* 댓글번호 */
	ID VARCHAR2(30), /* 회원아이디 */
	C_CONTENT VARCHAR2(4000), /* 댓글내용 */
	C_SYMPATHY NUMBER, /* 공감수 */
	C_UNSYMPATHY NUMBER, /* 비공감수 */
	C_GRADE NUMBER, /* 평점 */
	C_DATE DATE, /* 작성일자 */
	DEL_YN VARCHAR2(2), /* 삭제여부 */
	M_IDX NUMBER, /* 영화번호 */
	STEP NUMBER, /* 스탭 */
	DEP NUMBER /* 깊이 */
);

CREATE UNIQUE INDEX PK_COMM
	ON COMM (
		C_IDX ASC
	);

ALTER TABLE COMM
	ADD
		CONSTRAINT PK_COMM
		PRIMARY KEY (
			C_IDX
		);

COMMENT ON TABLE COMM IS '댓글';

COMMENT ON COLUMN COMM.C_IDX IS '댓글번호';

COMMENT ON COLUMN COMM.ID IS '회원아이디';

COMMENT ON COLUMN COMM.C_CONTENT IS '댓글내용';

COMMENT ON COLUMN COMM.C_SYMPATHY IS '공감수';

COMMENT ON COLUMN COMM.C_UNSYMPATHY IS '비공감수';

COMMENT ON COLUMN COMM.C_GRADE IS '평점';

COMMENT ON COLUMN COMM.C_DATE IS '작성일자';

COMMENT ON COLUMN COMM.DEL_YN IS '삭제여부';

COMMENT ON COLUMN COMM.M_IDX IS '영화번호';

COMMENT ON COLUMN COMM.STEP IS '스탭';

COMMENT ON COLUMN COMM.DEP IS '깊이';

/* 리뷰게시판 */
CREATE TABLE REVIEW (
	P_IDX NUMBER NOT NULL, /* 게시글 번호 */
	P_TITLE VARCHAR2(20), /* 제목 */
	P_CONTENT VARCHAR2(500), /* 내용 */
	P_DATE DATE, /* 작성일자 */
	ID VARCHAR2(30), /* 관리자아이디 */
	M_IDX NUMBER /* 영화번호 */
);

CREATE UNIQUE INDEX PK_REVIEW
	ON REVIEW (
		P_IDX ASC
	);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT PK_REVIEW
		PRIMARY KEY (
			P_IDX
		);

COMMENT ON TABLE REVIEW IS '리뷰게시판';

COMMENT ON COLUMN REVIEW.P_IDX IS '게시글 번호';

COMMENT ON COLUMN REVIEW.P_TITLE IS '제목';

COMMENT ON COLUMN REVIEW.P_CONTENT IS '내용';

COMMENT ON COLUMN REVIEW.P_DATE IS '작성일자';

COMMENT ON COLUMN REVIEW.ID IS '관리자아이디';

COMMENT ON COLUMN REVIEW.M_IDX IS '영화번호';

/* 설문응답 */
CREATE TABLE S_COMM (
	R_IDX NUMBER NOT NULL, /* 응답번호 */
	S_IDX NUMBER NOT NULL, /* 설문번호 */
	ID VARCHAR2(30) NOT NULL, /* 회원아이디 */
	R_OP VARCHAR2(50), /* 투표항목 */
	R_CONTENT VARCHAR2(4000), /* 내용 */
	R_REGDATE DATE, /* 작성일자 */
	S_IDX2 VARCHAR2(100) /* 설문번호2 */
);

CREATE UNIQUE INDEX PK_S_COMM
	ON S_COMM (
		S_IDX ASC,
		ID ASC
	);

ALTER TABLE S_COMM
	ADD
		CONSTRAINT PK_S_COMM
		PRIMARY KEY (
			S_IDX,
			ID
		);

COMMENT ON TABLE S_COMM IS '설문응답';

COMMENT ON COLUMN S_COMM.R_IDX IS '응답번호';

COMMENT ON COLUMN S_COMM.S_IDX IS '설문번호';

COMMENT ON COLUMN S_COMM.ID IS '회원아이디';

COMMENT ON COLUMN S_COMM.R_OP IS '투표항목';

COMMENT ON COLUMN S_COMM.R_CONTENT IS '내용';

COMMENT ON COLUMN S_COMM.R_REGDATE IS '작성일자';

COMMENT ON COLUMN S_COMM.S_IDX2 IS '설문번호2';

ALTER TABLE SUR
	ADD
		CONSTRAINT FK_MEMBER_TO_SUR
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE MOVIE_INFO
	ADD
		CONSTRAINT FK_MEMBER_TO_MOVIE_INFO
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE BOOK_MIND
	ADD
		CONSTRAINT FK_MOVIE_INFO_TO_BOOK_MIND
		FOREIGN KEY (
			M_IDX
		)
		REFERENCES MOVIE_INFO (
			M_IDX
		);

ALTER TABLE BOOK_MIND
	ADD
		CONSTRAINT FK_MEMBER_TO_BOOK_MIND
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE COMM
	ADD
		CONSTRAINT FK_MOVIE_INFO_TO_COMM
		FOREIGN KEY (
			M_IDX
		)
		REFERENCES MOVIE_INFO (
			M_IDX
		);

ALTER TABLE COMM
	ADD
		CONSTRAINT FK_MEMBER_TO_COMM
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_MEMBER_TO_REVIEW
		FOREIGN KEY (
			ID
		)
		REFERENCES MEMBER (
			ID
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_MOVIE_INFO_TO_REVIEW
		FOREIGN KEY (
			M_IDX
		)
		REFERENCES MOVIE_INFO (
			M_IDX
		);

ALTER TABLE S_COMM
	ADD
		CONSTRAINT FK_SUR_TO_S_COMM
		FOREIGN KEY (
			S_IDX2
		)
		REFERENCES SUR (
			S_IDX
		);

SET DEFINE OFF;
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('admin',1,'2468','email1@gmail.com','nickname2','남자','2020/07/01','N','2');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil2',2,'2468','email2@gmail.com','nickname3','여자','2010/07/01','N','1');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil3',3,'2468','email4@3gmail.com','nickname4','남자','2030/07/01','N','1');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil4',4,'2468','email5@gmail.com','nickname6','남자','2019/07/01','N','1');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil5',5,'2468','email6@gmail.com','nickname7','여자','2018/07/01','N','1');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil6',6,'2468','email6@gmail.com','nickname9','남자','2021/07/01','N','3');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil7',7,'2468','email8@gmail.com','nickname5','여자','2019/07/01','N','3');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil8',8,'2468','email9@gmail.com','nickname54','남자','2018/07/01','N','1');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil9',9,'2468','email@5gmail.com','nickname54','여자','2023/07/01','N','3');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil10',10,'2468','email75@gmail.com','nickname43','여자','2020/07/01','N','1');
Insert into MEMBER (ID,IDX,PASSWORD,EMAIL,NICKNAME,GENDER,REG_DATE,DEL_YN,STATUS) values ('hongil11',11,'2468','email@43gmail.com','nickname78','남자','2020/07/01','N','1');

--------------------------------------------------------
--  파일이 생성됨 - 금요일-7월-24-2020   
--------------------------------------------------------
--REM INSERTING into MOVIE_INFO

SET DEFINE OFF;
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (7,'주전장','호러',to_date('20/07/24','RR/MM/DD'),'영국',82,'12','test','나홍인, 고민국','연상호','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy8w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (8,'당갈','호러',to_date('20/07/24','RR/MM/DD'),'스페인',84,'19','test','나홍인, 고민국','피터 패럴리','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy9w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (9,'쇼생크 탈출','스릴러',to_date('20/07/24','RR/MM/DD'),'미국',86,'0','test','나홍인, 고민국','구수환','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy10w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (10,'터미네이터 2:오리지널','액션',to_date('20/07/24','RR/MM/DD'),'독일',88,'0','test','나홍인, 고민국','나딘 라바키','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy11w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (11,'보헤미안 랩소디','호러',to_date('20/07/24','RR/MM/DD'),'기타',90,'12','test','나홍인, 고민국','댄 스캔론','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy12w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (12,'덕구','드라마',to_date('20/07/24','RR/MM/DD'),'한국',92,'12','test','나홍인, 고민국','피터 패럴리','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy13w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (13,'월-E','스릴러',to_date('20/07/24','RR/MM/DD'),'프랑스',94,'19','test','나홍인, 고민국','제임스 맨골드','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy14w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (14,'나 홀로 집에','로맨스',to_date('20/07/24','RR/MM/DD'),'중국',96,'12','test','나홍인, 고민국','로칸 피네건','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy15w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (15,'라이언 일병 구하기','로맨스',to_date('20/07/24','RR/MM/DD'),'일본',98,'12','test','나홍인, 고민국','피터 패럴리','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy16w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (16,'아이즈 온 미 : 더 무비','로맨스',to_date('20/07/24','RR/MM/DD'),'인도',100,'12','test','나홍인, 고민국','연상호','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy17w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (17,'살인의 추억','스릴러',to_date('20/07/24','RR/MM/DD'),'이탈리아',102,'12','test','나홍인, 고민국','댄 스캔론','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy18w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (18,'빽 투 더 퓨쳐','스릴러',to_date('20/07/24','RR/MM/DD'),'영국',104,'12','test','나홍인, 고민국','강태광','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy19w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (19,'사운드 오브 뮤직','드라마',to_date('20/07/24','RR/MM/DD'),'스페인',106,'12','test','나홍인, 고민국','구수환','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy20w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (20,'매트릭스','액션',to_date('20/07/24','RR/MM/DD'),'미국',108,'12','test','나홍인, 고민국','제임스 맨골드','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy21w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (21,'인생은 아름다워','로맨스',to_date('20/07/24','RR/MM/DD'),'독일',110,'12','test','나홍인, 고민국','로칸 피네건','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy22w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (22,'헬프','다큐',to_date('20/07/24','RR/MM/DD'),'기타',112,'0','test','나홍인, 고민국','피터 패럴리','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy23w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (23,'포레스트 검프','드라마',to_date('20/07/24','RR/MM/DD'),'한국',114,'15','test','나홍인, 고민국','증국상','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy24w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (24,'위대한 쇼맨','액션',to_date('20/07/24','RR/MM/DD'),'프랑스',116,'15','test','나홍인, 고민국','구수환','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy25w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (25,'클래식','호러',to_date('20/07/24','RR/MM/DD'),'중국',118,'15','test','나홍인, 고민국','브라이언 싱어','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy26w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (26,'글래디에이터','드라마',to_date('20/07/24','RR/MM/DD'),'일본',120,'15','test','나홍인, 고민국','연상호','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy27w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (27,'센과 치히로의 행방불명','호러',to_date('20/07/24','RR/MM/DD'),'인도',122,'15','test','나홍인, 고민국','브라이언 싱어','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy28w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (28,'토이 스토리 3','액션',to_date('20/07/24','RR/MM/DD'),'이탈리아',124,'19','test','나홍인, 고민국','연상호','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy29w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (29,'타이타닉','드라마',to_date('20/07/24','RR/MM/DD'),'영국',126,'19','test','나홍인, 고민국','증국상','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy30w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (30,'알라딘','호러',to_date('20/07/24','RR/MM/DD'),'스페인',128,'19','test','나홍인, 고민국','브라이언 싱어','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy31w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (1,'그린북','드라마',to_date('20/07/24','RR/MM/DD'),'한국',70,'0','test','나홍인, 고민국','댄 스캔론','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy2w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (2,'가버나움','액션',to_date('20/07/24','RR/MM/DD'),'프랑스',72,'12','test','나홍인, 고민국','피터 패럴리','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy3w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (3,'베일리 어게인','액션',to_date('20/07/24','RR/MM/DD'),'중국',74,'0','test','나홍인, 고민국','증국상','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy4w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (4,'원더','드라마',to_date('20/07/24','RR/MM/DD'),'일본',76,'0','test','나홍인, 고민국','구수환','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy5w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (5,'포드 V 페라리','스릴러',to_date('20/07/24','RR/MM/DD'),'인도',78,'0','test','나홍인, 고민국','나딘 라바키','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy6w&feature=youtu.be','Poster_Aladdin.jpg','admin');
Insert into MOVIE_INFO (M_IDX,M_NAME,M_GENRE,M_DATE,M_NATION,M_TIME,M_RATE,M_STORY,M_CAST,M_DIRECTOR,M_PHOTO,M_VIDEO,M_POSTER,ID) values (6,'아일라','액션',to_date('20/07/24','RR/MM/DD'),'이탈리아',80,'0','test','나홍인, 고민국','댄 스캔론','Photo_Aladdin.jpg','https://www.youtube.com/watch?v=KrM3vS5sy7w&feature=youtu.be','Poster_Aladdin.jpg','admin');
commit;

REM INSERTING into J20200701.SUR
SET DEFINE OFF;
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('1','토르 대 아이언맨',to_date('20/07/24','RR/MM/DD'),to_date('20/08/25','RR/MM/DD'),'토르 대 아이언맨 누가 더 셀가요','토르','아이언맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('2','헐크 대 아이언맨',to_date('20/07/01','RR/MM/DD'),to_date('20/07/10','RR/MM/DD'),'헐크가 센가요 아이언맨이 센가요','헐크','아이언맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('3','아이언맨 대 로키',to_date('20/07/02','RR/MM/DD'),to_date('20/07/11','RR/MM/DD'),'로키도 센가요?','로키','아이언맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('4','로키 대 토르',to_date('20/07/03','RR/MM/DD'),to_date('20/07/12','RR/MM/DD'),'토르가 봐주지 않을까요?','로키','토르',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('5','오딘 대 토르',to_date('20/07/04','RR/MM/DD'),to_date('20/07/13','RR/MM/DD'),'오딘이 그래도 토르는 이기겠죠?','오딘','토르',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('6','타노스 대 오딘',to_date('20/07/05','RR/MM/DD'),to_date('20/07/14','RR/MM/DD'),'오딘이랑 타노스랑 싸우는 거 안나왔죠?','타노스','오딘',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('7','호크아이 대 블랙위도우',to_date('20/07/06','RR/MM/DD'),to_date('20/07/15','RR/MM/DD'),'인간계의 싸움','호크아이','블랙위도우',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('8','배트맨 대 슈퍼맨',to_date('20/07/07','RR/MM/DD'),to_date('20/07/16','RR/MM/DD'),'궁금해서 영화도 나왔어요','배트맨','슈퍼맨',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('9','스파이더맨 대 맨스파이더',to_date('20/07/08','RR/MM/DD'),to_date('20/07/17','RR/MM/DD'),'맨스파이더는 누구야?','스파이더맨','맨스파이더',null,null,null,'admin');
Insert into J20200701.SUR (S_IDX,S_SUB,S_SDATE,S_EDATE,S_CONTENT,S_OP1,S_OP2,S_OP3,S_OP4,S_OP5,ID) values ('10','영화보기 제일 좋은 계절은?',to_date('20/07/09','RR/MM/DD'),to_date('20/07/18','RR/MM/DD'),'봄여름가을겨울 언제 영화 보세요?','봄','여름','가을','겨울',null,'admin');
commit;