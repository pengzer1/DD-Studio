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
	<!-- /activity/festival/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>페스티벌</h2>
			<br>
			<p>더블디 스튜디오의 지브리와 함께하는 다양한 페스티벌을 경험해보세요!</p>
		</div>

		<div id="content">
			<div id="condition">
			
				<!-- 조건 검색 (click 전) -->
				<div id="default-searchbar">
					<h3><i class="fa-solid fa-magnifying-glass"></i>조건검색(테마/운휴일정/위치정보)</h3>
				</div>
			
				<!-- 조건 검색 (click 후) -->
				<div id="hidden-searchbar">
					<h4><i class="fa-solid fa-magnifying-glass"></i>조건검색</h4>
					<div>
						<div>테마</div>
						<select name="theme" id="theme-select" class="selectbox">
							<c:forEach items="${themeList}" var="dto">
							<option value="${dto.name}">${dto.name}</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<div>위치정보</div>
						<select name="location" id="location-select" class="selectbox">
							<c:forEach items="${locationList}" var="dto">
							<option value="${dto.info}">${dto.info}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			
			</div>
			
			<!-- 관리자용 추가 버튼 -->
			<c:if test="${not empty email && lv == 2}">
				<div id="admin-btn">
					<button type="button" id="add-btn" onclick="location.href='/ddstudio/activity/festivaladd.do'"><i class="fa-solid fa-plus"></i>등록</button>
				</div>
			</c:if>

			<div class="munti-content-container">
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div
						style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
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
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


