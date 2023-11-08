/* 유저 */
INSERT INTO tblUser (user_seq, name, email, pw, tel, address, birth, lv, ing)
VALUES (seqtblUser.nextVal, '박나래', 'park@example.com', '1111', '111-2222-3333', '주소1', TO_DATE('2000-01-01', 'yyyy-mm-dd'), '1', 'Y');

INSERT INTO tblUser (user_seq, name, email, pw, tel, address, birth, lv, ing)
VALUES (seqtblUser.nextVal, '황주원', 'hwang@example.com', '1111', '444-5555-6666', '주소2', TO_DATE('1985-05-15', 'yyyy-mm-dd'), '1', 'Y');

INSERT INTO tblUser (user_seq, name, email, pw, tel, address, birth, lv, ing)
VALUES (seqtblUser.nextVal, '차민재', 'cha@example.com', '1111', '777-8888-9999', '군대', TO_DATE('2010-12-30', 'yyyy-mm-dd'), '1', 'N');

INSERT INTO tblUser (user_seq, name, email, pw, tel, address, birth, lv, ing)
VALUES (seqtblUser.nextVal, '관리자', 'admin@example.com', '1111', '123-4567-7890', '주소3', TO_DATE('1990-12-30', 'yyyy-mm-dd'), '2', 'Y');

select * from tblUser;
select * from tblUser where email = 'park@example.com' and pw = '1111' and ing = 'Y';

/* 테마 */
INSERT INTO tblTheme (theme_seq, name)
VALUES (seqtblTheme.nextVal, '테마1');

INSERT INTO tblTheme (theme_seq, name)
VALUES (seqtblTheme.nextVal, '테마2');

INSERT INTO tblTheme (theme_seq, name)
VALUES (seqtblTheme.nextVal, '테마3');

/* 해시태그 */
INSERT INTO tblHashtag (hashtag_seq, name)
VALUES (seqtblHashtag.nextVal, '해시태그1');

INSERT INTO tblHashtag (hashtag_seq, name)
VALUES (seqtblHashtag.nextVal, '해시태그2');

INSERT INTO tblHashtag (hashtag_seq, name)
VALUES (seqtblHashtag.nextVal, '해시태그3');

/* 위치정보 */
INSERT INTO tblLocation (location_seq, info)
VALUES (seqtblLocation.nextVal, '위치정보1');

INSERT INTO tblLocation (location_seq, info)
VALUES (seqtblLocation.nextVal, '위치정보2');

INSERT INTO tblLocation (location_seq, info)
VALUES (seqtblLocation.nextVal, '위치정보3');

/* 카테고리 */
INSERT INTO tblCategory (category_seq, name)
VALUES (seqtblCategory.nextVal, '카테고리1');

INSERT INTO tblCategory (category_seq, name)
VALUES (seqtblCategory.nextVal, '카테고리2');

INSERT INTO tblCategory (category_seq, name)
VALUES (seqtblCategory.nextVal, '카테고리3');

/* 식당 */
INSERT INTO tblRestaurant (restaurant_seq, name, menu, time, capacity, tel, location_seq, category_seq)
VALUES (seqtblRestaurant.nextVal, '식당1', '메뉴1', '9:00 AM - 10:00 PM', 100, '123-456-7890', 1, 1);

INSERT INTO tblRestaurant (restaurant_seq, name, menu, time, capacity, tel, location_seq, category_seq)
VALUES (seqtblRestaurant.nextVal, '식당2', '메뉴2', '10:00 AM - 11:00 PM', 80, '987-654-3210', 2, 2);

INSERT INTO tblRestaurant (restaurant_seq, name, menu, time, capacity, tel, location_seq, category_seq)
VALUES (seqtblRestaurant.nextVal, '식당3', '메뉴3', '8:00 AM - 9:00 PM', 120, '111-222-3333', 3, 3);

/* 식당이미지 */
INSERT INTO tblRestaurantImg (restaurant_img_seq, img, restaurant_seq)
VALUES (seqtblRestaurantImg.nextVal, 'restaurant1.png', 1);

INSERT INTO tblRestaurantImg (restaurant_img_seq, img, restaurant_seq)
VALUES (seqtblRestaurantImg.nextVal, 'restaurant2.png', 2);

INSERT INTO tblRestaurantImg (restaurant_img_seq, img, restaurant_seq)
VALUES (seqtblRestaurantImg.nextVal, 'restaurant3.png', 3);

/* 식당/운휴 */
INSERT INTO tblRestaurantClose (restaurant_close_seq, start_date, end_date, restaurant_seq)
VALUES (seqtblRestaurantClose.NEXTVAL, TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-05', 'YYYY-MM-DD'), 1);

INSERT INTO tblRestaurantClose (restaurant_close_seq, start_date, end_date, restaurant_seq)
VALUES (seqtblRestaurantClose.NEXTVAL, TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2023-11-15', 'YYYY-MM-DD'), 2);

INSERT INTO tblRestaurantClose (restaurant_close_seq, start_date, end_date, restaurant_seq)
VALUES (seqtblRestaurantClose.NEXTVAL, TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-11-25', 'YYYY-MM-DD'), 3);

/* 편의시설 */
INSERT INTO tblConvenient (convenient_seq, name, time, tel, img, location_seq)
VALUES (seqtblConvenient.NEXTVAL, '편의점 A', '09:00 - 21:00', '123-456-7890', 'convenient.png', 1);

INSERT INTO tblConvenient (convenient_seq, name, time, tel, img, location_seq)
VALUES (seqtblConvenient.NEXTVAL, '편의점 B', '08:00 - 22:00', '987-654-3210', 'convenient.png', 2);

INSERT INTO tblConvenient (convenient_seq, name, time, tel, img, location_seq)
VALUES (seqtblConvenient.NEXTVAL, '편의점 C', '10:00 - 20:00', '555-123-7777', 'convenient.png', 3);

/* 기프트샵 */
INSERT INTO tblShop (shop_seq, name, time, info, tel, location_seq)
VALUES (seqtblShop.NEXTVAL, '기프트샵 X', '09:30 - 18:00', '최고의 선물을 찾아보세요.', '111-222-3333', 1);

INSERT INTO tblShop (shop_seq, name, time, info, tel, location_seq)
VALUES (seqtblShop.NEXTVAL, '기프트샵 Y', '10:00 - 19:30', '다양한 기념품을 판매합니다.', '444-555-6666', 2);

INSERT INTO tblShop (shop_seq, name, time, info, tel, location_seq)
VALUES (seqtblShop.NEXTVAL, '기프트샵 Z', '11:00 - 17:45', '추억을 채워가는 곳.', '777-888-9999', 3);

/* 기프트샵/운휴 */
INSERT INTO tblShopClose (shop_close_seq, start_date, end_date, shop_seq)
VALUES (seqtblShopClose.NEXTVAL, TO_DATE('2023-11-02', 'YYYY-MM-DD'), TO_DATE('2023-11-04', 'YYYY-MM-DD'), 1);

INSERT INTO tblShopClose (shop_close_seq, start_date, end_date, shop_seq)
VALUES (seqtblShopClose.NEXTVAL, TO_DATE('2023-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-14', 'YYYY-MM-DD'), 2);

INSERT INTO tblShopClose (shop_close_seq, start_date, end_date, shop_seq)
VALUES (seqtblShopClose.NEXTVAL, TO_DATE('2023-11-22', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), 3);

/* 기프트샵이미지 */
INSERT INTO tblShopImg (shop_img_seq, img, shop_seq)
VALUES (seqtblShopImg.NEXTVAL, 'shop1.png', 1);

INSERT INTO tblShopImg (shop_img_seq, img, shop_seq)
VALUES (seqtblShopImg.NEXTVAL, 'shop2.png', 2);

INSERT INTO tblShopImg (shop_img_seq, img, shop_seq)
VALUES (seqtblShopImg.NEXTVAL, 'shop3.png', 3);

/* 영화관 */
INSERT INTO tblTheater (theater_seq, name, location_seq)
VALUES (seqtblTheater.NEXTVAL, '영화관 A', 1);

INSERT INTO tblTheater (theater_seq, name, location_seq)
VALUES (seqtblTheater.NEXTVAL, '영화관 B', 2);

INSERT INTO tblTheater (theater_seq, name, location_seq)
VALUES (seqtblTheater.NEXTVAL, '영화관 C', 3);

/* 영화관/운휴 */
INSERT INTO tblTheaterClose (theater_close_seq, start_date, end_date, theater_seq)
VALUES (seqtblTheaterClose.NEXTVAL, TO_DATE('2023-11-02', 'YYYY-MM-DD'), TO_DATE('2023-11-04', 'YYYY-MM-DD'), 1);

INSERT INTO tblTheaterClose (theater_close_seq, start_date, end_date, theater_seq)
VALUES (seqtblTheaterClose.NEXTVAL, TO_DATE('2023-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-14', 'YYYY-MM-DD'), 2);

INSERT INTO tblTheaterClose (theater_close_seq, start_date, end_date, theater_seq)
VALUES (seqtblTheaterClose.NEXTVAL, TO_DATE('2023-11-22', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), 3);

/* 영화 */
INSERT INTO tblMovie (movie_seq, name, period, runningtime, img, preview)
VALUES (seqtblMovie.NEXTVAL, '영화 1', '2023-11-01 ~ 2023-11-10', 120, 'movie1.png', 'preview1.mp4');

INSERT INTO tblMovie (movie_seq, name, period, runningtime, img, preview)
VALUES (seqtblMovie.NEXTVAL, '영화 2', '2023-11-05 ~ 2023-11-15', 105, 'movie2.png', 'preview2.mp4');

INSERT INTO tblMovie (movie_seq, name, period, runningtime, img, preview)
VALUES (seqtblMovie.NEXTVAL, '영화 3', '2023-11-12 ~ 2023-11-20', 130, 'movie3.png', 'preview3.mp4');

/* 영화상영 */
INSERT INTO tblMoviePlay (movie_play_seq, start_time, theater_seq, movie_seq)
VALUES (seqtblMoviePlay.NEXTVAL, '12:00', 1, 1);

INSERT INTO tblMoviePlay (movie_play_seq, start_time, theater_seq, movie_seq)
VALUES (seqtblMoviePlay.NEXTVAL, '14:30', 2, 1);

INSERT INTO tblMoviePlay (movie_play_seq, start_time, theater_seq, movie_seq)
VALUES (seqtblMoviePlay.NEXTVAL, '17:15', 3, 1);

/* 영화/해시태그 */
INSERT INTO tblMovieHashtag (movie_hashtag_seq, movie_seq, hashtag_seq)
VALUES (seqtblMovieHashtag.NEXTVAL, 1, 1);

INSERT INTO tblMovieHashtag (movie_hashtag_seq, movie_seq, hashtag_seq)
VALUES (seqtblMovieHashtag.NEXTVAL, 2, 2);

INSERT INTO tblMovieHashtag (movie_hashtag_seq, movie_seq, hashtag_seq)
VALUES (seqtblMovieHashtag.NEXTVAL, 3, 3);

/* 포토존 */
INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '포토존 X', '09:00 - 20:00', '아름다운 풍경을 담아보세요.', 1);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '포토존 Y', '10:00 - 18:30', '자연의 아름다움을 담다.', 2);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '포토존 Z', '08:30 - 19:00', '추억을 남기는 곳.', 3);


/* 포토존이미지 */
INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, 'photozone1.png', 1);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, 'photozone2.png', 2);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, 'photozone3.png', 3);

/* 페스티벌 */
INSERT INTO tblFestival (festival_seq, name, time, info, period, location_seq) VALUES (seqtblFestival.NEXTVAL, '지브리 페스티벌', '11:00', '지브리의 모든 캐릭터들을 만나보세요!','2023.10.01 - 2024.10.31', 1);
INSERT INTO tblFestival (festival_seq, name, time, info, period, location_seq) VALUES (seqtblFestival.NEXTVAL, '토토로의 밤 나들이', '20:00', '토토로와 함께하는 밤 나들이 시간!', '2023.10.01 - 2024.10.31', 2);
INSERT INTO tblFestival (festival_seq, name, time, info, period, location_seq) VALUES (seqtblFestival.NEXTVAL, '포뇨와 함께하는 바다 구경', '13:00', '포뇨와 함께 바닷속을 구경해봐요!', '2023.10.01 - 2024.10.31', 3);

/* 페스티벌이미지 */
INSERT INTO tblFestivalImg (festival_img_seq, img, festival_seq)
VALUES (seqtblFestivalImg.NEXTVAL, 'festival1.png', 1);

INSERT INTO tblFestivalImg (festival_img_seq, img, festival_seq)
VALUES (seqtblFestivalImg.NEXTVAL, 'festival2.png', 2);

INSERT INTO tblFestivalImg (festival_img_seq, img, festival_seq)
VALUES (seqtblFestivalImg.NEXTVAL, 'festival3.png', 3);

/* 페스티벌/해시태그 */
INSERT INTO tblFestivalHashtag (festival_hashtag_seq, festival_seq, hashtag_seq)
VALUES (seqtblFestivalHashtag.NEXTVAL, 1, 1);

INSERT INTO tblFestivalHashtag (festival_hashtag_seq, festival_seq, hashtag_seq)
VALUES (seqtblFestivalHashtag.NEXTVAL, 2, 2);

INSERT INTO tblFestivalHashtag (festival_hashtag_seq, festival_seq, hashtag_seq)
VALUES (seqtblFestivalHashtag.NEXTVAL, 3, 3);

/* 어트랙션 */
INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, theme_seq, is_test)
VALUES (seqtblAttraction.NEXTVAL, '어트랙션 A', 100, 1, '10:00 - 18:00', 140, 1, 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, theme_seq, is_test)
VALUES (seqtblAttraction.NEXTVAL, '어트랙션 B', 80, 2, '09:30 - 17:30', 130, 2, 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, theme_seq, is_test)
VALUES (seqtblAttraction.NEXTVAL, '어트랙션 C', 120, 3, '11:00 - 19:00', 150, 3, 'Y');

/* 어트/운휴 */
INSERT INTO tblAttractionClose (attraction_close_seq, start_date, end_date, attraction_seq)
VALUES (seqtblAttractionClose.NEXTVAL, TO_DATE('2023-11-02', 'YYYY-MM-DD'), TO_DATE('2023-11-04', 'YYYY-MM-DD'), 1);

INSERT INTO tblAttractionClose (attraction_close_seq, start_date, end_date, attraction_seq)
VALUES (seqtblAttractionClose.NEXTVAL, TO_DATE('2023-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-14', 'YYYY-MM-DD'), 2);

INSERT INTO tblAttractionClose (attraction_close_seq, start_date, end_date, attraction_seq)
VALUES (seqtblAttractionClose.NEXTVAL, TO_DATE('2023-11-22', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), 3);

/* 어트랙션 예약 */
INSERT INTO tblAttractionBook (attraction_book_seq, book_time, capacity)
VALUES (seqtblAttractionBook.NEXTVAL, '2023-11-01 14:00', 4);

INSERT INTO tblAttractionBook (attraction_book_seq, book_time, capacity)
VALUES (seqtblAttractionBook.NEXTVAL, '2023-11-10 10:30', 3);

INSERT INTO tblAttractionBook (attraction_book_seq, book_time, capacity)
VALUES (seqtblAttractionBook.NEXTVAL, '2023-11-20 15:45', 5);

/* 어트랙션이미지 */
INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, 'attraction1.png', 1);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, 'attraction2.png', 2);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, 'attraction3.png', 3);

/* 어트/해시태그 */
INSERT INTO tblAttractionHashtag (attraction_hashtag_seq, attraction_seq, hashtag_seq)
VALUES (seqtblAttractionHashtag.NEXTVAL, 1, 1);

INSERT INTO tblAttractionHashtag (attraction_hashtag_seq, attraction_seq, hashtag_seq)
VALUES (seqtblAttractionHashtag.NEXTVAL, 2, 2);

INSERT INTO tblAttractionHashtag (attraction_hashtag_seq, attraction_seq, hashtag_seq)
VALUES (seqtblAttractionHashtag.NEXTVAL, 3, 3);

/* 예약/회원 */
INSERT INTO tblBookUser (book_user_seq, regdate, capacity, attraction_book_seq, user_seq, attraction_seq)
VALUES (seqtblBookUser.NEXTVAL, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 3, 1, 1, 1);

INSERT INTO tblBookUser (book_user_seq, regdate, capacity, attraction_book_seq, user_seq, attraction_seq)
VALUES (seqtblBookUser.NEXTVAL, TO_DATE('2023-11-12', 'YYYY-MM-DD'), 4, 2, 2, 2);

INSERT INTO tblBookUser (book_user_seq, regdate, capacity, attraction_book_seq, user_seq, attraction_seq)
VALUES (seqtblBookUser.NEXTVAL, TO_DATE('2023-11-22', 'YYYY-MM-DD'), 5, 3, 3, 3);

/* 셔틀버스 */
INSERT INTO tblBus (bus_seq, start_time, interval, capacity)
VALUES (seqtblBus.NEXTVAL, '08:00', 30, 50);

INSERT INTO tblBus (bus_seq, start_time, interval, capacity)
VALUES (seqtblBus.NEXTVAL, '09:00', 20, 40);

INSERT INTO tblBus (bus_seq, start_time, interval, capacity)
VALUES (seqtblBus.NEXTVAL, '10:00', 25, 60);

/* 노선 */
INSERT INTO tblRoute (route_seq, route_order, bus_seq, start_attraction_seq, end_attraction_seq)
VALUES (seqtblRoute.NEXTVAL, 1, 1, 1, 3);

INSERT INTO tblRoute (route_seq, route_order, bus_seq, start_attraction_seq, end_attraction_seq)
VALUES (seqtblRoute.NEXTVAL, 2, 2, 2, 3);

INSERT INTO tblRoute (route_seq, route_order, bus_seq, start_attraction_seq, end_attraction_seq)
VALUES (seqtblRoute.NEXTVAL, 3, 3, 3, 2);

/* 코스 */
INSERT INTO tblCourse (course_seq, name, img)
VALUES (seqtblCourse.NEXTVAL, '코스 A', 'course1.png');

INSERT INTO tblCourse (course_seq, name, img)
VALUES (seqtblCourse.NEXTVAL, '코스 B', 'course2.png');

INSERT INTO tblCourse (course_seq, name, img)
VALUES (seqtblCourse.NEXTVAL, '코스 C', 'course3.png');

/* MBTI */
INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '결과 A', 'MBTI A', 1, 1);

INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '결과 B', 'MBTI B', 2, 2);

INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq)
VALUES (seqtblMBTI.NEXTVAL, '결과 C', 'MBTI C', 3, 3);

/* 취향테스트 문제 */
INSERT INTO tblTest (test_seq, question, answer1, answer2, img)
VALUES (seqtblTest.NEXTVAL, '문제 1', '답변 1-1', '답변 1-2', 'test1.png');

INSERT INTO tblTest (test_seq, question, answer1, answer2, img)
VALUES (seqtblTest.NEXTVAL, '문제 2', '답변 2-1', '답변 2-2', 'test2.png');

INSERT INTO tblTest (test_seq, question, answer1, answer2, img)
VALUES (seqtblTest.NEXTVAL, '문제 3', '답변 3-1', '답변 3-2', 'test3.png');

/* 취향테스트 문제 점수 */
INSERT INTO tblTestScore (test_score_seq, point1, point2, type, test_seq)
VALUES (seqtblTestScore.NEXTVAL, 3, 1, 'E/I', 1);

INSERT INTO tblTestScore (test_score_seq, point1, point2, type, test_seq)
VALUES (seqtblTestScore.NEXTVAL, 2, 2, 'N/S', 2);

INSERT INTO tblTestScore (test_score_seq, point1, point2, type, test_seq)
VALUES (seqtblTestScore.NEXTVAL, 1, 3, 'F/T', 3);

/* 칭찬/불편/건의 */
INSERT INTO tblVOC (voc_seq, type, service_type, subject, content, attach, visit_date, answer, user_seq)
VALUES (seqtblVOC.NEXTVAL, '불편', '서비스1', '불편사항 1', '불편한 사항 내용 1', 'attach1.jpg', TO_DATE('2023-11-02', 'YYYY-MM-DD'), '답변 내용 1', 1);

INSERT INTO tblVOC (voc_seq, type, service_type, subject, content, attach, visit_date, answer, user_seq)
VALUES (seqtblVOC.NEXTVAL, '건의', '서비스2', '건의사항 2', '건의 내용 2', NULL, TO_DATE('2023-11-10', 'YYYY-MM-DD'), '답변 내용 2', 2);

INSERT INTO tblVOC (voc_seq, type, service_type, subject, content, attach, visit_date, answer, user_seq)
VALUES (seqtblVOC.NEXTVAL, '불편', '서비스3', '불편사항 3', '불편한 사항 내용 3', 'attach3.jpg', TO_DATE('2023-11-20', 'YYYY-MM-DD'), '답변 내용 3', 3);

/* 이용문의 */
INSERT INTO tblInquiry (COL, COL2, subject, content, attach, answer, user_seq)
VALUES (seqtblInquiry.NEXTVAL, '문의유형1', '문의 제목 1', '문의 내용 1', 'attach1.pdf', '답변 내용 1', 1);

INSERT INTO tblInquiry (COL, COL2, subject, content, attach, answer, user_seq)
VALUES (seqtblInquiry.NEXTVAL, '문의유형2', '문의 제목 2', '문의 내용 2', NULL, '답변 내용 2', 2);

INSERT INTO tblInquiry (COL, COL2, subject, content, attach, answer, user_seq)
VALUES (seqtblInquiry.NEXTVAL, '문의유형3', '문의 제목 3', '문의 내용 3', 'attach3.doc', '답변 내용 3', 3);

/* FAQ */
INSERT INTO tblFAQ (faq_seq, type, question, answer, faq_order)
VALUES (seqtblFAQ.NEXTVAL, '카테고리1', '질문 1', '답변 1', 1);

INSERT INTO tblFAQ (faq_seq, type, question, answer, faq_order)
VALUES (seqtblFAQ.NEXTVAL, '카테고리2', '질문 2', '답변 2', 2);

INSERT INTO tblFAQ (faq_seq, type, question, answer, faq_order)
VALUES (seqtblFAQ.NEXTVAL, '카테고리1', '질문 3', '답변 3', 3);

/* 공지사항 */
INSERT INTO tblNotice (notice_seq, subject, content, attach, fix)
VALUES (seqtblNotice.NEXTVAL, '공지사항 1', '이번 주 행사 안내입니다.', 'attach1.pdf', 1);

INSERT INTO tblNotice (notice_seq, subject, content, attach, fix)
VALUES (seqtblNotice.NEXTVAL, '공지사항 2', '주차장 공사로 인한 영향 안내', NULL, 0);

INSERT INTO tblNotice (notice_seq, subject, content, attach, fix)
VALUES (seqtblNotice.NEXTVAL, '공지사항 3', '휴업일 변경 공지', 'attach3.doc', 1);

/* 분실물센터 */
INSERT INTO tblLostCenter (lost_center_seq, type, name, location, lost_center_date, img, result)
VALUES (seqtblLostCenter.NEXTVAL, '분류1', '습득물 1', '로비', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'lost1.jpg', '처리 완료');

INSERT INTO tblLostCenter (lost_center_seq, type, name, location, lost_center_date, img, result)
VALUES (seqtblLostCenter.NEXTVAL, '분류2', '습득물 2', '2층 로비', TO_DATE('2023-11-02', 'YYYY-MM-DD'), 'lost2.jpg', '미처리');

INSERT INTO tblLostCenter (lost_center_seq, type, name, location, lost_center_date, img, result)
VALUES (seqtblLostCenter.NEXTVAL, '분류1', '습득물 3', '1층 대문 앞', TO_DATE('2023-11-10', 'YYYY-MM-DD'), 'lost3.jpg', '처리 완료');

/* 티켓 */
INSERT INTO tblTicket (ticket_seq, ticket_type, person_type, age, price)
VALUES (seqtblTicket.NEXTVAL, '1Day', '개인', '성인', 10000);

INSERT INTO tblTicket (ticket_seq, ticket_type, person_type, age, price)
VALUES (seqtblTicket.NEXTVAL, 'After4', '단체', '청소년', 8000);

INSERT INTO tblTicket (ticket_seq, ticket_type, person_type, age, price)
VALUES (seqtblTicket.NEXTVAL, '뿅뿅', '개인', '어린이', 5000);

/* 혜택 */
INSERT INTO tblBenefit (benefit_seq, name, type, benefit_date, discount_rate, img)
VALUES (seqtblBenefit.NEXTVAL, '할인 혜택 1', '할인', '2023-11-15', 10, 'benefit1.png');

INSERT INTO tblBenefit (benefit_seq, name, type, benefit_date, discount_rate, img)
VALUES (seqtblBenefit.NEXTVAL, '무료 혜택 2', '무료', '2023-11-30', 100, 'benefit2.png');

INSERT INTO tblBenefit (benefit_seq, name, type, benefit_date, discount_rate, img)
VALUES (seqtblBenefit.NEXTVAL, '할인 혜택 3', '할인', '2023-12-10', 15, 'benefit3.png');

/* 예매내역 */
INSERT INTO tblTicketBook (ticket_book_seq, book_date, visit_date, ea, ticket_seq, benefit_seq)
VALUES (seqtblTicketBook.NEXTVAL, TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-15', 'YYYY-MM-DD'), 2, 1, 1);

INSERT INTO tblTicketBook (ticket_book_seq, book_date, visit_date, ea, ticket_seq, benefit_seq)
VALUES (seqtblTicketBook.NEXTVAL, TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2023-11-25', 'YYYY-MM-DD'), 5, 2, 2);

INSERT INTO tblTicketBook (ticket_book_seq, book_date, visit_date, ea, ticket_seq, benefit_seq)
VALUES (seqtblTicketBook.NEXTVAL, TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2023-12-05', 'YYYY-MM-DD'), 3, 3, 3);

/* 회원/예매 */
INSERT INTO tblUserBook (user_book_seq, user_seq, ticket_book_seq)
VALUES (seqtblUserBook.NEXTVAL, 1, 1);

INSERT INTO tblUserBook (user_book_seq, user_seq, ticket_book_seq)
VALUES (seqtblUserBook.NEXTVAL, 2, 2);

INSERT INTO tblUserBook (user_book_seq, user_seq, ticket_book_seq)
VALUES (seqtblUserBook.NEXTVAL, 3, 3);

/* 리뷰 */
INSERT INTO tblReview (review_seq, subject, content, readcount, user_book_seq)
VALUES (seqtblReview.NEXTVAL, '좋은 서비스', '서비스가 매우 만족스러웠습니다.', 10, 1);

INSERT INTO tblReview (review_seq, subject, content, readcount, user_book_seq)
VALUES (seqtblReview.NEXTVAL, '관람 후기', '영화가 정말 재밌었습니다.', 15, 2);

INSERT INTO tblReview (review_seq, subject, content, readcount, user_book_seq)
VALUES (seqtblReview.NEXTVAL, '추천해요', '아이템이 너무 귀여워서 추천합니다.', 8, 3);

/* 리뷰이미지 */
INSERT INTO tblReviewImg (review_img_seq, img, review_seq)
VALUES (seqtblReviewImg.NEXTVAL, 'reviewimg1.png', 1);

INSERT INTO tblReviewImg (review_img_seq, img, review_seq)
VALUES (seqtblReviewImg.NEXTVAL, 'reviewimg2.png', 2);

INSERT INTO tblReviewImg (review_img_seq, img, review_seq)
VALUES (seqtblReviewImg.NEXTVAL, 'reviewimg3.png', 3);

/* 아이템 */
INSERT INTO tblItem (item_seq, name, info, price, shop_seq)
VALUES (seqtblItem.NEXTVAL, '아이템 1', '테마파크 기념품', 5000, 1);

INSERT INTO tblItem (item_seq, name, info, price, shop_seq)
VALUES (seqtblItem.NEXTVAL, '아이템 2', '추억의 아이템', 10000, 2);

INSERT INTO tblItem (item_seq, name, info, price, shop_seq)
VALUES (seqtblItem.NEXTVAL, '아이템 3', '영화 아이템', 8000, 3);

/* 아이템이미지 */
INSERT INTO tblItemImg (item_img_seq, img, item_seq)
VALUES (seqtblItemImg.NEXTVAL, 'itemimg1.png', 1);

INSERT INTO tblItemImg (item_img_seq, img, item_seq)
VALUES (seqtblItemImg.NEXTVAL, 'itemimg2.png', 2);

INSERT INTO tblItemImg (item_img_seq, img, item_seq)
VALUES (seqtblItemImg.NEXTVAL, 'itemimg3.png', 3);

/* 장바구니 */
INSERT INTO tblCart (cart_seq, ea, cart_option, item_seq)
VALUES (seqtblCart.NEXTVAL, 2, '옵션 1', 1);

INSERT INTO tblCart (cart_seq, ea, cart_option, item_seq)
VALUES (seqtblCart.NEXTVAL, 1, '옵션 2', 2);

INSERT INTO tblCart (cart_seq, ea, cart_option, item_seq)
VALUES (seqtblCart.NEXTVAL, 3, '옵션 3', 3);

/* 회원/장바구니 */
INSERT INTO tblUserCart (user_cart_seq, user_seq, cart_seq)
VALUES (seqtblUserCart.NEXTVAL, 1, 1);

INSERT INTO tblUserCart (user_cart_seq, user_seq, cart_seq)
VALUES (seqtblUserCart.NEXTVAL, 2, 2);

INSERT INTO tblUserCart (user_cart_seq, user_seq, cart_seq)
VALUES (seqtblUserCart.NEXTVAL, 3, 3);

/* 구매내역 */
INSERT INTO tblBuy (buy_seq, buy_date, ea, buy_option, item_seq)
VALUES (seqtblBuy.NEXTVAL, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 2, '옵션 1', 1);

INSERT INTO tblBuy (buy_seq, buy_date, ea, buy_option, item_seq)
VALUES (seqtblBuy.NEXTVAL, TO_DATE('2023-11-10', 'YYYY-MM-DD'), 1, '옵션 2', 2);

INSERT INTO tblBuy (buy_seq, buy_date, ea, buy_option, item_seq)
VALUES (seqtblBuy.NEXTVAL, TO_DATE('2023-11-15', 'YYYY-MM-DD'), 3, '옵션 3', 3);

/* 회원/구매 */
INSERT INTO tblUserBuy (user_buy_seq, user_seq, buy_seq)
VALUES (seqtblUserBuy.NEXTVAL, 1, 1);

INSERT INTO tblUserBuy (user_buy_seq, user_seq, buy_seq)
VALUES (seqtblUserBuy.NEXTVAL, 2, 2);

INSERT INTO tblUserBuy (user_buy_seq, user_seq, buy_seq)
VALUES (seqtblUserBuy.NEXTVAL, 3, 3);
