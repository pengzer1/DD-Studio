<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/ddstudio/asset/css/main.css">
<style>
.wide-content-container {
    width: 1000px;
    border: 0;
    align-items: center;
    justify-content: center;
    text-align: center;
    margin: auto;
}

.sub-title {
	font-weight: 800;
    font-size: 24px;
    margin-top: 30px;
}

#content .wide-content-container {
    margin-top: -140px;
}

.wide-item>div {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	border: 0 !important;
}

.wide-item img {
	width: 90%;
	height: auto;
	border-radius: 8px;
	margin-bottom: 10px;
}

#title {
	margin-top: 123px;
}

.wide-item>div:nth-child(1) {
	margin-top: 250px;
}

.wide-item>div:nth-child(2) {
    justify-content: end;
    margin-top: 10px;
    height: 150px;
    font-weight: 800;
    font-size: 19px;
}

.wide-item img {
	height: 270px;
}

#title {
	margin-top: 123px;
	background-image: url('/ddstudio/asset/image/background-7.jpg');
}

#overlay-div {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 400px;
	background-color: black;
	opacity: 0.45; /* 투명도 조절 */
	z-index: 1; /* 다른 요소들보다 위에 위치하도록 설정 */
}

#title h2 {
	color: #EEE;
	z-index: 2;
}

#title p {
	z-index: 2;
}
</style>
</head>
<body>
	<!-- /mbti/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" title="작가 senivpetro 출처 Freepik">
		<div id="overlay-div"></div>
			<h2 id="mbtiTitle">ISTJ</h2>
			<br>
			<p>MBTI별 추천 결과</p>
		</div>
		
		<div class="sub-title">
			<p id="result">유형</p>
		</div>

		<div id="content">

			<div class="wide-content-container">
				<div class="wide-item">
					<div id="attraction-img">놀이기구 사진</div>
					<div id="attraction-name">놀이기구 이름</div>
				</div>
				<div class="wide-item">
					<div id="course-img">코스 사진</div>
					<div id="course-name">코스 이름</div>
				</div>
			</div>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		function loadMBTIDetail() {
			var mbti = getParameterByName('mbti'); // mbti 매개변수 가져오기
			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					// 서버 응답 처리 함수 호출
					handleMBTIDetailResponse(xhr.responseText);
				}
			};

			// 요청을 POST로 변경하고 MBTI 매개변수를 요청 본문에 포함
			xhr.open("POST", "/ddstudio/test/mbtidetail.do", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			var params = "mbti=" + encodeURIComponent(mbti);
			xhr.send(params);
		}

		// AJAX POST 응답을 처리하는 함수
		function handleMBTIDetailResponse(responseText) {
			var data = JSON.parse(responseText);

			// 어트랙션 업데이트
			var result = document.getElementById('result');
			if (result) {
				result.innerText = data.result;
			}
			
			// 어트랙션 업데이트
			var attractionImg = document.getElementById('attraction-img');
			if (attractionImg) {
				attractionImg.innerHTML = '<img src="/ddstudio/asset/image/attraction/' + data.attraction_img + '" alt="' + data.attraction_name + '">';
			}

			var attractionName = document.getElementById('attraction-name');
			if (attractionName) {
				attractionName.innerText = data.attraction_name;
			}

			// 코스 업데이트
			var courseImg = document.getElementById('course-img');
			if (courseImg) {
				courseImg.innerHTML = '<img src="/ddstudio/asset/image/course/' + data.course_img + '" alt="' + data.course_name + '">';
			}

			var courseName = document.getElementById('course-name');
			if (courseName) {
				courseName.innerText = data.course_name;
			}
		}

		// URL에서 매개변수 추출 함수
		function getParameterByName(name, url) {
			if (!url)
				url = window.location.href;
			name = name.replace(/[\[\]]/g, "\\$&");
			var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex
					.exec(url);
			if (!results)
				return null;
			if (!results[2])
				return '';
			return decodeURIComponent(results[2].replace(/\+/g, " "));
		}

		// 페이지 로드 시 호출
		window.onload = loadMBTIDetail;

		// URL에서 mbti 매개변수 가져오기
		var mbti = getParameterByName('mbti');

		// 가져온 매개변수를 h2에 동적으로 설정
		var mbtiTitleElement = document.getElementById('mbtiTitle');
		if (mbtiTitleElement && mbti) {
			mbtiTitleElement.innerText = mbti;
		}
	</script>
</body>
</html>
