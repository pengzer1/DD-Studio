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
	flex-wrap: wrap;
}

.item {
	height: 100px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	color: white;
	background-color: #007bff;
	border-radius: 8px;
	margin: 10px;
	padding: 20px;
	border: 0px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease-in-out;
	cursor: pointer;
	font-size: 40px;
	font-weight: 600;
}

.item:hover {
	transform: scale(1.05);
	background-color: #0056b3;
}

.item h3 {
	margin: 0;
	font-size: 18px;
	color: #333;
}

#title {
	margin-top: 123px;
	background-image: url('/ddstudio/asset/image/background-7.jpg');
}

#content {
	margin-top: 50px !important;
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
	<!-- /mbti/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<div id="title" title="senivpetro 출처 Freepik">
		<div id="overlay-div"></div>
			<h2>MBTI별 추천</h2>
		</div>

		<!-- 관리자 -->
		<c:if test="${lv == 2}">
			<div id="admin-btn">
				<button type="button" id="add-btn"
					onclick="location.href='/ddstudio/test/mbtiadd.do'">
					<i class="fa-solid fa-plus"></i>추가
				</button>
				<button type="button" id="del-btn"
					onclick="location.href='/ddstudio/test/mbtidel.do'">
					<i class="fa-solid fa-trash"></i>삭제
				</button>
				<button type="button" id="edit-btn"
					onclick="location.href='/ddstudio/test/mbtiedit.do'">
					<i class="fa-solid fa-pen-to-square"></i>수정
				</button>
			</div>
		</c:if>

		<div id="content">

			<form id="mbtiForm" method="GET"
				action="/ddstudio/test/mbtidetail.do">
				<div class="button-container">
					<!--
					<div class="item" name="ISTJ" id="ISTJ"
						onclick="handleButtonClick('ISTJ')">ISTJ</div>
					<div class="item" name="ISFJ" id="ISFJ"
						onclick="handleButtonClick('ISFJ')">ISFJ</div>
					<div class="item" name="INFJ" id="INFJ"
						onclick="handleButtonClick('INFJ')">INFJ</div>
					<div class="item" name="INTJ" id="INTJ"
						onclick="handleButtonClick('INTJ')">INTJ</div>
					<div class="item" name="ISTP" id="ISTP"
						onclick="handleButtonClick('ISTP')">ISTP</div>
					<div class="item" name="ISFP" id="ISFP"
						onclick="handleButtonClick('ISFP')">ISFP</div>
					<div class="item" name="INFP" id="INFP"
						onclick="handleButtonClick('INFP')">INFP</div>
					<div class="item" name="INTP" id="INTP"
						onclick="handleButtonClick('INTP')">INTP</div>
					<div class="item" name="ESTP" id="ESTP"
						onclick="handleButtonClick('ESTP')">ESTP</div>
					<div class="item" name="ESFP" id="ESFP"
						onclick="handleButtonClick('ESFP')">ESFP</div>
					<div class="item" name="ENFP" id="ENFP"
						onclick="handleButtonClick('ENFP')">ENFP</div>
					<div class="item" name="ENTP" id="ENTP"
						onclick="handleButtonClick('ENTP')">ENTP</div>
					<div class="item" name="ESTJ" id="ESTJ"
						onclick="handleButtonClick('ESTJ')">ESTJ</div>
					<div class="item" name="ESFJ" id="ESFJ"
						onclick="handleButtonClick('ESFJ')">ESFJ</div>
					<div class="item" name="ENFJ" id="ENFJ"
						onclick="handleButtonClick('ENFJ')">ENFJ</div>
					<div class="item" name="ENTJ" id="ENTJ"
						onclick="handleButtonClick('ENTJ')">ENTJ</div>
					-->
				</div>
			</form>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		$(document).ready(function() {
			load();
		});

		function load() {
			$.ajax({
				type : 'GET',
				url : '/ddstudio/test/mbti/list.do',
				dataType : 'json',
				success : function(result) {
					var container = $('.button-container');
					container.empty();

					$(result).each(function(index, item) {
					    var div = $('<div>').addClass('item').attr({
					        'name' : item.mbti,
					        'id' : item.mbti,
					        'onclick' : 'handleButtonClick(\'' + item.mbti + '\')'
					    }).text(item.mbti);

					    // console.log(div);
					    container.append(div);
					});

					updateImage(result);
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}
		
		function handleButtonClick(mbti) {
		    console.log('Button clicked:', mbti);
		    var form = $('#mbtiForm');
		    form.find('input[name="mbti"]').remove(); //이전의 mbti 태그 삭제
		    
		    $('<input>').attr({
		        type: 'hidden',
		        name: 'mbti',
		        value: mbti
		    }).appendTo(form);

		    form.submit();
		}

	</script>
</body>
</html>