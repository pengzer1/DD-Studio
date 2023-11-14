-- 관련 있는 DDL


DELETE FROM tblTestScore;
DELETE FROM tblTest;
DELETE FROM tblMBTI;
DELETE FROM tblCourse;

DROP SEQUENCE seqtblCourse;
DROP SEQUENCE seqtblMBTI;
DROP SEQUENCE seqtblTest;
DROP SEQUENCE seqtblTestScore;

CREATE SEQUENCE seqtblCourse;
CREATE SEQUENCE seqtblMBTI;
CREATE SEQUENCE seqtblTest;
CREATE SEQUENCE seqtblTestScore;

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

select * from tblCourse;

INSERT INTO tblCourse (course_seq, name, img)
VALUES (seqtblCourse.NEXTVAL, '신나는 코스', 'course1.jpg');
INSERT INTO tblCourse (course_seq, name, img)
VALUES (seqtblCourse.NEXTVAL, '조용한 코스', 'course2.jpg');
INSERT INTO tblCourse (course_seq, name, img)
VALUES (seqtblCourse.NEXTVAL, '재밌는 코스', 'course3.jpg');
INSERT INTO tblCourse (course_seq, name, img)
VALUES (seqtblCourse.NEXTVAL, '스릴있는 코스', 'course4.jpg');

commit;

select * from tblUser;
--INSERT INTO tblCourse (course_seq, name, img) VALUES (seqtblCourse.nextVal, ?, ?)

/* MBTI */
CREATE TABLE tblMBTI (
	mbti_seq NUMBER PRIMARY KEY, /* MBTI번호 */
	result VARCHAR2(500) NOT NULL, /* 결과�? */
	mbti VARCHAR2(500) NOT NULL, /* MBTI�? */
	course_seq NUMBER REFERENCES tblCourse(course_seq) NOT NULL, /* 코스번호 */
	attraction_seq NUMBER REFERENCES tblAttraction(attraction_seq) NOT NULL /* ?��?��?��?��번호 */
);

drop table tblWorldcup;
--/* 월드컵 */
--create table tblWorldcup (
--	worldcup_seq number primary key,
--	select_seq number,
--	remain_seq number
--);
--

select * from tblCourse order by course_seq;
select * from TBLATTRACTION;
select * from tblLocation;
select * from TBLATTRACTIONHASHTAG;
select * from TBLATTRACTIONIMG;

drop view vwAttraction;
CREATE OR REPLACE VIEW vwAttractionList
AS
select
    a.attraction_seq,
    a.name as attraction_name,
    ai.img as attraction_img
from tblAttraction a
left join tblAttractionImg ai
on a.attraction_seq = ai.attraction_seq;

select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1) as img, (select name from tblTheme where a.theme_seq = theme_seq) as theme from tblAttraction a;
select * from vwAttractionList order by attraction_seq;

select * from tblMBTI where mbti = 'INFJ';
select * from tblMBTI order by mbti_seq;

update tblMBTI set course_seq = 999 where course_seq = 6;
SELECT * FROM vwMBTIDetail order by mbti_seq;



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

select * from vwMBTIDetail order by mbti_seq;
select * from vwMBTIDetail where mbti = 'INFJ';
commit;

INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '몇 시에 일어나서 무슨 옷을 입고 몇 시에 출발할지 모두 계획하는 사람', 'ISTJ', '1', '1');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '무서워하는 친구를 챙겨주는 세심한 사람', 'ISFJ', '2', '2');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '친구들의 부탁을 잘 들어주는 사람', 'INFJ', '1', '3');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '타고 싶은 거 안 타고 싶은 거 이유를 칼같이 말하는 논리적인 사람', 'INTJ', '3', '4');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '조용히 있는 듯 없는 듯 다 타는 스릴러를 즐기는 사람', 'ISTP', '2', '5');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '내 갈길 간다! 친구가 못 타면 나라도 타고오는 사람', 'ISFP', '4', '6');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '타고 싶은 게 있어도 말 안하고 친구들이 타고 싶다하는 거 타러 가는 사람', 'INFP', '2', '7');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '타고 싶은 건 많지만 귀찮아서 몇 개만 타는 사람', 'INTP', '1', '8');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '처음 타는 것도 바로 적응하고 계속 타는 사람', 'ESTP', '2', '9');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '인싸중에 핵인싸 놀이동산 오자고 한 사람', 'ESFP', '3', '10');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '무서워도 웃고 재밌어도 웃고 신나서 계속 웃는 사람', 'ENFP', '1', '11');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '반복적인 거 싫어하고 도전하는 거 좋아해서 처음 보는 거 다 타는 사람', 'ENTP', '2', '12');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '이거 타자 저거 타자 의견 제시하는 사람', 'ESTJ', '4', '13');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '갑자기 놀이동산 가자하면 지체없이 바로 출발하는 사람', 'ESFJ', '1', '14');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '놀이기구 제일 잘 타는(줄 아는) 사람', 'ENFJ', '2', '15');
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '오늘 타려고 계획했던 건 다 타야 하는 사람', 'ENTJ', '3', '16');

commit;

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