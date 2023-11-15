-- system
create user JspProject identified by pass;
grant connect, resource, dba to JspProject;

/* DELETE�?_51�? */
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
DELETE FROM tblLostProperty;
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


/* DROP TABLE_51�? */
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
DROP TABLE tblLostProperty;
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


/* DROP SEQUENCE_51�? */
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
DROP SEQUENCE seqtblLostProperty;
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

/* CREATE�?_51�? */

/* ?��?? */
CREATE TABLE tblUser (
	user_seq NUMBER PRIMARY KEY, /* ?��??번호 */
    name VARCHAR2(500) NOT NULL, /* ?���? */
	email VARCHAR2(500) NOT NULL UNIQUE, /* ?��메일 */
	pw VARCHAR2(500) NOT NULL, /* 비�?번호 */
	tel VARCHAR2(500) NOT NULL UNIQUE, /* ?��?��번호 */
	address VARCHAR2(500) NOT NULL, /* 주소 */
	birth DATE NOT NULL, /* ?��?��?��?�� */
	lv CHAR(1) NOT NULL, /* ?���? */
	ing CHAR(1) NOT NULL /* ?��?��?���? */
);

/* ?���? */
CREATE TABLE tblTheme (
	theme_seq NUMBER PRIMARY KEY, /* ?��마번?�� */
	name VARCHAR2(500) NOT NULL UNIQUE /* ?��마명 */
);

/* ?��?��?���? */
CREATE TABLE tblHashtag (
   hashtag_seq NUMBER PRIMARY KEY, /* ?��?��?��그번?�� */
   name VARCHAR2(500) NOT NULL UNIQUE /* ?��?��?��그명 */
);

/* ?��치정�? */
CREATE TABLE tblLocation (
   location_seq NUMBER PRIMARY KEY, /* ?��치정보번?�� */
   info VARCHAR2(500) NOT NULL UNIQUE /* ?��치정보내?�� */
);

/* 카테고리 */
CREATE TABLE tblCategory (
   category_seq NUMBER PRIMARY KEY, /* 카테고리번호 */
   name VARCHAR2(500) NOT NULL UNIQUE /* 카테고리�? */
);

/* ?��?�� */
CREATE TABLE tblRestaurant (
   restaurant_seq NUMBER PRIMARY KEY, /* ?��?��번호 */
   name VARCHAR2(500) NOT NULL, /* ?��?���? */
   menu VARCHAR2(500) NOT NULL, /* ???��메뉴 */
   time VARCHAR2(500) NOT NULL, /* ?��?��?���? */
   capacity NUMBER NOT NULL, /* ?��?��?��?�� */
   tel VARCHAR2(500) NOT NULL, /* ?��?��?��?��번호 */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL, /* ?��치정보번?�� */
   category_seq NUMBER REFERENCES tblCategory(category_seq) NOT NULL /* 카테고리번호 */
);

/* ?��?��?��미�? */
CREATE TABLE tblRestaurantImg (
   restaurant_img_seq NUMBER PRIMARY KEY, /* ?��?��?��미�?번호 */
   img VARCHAR2(500) DEFAULT 'restaurant.png' NOT NULL, /* ?��?��?��미�? */
   restaurant_seq NUMBER REFERENCES tblRestaurant(restaurant_seq) NOT NULL /* ?��?��번호 */
);

/* ?��?��/?��?�� */
CREATE TABLE tblRestaurantClose (
   restaurant_close_seq NUMBER PRIMARY KEY, /* ?��?��?��?��번호 */
   start_date DATE NOT NULL, /* ?��?��?��?�� */
   end_date DATE NOT NULL, /* ?��?��종료 */
   restaurant_seq NUMBER REFERENCES tblRestaurant(restaurant_seq) NOT NULL /* ?��?��번호 */
);

/* ?��?��?��?�� */
CREATE TABLE tblConvenient (
	convenient_seq NUMBER PRIMARY KEY, /* ?��?��?��?��번호 */
	name VARCHAR2(500) NOT NULL UNIQUE, /* ?��?��?��?��?���? */
	time VARCHAR2(500) NOT NULL, /* ?��?��?���? */
	tel VARCHAR2(500) NOT NULL, /* ?��?��?��?��?��?��번호 */
	img VARCHAR2(500) DEFAULT 'convenient.png' NOT NULL, /* ?��?��?��?�� ?��미�? */
	location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?��치정보번?�� */
);

/* 기프?��?�� */
CREATE TABLE tblShop (
   shop_seq NUMBER PRIMARY KEY, /* 기프?��?��번호 */
   name VARCHAR2(500) NOT NULL, /* 기프?��?���? */
   time VARCHAR2(500) NOT NULL, /* ?��?��?���? */
   info VARCHAR2(2000) NOT NULL, /* 기프?��?��?���? */
   tel VARCHAR2(500) NOT NULL, /* 기프?��?��?��?��번호 */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?��치정보번?�� */
);

/* 기프?��?��/?��?�� */
CREATE TABLE tblShopClose (
   shop_close_seq NUMBER PRIMARY KEY, /* 기프?��?��?��?��번호 */
   start_date DATE NOT NULL, /* ?��?��?��?�� */
   end_date DATE NOT NULL, /* ?��?��종료 */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* 기프?��?��번호 */
);

/* 기프?��?��?��미�? */
CREATE TABLE tblShopImg (
   shop_img_seq NUMBER PRIMARY KEY, /* 기프?��?��?��미�?번호 */
   img VARCHAR2(500) DEFAULT 'shop.png' NOT NULL, /* 기프?��?��?��미�? */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* 기프?��?��번호 */
);

/* ?��?���? */
CREATE TABLE tblTheater (
   theater_seq NUMBER PRIMARY KEY, /* ?��?���?번호 */
   name VARCHAR2(500) NOT NULL, /* ?��?���?�? */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?��치정보번?�� */
);

/* ?��?���?/?��?�� */
CREATE TABLE tblTheaterClose (
   theater_close_seq NUMBER PRIMARY KEY, /* ?��?��?��?��번호 */
   start_date DATE NOT NULL, /* ?��?��?��?�� */
   end_date DATE NOT NULL, /* ?��?��종료 */
   theater_seq NUMBER REFERENCES tblTheater(theater_seq) NOT NULL /* ?��?���?번호 */
);

/* ?��?�� */
CREATE TABLE tblMovie (
   movie_seq NUMBER PRIMARY KEY, /* ?��?��번호 */
   name VARCHAR2(500) NOT NULL, /* ?��?���? */
   period VARCHAR2(500) NOT NULL, /* ?��?��?��?��기간 */
   runningtime NUMBER NOT NULL, /* ?��?��???�� */
   img VARCHAR2(500) DEFAULT 'movie.png' NOT NULL, /* ?��?��?��?��미�? */
   preview VARCHAR2(500) /* ?��?��?��고편?��?�� */
);

/* ?��?��?��?�� */
CREATE TABLE tblMoviePlay (
   movie_play_seq NUMBER PRIMARY KEY, /* ?��?��?��?��번호 */
   start_time VARCHAR2(500) NOT NULL, /* ?��?��?��?��?��?��?���? */
   theater_seq NUMBER REFERENCES tblTheater(theater_seq) NOT NULL, /* ?��?���?번호 */
   movie_seq NUMBER REFERENCES tblMovie(movie_seq) NOT NULL /* ?��?��번호 */
);

/* ?��?��/?��?��?���? */
CREATE TABLE tblMovieHashtag (
   movie_hashtag_seq NUMBER PRIMARY KEY, /* ?��?��?��?��?��그번?�� */
   movie_seq NUMBER REFERENCES tblMovie(movie_seq) NOT NULL, /* ?��?��번호 */
   hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* ?��?��?��그번?�� */
);

/* ?��?���? */
CREATE TABLE tblPhotoZone (
   photozone_seq NUMBER PRIMARY KEY, /* ?��?��존번?�� */
   name VARCHAR2(500) NOT NULL, /* ?��?��존명 */
   time VARCHAR2(500) NOT NULL, /* ?��?��?���? */
   info VARCHAR2(2000) NOT NULL, /* ?��?��존설�? */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?��치정보번?�� */
);

/* ?��?��존이미�? */
CREATE TABLE tblPhotoZoneImg (
   photozone_img_seq NUMBER PRIMARY KEY, /* ?��?��존이미�?번호 */
   img VARCHAR2(500) DEFAULT 'photozone.png' NOT NULL, /* ?��?��존이미�? */
   photozone_seq NUMBER REFERENCES tblPhotoZone(photozone_seq) NOT NULL /* ?��?��존번?�� */
);

/* ?��?��?���? */
CREATE TABLE tblFestival (
   festival_seq NUMBER PRIMARY KEY, /* ?��?��?��벌번?�� */
   name VARCHAR2(500) NOT NULL, /* ?��?��?��벌명 */
   time VARCHAR2(500) NOT NULL, /* ?��?��?��벌시�? */
   info VARCHAR2(2000) NOT NULL, /* ?��?��?��벌설�? */
   period VARCHAR2(500) NOT NULL, /* ?��?��?��벌기�? */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* ?��치정보번?�� */
);

/* ?��?��?��벌이미�? */
CREATE TABLE tblFestivalImg (
   festival_img_seq NUMBER PRIMARY KEY, /* ?��?��?��벌이미�?번호 */
   img VARCHAR2(500) DEFAULT 'festival.png' NOT NULL, /* ?��?��?��벌이미�? */
   festival_seq NUMBER REFERENCES tblFestival(festival_seq) NOT NULL /* ?��?��?��벌번?�� */
);

/* ?��?��?���?/?��?��?���? */
CREATE TABLE tblFestivalHashtag (
   festival_hashtag_seq NUMBER PRIMARY KEY, /* ?��?��?��벌해?��?��그번?�� */
   festival_seq NUMBER REFERENCES tblFestival(festival_seq) NOT NULL, /* ?��?��?��벌번?�� */
   hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* ?��?��?��그번?�� */
);

/* ?��?��?��?�� */
CREATE TABLE tblAttraction (
	attraction_seq NUMBER PRIMARY KEY, /* ?��?��?��?��번호 */
	name VARCHAR2(500) NOT NULL UNIQUE, /* ?��?��?��?���? */
	capacity NUMBER NOT NULL, /* ?��?��?��?�� */
	location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL, /* ?��치정�? */
	time VARCHAR2(500) NOT NULL, /* ?��?��?���? */
	restriction VARCHAR2(2000), /* ?�� ?���? ?��?��?��?�� */
	theme_seq NUMBER REFERENCES tblTheme(theme_seq) NOT NULL, /* ?��마번?�� */
    is_test CHAR(1) NOT NULL /* ?��?��?��채택 */
);

/* ?��?��/?��?�� */
CREATE TABLE tblAttractionClose (
	attraction_close_seq NUMBER PRIMARY KEY, /* ?��?��/?��?��번호 */
	start_date DATE NOT NULL, /* ?��?��?��?�� */
	end_date DATE NOT NULL, /* ?��?��종료 */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?��?��?��?��번호 */
);

/* ?��?��?��?�� ?��?�� */
CREATE TABLE tblAttractionBook (
	attraction_book_seq NUMBER PRIMARY KEY, /* ?��?��번호 */
	book_time VARCHAR2(500) NOT NULL, /* ?��?��?���? */
	capacity NUMBER NOT NULL /* ?��?���??��?��?�� */
);

/* ?��?��?��?��?��미�? */
CREATE TABLE tblAttractionImg (
	attraction_img_seq NUMBER PRIMARY KEY, /* ?��?��?��미�?번호 */
	img VARCHAR2(500) DEFAULT 'attraction.png' NOT NULL, /* ?��미�? */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?��?��?��?��번호 */
);

/* ?��?��/?��?��?���? */
CREATE TABLE tblAttractionHashtag (
	attraction_hashtag_seq NUMBER PRIMARY KEY, /* ?��?��?��?��?��그번?�� */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL, /* ?��?��?��?��번호 */
	hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* ?��?��?��그번?�� */
);

/* ?��?��/?��?�� */
CREATE TABLE tblBookUser (
	book_user_seq NUMBER PRIMARY KEY, /* ?��?��?��?��번호 */
    regdate DATE DEFAULT sysdate NOT NULL, /* ?��?��?���? */
	capacity NUMBER NOT NULL, /* ?��?��?��?�� */
	attraction_book_seq NUMBER REFERENCES tblAttractionBook(attraction_book_seq) NOT NULL, /* ?��?��번호 */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ?��??번호 */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?��?��?��?��번호 */
);

/* ?��??버스 */
CREATE TABLE tblBus (
   bus_seq NUMBER PRIMARY KEY, /* ?��??버스번호 */
   start_time VARCHAR2(500) NOT NULL, /* ?��?��?���? */
   interval NUMBER NOT NULL, /* 배차?���? */
   capacity NUMBER NOT NULL /* 버스?��?��?��?�� */
);

/* ?��?�� */
CREATE TABLE tblRoute (
	route_seq NUMBER PRIMARY KEY, /* ?��?��번호 */
	route_order NUMBER NOT NULL, /* ?��?��?��?�� */
	bus_seq NUMBER REFERENCES tblBus(bus_seq) NOT NULL, /* ?��??버스번호 */
	start_attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL, /* 출발?��?��?��?�� */
	end_attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?��착어?��?��?�� */
);

/* 코스 */
CREATE TABLE tblCourse (
	course_seq NUMBER PRIMARY KEY, /* 코스번호 */
	name VARCHAR2(500) NOT NULL UNIQUE, /* 코스�? */
	img VARCHAR2(500) DEFAULT 'course.png' NOT NULL /* 코스?��미�? */
);

/* MBTI */
CREATE TABLE tblMBTI (
	mbti_seq NUMBER PRIMARY KEY, /* MBTI번호 */
	result VARCHAR2(500) NOT NULL, /* 결과�? */
	mbti VARCHAR2(500) NOT NULL, /* MBTI�? */
	course_seq NUMBER REFERENCES tblCourse(course_seq) NOT NULL, /* 코스번호 */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?��?��?��?��번호 */
);

/* 취향?��?��?�� 문제 */
CREATE TABLE tblTest (
	test_seq NUMBER PRIMARY KEY, /* 문제번호 */
	question VARCHAR2(500) NOT NULL, /* 문제?��?�� */
	answer1 VARCHAR2(500) NOT NULL, /* ?��?��1�? */
	answer2 VARCHAR2(500) NOT NULL, /* ?��?��2�? */
	img VARCHAR2(500) DEFAULT 'test.png' NOT NULL /* 문제?��미�? */
);

/* 취향?��?��?�� 문제 ?��?�� */
CREATE TABLE tblTestScore (
	test_score_seq NUMBER PRIMARY KEY, /* 취향?��?��?�� 문제 ?��?�� */
	point1 NUMBER NOT NULL, /* 1 */
	point2 NUMBER NOT NULL, /* 2 */
	type VARCHAR2(500) NOT NULL, /* type(E/I, N/S, F/T, J/P) */
	test_seq NUMBER REFERENCES tblTest(test_seq) NOT NULL /* 문제번호 */
);

/* �?�?/불편/건의 */
CREATE TABLE tblVOC (
	voc_seq NUMBER PRIMARY KEY, /* 건의번호 */
	type VARCHAR2(500) NOT NULL, /* 구분 */
	service_type VARCHAR2(500) NOT NULL, /* ?��비스?��?�� */
	subject VARCHAR2(100) NOT NULL, /* 건의?���? */
	content VARCHAR2(2000) NOT NULL, /* 건의?��?�� */
	attach VARCHAR2(500), /* 첨�??��?�� */
	visit_date DATE NOT NULL, /* 방문?�� */
	answer VARCHAR2(2000), /* ?���??��?�� */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL /* ?��??번호 */
);

/* ?��?��문의 */
CREATE TABLE tblInquiry (
	inquiry_seq NUMBER PRIMARY KEY, /* ?��?��문의번호 */
	type VARCHAR2(500) NOT NULL, /* 문의?��?�� */
	subject VARCHAR2(100) NOT NULL, /* 문의?���? */
	content VARCHAR2(2000) NOT NULL, /* 문의?��?�� */
	attach VARCHAR2(500), /* 첨�??��?�� */
	answer VARCHAR2(2000), /* ?���??��?�� */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL /* ?��??번호 */
);


/* FAQ */
CREATE TABLE tblFAQ (
   faq_seq NUMBER primary key, /* FAQ번호 */
   type VARCHAR2(500) NOT NULL, /* 카테고리 */
   question VARCHAR2(300) NOT NULL, /* 질문 */
   answer VARCHAR2(2000) NOT NULL, /* ?���? */
   faq_order NUMBER NOT NULL /* ?��?��번호 */
);

/* 공�??��?�� */
CREATE TABLE tblNotice (
   notice_seq NUMBER primary key, /* 공�??��?��번호 */
   subject VARCHAR2(100) NOT NULL, /* 공�??��?��?���? */
   content VARCHAR2(2000), /* 공�??��?��?��?�� */
   regdate DATE DEFAULT sysdate NOT NULL, /* 공�??��?��?��록일 */
   attach VARCHAR2(500), /* 공�??��?��첨�??��?�� */
   fix CHAR(1) NOT NULL /* 고정?���? */
);

/* 분실물센?�� */
CREATE TABLE tblLostProperty (
   lost_property_seq NUMBER PRIMARY KEY, /* 분실물번?�� */
   type VARCHAR2(500) NOT NULL, /* 분류 */
   name VARCHAR2(500) NOT NULL, /* ?��?��물명 */
   location VARCHAR2(500) NOT NULL, /* ?��?��?��?�� */
   lost_property_date DATE NOT NULL, /* ?��?��?�� */
   img VARCHAR2(500), /* 분실물이미�? */
   result VARCHAR2(500) NOT NULL /* 처리결과 */
);

/* ?���? */
CREATE TABLE tblTicket (
   ticket_seq NUMBER primary key, /* ?��켓번?�� */
   ticket_type VARCHAR2(500) NOT NULL, /* ?��켓종�? */
   person_type VARCHAR2(500) NOT NULL, /* 개인/?��체구�? */
   age VARCHAR2(500) NOT NULL, /* ?��?��구분 */
   price NUMBER NOT NULL /* ?���? */
);

/* ?��?�� */
CREATE TABLE tblBenefit (
   benefit_seq NUMBER primary key, /* ?��?��번호 */
   name VARCHAR2(500) NOT NULL, /* ?��?���? */
   type VARCHAR2(500) NOT NULL, /* ?��?��종류 */
   benefit_date VARCHAR2(500) NOT NULL, /* ?��?��기간 */
   discount_rate NUMBER NOT NULL, /* ?��?��?�� */
   img VARCHAR2(500) DEFAULT 'benefit.png' NOT NULL /* ?��?�� ?��미�? */
);

/* ?��매내?�� */
CREATE TABLE tblTicketBook (
   ticket_book_seq NUMBER primary key, /* ?��매내?��번호 */
   book_date DATE DEFAULT sysdate NOT NULL, /* ?��매일?�� */
   visit_date DATE NOT NULL, /* 방문?��?�� */
   ea NUMBER NOT NULL, /* 구매?��?�� */
   ticket_seq NUMBER references tblTicket(ticket_seq) NOT NULL, /* ?��켓번?�� */
   benefit_seq NUMBER references tblbenefit(benefit_seq) NOT NULL /* ?��?��번호 */
);

/* ?��?��/?���? */
CREATE TABLE tblUserBook (
   user_book_seq NUMBER primary key, /* ?��?��?��매번?�� */
   user_seq NUMBER references tbluser(user_seq) NOT NULL, /* ?��??번호 */
   ticket_book_seq NUMBER references tblTicketBook(ticket_book_seq) NOT NULL /* ?��매내?��번호 */
);

/* 리뷰 */
CREATE TABLE tblReview (
   review_seq NUMBER primary key, /* 리뷰번호 */
   subject VARCHAR2(500) NOT NULL, /* 리뷰?���? */
   content VARCHAR2(2000) NOT NULL, /* 리뷰?��?�� */
   regdate DATE DEFAULT sysdate NOT NULL, /* ?��록일 */
   readcount NUMBER NOT NULL, /* 조회?�� */
   user_book_seq NUMBER references tbluserbook(user_book_seq) NOT NULL /* ?��?��?��매번?�� */
);

/* 리뷰?��미�? */
CREATE TABLE tblReviewImg (
   review_img_seq NUMBER primary key, /* 리뷰?��미�?번호 */
   img VARCHAR2(500) DEFAULT 'reviewimg.png' NOT NULL, /* 리뷰?��미�? */
   review_seq NUMBER references tblreview(review_seq) NOT NULL /* 리뷰번호 */
);

/* ?��?��?�� */
CREATE TABLE tblItem (
   item_seq NUMBER PRIMARY KEY, /* ?��?��?��번호 */
   name VARCHAR2(500) NOT NULL, /* ?��?��?���? */
   info VARCHAR2(2000) NOT NULL, /* ?��?��?��?���? */
   price NUMBER NOT NULL, /* ?��?��?���?�? */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* 기프?��?��번호 */
);

/* ?��?��?��?��미�? */
CREATE TABLE tblItemImg (
   item_img_seq NUMBER PRIMARY KEY, /* ?��?��?��?��미�?번호 */
   img VARCHAR2(500) DEFAULT 'itemimg.png' NOT NULL, /* ?��?��?��?��미�? */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* ?��?��?��번호 */
);

/* ?��바구?�� */
CREATE TABLE tblCart (
   cart_seq NUMBER PRIMARY KEY, /* ?��바구?��번호 */
   ea NUMBER NOT NULL, /* ?��?�� */
   cart_option varchar2(500) NOT NULL, /* ?��?�� */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* ?��?��?��번호 */
);

/* ?��?��/?��바구?�� */
CREATE TABLE tblUserCart (
   user_cart_seq NUMBER PRIMARY KEY, /* ?��?��?��바구?��번호 */
   user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ?��??번호 */
   cart_seq NUMBER REFERENCES tblCart(cart_seq) NOT NULL /* ?��바구?��번호 */
);

/* 구매?��?�� */
CREATE TABLE tblBuy (
   buy_seq NUMBER PRIMARY KEY, /* 구매?��?��번호 */
   buy_date DATE DEFAULT sysdate NOT NULL, /* 결제?�� */
   ea NUMBER NOT NULL, /* 구매?��?�� */
   buy_option VARCHAR2(500) NOT NULL, /* 구매?��?�� */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* ?��?��?��번호 */
);

/* ?��?��/구매 */
CREATE TABLE tblUserBuy (
   user_buy_seq NUMBER PRIMARY KEY, /* ?��?��구매번호 */
   user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* ?��??번호 */
   buy_seq NUMBER REFERENCES tblBuy(buy_seq) NOT NULL /* 구매?��?��번호 */
);

/* CREATE SEQUENCE_51�?*/
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
CREATE SEQUENCE seqtblLostProperty;
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