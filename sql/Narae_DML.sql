--어트랙션(tblAttraction): 30개(위치번호: 1~30)
/* 어트랙션 */
SELECT * FROM tblAttraction;

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '지브리특급', 120, 3, '10:00 - 22:00', '130cm 미만 탑승 불가, 임산부 및 노약자 탑승 불가', 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '포뇨의 비행', 30, 5, '10:00 - 22:00', '임산부 및 노약자 탑승 불가', 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '천공의 성', 65, 8, '10:00 - 22:00', '임산부 및 노약자 탑승 불가', 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '고양이 스핀', 80, 1, '10:00 - 22:00', '제한 없음', 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '센과 치히로의 동굴 탐험', 60, 6, '10:00 - 22:00', '제한 없음', 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '모노노케히메의 늑대 체험', 70, 7, '10:00 - 22:00', '130cm 미만 탑승 불가, 임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '우리는 빙글빙글', 80, 2, '10:00 - 22:00', '제한 없음', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '추억의 마니', 70, 4, '10:00 - 22:00', '제한 없음', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '즐거움은 방울방울', 50, 9, '10:00 - 22:00', '제한 없음', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '마녀 배달부 디디', 70, 10, '10:00 - 22:00', '제한 없음', 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '빗자루 여행', 55, 11, '10:00 - 22:00', '120cm 미만 탑승 불가, 임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '너구리 대작전', 75, 12, '10:00 - 22:00', '임산부 및 노약자 탑승 불가', 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '지트란티스', 85, 13, '10:00 - 22:00', '140cm 미만 탑승 불가, 임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '토토로스윙', 80, 14, '10:00 - 22:00', '130cm 미만 탑승 불가, 임산부 및 노약자 탑승 불가', 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '토토로스핀', 80, 15, '10:00 - 22:00', '130cm 미만 탑승 불가, 임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '거북이 그네', 55, 16, '10:00 - 22:00', '임산부 및 노약자 탑승 불가', 'Y');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '지브리왕국의 해적선', 120, 17, '10:00 - 22:00', '130cm 미만 탑승 불가, 임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '후룸라이드', 65, 18, '10:00 - 22:00', '임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '회전목마', 75, 19, '10:00 - 22:00', '제한 없음', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '후렌치레볼루션', 80, 20, '10:00 - 22:00', '140cm 미만 탑승 불가, 임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '황야의 무법자', 80, 21, '10:00 - 22:00', '제한 없음', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '뛰뛰빵빵', 60, 22, '10:00 - 22:00', '제한 없음', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '환타지드림', 55, 23, '10:00 - 22:00', '제한 없음', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '코쿠리코 언덕에서', 80, 24, '10:00 - 22:00', '임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '마루 밑 아리에티를 찾아서', 30, 65, '10:00 - 22:00', '임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '니모 이야기', 75, 26, '10:00 - 22:00', '제한 없음', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '벼랑 기차', 75, 27, '10:00 - 22:00', '130cm 미만 탑승 불가, 임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '지브리의 보은', 90, 28, '10:00 - 22:00', '임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '이웃집 탐방기', 100, 29, '10:00 - 22:00', '임산부 및 노약자 탑승 불가', 'N');

INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)
VALUES (seqtblAttraction.NEXTVAL, '귀를 기울이면', 120, 30, '10:00 - 22:00', '제한 없음', 'N');

--어트랙션 이미지(tblAttractionImg): 30개
/* 어트랙션이미지 */
select * from tblAttractionImg;

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '지브리특급1.jpeg', 1);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '지브리특급2.jpeg', 1);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '포뇨의 비행1.jpeg', 2);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '포뇨의 비행2.jpeg', 2);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '천공의 성.jpeg', 3);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '고양이 스핀.jpeg', 4);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '센과 치히로의 동굴 탐험.jpeg', 5);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '늑대 체험.jpg', 6);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '우리는 빙글빙글1.jpeg', 7);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '우리는 빙글빙글2.jpeg', 7);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '추억의 마니.jpeg', 8);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '즐거움은 방울방울1.jpeg', 9);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '즐거움은 방울방울2.jpeg', 9);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '마녀 배달부 디디.jpeg', 10);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '빗자루여행.jpg', 11);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '너구리 대작전.jpg', 12);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '지트란티스.jpeg', 13);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '토토로스윙.jpeg', 14);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '토토로스핀.jpeg', 15);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '거북이 그네.jpeg', 16);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '지브리왕국의 해적선.jpeg', 17);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '후룸라이드.jpeg', 18);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '회전목마.jpeg', 19);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '후렌치레볼루션.jpeg', 20);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '황야의무법자.jpeg', 21);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '뛰뛰빵빵.jpeg', 22);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '환타지드림.jpeg', 23);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '코쿠리코 언덕에서.jpeg', 24);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '마루 밑 아리에티를 찾아서.jpeg', 25);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '니모이야기1.jpeg', 26);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '니모이야기2.jpeg', 26);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '니모이야기3.jpeg', 26);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '벼랑 기차.jpeg', 27);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '지브리의 보은.jpeg', 28);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '이웃집 탐방기.jpeg', 29);

INSERT INTO tblAttractionImg (attraction_img_seq, img, attraction_seq)
VALUES (seqtblAttractionImg.NEXTVAL, '귀를 기울이면.jpeg', 30);

--포토존(tblPhotozone): 10개(위치번호: 36~45)
SELECT * FROM tblPhotozone;

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '토토로 마을', '10:00 - 22:00', '이웃집 토토로와 함께 추억을 남겨보세요.', 36);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '하울의 성', '10:00 - 22:00', '하울의 움직이는 성 내부가 궁금했다면, 바로 이 곳! 하울의 성 포토존으로 오세요!', 37);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '센과 치히로의 온천', '10:00 - 22:00', '센과 치히로의 온천에서 즐거운 추억을 남겨보세요.', 38);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '늑대 마을', '10:00 - 22:00', '모노노케히메와 함께 늑대 마을을 둘러보면 어떨까요?', 39);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '포뇨의 바다', '10:00 - 22:00', '귀여운 포뇨가 이끄는 바닷속에서 아름다운 풍경을 담아보세요!', 40);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '천공의 성', '10:00 - 22:00', '천공의 성 라퓨타! 지금, 바로 여기!', 41);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '마녀 배달부 키키의 하늘', '10:00 - 22:00', '마녀 배달부 키키의 바다가 보이는 마을에서 아름다운 풍경을 담아보세요.', 42);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '고양이 동네', '10:00 - 22:00', '고양이의 보은을 받고싶다면? 고양이 동네로 오세요!', 43);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '코쿠리코 언덕', '10:00 - 22:00', '코쿠리코 언덕에서 저와 함께 사진 찍으실래요?', 44);

INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)
VALUES (seqtblPhotoZone.NEXTVAL, '마루 밑', '10:00 - 22:00', '마루 밑 아리에티가 있던 곳에서 아름다운 추억을 남겨보세요.', 45);

/* 포토존이미지 */
SELECT * FROM tblPhotozoneImg;

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '토토로포토존.jpeg', 1);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '하울의 움직이는 성.png', 2);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '센과 치히로의 행방불명.jpg', 3);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '늑대 체험.jpg', 4);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '벼랑 위의 포뇨.jpg', 5);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '천공의 성 라퓨타.jpg', 6);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '마녀배달부 키키의 하늘.jpeg', 7);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '고양이의 보은.jpg', 8);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '코쿠리코 언덕.jpg', 9);

INSERT INTO tblPhotoZoneImg (photozone_img_seq, img, photozone_seq)
VALUES (seqtblPhotoZoneImg.NEXTVAL, '마루 밑 아리에티.png', 10);

/* 페스티벌 */
INSERT INTO tblFestival (festival_seq, name, time, info, start_date, end_date, location_seq) VALUES (seqtblFestival.NEXTVAL, '지브리 페스티벌', '11:00', '지브리의 모든 캐릭터들을 만나보세요!',TO_DATE('2023.10.01', 'YYYY-MM-DD'), TO_DATE('2024.10.31', 'YYYY-MM-DD'), 46);
INSERT INTO tblFestival (festival_seq, name, time, info, start_date, end_date, location_seq) VALUES (seqtblFestival.NEXTVAL, '토토로의 밤 나들이', '20:00', '토토로와 함께하는 밤 나들이 시간!', TO_DATE('2023.10.01', 'YYYY-MM-DD'), TO_DATE('2024.10.31', 'YYYY-MM-DD'), 47);
INSERT INTO tblFestival (festival_seq, name, time, info, start_date, end_date, location_seq) VALUES (seqtblFestival.NEXTVAL, '포뇨와 함께하는 바다 구경', '13:00', '포뇨와 함께 바닷속을 구경해봐요!', TO_DATE('2023.10.01', 'YYYY-MM-DD'), TO_DATE('2024.10.31', 'YYYY-MM-DD'), 48);

/* 페스티벌이미지 */
SELECT * FROM tblFestivalImg;

INSERT INTO tblFestivalImg (festival_img_seq, img, festival_seq)
VALUES (seqtblFestivalImg.NEXTVAL, 'Ghibli-festival-sample1.png', 1);

INSERT INTO tblFestivalImg (festival_img_seq, img, festival_seq)
VALUES (seqtblFestivalImg.NEXTVAL, 'Ghibli-festival-sample2.png', 2);

INSERT INTO tblFestivalImg (festival_img_seq, img, festival_seq)
VALUES (seqtblFestivalImg.NEXTVAL, 'Ghibli-festival-sample3.png', 3);

/* 페스티벌/해시태그 */
INSERT INTO tblFestivalHashtag (festival_hashtag_seq, festival_seq, hashtag_seq)
VALUES (seqtblFestivalHashtag.NEXTVAL, 1, 1);

INSERT INTO tblFestivalHashtag (festival_hashtag_seq, festival_seq, hashtag_seq)
VALUES (seqtblFestivalHashtag.NEXTVAL, 2, 2);

INSERT INTO tblFestivalHashtag (festival_hashtag_seq, festival_seq, hashtag_seq)
VALUES (seqtblFestivalHashtag.NEXTVAL, 3, 3);

