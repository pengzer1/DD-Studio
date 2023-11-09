-- 예매 확인/취소 
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


-- 어트랙션 예약 확인/취소
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


-- 회원정보 수정
