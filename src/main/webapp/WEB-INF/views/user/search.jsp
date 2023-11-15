<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
.nav-icon {
	font-size: 50px !important;
}

#main {
	text-align: center;
	margin-top: 150px;
}

#search-container {
	width: 80%;
	text-align: center;
	border-top: 2px solid black;
	margin: 50px auto 0;
}

#search-form {
	margin-top: 50px;
}

#hashtag-container {
	display: flex;
	text-align: center;
	margin-top: 10px;
	justify-content: center;
}

#hashtag {
	width: 100px;
	height: 40px;
	margin-right: 5px;
}

#result-container {
	text-align: left;
	margin-top: 20px;
}

#result-title {
	font-size: 30px;
	border-bottom: 2px solid #CCC;
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.result-content {
	font-size: 20px;
	margin-bottom: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid #CCC;
}

#category {
	width: 100px;
	height: 40px;
	margin-right: 5px;
}

#search-field {
	height: 80px;
	width: 60%;
	padding: 30px;
	font-size: 20px;
	border-radius: 40px;
}

#search-button {
	background-color: transparent;
	border: none;
	outline: none;
}

#search-button span {
	font-size: 40px;
	position: relative;
	top: 13px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<main id="main">
		<h1>검색</h1>

		<div id="search-container">
			<form method="POST" action="/ddstudio/user/search.do"
				id="search-form">
				<input type="text" name="word" id="search-field" pattern=".{2,}"
					placeholder="두 글자 이상의 단어를 입력하세요." required>

				<button type="submit" id="search-button">
					<span class="material-symbols-outlined">search</span>
				</button>
			</form>

			<div id="hashtag-container">
				<div id="hashtag">#hashtag</div>
				<div id="hashtag">#hashtag</div>
				<div id="hashtag">#hashtag</div>
			</div>

			<div id="result-container">
				<div id="result-title">정보를 가져온 컬럼</div>
				<div class="result-content">컬럼 내용</div>
				<div class="result-content">컬럼 내용</div>
			</div>
		</div>
	</main>
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
        $('#search-form').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                url: '/ddstudio/user/search.do',
                data: $('#search-form').serialize(),
                success: function(data) {
                    console.log('data:', data);
                    var searchResults = data;

                    var attractionNameList = [];
                    var mbtiResultList = [];
                    var mbtiMbtiList = [];
                    var courseNameList = [];
                    var hashtagNameList = [];
                    var restaurantNameList = [];
                    var restaurantMenuList = [];
                    var categoryNameList = [];
                    var shopNameList = [];
                    var shopInfoList = [];
                    var itemNameList = [];
                    var itemInfoList = [];
                    var convenientNameList = [];
                    var festivalNameList = [];
                    var festivalInfoList = [];
                    var theaterNameList = [];
                    var movieNameList = [];
                    var noticeSubjectList = [];
                    var noticeContentList = [];
                    var benefitNameList = [];
                    var benefitTypeList = [];
                    var faqCategoryList = [];
                    var faqQuestionList = [];

                    var searchTerm = $('#search-field').val().toLowerCase();

                    $.each(searchResults, function(index, result) {
                        var containsSearchTerm = function(attribute) {
                            return attribute.toLowerCase().indexOf(searchTerm) !== -1;
                        };

                        if (containsSearchTerm(result.attractionName) && result.attractionName !== " ") {
                            attractionNameList.push(result.attractionName);
                        }
                        if (containsSearchTerm(result.mbtiResult) && result.mbtiResult !== " ") {
                            mbtiResultList.push(result.mbtiResult);
                        }
                        if (containsSearchTerm(result.mbtiMbti) && result.mbtiMbti !== " ") {
                            mbtiMbtiList.push(result.mbtiMbti);
                        }
                        if (containsSearchTerm(result.courseName) && result.courseName !== " ") {
                            courseNameList.push(result.courseName);
                        }
                        if (containsSearchTerm(result.hashtagName) && result.hashtagName !== " ") {
                            hashtagNameList.push(result.hashtagName);
                        }
                        if (containsSearchTerm(result.restaurantName) && result.restaurantName !== " ") {
                            restaurantNameList.push(result.restaurantName);
                        }
                        if (containsSearchTerm(result.restaurantMenu) && result.restaurantMenu !== " ") {
                            restaurantMenuList.push(result.restaurantMenu);
                        }
                        if (containsSearchTerm(result.categoryName) && result.categoryName !== " ") {
                            categoryNameList.push(result.categoryName);
                        }
                        if (containsSearchTerm(result.shopName) && result.shopName !== " ") {
                            shopNameList.push(result.shopName);
                        }
                        if (containsSearchTerm(result.shopInfo) && result.shopInfo !== " ") {
                            shopInfoList.push(result.shopInfo);
                        }
                        if (containsSearchTerm(result.itemName) && result.itemName !== " ") {
                            itemNameList.push(result.itemName);
                        }
                        if (containsSearchTerm(result.itemInfo) && result.itemInfo !== " ") {
                            itemInfoList.push(result.itemInfo);
                        }
                        if (containsSearchTerm(result.convenientName) && result.convenientName !== " ") {
                            convenientNameList.push(result.convenientName);
                        }
                        if (containsSearchTerm(result.festivalName) && result.festivalName !== " ") {
                            festivalNameList.push(result.festivalName);
                        }
                        if (containsSearchTerm(result.festivalInfo) && result.festivalInfo !== " ") {
                            festivalInfoList.push(result.festivalInfo);
                        }
                        if (containsSearchTerm(result.theaterName) && result.theaterName !== " ") {
                            theaterNameList.push(result.theaterName);
                        }
                        if (containsSearchTerm(result.movieName) && result.movieName !== " ") {
                            movieNameList.push(result.movieName);
                        }
                        if (containsSearchTerm(result.noticeSubject) && result.noticeSubject !== " ") {
                            noticeSubjectList.push(result.noticeSubject);
                        }
                        if (containsSearchTerm(result.noticeContent) && result.noticeContent !== " ") {
                            noticeContentList.push(result.noticeContent);
                        }
                        if (containsSearchTerm(result.benefitName) && result.benefitName !== " ") {
                            benefitNameList.push(result.benefitName);
                        }
                        if (containsSearchTerm(result.benefitType) && result.benefitType !== " ") {
                            benefitTypeList.push(result.benefitType);
                        }
                        if (containsSearchTerm(result.faqCategory) && result.faqCategory !== " ") {
                            faqCategoryList.push(result.faqCategory);
                        }
                        if (containsSearchTerm(result.faqQuestion) && result.faqQuestion !== " ") {
                            faqQuestionList.push(result.faqQuestion);
                        }
                    });

					// 검색 결과 초기화
                    $('#result-container').empty();

					// 검색 결과
                    if (attractionNameList.length > 0 ||
						mbtiResultList.length > 0 ||
						mbtiMbtiList.length > 0 ||
						courseNameList.length > 0 ||
						hashtagNameList.length > 0 ||
						restaurantNameList.length > 0 ||
						restaurantMenuList.length > 0 ||
						categoryNameList.length > 0 ||
						shopNameList.length > 0 ||
						shopInfoList.length > 0 ||
						itemNameList.length > 0 ||
						itemInfoList.length > 0 ||
						convenientNameList.length > 0 ||
						festivalNameList.length > 0 ||
						festivalInfoList.length > 0 ||
						theaterNameList.length > 0 ||
						movieNameList.length > 0 ||
						noticeSubjectList.length > 0 ||
						noticeContentList.length > 0 ||
						benefitNameList.length > 0 ||
						benefitTypeList.length > 0 ||
						faqCategoryList.length > 0 ||
						faqQuestionList.length > 0) {
                    	
                        $('#result-container').append('<div id="result-title">검색 결과</div>');

                        // attractionNameList
                        if (attractionNameList.length > 0) {
                            var attractionContent = '<div class="result-content">어트랙션명: ';
                            $.each(attractionNameList, function(index, name) {
                                attractionContent += name + ', ';
                            });
                            attractionContent = attractionContent.slice(0, -2);
                            attractionContent += '</div>';
                            $('#result-container').append(attractionContent);
                        }
                        
                        // festivalInfoList
                        if (festivalInfoList.length > 0) {
                            var festivalContent = '<div class="result-content">축제정보: ';
                            $.each(festivalInfoList, function(index, festival) {
                                festivalContent += festival + ', ';
                            });
                            festivalContent = festivalContent.slice(0, -2);
                            festivalContent += '</div>';
                            $('#result-container').append(festivalContent);
                        }
                        // courseNameList
                        if (courseNameList.length > 0) {
                            var courseNameContent = '<div class="result-content">코스명: ';
                            $.each(courseNameList, function(index, courseName) {
                                courseNameContent += courseName + ', ';
                            });
                            courseNameContent = courseNameContent.slice(0, -2);
                            courseNameContent += '</div>';
                            $('#result-container').append(courseNameContent);
                        }

                        // hashtagNameList
                        if (hashtagNameList.length > 0) {
                            var hashtagNameContent = '<div class="result-content">해시태그: ';
                            $.each(hashtagNameList, function(index, hashtagName) {
                                hashtagNameContent += hashtagName + ', ';
                            });
                            hashtagNameContent = hashtagNameContent.slice(0, -2);
                            hashtagNameContent += '</div>';
                            $('#result-container').append(hashtagNameContent);
                        }

                        // restaurantNameList
                        if (restaurantNameList.length > 0) {
                            var restaurantNameContent = '<div class="result-content">식당명: ';
                            $.each(restaurantNameList, function(index, restaurantName) {
                                restaurantNameContent += restaurantName + ', ';
                            });
                            restaurantNameContent = restaurantNameContent.slice(0, -2);
                            restaurantNameContent += '</div>';
                            $('#result-container').append(restaurantNameContent);
                        }

                        // restaurantMenuList
                        if (restaurantMenuList.length > 0) {
                            var restaurantMenuContent = '<div class="result-content">식당 메뉴: ';
                            $.each(restaurantMenuList, function(index, restaurantMenu) {
                                restaurantMenuContent += restaurantMenu + ', ';
                            });
                            restaurantMenuContent = restaurantMenuContent.slice(0, -2);
                            restaurantMenuContent += '</div>';
                            $('#result-container').append(restaurantMenuContent);
                        }

                        // categoryNameList
                        if (categoryNameList.length > 0) {
                            var categoryNameContent = '<div class="result-content">카테고리명: ';
                            $.each(categoryNameList, function(index, categoryName) {
                                categoryNameContent += categoryName + ', ';
                            });
                            categoryNameContent = categoryNameContent.slice(0, -2);
                            categoryNameContent += '</div>';
                            $('#result-container').append(categoryNameContent);
                        }

                        // shopNameList
                        if (shopNameList.length > 0) {
                            var shopNameContent = '<div class="result-content">가게명: ';
                            $.each(shopNameList, function(index, shopName) {
                                shopNameContent += shopName + ', ';
                            });
                            shopNameContent = shopNameContent.slice(0, -2);
                            shopNameContent += '</div>';
                            $('#result-container').append(shopNameContent);
                        }

                        // shopInfoList
                        if (shopInfoList.length > 0) {
                            var shopInfoContent = '<div class="result-content">가게 정보: ';
                            $.each(shopInfoList, function(index, shopInfo) {
                                shopInfoContent += shopInfo + ', ';
                            });
                            shopInfoContent = shopInfoContent.slice(0, -2);
                            shopInfoContent += '</div>';
                            $('#result-container').append(shopInfoContent);
                        }

                        // itemNameList
                        if (itemNameList.length > 0) {
                            var itemNameContent = '<div class="result-content">아이템명: ';
                            $.each(itemNameList, function(index, itemName) {
                                itemNameContent += itemName + ', ';
                            });
                            itemNameContent = itemNameContent.slice(0, -2);
                            itemNameContent += '</div>';
                            $('#result-container').append(itemNameContent);
                        }

                        // itemInfoList
                        if (itemInfoList.length > 0) {
                            var itemInfoContent = '<div class="result-content">아이템 정보: ';
                            $.each(itemInfoList, function(index, itemInfo) {
                                itemInfoContent += itemInfo + ', ';
                            });
                            itemInfoContent = itemInfoContent.slice(0, -2);
                            itemInfoContent += '</div>';
                            $('#result-container').append(itemInfoContent);
                        }

                        // convenientNameList
                        if (convenientNameList.length > 0) {
                            var convenientNameContent = '<div class="result-content">편의시설명: ';
                            $.each(convenientNameList, function(index, convenientName) {
                                convenientNameContent += convenientName + ', ';
                            });
                            convenientNameContent = convenientNameContent.slice(0, -2);
                            convenientNameContent += '</div>';
                            $('#result-container').append(convenientNameContent);
                        }

                        // festivalNameList
                        if (festivalNameList.length > 0) {
                            var festivalNameContent = '<div class="result-content">축제명: ';
                            $.each(festivalNameList, function(index, festivalName) {
                                festivalNameContent += festivalName + ', ';
                            });
                            festivalNameContent = festivalNameContent.slice(0, -2);
                            festivalNameContent += '</div>';
                            $('#result-container').append(festivalNameContent);
                        }

                        // festivalInfoList
                        if (festivalInfoList.length > 0) {
                            var festivalInfoContent = '<div class="result-content">축제 정보: ';
                            $.each(festivalInfoList, function(index, festivalInfo) {
                                festivalInfoContent += festivalInfo + ', ';
                            });
                            festivalInfoContent = festivalInfoContent.slice(0, -2);
                            festivalInfoContent += '</div>';
                            $('#result-container').append(festivalInfoContent);
                        }

                        // theaterNameList
                        if (theaterNameList.length > 0) {
                            var theaterNameContent = '<div class="result-content">극장명: ';
                            $.each(theaterNameList, function(index, theaterName) {
                                theaterNameContent += theaterName + ', ';
                            });
                            theaterNameContent = theaterNameContent.slice(0, -2);
                            theaterNameContent += '</div>';
                            $('#result-container').append(theaterNameContent);
                        }

                        // movieNameList
                        if (movieNameList.length > 0) {
                            var movieNameContent = '<div class="result-content">영화명: ';
                            $.each(movieNameList, function(index, movieName) {
                                movieNameContent += movieName + ', ';
                            });
                            movieNameContent = movieNameContent.slice(0, -2);
                            movieNameContent += '</div>';
                            $('#result-container').append(movieNameContent);
                        }

                        // noticeSubjectList
                        if (noticeSubjectList.length > 0) {
                            var noticeSubjectContent = '<div class="result-content">공지 제목: ';
                            $.each(noticeSubjectList, function(index, noticeSubject) {
                                noticeSubjectContent += noticeSubject + ', ';
                            });
                            noticeSubjectContent = noticeSubjectContent.slice(0, -2);
                            noticeSubjectContent += '</div>';
                            $('#result-container').append(noticeSubjectContent);
                        }

                        // noticeContentList
                        if (noticeContentList.length > 0) {
                            var noticeContentContent = '<div class="result-content">공지 내용: ';
                            $.each(noticeContentList, function(index, noticeContent) {
                                noticeContentContent += noticeContent + ', ';
                            });
                            noticeContentContent = noticeContentContent.slice(0, -2);
                            noticeContentContent += '</div>';
                            $('#result-container').append(noticeContentContent);
                        }

                        // benefitNameList
                        if (benefitNameList.length > 0) {
                            var benefitNameContent = '<div class="result-content">혜택명: ';
                            $.each(benefitNameList, function(index, benefitName) {
                                benefitNameContent += benefitName + ', ';
                            });
                            benefitNameContent = benefitNameContent.slice(0, -2);
                            benefitNameContent += '</div>';
                            $('#result-container').append(benefitNameContent);
                        }

                        // benefitTypeList
                        if (benefitTypeList.length > 0) {
                            var benefitTypeContent = '<div class="result-content">혜택 유형: ';
                            $.each(benefitTypeList, function(index, benefitType) {
                                benefitTypeContent += benefitType + ', ';
                            });
                            benefitTypeContent = benefitTypeContent.slice(0, -2);
                            benefitTypeContent += '</div>';
                            $('#result-container').append(benefitTypeContent);
                        }

                        // faqCategoryList
                        if (faqCategoryList.length > 0) {
                            var faqCategoryContent = '<div class="result-content">FAQ 카테고리: ';
                            $.each(faqCategoryList, function(index, faqCategory) {
                                faqCategoryContent += faqCategory + ', ';
                            });
                            faqCategoryContent = faqCategoryContent.slice(0, -2);
                            faqCategoryContent += '</div>';
                            $('#result-container').append(faqCategoryContent);
                        }

                        // faqQuestionList
                        if (faqQuestionList.length > 0) {
                            var faqQuestionContent = '<div class="result-content">FAQ 질문: ';
                            $.each(faqQuestionList, function(index, faqQuestion) {
                                faqQuestionContent += faqQuestion + ', ';
                            });
                            faqQuestionContent = faqQuestionContent.slice(0, -2);
                            faqQuestionContent += '</div>';
                            $('#result-container').append(faqQuestionContent);
                        }
                    } else {
                        $('#result-container').append('<p>검색 결과가 없습니다.</p>');
                    }

                    console.log('Success');
                },
                error: function(a, b, c) {
                    console.error(a, b, c);
                }
            });
        });
	</script>

</body>
</html>