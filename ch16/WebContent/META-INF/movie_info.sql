--------------------------------------------------------
--  파일이 생성됨 - 월요일-8월-10-2020   
--------------------------------------------------------
DROP TABLE "J20200701"."MOVIE_INFO";
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
--------------------------------------------------------
--  DDL for Index PK_MOVIE_INFO
--------------------------------------------------------

  CREATE UNIQUE INDEX "J20200701"."PK_MOVIE_INFO" ON "J20200701"."MOVIE_INFO" ("M_IDX") 
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
