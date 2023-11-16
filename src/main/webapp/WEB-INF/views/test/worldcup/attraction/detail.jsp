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
.button-container {
	display: flex;
}

body {
	overflow-x: hidden;
}

.item {
	width: 50%;
	height: 600px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: transparent;
	border-radius: 8px;
	margin: 10px;
	padding: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: all 0.35s ease;
	transform-origin: center bottom;
	cursor: pointer;
	font-size: 40px;
	font-weight: 600;
	color: #333;
	position: relative;
	overflow: hidden;
}

.item>div:nth-child(1) {
	background-color: transparent;
}

.item div.img-container {
	width: 100%;
	height: 100%;
	background-size: cover;
	background-position: center;
}

#item1:hover {
	transform: rotate(-10deg) scale(0.9) translateX(-10px) translateY(5px);
	opacity: 0.25;
	filter: brightness(0.8);
}

#item2:hover {
	transform: rotate(10deg) scale(0.9) translateX(10px) translateY(5px);
	opacity: 0.25;
	filter: brightness(0.8);
}

#attinfo {
	font-size : 18px;
	text-align: center;
	color: #444;
	font-weight: bold;
	margin-bottom: 3px;
}

#result-message {
	margin-top: 40px;
	text-align: center;
	color: #3498db;
	font-weight: bold;
	font-size: 30px;
}

.item h3 {
	margin: 0;
	font-size: 18px;
	color: #333;
}

#title {
	margin-top: 123px;
}

#content {
	margin-top: 50px !important;
	padding: 0;
}

#worldcup-container {
	width: 100%;
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<%-- /test/worldcup/attraction/detail.jsp --%>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<div id="title">
			<h2>어트랙션 월드컵</h2>
		</div>

		<div id="result-info"></div>
		<div id="worldcup-container" class="button-container">
			<!-- 어트랙션을 출력 -->

			<c:forEach var="attraction" items="${selectedTwoAttractions}"
				varStatus="loop">
				<div class="item" id="item${loop.index + 1}"
					onclick="selectAttraction('${attraction.attraction_seq}')">
					<div class="img-container"
						style="background-image: url('/ddstudio/asset/image/attraction/${attraction.img}');"></div>
					<h3>${attraction.name}</h3>
				</div>
			</c:forEach>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
		let selectedTwoAttractions;

		$(document).ready(function() {
			// 페이지가 로드될 때 세션 초기화
			initializeSession();
		});

		function initializeSession() {
			$.ajax({
				type : 'POST',
				url : '/ddstudio/test/worldcup/attraction/detail.do',
				data : {
					'isNewSession' : true
				},
				success : function(data) {
					// console.log('세션 초기화', data);
				},
				error : function(a, b, c) {
					console.error(a, b, c);
				}
			});
		}

		function selectAttraction(attractionSeq) {
			$.ajax({
				type : 'POST',
				url : '/ddstudio/test/worldcup/attraction/detail.do',
				data : {
					'attractionSeq' : attractionSeq
				},
				success : function(data) {
					//console.log('선택한 어트랙션 정보:', data.selectedTwoAttractions);
					//console.log('남은 어트랙션:', data.remainingAttractionSeqs);

					// 전역 변수에 할당
					selectedTwoAttractions = data.selectedTwoAttractions;

					// 어트랙션 정보에 따라 화면 갱신
					if (selectedTwoAttractions.length > 1) {
						refreshScreen();
					} else {
						resultScreen(selectedTwoAttractions[0]);
					}
				},
				error : function(a, b, c) {
					console.error(a, b, c);
				}
			});
		}

		function refreshScreen() {
			//console.log('refreshScreen 함수 호출');

			// 모든 어트랙션을 화면에 갱신
			$('#worldcup-container').empty();

			for (let i = 0; i < selectedTwoAttractions.length; i++) {
				const attraction = selectedTwoAttractions[i];
				const imgUrl = attraction.img ? '/ddstudio/asset/image/attraction/'
						+ attraction.img : '쌍용열차.jpg';

				// 동적으로 id 생성
				const itemId = 'item' + (i + 1);

				const item = $(
						'<div class="item" id="' + itemId
								+ '" onclick="selectAttraction('
								+ attraction.attraction_seq + ')">').append(
						'<div class="img-container" style="background-image: url(\''
								+ imgUrl + '\');"></div>').append(
						'<h3>' + attraction.name + '</h3>');
				$('#worldcup-container').append(item);
			}
		}

		function resultScreen(selectedAttraction) {
		    // 어트랙션을 화면에 갱신
		    $('#worldcup-container').empty();

		    const resultContainer = $('<div class="item result-container" id="item3">');
		    const imgContainer = $('<div class="img-container" style="background-image: url(\'/ddstudio/asset/image/attraction/' + selectedAttraction.img + '\');"></div>');
		    const infoname = $('<h3>' + selectedAttraction.name + '</h3>');
		    const message = $('<p id="result-message">최고의 어트랙션이죠!<br>[' + selectedAttraction.name + ']</p>' + '<p id="attinfo">클릭시 해당 어트랙션 페이지로 이동합니다.</p>');

		    // 메시지
		    $('#result-info').append(message);

		    // 최종 선택 어트랙션
		    resultContainer.append(imgContainer).append(infoname);

		    // 클릭 이벤트 처리
		    resultContainer.click(function() {
		        // 어트랙션 상세 페이지로 이동
		        window.location.href = '/ddstudio/activity/attractiondetail.do?seq=' + selectedAttraction.attraction_seq;
		    });

		    // #worldcup-container에 추가
		    $('#worldcup-container').append(resultContainer);
		}

	</script>
</body>
</html>
