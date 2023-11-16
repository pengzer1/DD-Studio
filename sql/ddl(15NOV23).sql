-- system
create user JspProject identified by pass;
grant connect, resource, dba to JspProject;

/* DELETE문_개*/
DELETE FROM tblUserBuy;
DELETE FROM tblBuy;
DELETE FROM tblUserCart;
DELETE FROM tblCart;
DELETE FROM tblItemImg;
DELETE FROM tblItem;
DELETE FROM tblReviewCmt;
DELETE FROM tblReviewImg;
DELETE FROM tblReview;
DELETE FROM tblUserGroupBook;
DELETE FROM tblUserBook;
DELETE FROM tblGroupBook;
DELETE FROM tblTicketBook;
DELETE FROM tblBenefit;
DELETE FROM tblTicket;
DELETE FROM tblLostProperty;
DELETE FROM tblNotice;
DELETE FROM tblFAQ;
DELETE FROM tblInquiry;
DELETE FROM tblVOC;
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
DELETE FROM tblUser;


/* DROP TABLE_개 */
DROP TABLE tblUserBuy;
DROP TABLE tblBuy;
DROP TABLE tblUserCart;
DROP TABLE tblCart;
DROP TABLE tblItemImg;
DROP TABLE tblItem;
DROP TABLE tblReviewCmt;
DROP TABLE tblReviewImg;
DROP TABLE tblReview;
DROP TABLE tblUserGroupBook;
DROP TABLE tblUserBook;
DROP TABLE tblGroupBook;
DROP TABLE tblTicketBook;
DROP TABLE tblBenefit;
DROP TABLE tblTicket;
DROP TABLE tblLostProperty;
DROP TABLE tblNotice;
DROP TABLE tblFAQ;
DROP TABLE tblInquiry;
DROP TABLE tblVOC;
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
DROP TABLE tblUser;

/* DROP SEQUENCE_개 */
DROP SEQUENCE seqtblUser;
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
DROP SEQUENCE seqtblVOC;
DROP SEQUENCE seqtblInquiry;
DROP SEQUENCE seqtblFAQ;
DROP SEQUENCE seqtblNotice;
DROP SEQUENCE seqtblLostProperty;
DROP SEQUENCE seqtblTicket;
DROP SEQUENCE seqtblBenefit;
DROP SEQUENCE seqtblTicketBook;
DROP SEQUENCE seqGroupBook;
DROP SEQUENCE seqtblUserBook;
DROP SEQUENCE seqUserGroupBook;
DROP SEQUENCE seqtblReview;
DROP SEQUENCE seqtblReviewImg;
DROP SEQUENCE seqtblReviewCmt;
DROP SEQUENCE seqtblItem;
DROP SEQUENCE seqtblItemImg;
DROP SEQUENCE seqtblCart;
DROP SEQUENCE seqtblUserCart;
DROP SEQUENCE seqtblBuy;
DROP SEQUENCE seqtblUserBuy;

/* CREATE문_54개 */

/* 유저 */
CREATE TABLE tblUser (
	user_seq NUMBER PRIMARY KEY, /* 유저번호 */
    name VARCHAR2(500) NOT NULL, /* 이름 */
	email VARCHAR2(500) NOT NULL UNIQUE, /* 이메일 */
	pw VARCHAR2(500) NOT NULL, /* 비밀번호 */
	tel VARCHAR2(500) NOT NULL, /* 전화번호 */
	address VARCHAR2(500) DEFAULT '미기재' NOT NULL, /* 주소 */
	birth DATE NOT NULL, /* 생년월일 */
	lv CHAR(1) NOT NULL, /* 등급 */
	ing CHAR(1) NOT NULL /* 탈퇴여부 */
);

/* 해시태그 */
CREATE TABLE tblHashtag (
   hashtag_seq NUMBER PRIMARY KEY, /* 해시태그번호 */
   name VARCHAR2(500) NOT NULL UNIQUE /* 해시태그명 */
);

/* 위치정보 */
CREATE TABLE tblLocation (
   location_seq NUMBER PRIMARY KEY, /* 위치정보번호 */
   lat NUMBER NOT NULL, /* 위도(latitude) */
   lng NUMBER NOT NULL /* 경도(longitude) */
);

/* 카테고리 */
CREATE TABLE tblCategory (
   category_seq NUMBER PRIMARY KEY, /* 카테고리번호 */
   name VARCHAR2(500) NOT NULL UNIQUE /* 카테고리명 */
);

/* 식당 */
CREATE TABLE tblRestaurant (
   restaurant_seq NUMBER PRIMARY KEY, /* 식당번호 */
   name VARCHAR2(500) NOT NULL, /* 식당명 */
   menu VARCHAR2(500) NOT NULL, /* 대표메뉴 */
   time VARCHAR2(500) NOT NULL, /* 운영시간 */
   capacity NUMBER NOT NULL, /* 수용인원 */
   tel VARCHAR2(500) NOT NULL, /* 식당전화번호 */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL, /* 위치정보번호 */
   category_seq NUMBER REFERENCES tblCategory(category_seq) NOT NULL /* 카테고리번호 */
);

/* 식당이미지 */
CREATE TABLE tblRestaurantImg (
   restaurant_img_seq NUMBER PRIMARY KEY, /* 식당이미지번호 */
   img VARCHAR2(500) DEFAULT 'restaurant.png' NOT NULL, /* 식당이미지 */
   restaurant_seq NUMBER REFERENCES tblRestaurant(restaurant_seq) NOT NULL /* 식당번호 */
);

/* 식당/운휴 */
CREATE TABLE tblRestaurantClose (
   restaurant_close_seq NUMBER PRIMARY KEY, /* 식당운휴번호 */
   start_date DATE NOT NULL, /* 운휴시작 */
   end_date DATE NOT NULL, /* 운휴종료 */
   restaurant_seq NUMBER REFERENCES tblRestaurant(restaurant_seq) NOT NULL /* 식당번호 */
);

/* 편의시설 */
CREATE TABLE tblConvenient (
	convenient_seq NUMBER PRIMARY KEY, /* 편의시설번호 */
	name VARCHAR2(500) NOT NULL UNIQUE, /* 편의시설이름 */
	time VARCHAR2(500) NOT NULL, /* 운영시간 */
	tel VARCHAR2(500) NOT NULL, /* 편의시설전화번호 */
	img VARCHAR2(500) DEFAULT 'convenient.png' NOT NULL, /* 편의시설 이미지 */
	location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* 위치정보번호 */
);

/* 기프트샵 */
CREATE TABLE tblShop (
   shop_seq NUMBER PRIMARY KEY, /* 기프트샵번호 */
   name VARCHAR2(500) NOT NULL, /* 기프트샵명 */
   time VARCHAR2(500) NOT NULL, /* 운영시간 */
   info VARCHAR2(2000) NOT NULL, /* 기프트샵설명 */
   tel VARCHAR2(500) NOT NULL, /* 기프트샵전화번호 */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* 위치정보번호 */
);

/* 기프트샵/운휴 */
CREATE TABLE tblShopClose (
   shop_close_seq NUMBER PRIMARY KEY, /* 기프트샵운휴번호 */
   start_date DATE NOT NULL, /* 운휴시작 */
   end_date DATE NOT NULL, /* 운휴종료 */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* 기프트샵번호 */
);

/* 기프트샵이미지 */
CREATE TABLE tblShopImg (
   shop_img_seq NUMBER PRIMARY KEY, /* 기프트샵이미지번호 */
   img VARCHAR2(500) DEFAULT 'shop.png' NOT NULL, /* 기프트샵이미지 */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* 기프트샵번호 */
);

/* 영화관 */
CREATE TABLE tblTheater (
   theater_seq NUMBER PRIMARY KEY, /* 영화관번호 */
   name VARCHAR2(500) NOT NULL, /* 영화관명 */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* 위치정보번호 */
);

/* 영화관/운휴 */
CREATE TABLE tblTheaterClose (
   theater_close_seq NUMBER PRIMARY KEY, /* 영화운휴번호 */
   start_date DATE NOT NULL, /* 운휴시작 */
   end_date DATE NOT NULL, /* 운휴종료 */
   theater_seq NUMBER REFERENCES tblTheater(theater_seq) NOT NULL /* 영화관번호 */
);

/* 영화 */
CREATE TABLE tblMovie (
   movie_seq NUMBER PRIMARY KEY, /* 영화번호 */
   name VARCHAR2(500) NOT NULL, /* 영화명 */
   start_date DATE NOT NULL, /* 영화 상영 시작일 */
   end_date DATE NOT NULL, /* 영화 상영 종료일 */
   runningtime NUMBER NOT NULL, /* 러닝타임 */
   img VARCHAR2(500) DEFAULT 'movie.png' NOT NULL, /* 포스터이미지 */
   preview VARCHAR2(500) /* 영화예고편영상 */
);

/* 영화상영 */
CREATE TABLE tblMoviePlay (
   movie_play_seq NUMBER PRIMARY KEY, /* 영화상영번호 */
   start_time VARCHAR2(500) NOT NULL, /* 영화상영시작시간 */
   theater_seq NUMBER REFERENCES tblTheater(theater_seq) NOT NULL, /* 영화관번호 */
   movie_seq NUMBER REFERENCES tblMovie(movie_seq) NOT NULL /* 영화번호 */
);

/* 영화/해시태그 */
CREATE TABLE tblMovieHashtag (
   movie_hashtag_seq NUMBER PRIMARY KEY, /* 영화해시태그번호 */
   movie_seq NUMBER REFERENCES tblMovie(movie_seq) NOT NULL, /* 영화번호 */
   hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* 해시태그번호 */
);

/* 포토존 */
CREATE TABLE tblPhotoZone (
   photozone_seq NUMBER PRIMARY KEY, /* 포토존번호 */
   name VARCHAR2(500) NOT NULL, /* 포토존명 */
   time VARCHAR2(500) NOT NULL, /* 운영시간 */
   info VARCHAR2(2000) NOT NULL, /* 포토존설명 */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* 위치정보번호 */
);

/* 포토존이미지 */
CREATE TABLE tblPhotoZoneImg (
   photozone_img_seq NUMBER PRIMARY KEY, /* 포토존이미지번호 */
   img VARCHAR2(500) DEFAULT 'photozone.png' NOT NULL, /* 포토존이미지 */
   photozone_seq NUMBER REFERENCES tblPhotoZone(photozone_seq) NOT NULL /* 포토존번호 */
);

/* 페스티벌 */
CREATE TABLE tblFestival (
   festival_seq NUMBER PRIMARY KEY, /* 페스티벌번호 */
   name VARCHAR2(500) NOT NULL, /* 페스티벌명 */
   time VARCHAR2(500) NOT NULL, /* 페스티벌시간 */
   info VARCHAR2(2000) NOT NULL, /* 페스티벌설명 */
   start_date DATE NOT NULL, /* 페스티벌 시작일 */
   end_date DATE NOT NULL, /* 페스티벌 종료일 */
   location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL /* 위치정보번호 */
);

/* 페스티벌이미지 */
CREATE TABLE tblFestivalImg (
   festival_img_seq NUMBER PRIMARY KEY, /* 페스티벌이미지번호 */
   img VARCHAR2(500) DEFAULT 'festival.png' NOT NULL, /* 페스티벌이미지 */
   festival_seq NUMBER REFERENCES tblFestival(festival_seq) NOT NULL /* 페스티벌번호 */
);

/* 페스티벌/해시태그 */
CREATE TABLE tblFestivalHashtag (
   festival_hashtag_seq NUMBER PRIMARY KEY, /* 페스티벌해시태그번호 */
   festival_seq NUMBER REFERENCES tblFestival(festival_seq) NOT NULL, /* 페스티벌번호 */
   hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* 해시태그번호 */
);

/* 어트랙션 */
CREATE TABLE tblAttraction (
	attraction_seq NUMBER PRIMARY KEY, /* 어트랙션번호 */
	name VARCHAR2(500) NOT NULL UNIQUE, /* 어트랙션명 */
	capacity NUMBER NOT NULL, /* 수용인원 */
	location_seq NUMBER REFERENCES tblLocation(location_seq) NOT NULL, /* 위치정보 */
	time VARCHAR2(500) NOT NULL, /* 운영시간 */
	restriction VARCHAR2(2000), /* 키 크기 제약사항 등 이용정보 */
    is_test CHAR(1) NOT NULL /* 테스트채택 */
);

/* 어트/운휴 */
CREATE TABLE tblAttractionClose (
	attraction_close_seq NUMBER PRIMARY KEY, /* 어트/운휴번호 */
	start_date DATE NOT NULL, /* 운휴시작 */
	end_date DATE NOT NULL, /* 운휴종료 */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* 어트랙션번호 */
);

/* 어트랙션 예약 */
CREATE TABLE tblAttractionBook (
	attraction_book_seq NUMBER PRIMARY KEY, /* 예약번호 */
	book_time VARCHAR2(500) NOT NULL, /* 예약시간 */
	capacity NUMBER NOT NULL /* 예약가능인원 */
);

/* 어트랙션이미지 */
CREATE TABLE tblAttractionImg (
	attraction_img_seq NUMBER PRIMARY KEY, /* 어트이미지번호 */
	img VARCHAR2(500) DEFAULT 'attraction.png' NOT NULL, /* 이미지 */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* 어트랙션번호 */
);

/* 어트/해시태그 */
CREATE TABLE tblAttractionHashtag (
	attraction_hashtag_seq NUMBER PRIMARY KEY, /* 어트해시태그번호 */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL, /* 어트랙션번호 */
	hashtag_seq NUMBER REFERENCES tblHashtag(hashtag_seq) NOT NULL /* 해시태그번호 */
);

/* 예약/회원 */
CREATE TABLE tblBookUser (
	book_user_seq NUMBER PRIMARY KEY, /* 예약회원번호 */
    regdate DATE DEFAULT sysdate NOT NULL, /* 예약날짜 */
	capacity NUMBER NOT NULL, /* 예약인원 */
	attraction_book_seq NUMBER REFERENCES tblAttractionBook(attraction_book_seq) NOT NULL, /* 예약번호 */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* 유저번호 */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* 어트랙션번호 */
);

/* 셔틀버스 */
CREATE TABLE tblBus (
   bus_seq NUMBER PRIMARY KEY, /* 셔틀버스번호 */
   start_time VARCHAR2(500) NOT NULL, /* 시작시간 */
   interval NUMBER NOT NULL, /* 배차시간 */
   capacity NUMBER NOT NULL /* 버스수용인원 */
);

/* 노선 */
CREATE TABLE tblRoute (
	route_seq NUMBER PRIMARY KEY, /* 노선번호 */
	route_order NUMBER NOT NULL, /* 노선순서 */
	bus_seq NUMBER REFERENCES tblBus(bus_seq) NOT NULL, /* 셔틀버스번호 */
	start_attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL, /* 출발어트랙션 */
	end_attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* 도착어트랙션 */
);

/* 코스 */
CREATE TABLE tblCourse (
	course_seq NUMBER PRIMARY KEY, /* 코스번호 */
	name VARCHAR2(500) NOT NULL UNIQUE, /* 코스명 */
	img VARCHAR2(500) DEFAULT 'course.png' NOT NULL /* 코스이미지 */
);

/* MBTI */
CREATE TABLE tblMBTI (
	mbti_seq NUMBER PRIMARY KEY, /* MBTI번호 */
	result VARCHAR2(500) NOT NULL, /* 결과명 */
	mbti VARCHAR2(500) NOT NULL, /* MBTI명 */
	course_seq NUMBER REFERENCES tblCourse(course_seq) NOT NULL, /* 코스번호 */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* 어트랙션번호 */
);

/* 칭찬/불편/건의 */
CREATE TABLE tblVOC (
	voc_seq NUMBER PRIMARY KEY, /* 건의번호 */
	type VARCHAR2(500) NOT NULL, /* 구분 */
	service_type VARCHAR2(500) NOT NULL, /* 서비스유형 */
	subject VARCHAR2(100) NOT NULL, /* 건의제목 */
	content VARCHAR2(2000) NOT NULL, /* 건의내용 */
    regdate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	attach VARCHAR2(500), /* 첨부파일 */
	visit_date DATE NOT NULL, /* 방문일 */
	answer VARCHAR2(2000), /* 답변내용 */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL /* 유저번호 */
);

/* 이용문의 */
CREATE TABLE tblInquiry (
	inquiry_seq NUMBER PRIMARY KEY, /* 이용문의번호 */
	type VARCHAR2(500) NOT NULL, /* 문의유형 */
	subject VARCHAR2(100) NOT NULL, /* 문의제목 */
	content VARCHAR2(2000) NOT NULL, /* 문의내용 */
    regdate DATE DEFAULT sysdate NOT NULL, /* 문의 등록일 */
	attach VARCHAR2(500), /* 첨부파일 */
	answer VARCHAR2(2000), /* 답변내용 */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL /* 유저번호 */
);

/* FAQ */
CREATE TABLE tblFAQ (
   faq_seq NUMBER primary key, /* FAQ번호 */
   type VARCHAR2(100) NOT NULL, /* 카테고리 */
   question VARCHAR2(150) NOT NULL, /* 질문 */
   answer VARCHAR2(2000) NOT NULL /* 답변 */
);

/* 공지사항 */
CREATE TABLE tblNotice (
   notice_seq NUMBER primary key, /* 공지사항번호 */
   subject VARCHAR2(100) NOT NULL, /* 공지사항제목 */
   content VARCHAR2(2000), /* 공지사항내용 */
   regdate DATE DEFAULT sysdate NOT NULL, /* 공지사항등록일 */
   attach VARCHAR2(500), /* 공지사항첨부파일 */
   fix CHAR(1) NOT NULL /* 고정유무 */
);

/* 분실물센터 */
CREATE TABLE tblLostProperty (
   lost_center_seq NUMBER PRIMARY KEY, /* 분실물번호 */
   type VARCHAR2(500) NOT NULL, /* 분류 */
   name VARCHAR2(500) NOT NULL, /* 습득물명 */
   location VARCHAR2(500) NOT NULL, /* 습득장소 */
   lost_center_date DATE NOT NULL, /* 습득일 */
   img VARCHAR2(500), /* 분실물이미지 */
   result VARCHAR2(500) NOT NULL /* 처리결과 */
);

/* 티켓 */
CREATE TABLE tblTicket (
   ticket_seq NUMBER primary key, /* 티켓번호 */
   ticket_type VARCHAR2(500) NOT NULL, /* 티켓종류 */
   person_type VARCHAR2(500) NOT NULL, /* 개인/단체구분 */
   age VARCHAR2(500) NOT NULL, /* 나이구분 */
   price NUMBER NOT NULL /* 요금 */
);

/* 혜택 */
CREATE TABLE tblBenefit (
   benefit_seq NUMBER primary key, /* 혜택번호 */
   name VARCHAR2(500) NOT NULL, /* 혜택명 */
   type VARCHAR2(500) NOT NULL, /* 혜택종류 */
   start_date DATE NOT NULL, /* 혜택 시작일 */
   end_date DATE NOT NULL, /* 혜택 종료일 */
   discount_rate NUMBER NOT NULL, /* 할인율 */
   img VARCHAR2(500) DEFAULT 'benefit.png' NOT NULL /* 혜택 이미지 */
);

/* 예매내역 */
CREATE TABLE tblTicketBook (
   ticket_book_seq NUMBER primary key, /* 예매내역번호 */
   book_date DATE DEFAULT sysdate NOT NULL, /* 예매일자 */
   visit_date DATE NOT NULL, /* 방문일자 */
   ea NUMBER NOT NULL, /* 구매수량 */
   price NUMBER NOT NULL, /*결제 금액 */
   ticket_seq NUMBER references tblTicket(ticket_seq) NOT NULL, /* 티켓번호 */
   benefit_seq NUMBER references tblbenefit(benefit_seq) NOT NULL /* 혜택번호 */
);

/* 단체예매내역 */
CREATE TABLE tblGroupBook (
	group_book_seq NUMBER PRIMARY KEY, /* 단체예매내역번호 */
	book_date DATE NOT NULL, /* 예매일자 */
	group_division VARCHAR2(200) NOT NULL, /* 단체구분 */
	region VARCHAR2(200) NOT NULL, /* 지역 */
	group_name VARCHAR2(200) NOT NULL, /* 단체명 */
	address VARCHAR2(200) NOT NULL, /* 주소 */
	visit_date DATE NOT NULL, /* 방문일자 */
	visit_time VARCHAR2(200) NOT NULL /* 방문시간 */
);

/* 회원/예매 */
CREATE TABLE tblUserBook (
   user_book_seq NUMBER primary key, /* 회원예매번호 */
   user_seq NUMBER references tbluser(user_seq) NOT NULL, /* 유저번호 */
   ticket_book_seq NUMBER references tblTicketBook(ticket_book_seq) NOT NULL /* 예매내역번호 */
);

/* 회원/단체예매 */
CREATE TABLE tblUserGroupBook (
	user_group_book_seq NUMBER PRIMARY KEY, /* 회원단체예매번호 */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* 유저번호 */
	group_book_seq NUMBER REFERENCES tblGroupBook(group_book_seq) NOT NULL /* 단체예매내역번호 */
);

/* 리뷰 */
CREATE TABLE tblReview (
   review_seq NUMBER primary key, /* 리뷰번호 */
   subject VARCHAR2(500) NOT NULL, /* 리뷰제목 */
   content VARCHAR2(2000) NOT NULL, /* 리뷰내용 */
   regdate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
   readcount NUMBER NOT NULL, /* 조회수 */
   user_book_seq NUMBER references tbluserbook(user_book_seq) NOT NULL /* 회원예매번호 */
);

/* 리뷰이미지 */
CREATE TABLE tblReviewImg (
   review_img_seq NUMBER primary key, /* 리뷰이미지번호 */
   img VARCHAR2(500) DEFAULT 'reviewimg.png' NOT NULL, /* 리뷰이미지 */
   review_seq NUMBER references tblreview(review_seq) NOT NULL /* 리뷰번호 */
);

/* 리뷰 댓글 */
CREATE TABLE tblReviewCmt (
   review_cmt_seq NUMBER PRIMARY KEY, /* 리뷰번호 */
   user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* 유저번호 */
   regdate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
   content VARCHAR(2000) NOT NULL, /* 댓글내용 */
   review_seq NUMBER REFERENCES tblReview(review_seq) NOT NULL /* 리뷰번호 */
);

/* 아이템 */
CREATE TABLE tblItem (
   item_seq NUMBER PRIMARY KEY, /* 아이템번호 */
   name VARCHAR2(500) NOT NULL, /* 아이템명 */
   info VARCHAR2(2000) NOT NULL, /* 아이템정보 */
   price NUMBER NOT NULL, /* 아이템가격 */
   shop_seq NUMBER REFERENCES tblShop(shop_seq) NOT NULL /* 기프트샵번호 */
);

/* 아이템이미지 */
CREATE TABLE tblItemImg (
   item_img_seq NUMBER PRIMARY KEY, /* 아이템이미지번호 */
   img VARCHAR2(500) DEFAULT 'itemimg.png' NOT NULL, /* 아이템이미지 */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* 아이템번호 */
);

/* 장바구니 */
CREATE TABLE tblCart (
   cart_seq NUMBER PRIMARY KEY, /* 장바구니번호 */
   ea NUMBER NOT NULL, /* 수량 */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* 아이템번호 */
);

/* 회원/장바구니 */
CREATE TABLE tblUserCart (
   user_cart_seq NUMBER PRIMARY KEY, /* 회원장바구니번호 */
   user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* 유저번호 */
   cart_seq NUMBER REFERENCES tblCart(cart_seq) NOT NULL /* 장바구니번호 */
);

/* 구매내역 */
CREATE TABLE tblBuy (
   buy_seq NUMBER PRIMARY KEY, /* 구매내역번호 */
   buy_date DATE DEFAULT sysdate NOT NULL, /* 결제일 */
   ea NUMBER NOT NULL, /* 구매수량 */
   buy_option VARCHAR2(500) NOT NULL, /* 구매옵션 */
   item_seq NUMBER REFERENCES tblItem(item_seq) NOT NULL /* 아이템번호 */
);

/* 회원/구매 */
CREATE TABLE tblUserBuy (
   user_buy_seq NUMBER PRIMARY KEY, /* 회원구매번호 */
   user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* 유저번호 */
   buy_seq NUMBER REFERENCES tblBuy(buy_seq) NOT NULL /* 구매내역번호 */
);

/* CREATE SEQUENCE_개*/
CREATE SEQUENCE seqtblUser;
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
CREATE SEQUENCE seqtblVOC;
CREATE SEQUENCE seqtblInquiry;
CREATE SEQUENCE seqtblFAQ;
CREATE SEQUENCE seqtblNotice;
CREATE SEQUENCE seqtblLostProperty;
CREATE SEQUENCE seqtblTicket;
CREATE SEQUENCE seqtblBenefit;
CREATE SEQUENCE seqtblTicketBook;
CREATE SEQUENCE seqGroupBook;
CREATE SEQUENCE seqtblUserBook;
CREATE SEQUENCE seqUserGroupBook;
CREATE SEQUENCE seqtblReview;
CREATE SEQUENCE seqtblReviewImg;
CREATE SEQUENCE seqtblReviewCmt;
CREATE SEQUENCE seqtblItem;
CREATE SEQUENCE seqtblItemImg;
CREATE SEQUENCE seqtblCart;
CREATE SEQUENCE seqtblUserCart;
CREATE SEQUENCE seqtblBuy;
CREATE SEQUENCE seqtblUserBuy;


/* View 생성 */
CREATE OR REPLACE VIEW vwUserBook as
SELECT
    U.email,
    UB.user_book_seq,
    UB.user_seq,
    TB.ticket_book_seq,
    TB.book_date,
    TB.visit_date,
    TB.ea,
    TB.ticket_seq,
    TB.benefit_seq,
    B.discount_rate,
    T.price
FROM tblUserBook UB
JOIN tblTicketBook TB ON UB.ticket_book_seq = TB.ticket_book_seq
JOIN tblUser U ON UB.user_seq = U.user_seq
join tblBenefit B on TB.benefit_seq = B.benefit_seq
join tblTicket T on TB.ticket_seq = T.ticket_seq;

CREATE OR REPLACE VIEW vwBookUser as
SELECT
    u.email,
    A.name,
    ab.attraction_book_seq,
    ab.book_time,
    bu.regdate,
    bu.capacity
FROM tblBookUser BU
JOIN tblAttractionBook AB ON AB.attraction_book_seq = BU.attraction_book_seq
JOIN tblAttraction A on a.attraction_seq = BU.attraction_seq
join tblUser U on u.user_seq = BU.user_seq;

CREATE OR REPLACE VIEW vwUserBuy as
SELECT
    U.email,
    S.name as shopName,
    I.name as itemName,
    B.ea,
    I.price,
    B.buy_seq,
    B.buy_date
from tblUserBuy UB
join tblUser U on U.user_seq = UB.user_seq
join tblBuy B on B.buy_seq = UB.buy_seq
join tblItem I on B.item_seq = I.item_seq
join tblShop S on I.shop_seq = S.shop_seq;

CREATE OR REPLACE VIEW vwInquiry as
SELECT
    i.inquiry_seq,
    v.voc_seq,
    v.type as vocType,
    i.type as inquiryType,
    v.subject as vocSubject,
    i.subject as inquirySubject,
    v.answer as vocAnswer,
    i.answer as inquiryAnswer
from tblUser U
join tblInquiry I on U.user_seq = I.user_seq
join tblVOC V on V.user_seq = U.user_seq;

create or replace view vwRestaurant
as
select restaurant_seq, name, menu, time, capacity, tel, location_seq, (select lat from tblLocation where location_seq = r.location_seq) as lat, (select lng from tblLocation where location_seq = r.location_seq) as lng, (select name from tblCategory where category_seq = r.category_seq) as category, (select img from tblRestaurantImg where restaurant_seq = r.restaurant_seq and rownum = 1) as img from tblRestaurant r;

create or replace view vwShop
as
select shop_seq, name, time, info, tel, location_seq, (select lat from tblLocation where location_seq = s.location_seq) as lat, (select lng from tblLocation where location_seq = s.location_seq) as lng, (select img from tblShopImg where shop_seq = s.shop_seq and rownum = 1) as img from tblShop s;


-- 어트랙션 리스트 (seq, name, img)
CREATE OR REPLACE VIEW vwAttractionList
AS
select
    a.attraction_seq,
    a.name as attraction_name,
    ai.img as attraction_img
from tblAttraction a
left join tblAttractionImg ai
on a.attraction_seq = ai.attraction_seq;

-- MBTI 상세정보 (course, attraction 추가)
CREATE OR REPLACE VIEW vwMBTIDetail
AS
SELECT
    m.mbti_seq,
    m.result,
    m.mbti,
    c.course_seq,
    c.name as course_name,
    c.img as course_img,
    a.attraction_seq,
    a.name as attraction_name,
    ai.img as attraction_img
FROM tblMBTI m
LEFT JOIN tblCourse c
ON m.course_seq = c.course_seq
LEFT JOIN tblAttraction a
ON m.attraction_seq = a.attraction_seq
LEFT JOIN tblAttractionImg ai
ON a.attraction_seq = ai.attraction_seq;

-- 검색
-- 검색 (어트랙션, 영화관, 기프트숍 등 위치정보)
CREATE OR REPLACE VIEW vwSearchLocation
AS
SELECT
	a.name as attraction_name,
	mb.result as mbti_result,
	mb.mbti as mbti_mbti,
	c.name as course_name,
	h.name as hashtag_name,
	r.name as restaurant_name,
	r.menu as restaurant_menu,
	ct.name as category_name,
	s.name as shop_name,
	s.info as shop_info,
	i.name as item_name,
	i.info as item_info,
	co.name as convenient_name,
	f.name as festival_name,
	f.info as festival_info,
	t.name as theater_name,
	m.name as movie_name
FROM tblLocation l
LEFT JOIN tblAttraction a
ON l.location_seq = a.location_seq
LEFT join tblMBTI mb
ON a.attraction_seq = mb.attraction_seq
LEFT JOIN tblCourse c
ON mb.course_seq = c.course_seq
LEFT JOIN tblAttractionHashtag ah
ON a.attraction_seq = ah.attraction_seq
LEFT JOIN tblHashtag h
ON h.hashtag_seq = ah.hashtag_seq
LEFT JOIN tblRestaurant r
ON l.location_seq = r.location_seq
LEFT JOIN tblCategory ct
ON r.category_seq = ct.category_seq
LEFT JOIN tblShop s
ON l.location_seq = s.location_seq
LEFT JOIN tblItem i
ON s.shop_seq = i.shop_seq
LEFT JOIN tblConvenient co
ON l.location_seq = co.location_seq
LEFT JOIN tblFestival f
ON l.location_seq = f.location_seq
LEFT JOIN tblFestivalHashtag fh
ON f.festival_seq = fh.festival_seq
LEFT JOIN tblHashtag h
ON h.hashtag_seq = fh.hashtag_seq
LEFT JOIN tblTheater t
ON l.location_seq = t.location_seq
LEFT JOIN tblMoviePlay mp
ON t.theater_seq = mp.theater_seq
LEFT JOIN tblMovie m
ON mp.movie_seq = m.movie_seq
LEFT JOIN tblMovieHashtag mh
ON m.movie_seq = mh.movie_seq
LEFT JOIN tblHashtag h
on h.hashtag_seq = mh.hashtag_seq;

-- 검색 (공지사항, FAQ, 헤택 등 정보)
CREATE OR REPLACE VIEW vwSearchInfo AS
SELECT 
    subject AS notice_subject, content AS notice_content, null as benefit_name, null AS benefit_type, NULL AS faq_category, NULL AS faq_question, NULL AS faq_answer
FROM tblNotice
UNION ALL
SELECT 
    NULL, NULL, NULL, NULL, type, question, answer
FROM tblFAQ
UNION ALL
SELECT 
    NULL, null, NULL, NULL, NULL, NULL, NULL
FROM tblTicket
UNION ALL
SELECT 
    NULL, null, name, type, NULL, NULL, NULL
FROM tblBenefit;

-- 검색 (전체)
drop view vwSearch;

CREATE OR REPLACE VIEW vwSearch AS
SELECT
    attraction_name, mbti_result, mbti_mbti, course_name, hashtag_name,
    restaurant_name, restaurant_menu, category_name, shop_name, shop_info, item_name,
    item_info, convenient_name, festival_name, festival_info, theater_name, movie_name,
    null notice_subject, null notice_content, null benefit_name, null benefit_type,
    null faq_category, null faq_question, null faq_answer
FROM vwSearchLocation
UNION ALL
SELECT
    null, null, null, null, null, null, null, null, null, null, null, null,
    null, null, null, null, null,
    notice_subject, notice_content, benefit_name, benefit_type, faq_category,
    faq_question, faq_answer
FROM vwSearchInfo;
