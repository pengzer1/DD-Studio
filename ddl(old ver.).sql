-- system
create user JspProject identified by pass;
grant connect, resource, dba to JspProject;

/* DELETEë¬?_51ê°? */
DELETE FROM tblUserBuy;
DELETE FROM tblBuy;
DELETE FROM tblUserCart;
DELETE FROM tblCart;
DELETE FROM tblItemImg;
DELETE FROM tblItem;
DELETE FROM tblReviewImg;
DELETE FROM tblReview;
DELETE FROM tblUserBook;
DELETE FROM tblTicketBook;
DELETE FROM tblBenefit;
DELETE FROM tblTicket;
DELETE FROM tblLostCenter;
DELETE FROM tblNotice;
DELETE FROM tblFAQ;
DELETE FROM tblInquiry;
DELETE FROM tblVOC;
DELETE FROM tblTestScore;
DELETE FROM tblTest;
DELETE FROM tblMBTI;
DELETE FROM tblCourse;
DELETE FROM tblRoute;
DELETE FROM tblBus;
DELETE FROM tblBookUser;
DELETE FROM tblAttractionHashtag;
DELETE FROM tblAttractionImg;
DELETE FROM tblAttractionBook;
DELETE FROM tblAttractionClose;
DELETE FROM tblAttraction;
DELETE FROM tblFestivalHashtag;
DELETE FROM tblFestivalImg;
DELETE FROM tblFestival;
DELETE FROM tblPhotoZoneImg;
DELETE FROM tblPhotoZone;
DELETE FROM tblMovieHashtag;
DELETE FROM tblMoviePlay;
DELETE FROM tblMovie;
DELETE FROM tblTheaterClose;
DELETE FROM tblTheater;
DELETE FROM tblShopImg;
DELETE FROM tblShopClose;
DELETE FROM tblShop;
DELETE FROM tblConvenient;
DELETE FROM tblRestaurantClose;
DELETE FROM tblRestaurantImg;
DELETE FROM tblRestaurant;
DELETE FROM tblCategory;
DELETE FROM tblLocation;
DELETE FROM tblHashtag;
DELETE FROM tblTheme;
DELETE FROM tblUser;


/* DROP TABLE_51ê°? */
DROP TABLE tblUserBuy;
DROP TABLE tblBuy;
DROP TABLE tblUserCart;
DROP TABLE tblCart;
DROP TABLE tblItemImg;
DROP TABLE tblItem;
DROP TABLE tblReviewImg;
DROP TABLE tblReview;
DROP TABLE tblUserBook;
DROP TABLE tblTicketBook;
DROP TABLE tblBenefit;
DROP TABLE tblTicket;
DROP TABLE tblLostCenter;
DROP TABLE tblNotice;
DROP TABLE tblFAQ;
DROP TABLE tblInquiry;
DROP TABLE tblVOC;
DROP TABLE tblTestScore;
DROP TABLE tblTest;
DROP TABLE tblMBTI;
DROP TABLE tblCourse;
DROP TABLE tblRoute;
DROP TABLE tblBus;
DROP TABLE tblBookUser;
DROP TABLE tblAttractionHashtag;
DROP TABLE tblAttractionImg;
DROP TABLE tblAttractionBook;
DROP TABLE tblAttractionClose;
DROP TABLE tblAttraction;
DROP TABLE tblFestivalHashtag;
DROP TABLE tblFestivalImg;
DROP TABLE tblFestival;
DROP TABLE tblPhotoZoneImg;
DROP TABLE tblPhotoZone;
DROP TABLE tblMovieHashtag;
DROP TABLE tblMoviePlay;
DROP TABLE tblMovie;
DROP TABLE tblTheaterClose;
DROP TABLE tblTheater;
DROP TABLE tblShopImg;
DROP TABLE tblShopClose;
DROP TABLE tblShop;
DROP TABLE tblConvenient;
DROP TABLE tblRestaurantClose;
DROP TABLE tblRestaurantImg;
DROP TABLE tblRestaurant;
DROP TABLE tblCategory;
DROP TABLE tblLocation;
DROP TABLE tblHashtag;
DROP TABLE tblTheme;
DROP TABLE tblUser;


/* DROP SEQUENCE_51ê°? */
DROP SEQUENCE seqtblUser;
DROP SEQUENCE seqtblTheme;
DROP SEQUENCE seqtblHashtag;
DROP SEQUENCE seqtblLocation;
DROP SEQUENCE seqtblCategory;
DROP SEQUENCE seqtblRestaurant;
DROP SEQUENCE seqtblRestaurantImg;
DROP SEQUENCE seqtblRestaurantClose;
DROP SEQUENCE seqtblConvenient;
DROP SEQUENCE seqtblShop;
DROP SEQUENCE seqtblShopClose;
DROP SEQUENCE seqtblShopImg;
DROP SEQUENCE seqtblTheater;
DROP SEQUENCE seqtblTheaterClose;
DROP SEQUENCE seqtblMovie;
DROP SEQUENCE seqtblMoviePlay;
DROP SEQUENCE seqtblMovieHashtag;
DROP SEQUENCE seqtblPhotoZone;
DROP SEQUENCE seqtblPhotoZoneImg;
DROP SEQUENCE seqtblFestival;
DROP SEQUENCE seqtblFestivalImg;
DROP SEQUENCE seqtblFestivalHashtag;
DROP SEQUENCE seqtblAttraction;
DROP SEQUENCE seqtblAttractionClose;
DROP SEQUENCE seqtblAttractionBook;
DROP SEQUENCE seqtblAttractionImg;
DROP SEQUENCE seqtblAttractionHashtag;
DROP SEQUENCE seqtblBookUser;
DROP SEQUENCE seqtblRoute;
DROP SEQUENCE seqtblBus;
DROP SEQUENCE seqtblCourse;
DROP SEQUENCE seqtblMBTI;
DROP SEQUENCE seqtblTest;
DROP SEQUENCE seqtblTestScore;
DROP SEQUENCE seqtblVOC;
DROP SEQUENCE seqtblInquiry;
DROP SEQUENCE seqtblFAQ;
DROP SEQUENCE seqtblNotice;
DROP SEQUENCE seqtblLostCenter;
DROP SEQUENCE seqtblTicket;
DROP SEQUENCE seqtblBenefit;
DROP SEQUENCE seqtblTicketBook;
DROP SEQUENCE seqtblUserBook;
DROP SEQUENCE seqtblReview;
DROP SEQUENCE seqtblReviewImg;
DROP SEQUENCE seqtblItem;
DROP SEQUENCE seqtblItemImg;
DROP SEQUENCE seqtblCart;
DROP SEQUENCE seqtblUserCart;
DROP SEQUENCE seqtblBuy;
DROP SEQUENCE seqtblUserBuy;

/* CREATEë¬?_51ê°? */

/* ?œ ?? */
CREATE TABLE tblUser (
	user_seq NUMBER PRIMARY KEY, /* ?œ ??ë²ˆí˜¸ */
    name VARCHAR2(500) NOT NULL, /* ?´ë¦? */
	email VARCHAR2(500) NOT NULL UNIQUE, /* ?´ë©”ì¼ */
	pw VARCHAR2(500) NOT NULL, /* ë¹„ë?ë²ˆí˜¸ */
	tel VARCHAR2(500) NOT NULL UNIQUE, /* ? „?™”ë²ˆí˜¸ */
	address VARCHAR2(500) NOT NULL, /* ì£¼ì†Œ */
	birth DATE NOT NULL, /* ?ƒ?…„?›”?¼ */
	lv CHAR(1) NOT NULL, /* ?“±ê¸? */
	ing CHAR(1) NOT NULL /* ?ƒˆ?‡´?—¬ë¶? */
);

/* ?…Œë§? */
CREATE TABLE tblTheme (
	theme_seq NUMBER PRIMARY KEY, /* ?…Œë§ˆë²ˆ?˜¸ */
	name VARCHAR2(500) NOT NULL UNIQUE /* ?…Œë§ˆëª… */
);

/* ?•´?‹œ?ƒœê·? */
CREATE TABLE tblHashtag (
   hashtag_seq NUMBER PRIMARY KEY, /* ?•´?‹œ?ƒœê·¸ë²ˆ?˜¸ */
   name VARCHAR2(500) NOT NULL UNIQUE /* ?•´?‹œ?ƒœê·¸ëª… */
);

/* ?œ„ì¹˜ì •ë³? */
CREATE TABLE tblLocation (
   location_seq NUMBER PRIMARY KEY, /* ?œ„ì¹˜ì •ë³´ë²ˆ?˜¸ */
   info VARCHAR2(500) NOT NULL UNIQUE /* ?œ„ì¹˜ì •ë³´ë‚´?š© */
);

/* ì¹´í…Œê³ ë¦¬ */
CREATE TABLE tblCategory (
   category_seq NUMBER PRIMARY KEY, /* ì¹´í…Œê³ ë¦¬ë²ˆí˜¸ */
   name VARCHAR2(500) NOT NULL UNIQUE /* ì¹´í…Œê³ ë¦¬ëª? */
);

/* ?‹?‹¹ */
CREATE TABLE tblRestaurant (
   restaurant_seq NUMBER PRIMARY KEY, /* ?‹?‹¹ë²ˆí˜¸ */
   name VARCHAR2(500) NOT NULL, /* ?‹?‹¹ëª? */
   menu VARCHAR2(500) NOT NULL, /* ???‘œë©”ë‰´ */
   time VARCHAR2(500) NOT NULL, /* ?š´?˜?‹œê°? */
   capacity NUMBER NOT NULL, /* ?ˆ˜?š©?¸?› */
   tel VARCHAR2(500) NOT NULL, /* ?‹?‹¹? „?™”ë²ˆí˜¸ */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL, /* ?œ„ì¹˜ì •ë³´ë²ˆ?˜¸ */
   category_seq NUMBER REFERENCES tblCategory(category_seq) NOT NULL /* ì¹´í…Œê³ ë¦¬ë²ˆí˜¸ */
);

/* ?‹?‹¹?´ë¯¸ì? */
CREATE TABLE tblRestaurantImg (
   restaurant_img_seq NUMBER PRIMARY KEY, /* ?‹?‹¹?´ë¯¸ì?ë²ˆí˜¸ */
   img VARCHAR2(500) DEFAULT 'restaurant.png' NOT NULL, /* ?‹?‹¹?´ë¯¸ì? */
   restaurant_seq NUMBER REFERENCES tblRestaurant(restaurant_seq) NOT NULL /* ?‹?‹¹ë²ˆí˜¸ */
);

/* ?‹?‹¹/?š´?œ´ */
CREATE TABLE tblRestaurantClose (
   restaurant_close_seq NUMBER PRIMARY KEY, /* ?‹?‹¹?š´?œ´ë²ˆí˜¸ */
   start_date DATE NOT NULL, /* ?š´?œ´?‹œ?‘ */
   end_date DATE NOT NULL, /* ?š´?œ´ì¢…ë£Œ */
   restaurant_seq NUMBER REFERENCES tblRestaurant(restaurant_seq) NOT NULL /* ?‹?‹¹ë²ˆí˜¸ */
);

/* ?¸?˜?‹œ?„¤ */
CREATE TABLE tblConvenient (
	convenient_seq NUMBER PRIMARY KEY, /* ?¸?˜?‹œ?„¤ë²ˆí˜¸ */
	name VARCHAR2(500) NOT NULL UNIQUE, /* ?¸?˜?‹œ?„¤?´ë¦? */
	time VARCHAR2(500) NOT NULL, /* ?š´?˜?‹œê°? */
	tel VARCHAR2(500) NOT NULL, /* ?¸?˜?‹œ?„¤? „?™”ë²ˆí˜¸ */
	img VARCHAR2(500) DEFAULT 'convenient.png' NOT NULL, /* ?¸?˜?‹œ?„¤ ?´ë¯¸ì? */
	location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?œ„ì¹˜ì •ë³´ë²ˆ?˜¸ */
);

/* ê¸°í”„?Š¸?ƒµ */
CREATE TABLE tblShop (
   shop_seq NUMBER PRIMARY KEY, /* ê¸°í”„?Š¸?ƒµë²ˆí˜¸ */
   name VARCHAR2(500) NOT NULL, /* ê¸°í”„?Š¸?ƒµëª? */
   time VARCHAR2(500) NOT NULL, /* ?š´?˜?‹œê°? */
   info VARCHAR2(2000) NOT NULL, /* ê¸°í”„?Š¸?ƒµ?„¤ëª? */
   tel VARCHAR2(500) NOT NULL, /* ê¸°í”„?Š¸?ƒµ? „?™”ë²ˆí˜¸ */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?œ„ì¹˜ì •ë³´ë²ˆ?˜¸ */
);

/* ê¸°í”„?Š¸?ƒµ/?š´?œ´ */
CREATE TABLE tblShopClose (
   shop_close_seq NUMBER PRIMARY KEY, /* ê¸°í”„?Š¸?ƒµ?š´?œ´ë²ˆí˜¸ */
   start_date DATE NOT NULL, /* ?š´?œ´?‹œ?‘ */
   end_date DATE NOT NULL, /* ?š´?œ´ì¢…ë£Œ */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* ê¸°í”„?Š¸?ƒµë²ˆí˜¸ */
);

/* ê¸°í”„?Š¸?ƒµ?´ë¯¸ì? */
CREATE TABLE tblShopImg (
   shop_img_seq NUMBER PRIMARY KEY, /* ê¸°í”„?Š¸?ƒµ?´ë¯¸ì?ë²ˆí˜¸ */
   img VARCHAR2(500) DEFAULT 'shop.png' NOT NULL, /* ê¸°í”„?Š¸?ƒµ?´ë¯¸ì? */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* ê¸°í”„?Š¸?ƒµë²ˆí˜¸ */
);

/* ?˜?™”ê´? */
CREATE TABLE tblTheater (
   theater_seq NUMBER PRIMARY KEY, /* ?˜?™”ê´?ë²ˆí˜¸ */
   name VARCHAR2(500) NOT NULL, /* ?˜?™”ê´?ëª? */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?œ„ì¹˜ì •ë³´ë²ˆ?˜¸ */
);

/* ?˜?™”ê´?/?š´?œ´ */
CREATE TABLE tblTheaterClose (
   theater_close_seq NUMBER PRIMARY KEY, /* ?˜?™”?š´?œ´ë²ˆí˜¸ */
   start_date DATE NOT NULL, /* ?š´?œ´?‹œ?‘ */
   end_date DATE NOT NULL, /* ?š´?œ´ì¢…ë£Œ */
   theater_seq NUMBER REFERENCES tblTheater(theater_seq) NOT NULL /* ?˜?™”ê´?ë²ˆí˜¸ */
);

/* ?˜?™” */
CREATE TABLE tblMovie (
   movie_seq NUMBER PRIMARY KEY, /* ?˜?™”ë²ˆí˜¸ */
   name VARCHAR2(500) NOT NULL, /* ?˜?™”ëª? */
   period VARCHAR2(500) NOT NULL, /* ?˜?™”?ƒ?˜ê¸°ê°„ */
   runningtime NUMBER NOT NULL, /* ?Ÿ¬?‹???„ */
   img VARCHAR2(500) DEFAULT 'movie.png' NOT NULL, /* ?¬?Š¤?„°?´ë¯¸ì? */
   preview VARCHAR2(500) /* ?˜?™”?˜ˆê³ í¸?˜?ƒ */
);

/* ?˜?™”?ƒ?˜ */
CREATE TABLE tblMoviePlay (
   movie_play_seq NUMBER PRIMARY KEY, /* ?˜?™”?ƒ?˜ë²ˆí˜¸ */
   start_time VARCHAR2(500) NOT NULL, /* ?˜?™”?ƒ?˜?‹œ?‘?‹œê°? */
   theater_seq NUMBER REFERENCES tblTheater(theater_seq) NOT NULL, /* ?˜?™”ê´?ë²ˆí˜¸ */
   movie_seq NUMBER REFERENCES tblMovie(movie_seq) NOT NULL /* ?˜?™”ë²ˆí˜¸ */
);

/* ?˜?™”/?•´?‹œ?ƒœê·? */
CREATE TABLE tblMovieHashtag (
   movie_hashtag_seq NUMBER PRIMARY KEY, /* ?˜?™”?•´?‹œ?ƒœê·¸ë²ˆ?˜¸ */
   movie_seq NUMBER REFERENCES tblMovie(movie_seq) NOT NULL, /* ?˜?™”ë²ˆí˜¸ */
   hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* ?•´?‹œ?ƒœê·¸ë²ˆ?˜¸ */
);

/* ?¬?† ì¡? */
CREATE TABLE tblPhotoZone (
   photozone_seq NUMBER PRIMARY KEY, /* ?¬?† ì¡´ë²ˆ?˜¸ */
   name VARCHAR2(500) NOT NULL, /* ?¬?† ì¡´ëª… */
   time VARCHAR2(500) NOT NULL, /* ?š´?˜?‹œê°? */
   info VARCHAR2(2000) NOT NULL, /* ?¬?† ì¡´ì„¤ëª? */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?œ„ì¹˜ì •ë³´ë²ˆ?˜¸ */
);

/* ?¬?† ì¡´ì´ë¯¸ì? */
CREATE TABLE tblPhotoZoneImg (
   photozone_img_seq NUMBER PRIMARY KEY, /* ?¬?† ì¡´ì´ë¯¸ì?ë²ˆí˜¸ */
   img VARCHAR2(500) DEFAULT 'photozone.png' NOT NULL, /* ?¬?† ì¡´ì´ë¯¸ì? */
   photozone_seq NUMBER REFERENCES tblPhotoZone(photozone_seq) NOT NULL /* ?¬?† ì¡´ë²ˆ?˜¸ */
);

/* ?˜?Š¤?‹°ë²? */
CREATE TABLE tblFestival (
   festival_seq NUMBER PRIMARY KEY, /* ?˜?Š¤?‹°ë²Œë²ˆ?˜¸ */
   name VARCHAR2(500) NOT NULL, /* ?˜?Š¤?‹°ë²Œëª… */
   time VARCHAR2(500) NOT NULL, /* ?˜?Š¤?‹°ë²Œì‹œê°? */
   info VARCHAR2(2000) NOT NULL, /* ?˜?Š¤?‹°ë²Œì„¤ëª? */
   period VARCHAR2(500) NOT NULL, /* ?˜?Š¤?‹°ë²Œê¸°ê°? */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?œ„ì¹˜ì •ë³´ë²ˆ?˜¸ */
);

/* ?˜?Š¤?‹°ë²Œì´ë¯¸ì? */
CREATE TABLE tblFestivalImg (
   festival_img_seq NUMBER PRIMARY KEY, /* ?˜?Š¤?‹°ë²Œì´ë¯¸ì?ë²ˆí˜¸ */
   img VARCHAR2(500) DEFAULT 'festival.png' NOT NULL, /* ?˜?Š¤?‹°ë²Œì´ë¯¸ì? */
   festival_seq NUMBER REFERENCES tblFestival(festival_seq) NOT NULL /* ?˜?Š¤?‹°ë²Œë²ˆ?˜¸ */
);

/* ?˜?Š¤?‹°ë²?/?•´?‹œ?ƒœê·? */
CREATE TABLE tblFestivalHashtag (
   festival_hashtag_seq NUMBER PRIMARY KEY, /* ?˜?Š¤?‹°ë²Œí•´?‹œ?ƒœê·¸ë²ˆ?˜¸ */
   festival_seq NUMBER REFERENCES tblFestival(festival_seq) NOT NULL, /* ?˜?Š¤?‹°ë²Œë²ˆ?˜¸ */
   hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* ?•´?‹œ?ƒœê·¸ë²ˆ?˜¸ */
);

/* ?–´?Š¸?™?…˜ */
CREATE TABLE tblAttraction (
	attraction_seq NUMBER PRIMARY KEY, /* ?–´?Š¸?™?…˜ë²ˆí˜¸ */
	name VARCHAR2(500) NOT NULL UNIQUE, /* ?–´?Š¸?™?…˜ëª? */
	capacity NUMBER NOT NULL, /* ?ˆ˜?š©?¸?› */
	location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL, /* ?œ„ì¹˜ì •ë³? */
	time VARCHAR2(500) NOT NULL, /* ?š´?˜?‹œê°? */
	restriction VARCHAR2(2000), /* ?‚¤ ?¬ê¸? ? œ?•½?‚¬?•­ */
	theme_seq NUMBER REFERENCES tblTheme(theme_seq) NOT NULL, /* ?…Œë§ˆë²ˆ?˜¸ */
    is_test CHAR(1) NOT NULL /* ?…Œ?Š¤?Š¸ì±„íƒ */
);

/* ?–´?Š¸/?š´?œ´ */
CREATE TABLE tblAttractionClose (
	attraction_close_seq NUMBER PRIMARY KEY, /* ?–´?Š¸/?š´?œ´ë²ˆí˜¸ */
	start_date DATE NOT NULL, /* ?š´?œ´?‹œ?‘ */
	end_date DATE NOT NULL, /* ?š´?œ´ì¢…ë£Œ */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?–´?Š¸?™?…˜ë²ˆí˜¸ */
);

/* ?–´?Š¸?™?…˜ ?˜ˆ?•½ */
CREATE TABLE tblAttractionBook (
	attraction_book_seq NUMBER PRIMARY KEY, /* ?˜ˆ?•½ë²ˆí˜¸ */
	book_time VARCHAR2(500) NOT NULL, /* ?˜ˆ?•½?‹œê°? */
	capacity NUMBER NOT NULL /* ?˜ˆ?•½ê°??Š¥?¸?› */
);

/* ?–´?Š¸?™?…˜?´ë¯¸ì? */
CREATE TABLE tblAttractionImg (
	attraction_img_seq NUMBER PRIMARY KEY, /* ?–´?Š¸?´ë¯¸ì?ë²ˆí˜¸ */
	img VARCHAR2(500) DEFAULT 'attraction.png' NOT NULL, /* ?´ë¯¸ì? */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?–´?Š¸?™?…˜ë²ˆí˜¸ */
);

/* ?–´?Š¸/?•´?‹œ?ƒœê·? */
CREATE TABLE tblAttractionHashtag (
	attraction_hashtag_seq NUMBER PRIMARY KEY, /* ?–´?Š¸?•´?‹œ?ƒœê·¸ë²ˆ?˜¸ */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL, /* ?–´?Š¸?™?…˜ë²ˆí˜¸ */
	hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* ?•´?‹œ?ƒœê·¸ë²ˆ?˜¸ */
);

/* ?˜ˆ?•½/?šŒ?› */
CREATE TABLE tblBookUser (
	book_user_seq NUMBER PRIMARY KEY, /* ?˜ˆ?•½?šŒ?›ë²ˆí˜¸ */
    regdate DATE DEFAULT sysdate NOT NULL, /* ?˜ˆ?•½?‚ ì§? */
	capacity NUMBER NOT NULL, /* ?˜ˆ?•½?¸?› */
	attraction_book_seq NUMBER REFERENCES tblAttractionBook(attraction_book_seq) NOT NULL, /* ?˜ˆ?•½ë²ˆí˜¸ */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ?œ ??ë²ˆí˜¸ */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?–´?Š¸?™?…˜ë²ˆí˜¸ */
);

/* ?…”??ë²„ìŠ¤ */
CREATE TABLE tblBus (
   bus_seq NUMBER PRIMARY KEY, /* ?…”??ë²„ìŠ¤ë²ˆí˜¸ */
   start_time VARCHAR2(500) NOT NULL, /* ?‹œ?‘?‹œê°? */
   interval NUMBER NOT NULL, /* ë°°ì°¨?‹œê°? */
   capacity NUMBER NOT NULL /* ë²„ìŠ¤?ˆ˜?š©?¸?› */
);

/* ?…¸?„  */
CREATE TABLE tblRoute (
	route_seq NUMBER PRIMARY KEY, /* ?…¸?„ ë²ˆí˜¸ */
	route_order NUMBER NOT NULL, /* ?…¸?„ ?ˆœ?„œ */
	bus_seq NUMBER REFERENCES tblBus(bus_seq) NOT NULL, /* ?…”??ë²„ìŠ¤ë²ˆí˜¸ */
	start_attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL, /* ì¶œë°œ?–´?Š¸?™?…˜ */
	end_attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?„ì°©ì–´?Š¸?™?…˜ */
);

/* ì½”ìŠ¤ */
CREATE TABLE tblCourse (
	course_seq NUMBER PRIMARY KEY, /* ì½”ìŠ¤ë²ˆí˜¸ */
	name VARCHAR2(500) NOT NULL UNIQUE, /* ì½”ìŠ¤ëª? */
	img VARCHAR2(500) DEFAULT 'course.png' NOT NULL /* ì½”ìŠ¤?´ë¯¸ì? */
);

/* MBTI */
CREATE TABLE tblMBTI (
	mbti_seq NUMBER PRIMARY KEY, /* MBTIë²ˆí˜¸ */
	result VARCHAR2(500) NOT NULL, /* ê²°ê³¼ëª? */
	mbti VARCHAR2(500) NOT NULL, /* MBTIëª? */
	course_seq NUMBER REFERENCES tblCourse(course_seq) NOT NULL, /* ì½”ìŠ¤ë²ˆí˜¸ */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?–´?Š¸?™?…˜ë²ˆí˜¸ */
);

/* ì·¨í–¥?…Œ?Š¤?Š¸ ë¬¸ì œ */
CREATE TABLE tblTest (
	test_seq NUMBER PRIMARY KEY, /* ë¬¸ì œë²ˆí˜¸ */
	question VARCHAR2(500) NOT NULL, /* ë¬¸ì œ?‚´?š© */
	answer1 VARCHAR2(500) NOT NULL, /* ?„ ?ƒ1ë²? */
	answer2 VARCHAR2(500) NOT NULL, /* ?„ ?ƒ2ë²? */
	img VARCHAR2(500) DEFAULT 'test.png' NOT NULL /* ë¬¸ì œ?´ë¯¸ì? */
);

/* ì·¨í–¥?…Œ?Š¤?Š¸ ë¬¸ì œ ? ?ˆ˜ */
CREATE TABLE tblTestScore (
	test_score_seq NUMBER PRIMARY KEY, /* ì·¨í–¥?…Œ?Š¤?Š¸ ë¬¸ì œ ? ?ˆ˜ */
	point1 NUMBER NOT NULL, /* 1 */
	point2 NUMBER NOT NULL, /* 2 */
	type VARCHAR2(500) NOT NULL, /* type(E/I, N/S, F/T, J/P) */
	test_seq NUMBER REFERENCES tblTest(test_seq) NOT NULL /* ë¬¸ì œë²ˆí˜¸ */
);

/* ì¹?ì°?/ë¶ˆí¸/ê±´ì˜ */
CREATE TABLE tblVOC (
	voc_seq NUMBER PRIMARY KEY, /* ê±´ì˜ë²ˆí˜¸ */
	type VARCHAR2(500) NOT NULL, /* êµ¬ë¶„ */
	service_type VARCHAR2(500) NOT NULL, /* ?„œë¹„ìŠ¤?œ ?˜• */
	subject VARCHAR2(100) NOT NULL, /* ê±´ì˜? œëª? */
	content VARCHAR2(2000) NOT NULL, /* ê±´ì˜?‚´?š© */
	attach VARCHAR2(500), /* ì²¨ë??ŒŒ?¼ */
	visit_date DATE NOT NULL, /* ë°©ë¬¸?¼ */
	answer VARCHAR2(2000), /* ?‹µë³??‚´?š© */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ?œ ??ë²ˆí˜¸ */
    regdate DATE NOT NULL
);

/* ?´?š©ë¬¸ì˜ */
CREATE TABLE tblInquiry (
	inquiry_seq NUMBER PRIMARY KEY, /* ?´?š©ë¬¸ì˜ë²ˆí˜¸ */
	type VARCHAR2(500) NOT NULL, /* ë¬¸ì˜?œ ?˜• */
	subject VARCHAR2(100) NOT NULL, /* ë¬¸ì˜? œëª? */
	content VARCHAR2(2000) NOT NULL, /* ë¬¸ì˜?‚´?š© */
	attach VARCHAR2(500), /* ì²¨ë??ŒŒ?¼ */
	answer VARCHAR2(2000), /* ?‹µë³??‚´?š© */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL /* ?œ ??ë²ˆí˜¸ */
);


/* FAQ */
CREATE TABLE tblFAQ (
   faq_seq NUMBER primary key, /* FAQë²ˆí˜¸ */
   type VARCHAR2(500) NOT NULL, /* ì¹´í…Œê³ ë¦¬ */
   question VARCHAR2(300) NOT NULL, /* ì§ˆë¬¸ */
   answer VARCHAR2(2000) NOT NULL, /* ?‹µë³? */
   faq_order NUMBER NOT NULL /* ?ˆœ?„œë²ˆí˜¸ */
);

/* ê³µì??‚¬?•­ */
CREATE TABLE tblNotice (
   notice_seq NUMBER primary key, /* ê³µì??‚¬?•­ë²ˆí˜¸ */
   subject VARCHAR2(100) NOT NULL, /* ê³µì??‚¬?•­? œëª? */
   content VARCHAR2(2000), /* ê³µì??‚¬?•­?‚´?š© */
   regdate DATE DEFAULT sysdate NOT NULL, /* ê³µì??‚¬?•­?“±ë¡ì¼ */
   attach VARCHAR2(500), /* ê³µì??‚¬?•­ì²¨ë??ŒŒ?¼ */
   fix CHAR(1) NOT NULL /* ê³ ì •?œ ë¬? */
);

/* ë¶„ì‹¤ë¬¼ì„¼?„° */
CREATE TABLE tblLostCenter (
   lost_center_seq NUMBER PRIMARY KEY, /* ë¶„ì‹¤ë¬¼ë²ˆ?˜¸ */
   type VARCHAR2(500) NOT NULL, /* ë¶„ë¥˜ */
   name VARCHAR2(500) NOT NULL, /* ?Šµ?“ë¬¼ëª… */
   location VARCHAR2(500) NOT NULL, /* ?Šµ?“?¥?†Œ */
   lost_center_date DATE NOT NULL, /* ?Šµ?“?¼ */
   img VARCHAR2(500) DEFAULT 'lostcenter.png' NOT NULL, /* ë¶„ì‹¤ë¬¼ì´ë¯¸ì? */
   result VARCHAR2(500) NOT NULL /* ì²˜ë¦¬ê²°ê³¼ */
);

/* ?‹°ì¼? */
CREATE TABLE tblTicket (
   ticket_seq NUMBER primary key, /* ?‹°ì¼“ë²ˆ?˜¸ */
   ticket_type VARCHAR2(500) NOT NULL, /* ?‹°ì¼“ì¢…ë¥? */
   person_type VARCHAR2(500) NOT NULL, /* ê°œì¸/?‹¨ì²´êµ¬ë¶? */
   age VARCHAR2(500) NOT NULL, /* ?‚˜?´êµ¬ë¶„ */
   price NUMBER NOT NULL /* ?š”ê¸? */
);

/* ?˜œ?ƒ */
CREATE TABLE tblBenefit (
   benefit_seq NUMBER primary key, /* ?˜œ?ƒë²ˆí˜¸ */
   name VARCHAR2(500) NOT NULL, /* ?˜œ?ƒëª? */
   type VARCHAR2(500) NOT NULL, /* ?˜œ?ƒì¢…ë¥˜ */
   benefit_date VARCHAR2(500) NOT NULL, /* ?˜œ?ƒê¸°ê°„ */
   discount_rate NUMBER NOT NULL, /* ?• ?¸?œ¨ */
   img VARCHAR2(500) DEFAULT 'benefit.png' NOT NULL /* ?˜œ?ƒ ?´ë¯¸ì? */
);

/* ?˜ˆë§¤ë‚´?—­ */
CREATE TABLE tblTicketBook (
   ticket_book_seq NUMBER primary key, /* ?˜ˆë§¤ë‚´?—­ë²ˆí˜¸ */
   book_date DATE DEFAULT sysdate NOT NULL, /* ?˜ˆë§¤ì¼? */
   visit_date DATE NOT NULL, /* ë°©ë¬¸?¼? */
   ea NUMBER NOT NULL, /* êµ¬ë§¤?ˆ˜?Ÿ‰ */
   ticket_seq NUMBER references tblTicket(ticket_seq) NOT NULL, /* ?‹°ì¼“ë²ˆ?˜¸ */
   benefit_seq NUMBER references tblbenefit(benefit_seq) NOT NULL /* ?˜œ?ƒë²ˆí˜¸ */
);

/* ?šŒ?›/?˜ˆë§? */
CREATE TABLE tblUserBook (
   user_book_seq NUMBER primary key, /* ?šŒ?›?˜ˆë§¤ë²ˆ?˜¸ */
   user_seq NUMBER references tbluser(user_seq) NOT NULL, /* ?œ ??ë²ˆí˜¸ */
   ticket_book_seq NUMBER references tblTicketBook(ticket_book_seq) NOT NULL /* ?˜ˆë§¤ë‚´?—­ë²ˆí˜¸ */
);

/* ë¦¬ë·° */
CREATE TABLE tblReview (
   review_seq NUMBER primary key, /* ë¦¬ë·°ë²ˆí˜¸ */
   subject VARCHAR2(500) NOT NULL, /* ë¦¬ë·°? œëª? */
   content VARCHAR2(2000) NOT NULL, /* ë¦¬ë·°?‚´?š© */
   regdate DATE DEFAULT sysdate NOT NULL, /* ?“±ë¡ì¼ */
   readcount NUMBER NOT NULL, /* ì¡°íšŒ?ˆ˜ */
   user_book_seq NUMBER references tbluserbook(user_book_seq) NOT NULL /* ?šŒ?›?˜ˆë§¤ë²ˆ?˜¸ */
);

/* ë¦¬ë·°?´ë¯¸ì? */
CREATE TABLE tblReviewImg (
   review_img_seq NUMBER primary key, /* ë¦¬ë·°?´ë¯¸ì?ë²ˆí˜¸ */
   img VARCHAR2(500) DEFAULT 'reviewimg.png' NOT NULL, /* ë¦¬ë·°?´ë¯¸ì? */
   review_seq NUMBER references tblreview(review_seq) NOT NULL /* ë¦¬ë·°ë²ˆí˜¸ */
);

/* ?•„?´?…œ */
CREATE TABLE tblItem (
   item_seq NUMBER PRIMARY KEY, /* ?•„?´?…œë²ˆí˜¸ */
   name VARCHAR2(500) NOT NULL, /* ?•„?´?…œëª? */
   info VARCHAR2(2000) NOT NULL, /* ?•„?´?…œ? •ë³? */
   price NUMBER NOT NULL, /* ?•„?´?…œê°?ê²? */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* ê¸°í”„?Š¸?ƒµë²ˆí˜¸ */
);

/* ?•„?´?…œ?´ë¯¸ì? */
CREATE TABLE tblItemImg (
   item_img_seq NUMBER PRIMARY KEY, /* ?•„?´?…œ?´ë¯¸ì?ë²ˆí˜¸ */
   img VARCHAR2(500) DEFAULT 'itemimg.png' NOT NULL, /* ?•„?´?…œ?´ë¯¸ì? */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* ?•„?´?…œë²ˆí˜¸ */
);

/* ?¥ë°”êµ¬?‹ˆ */
CREATE TABLE tblCart (
   cart_seq NUMBER PRIMARY KEY, /* ?¥ë°”êµ¬?‹ˆë²ˆí˜¸ */
   ea NUMBER NOT NULL, /* ?ˆ˜?Ÿ‰ */
   cart_option varchar2(500) NOT NULL, /* ?˜µ?…˜ */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* ?•„?´?…œë²ˆí˜¸ */
);

/* ?šŒ?›/?¥ë°”êµ¬?‹ˆ */
CREATE TABLE tblUserCart (
   user_cart_seq NUMBER PRIMARY KEY, /* ?šŒ?›?¥ë°”êµ¬?‹ˆë²ˆí˜¸ */
   user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ?œ ??ë²ˆí˜¸ */
   cart_seq NUMBER REFERENCES tblCart(cart_seq) NOT NULL /* ?¥ë°”êµ¬?‹ˆë²ˆí˜¸ */
);

/* êµ¬ë§¤?‚´?—­ */
CREATE TABLE tblBuy (
   buy_seq NUMBER PRIMARY KEY, /* êµ¬ë§¤?‚´?—­ë²ˆí˜¸ */
   buy_date DATE DEFAULT sysdate NOT NULL, /* ê²°ì œ?¼ */
   ea NUMBER NOT NULL, /* êµ¬ë§¤?ˆ˜?Ÿ‰ */
   buy_option VARCHAR2(500) NOT NULL, /* êµ¬ë§¤?˜µ?…˜ */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* ?•„?´?…œë²ˆí˜¸ */
);

/* ?šŒ?›/êµ¬ë§¤ */
CREATE TABLE tblUserBuy (
   user_buy_seq NUMBER PRIMARY KEY, /* ?šŒ?›êµ¬ë§¤ë²ˆí˜¸ */
   user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ?œ ??ë²ˆí˜¸ */
   buy_seq NUMBER REFERENCES tblBuy(buy_seq) NOT NULL /* êµ¬ë§¤?‚´?—­ë²ˆí˜¸ */
);

/* CREATE SEQUENCE_51ê°?*/
CREATE SEQUENCE seqtblUser;
CREATE SEQUENCE seqtblTheme;
CREATE SEQUENCE seqtblHashtag;
CREATE SEQUENCE seqtblLocation;
CREATE SEQUENCE seqtblCategory;
CREATE SEQUENCE seqtblRestaurant;
CREATE SEQUENCE seqtblRestaurantImg;
CREATE SEQUENCE seqtblRestaurantClose;
CREATE SEQUENCE seqtblConvenient;
CREATE SEQUENCE seqtblShop;
CREATE SEQUENCE seqtblShopClose;
CREATE SEQUENCE seqtblShopImg;
CREATE SEQUENCE seqtblTheater;
CREATE SEQUENCE seqtblTheaterClose;
CREATE SEQUENCE seqtblMovie;
CREATE SEQUENCE seqtblMoviePlay;
CREATE SEQUENCE seqtblMovieHashtag;
CREATE SEQUENCE seqtblPhotoZone;
CREATE SEQUENCE seqtblPhotoZoneImg;
CREATE SEQUENCE seqtblFestival;
CREATE SEQUENCE seqtblFestivalImg;
CREATE SEQUENCE seqtblFestivalHashtag;
CREATE SEQUENCE seqtblAttraction;
CREATE SEQUENCE seqtblAttractionClose;
CREATE SEQUENCE seqtblAttractionBook;
CREATE SEQUENCE seqtblAttractionImg;
CREATE SEQUENCE seqtblAttractionHashtag;
CREATE SEQUENCE seqtblBookUser;
CREATE SEQUENCE seqtblRoute;
CREATE SEQUENCE seqtblBus;
CREATE SEQUENCE seqtblCourse;
CREATE SEQUENCE seqtblMBTI;
CREATE SEQUENCE seqtblTest;
CREATE SEQUENCE seqtblTestScore;
CREATE SEQUENCE seqtblVOC;
CREATE SEQUENCE seqtblInquiry;
CREATE SEQUENCE seqtblFAQ;
CREATE SEQUENCE seqtblNotice;
CREATE SEQUENCE seqtblLostCenter;
CREATE SEQUENCE seqtblTicket;
CREATE SEQUENCE seqtblBenefit;
CREATE SEQUENCE seqtblTicketBook;
CREATE SEQUENCE seqtblUserBook;
CREATE SEQUENCE seqtblReview;
CREATE SEQUENCE seqtblReviewImg;
CREATE SEQUENCE seqtblItem;
CREATE SEQUENCE seqtblItemImg;
CREATE SEQUENCE seqtblCart;
CREATE SEQUENCE seqtblUserCart;
CREATE SEQUENCE seqtblBuy;
CREATE SEQUENCE seqtblUserBuy;