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
    margin-top: 13px;
    font-size: 18px;
    justify-content: center;
}

.hashtag {
    width: 100px;
    height: 40px;
    margin-right: 10px;
    cursor: pointer;
}

.hashtag:not(:last-child) {
    margin-right: 0;
}

#result-container {
	text-align: left;
	margin-top: 20px;
}

.result-title {
    font-size: 30px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

.result-title + .result-title {
    margin-top: 30px;
}

.result-content {
    font-size: 18px;
    color: #555;
    margin-bottom: 30px;
    padding-bottom: 10px;
    border-bottom: 1px solid #EEE;
}

.result-content:last-child {
    border-bottom: none;
}

#result-container > p {
	text-align: center
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
			</div>
		</div>
	</main>
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	
	<script>
		// 페이지 로드 시 해시태그를 랜덤으로 추가
	    function addRandomHashtags(hashtagList) {
	        $('#hashtag-container').empty();
	
	        // 랜덤으로 3개의 해시태그 선택
	        var randomHashtags = getRandomElements(hashtagList, 3);
	
	        // 해시태그를 동적으로 추가
	        $.each(randomHashtags, function (index, hashtag) {
	            var hashtagElement = '<div class="hashtag">#' + hashtag + '</div>';
	            $('#hashtag-container').append(hashtagElement);
	        });
	    }
	
	    // 배열에서 랜덤으로 요소를 선택
	    function getRandomElements(array, numElements) {
	        var shuffledArray = array.slice(); // 복제본을 만들어 셔플링
	        
	        for (var i = shuffledArray.length - 1; i > 0; i--) {
	            var j = Math.floor(Math.random() * (i + 1));
	            // 배열 요소 교환
	            [shuffledArray[i], shuffledArray[j]] = [shuffledArray[j], shuffledArray[i]];
	        }
	        
	        // 처음부터 numElements만큼의 요소 반환
	        return shuffledArray.slice(0, numElements);
	    }
	
	    // 페이지 로드 시 실행
	    $(document).ready(function () {
	        $.ajax({
	            type: 'GET',
	            url: '/ddstudio/user/searchhashtag.do',
	            success: function (data) {
	                // console.log('Hashtag data:', data);
	
	                // 해시태그 추가
	                addRandomHashtags(data);
	            },
	            error: function (a, b, c) {
	                console.error(a, b, c);
	            }
	        });
	    });
	    
	 	// 해시태그 클릭 이벤트 추가
	    $(document).on('click', '#hashtag-container .hashtag', function () {
	        // 클릭된 해시태그의 클래스를 토글
	        $(this).toggleClass('hashtag-clicked');

	        // 클릭된 해시태그가 있으면 검색어 필드에 해당 해시태그 값을 넣고 검색 실행
	        if ($('#hashtag-container .hashtag-clicked').length > 0) {
	            var clickedHashtags = $('#hashtag-container .hashtag-clicked').map(function () {
	                return $(this).text().substring(1); // '#' 제외한 부분만 추출
	            }).get();

	            // 검색어 필드에 클릭된 해시태그 값을 넣음
	            $('#search-field').val(clickedHashtags.join(' '));

	            // 검색 실행
	            $('#search-form').submit();
	        }
	    });

	    // 검색 실행
	    $('#search-form').submit(function(e) {
	        e.preventDefault();
	
	        // 검색어
	        var searchTerm = $('#search-field').val().toLowerCase();
	
		    // 해시태그를 클릭한 경우
	        if ($('#hashtag-container .hashtag').hasClass('hashtag-clicked')) {
	            console.log("해시태그 클릭")
	            
	            $('#hashtag-container .hashtag-clicked').removeClass('hashtag-clicked');
	        } else {
	            console.log("해시태그 안 클릭")
	            
	            $('#hashtag-container .hashtag-clicked').removeClass('hashtag-clicked');
	        }
		     
	        $.ajax({
	            type: 'POST',
	            url: '/ddstudio/user/search.do',
	            data: $('#search-form').serialize(),
	            success: function(data) {
	                // console.log('data:', data);
	                var searchResults = data;
	
	                // 검색 결과를 담을 객체 초기화
	                var resultLists = {};
	
	                // 검색 결과 태그 초기화
	                $('#result-container').empty();
	
	                // 검색 결과 처리 함수
	                var processResults = function (title, list) {
	                    if (list.length > 0) {
	                        $('#result-container').append('<div class="result-title">' + title + '</div>');
	                        var content = '<div class="result-content">';
	                        $.each(list, function (index, item) {
	                            content += item + ', ';
	                        });
	                        content = content.slice(0, -2);
	                        content += '</div>';
	                        $('#result-container').append(content);
	                    }
	                };
	
	                // 검색 결과 반복 처리
	                $.each(searchResults, function(index, result) {
	                    var containsSearchTerm = function(attribute) {
	                        return attribute.toLowerCase().indexOf(searchTerm) !== -1;
	                    };
	
	                    // 각 속성에 대한 처리
	                    $.each(result, function (key, value) {
	                        if (containsSearchTerm(value) && value.trim() !== " ") {
	                            // 결과 배열이 없으면 초기화
	                            if (!resultLists[key]) {
	                                resultLists[key] = [];
	                            }
	                            
	                            // 중복 체크 후 추가
	                            if (!resultLists[key].includes(value)) {
	                                resultLists[key].push(value);
	                            }
	                        }
	                    });
	                });
	
	                // 결과 출력을 위한 한글 설명 매핑
	                var titleMapping = {
	                    attractionName: '어트랙션명',
	                    mbtiResult: 'MBTI 결과',
	                    mbtiMbti: 'MBTI',
	                    courseName: '코스명',
	                    hashtagName: '해시태그',
	                    restaurantName: '식당명',
	                    restaurantMenu: '식당 메뉴',
	                    categoryName: '카테고리명',
	                    shopName: '가게명',
	                    shopInfo: '가게 정보',
	                    itemName: '아이템명',
	                    itemInfo: '아이템 정보',
	                    convenientName: '편의시설명',
	                    festivalName: '축제명',
	                    festivalInfo: '축제 정보',
	                    theaterName: '극장명',
	                    movieName: '영화명',
	                    noticeSubject: '공지 제목',
	                    noticeContent: '공지 내용',
	                    benefitName: '혜택명',
	                    benefitType: '혜택 유형',
	                    faqCategory: 'FAQ 카테고리',
	                    faqQuestion: 'FAQ 질문'
	                };
	
	                // 결과 출력
	                $.each(resultLists, function (key, list) {
	                    processResults(titleMapping[key] || key, list);
	                });
	
	                // 검색 결과가 없는 경우 메시지 출력
	                if ($.isEmptyObject(resultLists)) {
	                    $('#result-container').append('<p>검색 결과가 없습니다.</p>');
	                }
	            },
	            error: function(a, b, c) {
	                console.error(a, b, c);
	            }
	        });
	    });
	</script>

</body>
</html>