-- ���� Ȯ��/��� 
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

select * from vwUserBook;
select * from vwUserBook where email = 'park@example.com';


-- ��Ʈ���� ���� Ȯ��/���
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

select * from tblUser;
select * from tblInquiry;
select * from tblVOC;