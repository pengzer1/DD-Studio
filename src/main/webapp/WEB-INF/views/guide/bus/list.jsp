<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
#notice {
	text-align: center;
	margin-top: 150px;
}

#search-form {
	margin-top: 50px;
}

#category {
	width: 100px;
	height: 40px;
	margin-right: 5px;
}

#search-field {
	height: 40px;
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

#notice-list {
	width: 80%;
	text-align: center;
	border-top: 2px solid black;
	margin: 50px auto 0;
}

#notice-list th, #notice-list td {
	height: 60px;
	color: #444;
	padding: 10px;
	border-bottom: 1px solid #E1E1E1;
}

#notice-list th {
	font-size: 1.02rem;
	font-weight: bold;
}

#notice-list td:nth-child(2) a {
	color: #333;
	font-weight: bold;
}

#notice-list th:nth-child(1) {
	width: 20%;
}

#notice-list th:nth-child(2) {
	width: 60%;
}

#notice-list th:nth-child(3) {
	width: 20%;
}

#notice-list td:nth-child(2) {
	font-size: 1.1rem;
}

#fixed {
	background-color: #EDFFFC;
}

#fix-icon {
	color: #F00;
}

#page-bar {
	display: flex;
	font-size: 1.2rem;
	justify-content: center;
	margin-top: 50px;
}

#previous-button, #current-page, #other-pages, #next-button {
	color: #000;
	margin: 0 10px;
}

#previous-button, #next-button {
	display: block;
	margin-top: 1.5px;
}

#current-page {
	color: red;
}

#button-list {
	display: flex;
	justify-content: flex-end;
}

#add-button {
	width: 100px;
	height: 33px;
	background-color: #FBF2F3;
	border: 2px solid #F49097;
	border-radius: 15px;
	margin-top: 10px;
	margin-right: 150px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/header.jsp"%>

	<main id="main">

		<div id="title" style="margin-top: 123px;">
			<h2>제목</h2>
			<br>
			<p>내용을 입력하세요</p>
		</div>

		<div id="sub-title">
			<h3>제목</h3>
		</div>

		<div id="page-bar">${pageBar}</div>

		<c:if test="${not empty email && lv == 2}">
			<div id="button-list">
				<button type="button" id="add-button"
					onclick="location.href='/ddstudio/communicate/noticeadd.do';">등록</button>
			</div>
		</c:if>

		<c:if test="${not empty email && lv == 2}">

			<div class="container">
				<div id="btn3" class="btn">
					<button type="button" class="add"
						onclick="location.href='/ddstudio/guide/busadd.do';">추가</button>
					<button type="button" class="add"
						onclick="location.href='/ddstudio/guide/busdel.do';">삭제</button>
				</div>
			</div>
		</c:if>

		<div id="content">

			<div class="wide-content-container">
				<div class="wide-item">
					<div>번호</div>
					<div>
						<c:forEach items="${routeList}" var="dto">
							<div>${dto.bus_seq}</div>
						</c:forEach>
					</div>
				</div>
				<div class="wide-item">
					<div>노선(출발-종료)</div>
					<div>
						<c:forEach items="${routeList}" var="dto">
							<div>${dto.start_name}~${dto.end_name}</div>
						</c:forEach>
					</div>
				</div>
				<div class="wide-item">
					<div>시작 시간</div>
					<div>
						<c:forEach items="${routeList}" var="dto">
							<div>${dto.start_time}</div>
						</c:forEach>
					</div>
				</div>
				<div class="wide-item">
					<div>배차</div>
					<div>
						<c:forEach items="${routeList}" var="dto">
							<div>${dto.interval}</div>
						</c:forEach>
					</div>
				</div>
				<!— 추가 아이템들 —>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!— Footer —>

	<script>
		<c:if test="${map.searchStatus == 'y'}">
		$('#category').val('${map.category}');
		$('#search-field').val('${map.word}');
		</c:if>

		document.addEventListener('DOMContentLoaded', function() {
			var searchField = document.getElementById('search-field');

			searchField.addEventListener('keyup', function(event) {
				if (event.key === 'Enter') {
					document.getElementById('search-form').submit();
				}
			});
		});
	</script>
</body>
</html>