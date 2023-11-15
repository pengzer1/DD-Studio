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

CREATE SEQUENCE seqGroupBook;

/* 회원/단체예매 */
CREATE TABLE tblUserGroupBook (
	user_group_book_seq NUMBER PRIMARY KEY, /* 회원단체예매번호 */
	user_seq NUMBER REFERENCES tblUser(user_seq) NOT NULL, /* 유저번호 */
	group_book_seq NUMBER REFERENCES tblGroupBook(group_book_seq) NOT NULL /* 단체예매내역번호 */
);

CREATE SEQUENCE seqUserGroupBook;

create or replace view vwRestaurant
as
select restaurant_seq, name, menu, time, capacity, tel, location_seq, (select lat from tblLocation where location_seq = r.location_seq) as lat, (select lng from tblLocation where location_seq = r.location_seq) as lng, (select name from tblCategory where category_seq = r.category_seq) as category, (select img from tblRestaurantImg where restaurant_seq = r.restaurant_seq and rownum = 1) as img, (select start_date from tblRestaurantClose where restaurant_seq = r.restaurant_seq) as start_date, (select end_date from tblRestaurantClose where restaurant_seq = r.restaurant_seq) as end_date from tblRestaurant r;


/* 기프트샵 view */
create or replace view vwShop
as
select shop_seq, name, time, info, tel, location_seq, (select lat from tblLocation where location_seq = s.location_seq) as lat, (select lng from tblLocation where location_seq = s.location_seq) as lng, (select img from tblShopImg where shop_seq = s.shop_seq and rownum = 1) as img from tblShop s;