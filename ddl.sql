-- system
create user JspProject identified by pass;
grant connect, resource, dba to JspProject;

/* DELETEλ¬?_51κ°? */
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


/* DROP TABLE_51κ°? */
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


/* DROP SEQUENCE_51κ°? */
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

/* CREATEλ¬?_51κ°? */

/* ? ?? */
CREATE TABLE tblUser (
	user_seq NUMBER PRIMARY KEY, /* ? ??λ²νΈ */
    name VARCHAR2(500) NOT NULL, /* ?΄λ¦? */
	email VARCHAR2(500) NOT NULL UNIQUE, /* ?΄λ©μΌ */
	pw VARCHAR2(500) NOT NULL, /* λΉλ?λ²νΈ */
	tel VARCHAR2(500) NOT NULL UNIQUE, /* ? ?λ²νΈ */
	address VARCHAR2(500) NOT NULL, /* μ£Όμ */
	birth DATE NOT NULL, /* ????Ό */
	lv CHAR(1) NOT NULL, /* ?±κΈ? */
	ing CHAR(1) NOT NULL /* ??΄?¬λΆ? */
);

/* ?λ§? */
CREATE TABLE tblTheme (
	theme_seq NUMBER PRIMARY KEY, /* ?λ§λ²?Έ */
	name VARCHAR2(500) NOT NULL UNIQUE /* ?λ§λͺ */
);

/* ?΄??κ·? */
CREATE TABLE tblHashtag (
   hashtag_seq NUMBER PRIMARY KEY, /* ?΄??κ·Έλ²?Έ */
   name VARCHAR2(500) NOT NULL UNIQUE /* ?΄??κ·Έλͺ */
);

/* ?μΉμ λ³? */
CREATE TABLE tblLocation (
   location_seq NUMBER PRIMARY KEY, /* ?μΉμ λ³΄λ²?Έ */
   info VARCHAR2(500) NOT NULL UNIQUE /* ?μΉμ λ³΄λ΄?© */
);

/* μΉ΄νκ³ λ¦¬ */
CREATE TABLE tblCategory (
   category_seq NUMBER PRIMARY KEY, /* μΉ΄νκ³ λ¦¬λ²νΈ */
   name VARCHAR2(500) NOT NULL UNIQUE /* μΉ΄νκ³ λ¦¬λͺ? */
);

/* ??Ή */
CREATE TABLE tblRestaurant (
   restaurant_seq NUMBER PRIMARY KEY, /* ??Ήλ²νΈ */
   name VARCHAR2(500) NOT NULL, /* ??Ήλͺ? */
   menu VARCHAR2(500) NOT NULL, /* ???λ©λ΄ */
   time VARCHAR2(500) NOT NULL, /* ?΄??κ°? */
   capacity NUMBER NOT NULL, /* ??©?Έ? */
   tel VARCHAR2(500) NOT NULL, /* ??Ή? ?λ²νΈ */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL, /* ?μΉμ λ³΄λ²?Έ */
   category_seq NUMBER REFERENCES tblCategory(category_seq) NOT NULL /* μΉ΄νκ³ λ¦¬λ²νΈ */
);

/* ??Ή?΄λ―Έμ? */
CREATE TABLE tblRestaurantImg (
   restaurant_img_seq NUMBER PRIMARY KEY, /* ??Ή?΄λ―Έμ?λ²νΈ */
   img VARCHAR2(500) DEFAULT 'restaurant.png' NOT NULL, /* ??Ή?΄λ―Έμ? */
   restaurant_seq NUMBER REFERENCES tblRestaurant(restaurant_seq) NOT NULL /* ??Ήλ²νΈ */
);

/* ??Ή/?΄?΄ */
CREATE TABLE tblRestaurantClose (
   restaurant_close_seq NUMBER PRIMARY KEY, /* ??Ή?΄?΄λ²νΈ */
   start_date DATE NOT NULL, /* ?΄?΄?? */
   end_date DATE NOT NULL, /* ?΄?΄μ’λ£ */
   restaurant_seq NUMBER REFERENCES tblRestaurant(restaurant_seq) NOT NULL /* ??Ήλ²νΈ */
);

/* ?Έ???€ */
CREATE TABLE tblConvenient (
	convenient_seq NUMBER PRIMARY KEY, /* ?Έ???€λ²νΈ */
	name VARCHAR2(500) NOT NULL UNIQUE, /* ?Έ???€?΄λ¦? */
	time VARCHAR2(500) NOT NULL, /* ?΄??κ°? */
	tel VARCHAR2(500) NOT NULL, /* ?Έ???€? ?λ²νΈ */
	img VARCHAR2(500) DEFAULT 'convenient.png' NOT NULL, /* ?Έ???€ ?΄λ―Έμ? */
	location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?μΉμ λ³΄λ²?Έ */
);

/* κΈ°ν?Έ?΅ */
CREATE TABLE tblShop (
   shop_seq NUMBER PRIMARY KEY, /* κΈ°ν?Έ?΅λ²νΈ */
   name VARCHAR2(500) NOT NULL, /* κΈ°ν?Έ?΅λͺ? */
   time VARCHAR2(500) NOT NULL, /* ?΄??κ°? */
   info VARCHAR2(2000) NOT NULL, /* κΈ°ν?Έ?΅?€λͺ? */
   tel VARCHAR2(500) NOT NULL, /* κΈ°ν?Έ?΅? ?λ²νΈ */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?μΉμ λ³΄λ²?Έ */
);

/* κΈ°ν?Έ?΅/?΄?΄ */
CREATE TABLE tblShopClose (
   shop_close_seq NUMBER PRIMARY KEY, /* κΈ°ν?Έ?΅?΄?΄λ²νΈ */
   start_date DATE NOT NULL, /* ?΄?΄?? */
   end_date DATE NOT NULL, /* ?΄?΄μ’λ£ */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* κΈ°ν?Έ?΅λ²νΈ */
);

/* κΈ°ν?Έ?΅?΄λ―Έμ? */
CREATE TABLE tblShopImg (
   shop_img_seq NUMBER PRIMARY KEY, /* κΈ°ν?Έ?΅?΄λ―Έμ?λ²νΈ */
   img VARCHAR2(500) DEFAULT 'shop.png' NOT NULL, /* κΈ°ν?Έ?΅?΄λ―Έμ? */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* κΈ°ν?Έ?΅λ²νΈ */
);

/* ??κ΄? */
CREATE TABLE tblTheater (
   theater_seq NUMBER PRIMARY KEY, /* ??κ΄?λ²νΈ */
   name VARCHAR2(500) NOT NULL, /* ??κ΄?λͺ? */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?μΉμ λ³΄λ²?Έ */
);

/* ??κ΄?/?΄?΄ */
CREATE TABLE tblTheaterClose (
   theater_close_seq NUMBER PRIMARY KEY, /* ???΄?΄λ²νΈ */
   start_date DATE NOT NULL, /* ?΄?΄?? */
   end_date DATE NOT NULL, /* ?΄?΄μ’λ£ */
   theater_seq NUMBER REFERENCES tblTheater(theater_seq) NOT NULL /* ??κ΄?λ²νΈ */
);

/* ?? */
CREATE TABLE tblMovie (
   movie_seq NUMBER PRIMARY KEY, /* ??λ²νΈ */
   name VARCHAR2(500) NOT NULL, /* ??λͺ? */
   period VARCHAR2(500) NOT NULL, /* ????κΈ°κ° */
   runningtime NUMBER NOT NULL, /* ?¬???? */
   img VARCHAR2(500) DEFAULT 'movie.png' NOT NULL, /* ?¬?€?°?΄λ―Έμ? */
   preview VARCHAR2(500) /* ???κ³ νΈ?? */
);

/* ???? */
CREATE TABLE tblMoviePlay (
   movie_play_seq NUMBER PRIMARY KEY, /* ????λ²νΈ */
   start_time VARCHAR2(500) NOT NULL, /* ???????κ°? */
   theater_seq NUMBER REFERENCES tblTheater(theater_seq) NOT NULL, /* ??κ΄?λ²νΈ */
   movie_seq NUMBER REFERENCES tblMovie(movie_seq) NOT NULL /* ??λ²νΈ */
);

/* ??/?΄??κ·? */
CREATE TABLE tblMovieHashtag (
   movie_hashtag_seq NUMBER PRIMARY KEY, /* ???΄??κ·Έλ²?Έ */
   movie_seq NUMBER REFERENCES tblMovie(movie_seq) NOT NULL, /* ??λ²νΈ */
   hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* ?΄??κ·Έλ²?Έ */
);

/* ?¬? μ‘? */
CREATE TABLE tblPhotoZone (
   photozone_seq NUMBER PRIMARY KEY, /* ?¬? μ‘΄λ²?Έ */
   name VARCHAR2(500) NOT NULL, /* ?¬? μ‘΄λͺ */
   time VARCHAR2(500) NOT NULL, /* ?΄??κ°? */
   info VARCHAR2(2000) NOT NULL, /* ?¬? μ‘΄μ€λͺ? */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?μΉμ λ³΄λ²?Έ */
);

/* ?¬? μ‘΄μ΄λ―Έμ? */
CREATE TABLE tblPhotoZoneImg (
   photozone_img_seq NUMBER PRIMARY KEY, /* ?¬? μ‘΄μ΄λ―Έμ?λ²νΈ */
   img VARCHAR2(500) DEFAULT 'photozone.png' NOT NULL, /* ?¬? μ‘΄μ΄λ―Έμ? */
   photozone_seq NUMBER REFERENCES tblPhotoZone(photozone_seq) NOT NULL /* ?¬? μ‘΄λ²?Έ */
);

/* ??€?°λ²? */
CREATE TABLE tblFestival (
   festival_seq NUMBER PRIMARY KEY, /* ??€?°λ²λ²?Έ */
   name VARCHAR2(500) NOT NULL, /* ??€?°λ²λͺ */
   time VARCHAR2(500) NOT NULL, /* ??€?°λ²μκ°? */
   info VARCHAR2(2000) NOT NULL, /* ??€?°λ²μ€λͺ? */
   period VARCHAR2(500) NOT NULL, /* ??€?°λ²κΈ°κ°? */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?μΉμ λ³΄λ²?Έ */
);

/* ??€?°λ²μ΄λ―Έμ? */
CREATE TABLE tblFestivalImg (
   festival_img_seq NUMBER PRIMARY KEY, /* ??€?°λ²μ΄λ―Έμ?λ²νΈ */
   img VARCHAR2(500) DEFAULT 'festival.png' NOT NULL, /* ??€?°λ²μ΄λ―Έμ? */
   festival_seq NUMBER REFERENCES tblFestival(festival_seq) NOT NULL /* ??€?°λ²λ²?Έ */
);

/* ??€?°λ²?/?΄??κ·? */
CREATE TABLE tblFestivalHashtag (
   festival_hashtag_seq NUMBER PRIMARY KEY, /* ??€?°λ²ν΄??κ·Έλ²?Έ */
   festival_seq NUMBER REFERENCES tblFestival(festival_seq) NOT NULL, /* ??€?°λ²λ²?Έ */
   hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* ?΄??κ·Έλ²?Έ */
);

/* ?΄?Έ?? */
CREATE TABLE tblAttraction (
	attraction_seq NUMBER PRIMARY KEY, /* ?΄?Έ??λ²νΈ */
	name VARCHAR2(500) NOT NULL UNIQUE, /* ?΄?Έ??λͺ? */
	capacity NUMBER NOT NULL, /* ??©?Έ? */
	location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL, /* ?μΉμ λ³? */
	time VARCHAR2(500) NOT NULL, /* ?΄??κ°? */
	restriction VARCHAR2(2000), /* ?€ ?¬κΈ? ? ?½?¬?­ */
	theme_seq NUMBER REFERENCES tblTheme(theme_seq) NOT NULL, /* ?λ§λ²?Έ */
    is_test CHAR(1) NOT NULL /* ??€?Έμ±ν */
);

/* ?΄?Έ/?΄?΄ */
CREATE TABLE tblAttractionClose (
	attraction_close_seq NUMBER PRIMARY KEY, /* ?΄?Έ/?΄?΄λ²νΈ */
	start_date DATE NOT NULL, /* ?΄?΄?? */
	end_date DATE NOT NULL, /* ?΄?΄μ’λ£ */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?΄?Έ??λ²νΈ */
);

/* ?΄?Έ?? ??½ */
CREATE TABLE tblAttractionBook (
	attraction_book_seq NUMBER PRIMARY KEY, /* ??½λ²νΈ */
	book_time VARCHAR2(500) NOT NULL, /* ??½?κ°? */
	capacity NUMBER NOT NULL /* ??½κ°??₯?Έ? */
);

/* ?΄?Έ???΄λ―Έμ? */
CREATE TABLE tblAttractionImg (
	attraction_img_seq NUMBER PRIMARY KEY, /* ?΄?Έ?΄λ―Έμ?λ²νΈ */
	img VARCHAR2(500) DEFAULT 'attraction.png' NOT NULL, /* ?΄λ―Έμ? */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?΄?Έ??λ²νΈ */
);

/* ?΄?Έ/?΄??κ·? */
CREATE TABLE tblAttractionHashtag (
	attraction_hashtag_seq NUMBER PRIMARY KEY, /* ?΄?Έ?΄??κ·Έλ²?Έ */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL, /* ?΄?Έ??λ²νΈ */
	hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* ?΄??κ·Έλ²?Έ */
);

/* ??½/?? */
CREATE TABLE tblBookUser (
	book_user_seq NUMBER PRIMARY KEY, /* ??½??λ²νΈ */
    regdate DATE DEFAULT sysdate NOT NULL, /* ??½? μ§? */
	capacity NUMBER NOT NULL, /* ??½?Έ? */
	attraction_book_seq NUMBER REFERENCES tblAttractionBook(attraction_book_seq) NOT NULL, /* ??½λ²νΈ */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ? ??λ²νΈ */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?΄?Έ??λ²νΈ */
);

/* ???λ²μ€ */
CREATE TABLE tblBus (
   bus_seq NUMBER PRIMARY KEY, /* ???λ²μ€λ²νΈ */
   start_time VARCHAR2(500) NOT NULL, /* ???κ°? */
   interval NUMBER NOT NULL, /* λ°°μ°¨?κ°? */
   capacity NUMBER NOT NULL /* λ²μ€??©?Έ? */
);

/* ?Έ?  */
CREATE TABLE tblRoute (
	route_seq NUMBER PRIMARY KEY, /* ?Έ? λ²νΈ */
	route_order NUMBER NOT NULL, /* ?Έ? ?? */
	bus_seq NUMBER REFERENCES tblBus(bus_seq) NOT NULL, /* ???λ²μ€λ²νΈ */
	start_attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL, /* μΆλ°?΄?Έ?? */
	end_attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?μ°©μ΄?Έ?? */
);

/* μ½μ€ */
CREATE TABLE tblCourse (
	course_seq NUMBER PRIMARY KEY, /* μ½μ€λ²νΈ */
	name VARCHAR2(500) NOT NULL UNIQUE, /* μ½μ€λͺ? */
	img VARCHAR2(500) DEFAULT 'course.png' NOT NULL /* μ½μ€?΄λ―Έμ? */
);

/* MBTI */
CREATE TABLE tblMBTI (
	mbti_seq NUMBER PRIMARY KEY, /* MBTIλ²νΈ */
	result VARCHAR2(500) NOT NULL, /* κ²°κ³Όλͺ? */
	mbti VARCHAR2(500) NOT NULL, /* MBTIλͺ? */
	course_seq NUMBER REFERENCES tblCourse(course_seq) NOT NULL, /* μ½μ€λ²νΈ */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?΄?Έ??λ²νΈ */
);

/* μ·¨ν₯??€?Έ λ¬Έμ  */
CREATE TABLE tblTest (
	test_seq NUMBER PRIMARY KEY, /* λ¬Έμ λ²νΈ */
	question VARCHAR2(500) NOT NULL, /* λ¬Έμ ?΄?© */
	answer1 VARCHAR2(500) NOT NULL, /* ? ?1λ²? */
	answer2 VARCHAR2(500) NOT NULL, /* ? ?2λ²? */
	img VARCHAR2(500) DEFAULT 'test.png' NOT NULL /* λ¬Έμ ?΄λ―Έμ? */
);

/* μ·¨ν₯??€?Έ λ¬Έμ  ? ? */
CREATE TABLE tblTestScore (
	test_score_seq NUMBER PRIMARY KEY, /* μ·¨ν₯??€?Έ λ¬Έμ  ? ? */
	point1 NUMBER NOT NULL, /* 1 */
	point2 NUMBER NOT NULL, /* 2 */
	type VARCHAR2(500) NOT NULL, /* type(E/I, N/S, F/T, J/P) */
	test_seq NUMBER REFERENCES tblTest(test_seq) NOT NULL /* λ¬Έμ λ²νΈ */
);

/* μΉ?μ°?/λΆνΈ/κ±΄μ */
CREATE TABLE tblVOC (
	voc_seq NUMBER PRIMARY KEY, /* κ±΄μλ²νΈ */
	type VARCHAR2(500) NOT NULL, /* κ΅¬λΆ */
	service_type VARCHAR2(500) NOT NULL, /* ?λΉμ€? ? */
	subject VARCHAR2(100) NOT NULL, /* κ±΄μ? λͺ? */
	content VARCHAR2(2000) NOT NULL, /* κ±΄μ?΄?© */
	attach VARCHAR2(500), /* μ²¨λ???Ό */
	visit_date DATE NOT NULL, /* λ°©λ¬Έ?Ό */
	answer VARCHAR2(2000), /* ?΅λ³??΄?© */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ? ??λ²νΈ */
    regdate DATE NOT NULL
);

/* ?΄?©λ¬Έμ */
CREATE TABLE tblInquiry (
	inquiry_seq NUMBER PRIMARY KEY, /* ?΄?©λ¬Έμλ²νΈ */
	type VARCHAR2(500) NOT NULL, /* λ¬Έμ? ? */
	subject VARCHAR2(100) NOT NULL, /* λ¬Έμ? λͺ? */
	content VARCHAR2(2000) NOT NULL, /* λ¬Έμ?΄?© */
	attach VARCHAR2(500), /* μ²¨λ???Ό */
	answer VARCHAR2(2000), /* ?΅λ³??΄?© */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL /* ? ??λ²νΈ */
);


/* FAQ */
CREATE TABLE tblFAQ (
   faq_seq NUMBER primary key, /* FAQλ²νΈ */
   type VARCHAR2(500) NOT NULL, /* μΉ΄νκ³ λ¦¬ */
   question VARCHAR2(300) NOT NULL, /* μ§λ¬Έ */
   answer VARCHAR2(2000) NOT NULL, /* ?΅λ³? */
   faq_order NUMBER NOT NULL /* ??λ²νΈ */
);

/* κ³΅μ??¬?­ */
CREATE TABLE tblNotice (
   notice_seq NUMBER primary key, /* κ³΅μ??¬?­λ²νΈ */
   subject VARCHAR2(100) NOT NULL, /* κ³΅μ??¬?­? λͺ? */
   content VARCHAR2(2000), /* κ³΅μ??¬?­?΄?© */
   regdate DATE DEFAULT sysdate NOT NULL, /* κ³΅μ??¬?­?±λ‘μΌ */
   attach VARCHAR2(500), /* κ³΅μ??¬?­μ²¨λ???Ό */
   fix CHAR(1) NOT NULL /* κ³ μ ? λ¬? */
);

/* λΆμ€λ¬ΌμΌ?° */
CREATE TABLE tblLostCenter (
   lost_center_seq NUMBER PRIMARY KEY, /* λΆμ€λ¬Όλ²?Έ */
   type VARCHAR2(500) NOT NULL, /* λΆλ₯ */
   name VARCHAR2(500) NOT NULL, /* ?΅?λ¬Όλͺ */
   location VARCHAR2(500) NOT NULL, /* ?΅??₯? */
   lost_center_date DATE NOT NULL, /* ?΅??Ό */
   img VARCHAR2(500) DEFAULT 'lostcenter.png' NOT NULL, /* λΆμ€λ¬Όμ΄λ―Έμ? */
   result VARCHAR2(500) NOT NULL /* μ²λ¦¬κ²°κ³Ό */
);

/* ?°μΌ? */
CREATE TABLE tblTicket (
   ticket_seq NUMBER primary key, /* ?°μΌλ²?Έ */
   ticket_type VARCHAR2(500) NOT NULL, /* ?°μΌμ’λ₯? */
   person_type VARCHAR2(500) NOT NULL, /* κ°μΈ/?¨μ²΄κ΅¬λΆ? */
   age VARCHAR2(500) NOT NULL, /* ??΄κ΅¬λΆ */
   price NUMBER NOT NULL /* ?κΈ? */
);

/* ?? */
CREATE TABLE tblBenefit (
   benefit_seq NUMBER primary key, /* ??λ²νΈ */
   name VARCHAR2(500) NOT NULL, /* ??λͺ? */
   type VARCHAR2(500) NOT NULL, /* ??μ’λ₯ */
   benefit_date VARCHAR2(500) NOT NULL, /* ??κΈ°κ° */
   discount_rate NUMBER NOT NULL, /* ? ?Έ?¨ */
   img VARCHAR2(500) DEFAULT 'benefit.png' NOT NULL /* ?? ?΄λ―Έμ? */
);

/* ?λ§€λ΄?­ */
CREATE TABLE tblTicketBook (
   ticket_book_seq NUMBER primary key, /* ?λ§€λ΄?­λ²νΈ */
   book_date DATE DEFAULT sysdate NOT NULL, /* ?λ§€μΌ? */
   visit_date DATE NOT NULL, /* λ°©λ¬Έ?Ό? */
   ea NUMBER NOT NULL, /* κ΅¬λ§€?? */
   ticket_seq NUMBER references tblTicket(ticket_seq) NOT NULL, /* ?°μΌλ²?Έ */
   benefit_seq NUMBER references tblbenefit(benefit_seq) NOT NULL /* ??λ²νΈ */
);

/* ??/?λ§? */
CREATE TABLE tblUserBook (
   user_book_seq NUMBER primary key, /* ???λ§€λ²?Έ */
   user_seq NUMBER references tbluser(user_seq) NOT NULL, /* ? ??λ²νΈ */
   ticket_book_seq NUMBER references tblTicketBook(ticket_book_seq) NOT NULL /* ?λ§€λ΄?­λ²νΈ */
);

/* λ¦¬λ·° */
CREATE TABLE tblReview (
   review_seq NUMBER primary key, /* λ¦¬λ·°λ²νΈ */
   subject VARCHAR2(500) NOT NULL, /* λ¦¬λ·°? λͺ? */
   content VARCHAR2(2000) NOT NULL, /* λ¦¬λ·°?΄?© */
   regdate DATE DEFAULT sysdate NOT NULL, /* ?±λ‘μΌ */
   readcount NUMBER NOT NULL, /* μ‘°ν? */
   user_book_seq NUMBER references tbluserbook(user_book_seq) NOT NULL /* ???λ§€λ²?Έ */
);

/* λ¦¬λ·°?΄λ―Έμ? */
CREATE TABLE tblReviewImg (
   review_img_seq NUMBER primary key, /* λ¦¬λ·°?΄λ―Έμ?λ²νΈ */
   img VARCHAR2(500) DEFAULT 'reviewimg.png' NOT NULL, /* λ¦¬λ·°?΄λ―Έμ? */
   review_seq NUMBER references tblreview(review_seq) NOT NULL /* λ¦¬λ·°λ²νΈ */
);

/* ??΄? */
CREATE TABLE tblItem (
   item_seq NUMBER PRIMARY KEY, /* ??΄?λ²νΈ */
   name VARCHAR2(500) NOT NULL, /* ??΄?λͺ? */
   info VARCHAR2(2000) NOT NULL, /* ??΄?? λ³? */
   price NUMBER NOT NULL, /* ??΄?κ°?κ²? */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* κΈ°ν?Έ?΅λ²νΈ */
);

/* ??΄??΄λ―Έμ? */
CREATE TABLE tblItemImg (
   item_img_seq NUMBER PRIMARY KEY, /* ??΄??΄λ―Έμ?λ²νΈ */
   img VARCHAR2(500) DEFAULT 'itemimg.png' NOT NULL, /* ??΄??΄λ―Έμ? */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* ??΄?λ²νΈ */
);

/* ?₯λ°κ΅¬? */
CREATE TABLE tblCart (
   cart_seq NUMBER PRIMARY KEY, /* ?₯λ°κ΅¬?λ²νΈ */
   ea NUMBER NOT NULL, /* ?? */
   cart_option varchar2(500) NOT NULL, /* ?΅? */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* ??΄?λ²νΈ */
);

/* ??/?₯λ°κ΅¬? */
CREATE TABLE tblUserCart (
   user_cart_seq NUMBER PRIMARY KEY, /* ???₯λ°κ΅¬?λ²νΈ */
   user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ? ??λ²νΈ */
   cart_seq NUMBER REFERENCES tblCart(cart_seq) NOT NULL /* ?₯λ°κ΅¬?λ²νΈ */
);

/* κ΅¬λ§€?΄?­ */
CREATE TABLE tblBuy (
   buy_seq NUMBER PRIMARY KEY, /* κ΅¬λ§€?΄?­λ²νΈ */
   buy_date DATE DEFAULT sysdate NOT NULL, /* κ²°μ ?Ό */
   ea NUMBER NOT NULL, /* κ΅¬λ§€?? */
   buy_option VARCHAR2(500) NOT NULL, /* κ΅¬λ§€?΅? */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* ??΄?λ²νΈ */
);

/* ??/κ΅¬λ§€ */
CREATE TABLE tblUserBuy (
   user_buy_seq NUMBER PRIMARY KEY, /* ??κ΅¬λ§€λ²νΈ */
   user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ? ??λ²νΈ */
   buy_seq NUMBER REFERENCES tblBuy(buy_seq) NOT NULL /* κ΅¬λ§€?΄?­λ²νΈ */
);

/* CREATE SEQUENCE_51κ°?*/
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