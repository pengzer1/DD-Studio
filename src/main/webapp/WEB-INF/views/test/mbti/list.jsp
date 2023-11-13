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

</style>
</head>
<body>
	<!-- /mbti/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>MBTI별 추천</h2>
		</div>

		<!-- 관리자 -->
		<c:if test="${lv == 2}">
			<div id="admin-btn">
				<button type="button" id="add-btn" onclick="location.href='/ddstudio/test/preferencetestadd.do'">
					<i class="fa-solid fa-plus"></i>추가
				</button>
				<button type="button" id="del-btn" onclick="location.href='/ddstudio/test/preferencetestdel.do?seq=${dto.attraction_seq}'">
					<i class="fa-solid fa-trash"></i>삭제
				</button>
				<button type="button" id="edit-btn" onclick="location.href='/ddstudio/test/preferencetestdel.do?seq=${dto.attraction_seq}'">
					<i class="fa-solid fa-pen-to-square"></i>수정
				</button>
			</div>
		</c:if>
		
		<div id="content">

			<div class="munti-content-container">
				<div class="item">
					<div style="background-image: url('/ddstudio/asset/image/chromi.png');"></div>
					<div>INFP</div>
				</div>
				<div class="item">
					<div style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<!-- 추가 아이템들 -->
			</div>
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


