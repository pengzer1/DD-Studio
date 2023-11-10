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

commit;

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
--어트랙션(30개)
INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.361488, 126.529212);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.369455, 126.563192);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.243217, 126.542354);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.238185, 126.566413);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.235918, 126.562827);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.240354, 126.608888);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.252144, 126.622615);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.271351, 126.697224);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.282079, 126.748282);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.303494, 126.792045);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.307921, 126.831023);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.325267, 126.848278);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.360716, 126.867031);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.305118, 126.166359);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.379284, 126.413401);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.281948, 126.570471);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.485583, 126.888875);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.459435, 126.939154);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.552424, 126.725118);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.447752, 126.523610);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.382156, 126.301300);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.323912, 126.618446);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.460676, 126.736155);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.353147, 126.708275);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.362082, 126.372486);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.294317, 126.281165);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.304963, 126.315241);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.304535, 126.317409);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.249302, 126.202492);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.286853, 126.174816);

--영화관(5개)
INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.484492, 126.487048);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.355099, 126.339975);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.318536, 126.489367);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.383865, 126.804857);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.528155, 126.827441);

--포토존(10개)
INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3992, 126.5777);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3608, 126.2744);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4852, 126.4351);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.5181, 126.7832);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3873, 126.6581);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3997, 126.848);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3229, 126.6814);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.2719, 126.5045);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.2269, 126.2796);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4149, 126.8771);

--페스티벌(3개)
INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.5145, 126.9714);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4006, 126.2514);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.2895, 126.7027);

--편의시설(25개)
INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.5021, 126.9565);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.5612, 126.7692);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.5227, 126.8448);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4799, 126.8241);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4616, 126.8735);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4264, 126.8369);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3461, 126.8323);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4103, 126.7489);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3736, 126.6948);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3369, 126.7526);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.5143, 126.6004);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4471, 126.6572);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4287, 126.7031);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3323, 126.6994);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.2894, 126.6912);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.444, 126.5033);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4471, 126.4226);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3889, 126.4226);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3185, 126.4373);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.2825, 126.3997);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.4012, 126.3108);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.2649, 126.2356);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.3583, 126.198);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.2322, 126.3289);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.2642, 126.2497);

--식당(15개)
INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.361956, 126.295689);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.253796, 126.229688);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.386880, 126.230640);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.412909, 126.281854);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.418824, 126.330628);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.422877, 126.491733);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.506151, 126.517572);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.492558, 126.676321);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.435090, 126.687872);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.288085, 126.584674);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.365595, 126.766224);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.472911, 126.778637);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.494391, 126.900416);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.546470, 126.748680);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.505390, 126.955714);

--기프트샵(8개)
INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.513232, 126.958583);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.505710, 126.732057);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.389263, 126.529013);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.454406, 126.484988);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.304354, 126.337687);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.323585, 126.198274);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.491535, 126.511102);

INSERT INTO tblLocation (location_seq, lat, lng)
VALUES (seqtblLocation.nextVal, 33.548522, 126.726314);

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
INSERT INTO tblMovie (movie_seq, name, start_date, end_date, runningtime, img, preview)
VALUES (seqtblMovie.NEXTVAL, '영화 1', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-10', 'YYYY-MM-DD'), 120, 'movie1.png', 'preview1.mp4');

INSERT INTO tblMovie (movie_seq, name, start_date, end_date, runningtime, img, preview)
VALUES (seqtblMovie.NEXTVAL, '영화 2', TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2023-11-15', 'YYYY-MM-DD'), 105, 'movie2.png', 'preview2.mp4');

INSERT INTO tblMovie (movie_seq, name, start_date, end_date, runningtime, img, preview)
VALUES (seqtblMovie.NEXTVAL, '영화 3', TO_DATE('2023-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), 130, 'movie3.png', 'preview3.mp4');

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
INSERT INTO tblFestival (festival_seq, name, time, info, start_date, end_date, location_seq) VALUES (seqtblFestival.NEXTVAL, '지브리 페스티벌', '11:00', '지브리의 모든 캐릭터들을 만나보세요!',TO_DATE('2023.10.01', 'YYYY-MM-DD'), TO_DATE('2024.10.31', 'YYYY-MM-DD'), 1);
INSERT INTO tblFestival (festival_seq, name, time, info, start_date, end_date, location_seq) VALUES (seqtblFestival.NEXTVAL, '토토로의 밤 나들이', '20:00', '토토로와 함께하는 밤 나들이 시간!', TO_DATE('2023.10.01', 'YYYY-MM-DD'), TO_DATE('2024.10.31', 'YYYY-MM-DD'), 2);
INSERT INTO tblFestival (festival_seq, name, time, info, start_date, end_date, location_seq) VALUES (seqtblFestival.NEXTVAL, '포뇨와 함께하는 바다 구경', '13:00', '포뇨와 함께 바닷속을 구경해봐요!', TO_DATE('2023.10.01', 'YYYY-MM-DD'), TO_DATE('2024.10.31', 'YYYY-MM-DD'), 3);

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
INSERT INTO tblVOC (voc_seq, type, service_type, subject, content, regdate, attach, visit_date, answer, user_seq)
VALUES (seqtblVOC.NEXTVAL, '불편', '서비스1', '불편사항 1', '불편한 사항 내용 1', DEFAULT,'attach1.jpg', TO_DATE('2023-11-02', 'YYYY-MM-DD'), '답변 내용 1', 1);

INSERT INTO tblVOC (voc_seq, type, service_type, subject, content, regdate, attach, visit_date, answer, user_seq)
VALUES (seqtblVOC.NEXTVAL, '건의', '서비스2', '건의사항 2', '건의 내용 2', DEFAULT, NULL, TO_DATE('2023-11-10', 'YYYY-MM-DD'), '답변 내용 2', 2);

INSERT INTO tblVOC (voc_seq, type, service_type, subject, content, regdate, attach, visit_date, answer, user_seq)
VALUES (seqtblVOC.NEXTVAL, '불편', '서비스3', '불편사항 3', '불편한 사항 내용 3', DEFAULT, 'attach3.jpg', TO_DATE('2023-11-20', 'YYYY-MM-DD'), '답변 내용 3', 3);

/* 이용문의 */
INSERT INTO tblInquiry (inquiry_seq, type, subject, content, regdate, attach, answer, user_seq)
VALUES (seqtblInquiry.NEXTVAL, '문의유형1', '문의 제목 1', '문의 내용 1', DEFAULT,'attach1.pdf', '답변 내용 1', 1);

INSERT INTO tblInquiry (inquiry_seq, type, subject, content, regdate, attach, answer, user_seq)
VALUES (seqtblInquiry.NEXTVAL, '문의유형2', '문의 제목 2', '문의 내용 2', DEFAULT, NULL, '답변 내용 2', 2);

INSERT INTO tblInquiry (inquiry_seq, type, subject, content, regdate, attach, answer, user_seq)
VALUES (seqtblInquiry.NEXTVAL, '문의유형3', '문의 제목 3', '문의 내용 3', DEFAULT, 'attach3.doc', '답변 내용 3', 3);

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
INSERT INTO tblBenefit (benefit_seq, name, type, start_date, end_date, discount_rate, img)
VALUES (seqtblBenefit.NEXTVAL, '할인 혜택 1', '할인', TO_DATE('2022-11-15', 'YYYY-MM-DD'), TO_DATE('2025-11-15', 'YYYY-MM-DD'), 10, 'benefit1.png');

INSERT INTO tblBenefit (benefit_seq, name, type, start_date, end_date, discount_rate, img)
VALUES (seqtblBenefit.NEXTVAL, '무료 혜택 2', '무료', TO_DATE('2022-11-30', 'YYYY-MM-DD'), TO_DATE('2024-11-30', 'YYYY-MM-DD'), 100, 'benefit2.png');

INSERT INTO tblBenefit (benefit_seq, name, type, start_date, end_date, discount_rate, img)
VALUES (seqtblBenefit.NEXTVAL, '할인 혜택 3', '할인', TO_DATE('2022-12-10', 'YYYY-MM-DD'), TO_DATE('2023-12-10', 'YYYY-MM-DD'), 15, 'benefit3.png');

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