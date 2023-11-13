-- 관련 있는 DDL

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

CREATE TABLE tblAttractionImg (
	attraction_img_seq NUMBER PRIMARY KEY, /* ?��?��?��미�?번호 */
	img VARCHAR2(500) DEFAULT 'attraction.png' NOT NULL, /* ?��미�? */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?��?��?��?��번호 */
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