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
.item {
	cursor: pointer;
}

.item:hover {
	background-color: #e0e0e0;
}
</style>
</head>
<body>
	<!-- recommend.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top: 123px;">
			<h2>추천</h2>
			<br>
			<p>나에게 딱 맞는 어트랙션을 찾아보세요!</p>
		</div>

		<!-- 관리자 -->
		<c:if test="${lv == 2}">
			<div id="admin-btn">
				<button type="button" id="add-btn" onclick="location.href='/ddstudio/test/courseadd.do'">
					<i class="fa-solid fa-plus"></i>코스 추가
				</button>
				<button type="button" id="add-btn" onclick="location.href='/ddstudio/test/course.do'">
					<i class="fa-solid fa-trash"></i>코스 삭제
				</button>
			</div>
		</c:if>

		<div id="content">
		
			<div class="munti-content-container">
				<!-- <div class="item" onclick="location.href='/ddstudio/test/preferencetest.do'">
					<div style="background-image: url('/ddstudio/asset/image/chromi.png');"></div>
					<div>취향 테스트</div>
				</div> -->
				<div class="item" onclick="location.href='/ddstudio/test/worldcup.do'">
					<div style="background-image: url('/ddstudio/asset/image/chromi.png');"></div>
					<div>DD 월드컵</div>
				</div>
				<div class="item" onclick="location.href='/ddstudio/test/mbti.do'">
					<div style="background-image: url('/ddstudio/asset/image/chromi.png');"></div>
					<div>MBTI별 추천</div>
				</div>
			</div>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


