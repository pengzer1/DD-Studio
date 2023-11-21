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
}

#item2:hover {
    transform: rotate(10deg) scale(0.9) translateX(10px) translateY(5px);
}

#item1:hover, #item2:hover {
    opacity: 0.25;
}

#item3 {
	cursor: default;
}

.item:hover .img-container i {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(4);
    opacity: 1;
    color: white;
    transition: opacity 0.3s ease;
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
</style>
</head>
<body>
	<%-- /test/worldcup/course/detail.jsp --%>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<div id="title" title="작가 senivpetro 출처 Freepik">
			<div id="overlay-div"></div>
			<h2>코스 월드컵</h2>
		</div>

		<div id="result-info"></div>
		<div id="worldcup-container" class="button-container">
			<!-- 코스를 출력 -->

			<c:forEach var="course" items="${selectedTwoCourses}"
				varStatus="loop">
				<div class="item" id="item${loop.index + 1}"
					onclick="selectCourse('${course.course_seq}')">
					<div class="img-container"
						style="background-image: url('/ddstudio/asset/image/course/${course.img}');"></div>
					<h3>${course.name}</h3>
				</div>
			</c:forEach>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
		let selectedTwoCourses;

		$(document).ready(function() {
			// 페이지가 로드될 때 세션 초기화
			initializeSession();
		});

		function initializeSession() {
			$.ajax({
				type : 'POST',
				url : '/ddstudio/test/worldcup/course/detail.do',
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

		function selectCourse(courseSeq) {
			$.ajax({
				type : 'POST',
				url : '/ddstudio/test/worldcup/course/detail.do',
				data : {
					'courseSeq' : courseSeq
				},
				success : function(data) {
					// console.log('선택한 코스 정보:', data.selectedTwoCourses);
					// console.log('남은 코스:', data.remainingcourseSeqs);

					// 전역 변수에 할당
					selectedTwoCourses = data.selectedTwoCourses;

					// 코스 정보에 따라 화면 갱신
					if (selectedTwoCourses.length > 1) {
						refreshScreen();
					} else {
						resultScreen(selectedTwoCourses[0]);
					}
				},
				error : function(a, b, c) {
					console.error(a, b, c);
				}
			});
		}

		function refreshScreen() {
			//console.log('refreshScreen 함수 호출');

			// 모든 코스를 화면에 갱신
			$('#worldcup-container').empty();

			if (selectedTwoCourses.length == 2) {
				for (let i = 0; i < selectedTwoCourses.length; i++) {
					const course = selectedTwoCourses[i];
					const imgUrl = course.img ? '/ddstudio/asset/image/course/'
							+ course.img : 'course.png';
	
					// 동적으로 id 생성
					const itemId = 'item' + (i + 1);
	
					const item = $(
							'<div class="item" id="' + itemId
									+ '" onclick="selectCourse('
									+ course.course_seq + ')">').append(
							'<div class="img-container" style="background-image: url(\''
									+ imgUrl + '\');"></div>').append(
							'<h3>' + course.name + '</h3>');
					$('#worldcup-container').append(item);
				}
			} else {
				const course = selectedTwoCourses0;
				const imgUrl = course.img ? '/ddstudio/asset/image/course/'
						+ course.img : 'course.png';

				// 동적으로 id 생성
				const itemId = 'item' + (i + 1);

				const item = $(
						'<div class="item" id="' + itemId
								+ '" onclick="selectCourse('
								+ course.course_seq + ')">').append(
						'<div class="img-container" style="background-image: url(\''
								+ imgUrl + '\');"></div>').append(
						'<h3>' + course.name + '</h3>');
				$('#worldcup-container').append(item);
			}
		}

		function resultScreen(selectedcourse) {
		    // 코스를 화면에 갱신
		    $('#worldcup-container').empty();

		    const resultContainer = $('<div class="item result-container" id="item3" style="cursor: default;">');
		    const imgContainer = $('<div class="img-container" style="background-image: url(\'/ddstudio/asset/image/course/' + selectedcourse.img + '\');"></div>');
		    const infoname = $('<h3>' + selectedcourse.name + '</h3>');
		    const message = $('<p id="result-message">최고의 코스에요!<br>[' + selectedcourse.name + ']</p>' + '<p id="attinfo">이 코스가 마음에 드셨군요!</p>');

		    // 메시지
		    $('#result-info').append(message);

		    // 최종 선택 코스
		    resultContainer.append(imgContainer).append(infoname);

		    // 클릭 이벤트 처리
		    /* resultContainer.click(function() {
		        // 코스 상세 페이지로 이동
		        window.location.href = '/ddstudio/activity/coursedetail.do?seq=' + selectedcourse.course_seq;
		    }); */

		    // #worldcup-container에 추가
		    $('#worldcup-container').append(resultContainer);
		}

		// 이미지 중앙에 우는 아이콘 추가
		$('#worldcup-container').on('mouseenter', '#item1', function () {
		    // 호버 시작
		    const sadFaceIcon = $('<i class="fa-regular fa-face-sad-cry"></i>');
		    $(this).find('.img-container').append(sadFaceIcon);
		});
		
		$('#worldcup-container').on('mouseenter', '#item2', function () {
		    // 호버 시작
		    const sadFaceIcon = $('<i class="fa-regular fa-face-sad-cry"></i>');
		    $(this).find('.img-container').append(sadFaceIcon);
		});

		$('#worldcup-container').on('mouseleave', '#item1', function () {
		    // 호버 종료
		    $(this).find('.img-container .fa-face-sad-cry').remove();
		});

		$('#worldcup-container').on('mouseleave', '#item2', function () {
		    // 호버 종료
		    $(this).find('.img-container .fa-face-sad-cry').remove();
		});
	</script>
</body>
</html>
