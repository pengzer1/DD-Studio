-- ���� Ȯ��/��� 
CREATE OR REPLACE VIEW vwUserBook as
SELECT
    U.email,
    UB.user_book_seq,
    UB.user_seq,
    TB.ticket_book_seq,
    TO_CHAR(TB.book_date,'YYYY-MM-DD') as book_date,
    TO_CHAR(TB.visit_date,'YYYY-MM-DD') as visit_date,
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

select * from vwUserBook;
select * from vwUserBook where email = 'park@example.com';

select * from tbluserbook;

commit;
-- ��Ʈ���� ���� Ȯ��/���
CREATE OR REPLACE VIEW vwBookUser as
SELECT
    u.email,
    A.name,
    ab.attraction_book_seq,
    ab.book_time,
    To_char(bu.regdate, 'YYYY-MM-DD') as regdate,
    bu.capacity,
    bu.book_user_seq
FROM tblBookUser BU
JOIN tblAttractionBook AB ON AB.attraction_book_seq = BU.attraction_book_seq
JOIN tblAttraction A on a.attraction_seq = BU.attraction_seq
join tblUser U on u.user_seq = BU.user_seq;

select * from vwBookUser;


-- ȸ������ ����
select * from tblUser;


-- ����Ʈ�� ���� ����
CREATE OR REPLACE VIEW vwUserBuy as
SELECT
    U.email,
    S.name as shopName,
    I.name as itemName,
    B.ea,
    I.price,
    B.buy_seq,
    To_char(B.buy_date, 'yyyy-mm-dd') as buy_date,
    UB.user_buy_seq
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

select * from tblUser;
select * from tblInquiry;
select * from tblVOC;

drop table tblvoc;

select inquiry_seq from tblInquiry;


drop view vwInquiry;

insert into tblVOC (voc_seq, type, service_type, subject, content, attach, visit_date, answer, user_seq, regdate) values (seqtblVOC.nextVal, 'Ī��', '��Ʈ����', '�����Դϴ�', '�����Դϴ�', '÷�������Դϴ�', TO_DATE('1990-12-30', 'yyyy-mm-dd'), '�亯�����Դϴ�', 1, sysdate);
insert into tblVOC (voc_seq, type, service_type, subject, content, attach, visit_date, answer, user_seq, regdate) values (seqtblVOC.nextVal, '����', '�佺Ƽ��', '�����Դϴ�', '�����Դϴ�', '÷�������Դϴ�', TO_DATE('2015-11-20', 'yyyy-mm-dd'), '�亯�����Դϴ�', 2, sysdate);

select * from tblreview;


DROP TRIGGER trg_before_insert_review;

insert into tblreview (review_seq, subject, content, regdate, readcount, user_book_seq) values (seqtblReview.nextVal, ?, ?, sysdate, 0, seqtblUserBook.nextVal);

commit;

select * from tbluserbook;

insert into tbluserbook (user_book_seq, user_seq, ticket_book_seq) values (8, 2, 5);

delete from tbluserbook where user_book_seq = 2; 

select * from tblUserBook;
insert into tblUserBook values (seqtblUserBook.nextVal, 2, 5);
update tblUserBook set ticket_book_seq = 5 where user_book_seq = 2;
commit;
select * from tblReview;
select * from tbluser;

select * from vwUserBook  where email = 'hwang@example.com';
select * from tblUserBook;

select * from tblticketbook;

update tblticketbook set visit_date = '20231101' where ticket_book_seq =1;

select * from vwuserbook;

commit;

delete tbluserbook where user_book_seq = 2;

select * from tblreview;

update tblreview set user_book_seq = 6 where review_seq=2;

commit;

insert into tbluserbook (user_book_seq, user_seq, ticket_book_seq) values (4, 2, 1);

select * from tbluserbook;

select * from tbluser;

insert into tblreview (review_seq, subject, content, regdate, readcount, user_book_seq) values (seqtblreview.nextVal, '테스트리뷰입니다', '테스트내용입니다.', '20231113', 6, 1);

DROP TRIGGER TRG_BEFORE_INSERT_REVIEW;

select * from tblreview;

select * from tblReviewImg;

commit;

select max(review_seq) from tblreview;

select * from vwUserBook where email = 'hwang@example.com' AND visit_date < SYSDATE;

insert into tblbookuser (book_user_seq, regdate, capacity, attraction_book_seq, user_seq, attraction_seq) values(seqtblbookuser.nextVal, '20231115', 3, 1, 2, 1);

select * from tblbookuser;

delete tblbookuser where book_user_seq = 22;

commit;

select * from vwUserBuy where email = 'hwang@example.com' and buy_date < sysdate - INTERVAL '14' DAY;
select * from vwUserBuy where email = 'hwang@example.com' and buy_date >= sysdate - INTERVAL '14' DAY;

insert into tblbuy (buy_seq, buy_date, ea, buy_option, item_seq) values (seqtblbuy.nextVal, '20231010', 3, '옵션4', 1);

select * from tblbuy;
select * from tblitem;
select * from tbluserbuy;

insert into tbluserbuy (user_buy_seq, user_seq, buy_seq) values (seqtbluserbuy.nextVal, 2, 21);

select * from tblinquiry;
select * from tbluser;
select * from tblreview;
select * from tbluserbook;

CREATE OR REPLACE VIEW vwreview as
SELECT
    U.email,
    R.review_seq,
    R.subject,
    R.content,
    R.regdate,
    R.readcount
FROM tblUserBook UB
JOIN tblUser U ON UB.user_seq = U.user_seq
join tblReview R on UB.user_book_seq = R.user_book_seq;

select * from tbluser;

update tbluser set ing = 'Y' where user_seq = 3;

commit;

select * from tbluser;

CREATE OR REPLACE VIEW vwcart as
SELECT
    c.ea,
    i.name,
    i.price,
    c.ea * i.price AS total_price,
    ii.img,
    u.email
FROM tblcart C
JOIN tblUserCart UC ON C.cart_seq = UC.cart_seq
join tblItem I on C.item_seq = I.item_seq
join tblItemImg II on I.item_seq = II.item_seq
join tbluser U on u.user_seq = UC.user_seq;

