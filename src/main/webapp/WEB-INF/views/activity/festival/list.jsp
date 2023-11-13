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
	#title {
	
	}
	
	#condition:hover {
		cursor: pointer;
	}
	
	.item:hover {
		cursor: pointer;
	}
	
	#admin-btn {
		margin: 3px 0;
	}
	
	#admin-btn button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #E6AAAE;
		float: right;
	}
	
	#admin-btn::after {
		clear: both;
	}

	#condition {
		/* 조건검색 누르면 아래로 확장되게 해야함!! */
	}
	
	#hidden-searchbar {
		display: none;
	}
	
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
			<p>DD Studio의 지브리와 함께하는 다양한 페스티벌을 경험해보세요!</p>
		</div>

		<div id="content">
		
			<div id="condition">
			
				<!-- 조건 검색 (click 전) -->
				<div id="default-searchbar">
					<h3><i class="fa-solid fa-magnifying-glass"></i>조건검색(진행여부별 조회)</h3>
				</div>

				<!-- 조건 검색 (click 후) -->
				<div id="hidden-searchbar">
					<h4><i class="fa-solid fa-magnifying-glass"></i>조건검색</h4>
					<div>
						<div>진행여부</div>
						<select name="close" id="close-select" class="selectbox">
							<option value="end">진행 종료</option>
							<option value="ing">진행중</option>
							<option value="will">진행 예정</option>
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

			<!-- 페스티벌 컨텐츠 이미지 -->
			<div class="munti-content-container">
				<c:forEach items="${list}" var="dto">
					<div class="item" onclick="location.href= '/ddstudio/activity/festivaldetail.do?seq=' + ${dto.festival_seq};">
					<div style="background-image: url('/ddstudio/asset/image/${dto.img}');"></div>
					<div>${dto.name}</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


