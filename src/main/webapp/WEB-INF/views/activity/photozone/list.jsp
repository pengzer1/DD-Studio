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
	 
	 #title > h2 {
		/* margin-top: 70px; */
		/* color: #000; */
	}
	
	#title > h2 > a {
		color: #FFF;
	}
	
	#title > p {
		color: #000;
	}
	 
	#main > #title {
	 	background-color: transparent;
	 	background-repeat: no-repeat;
	}
	 
	#title {
	 	/* background-image: url('/ddstudio/asset/image/detail_background_half_trans.png'); */
	 	background-image: url('/ddstudio/asset/image/Ghibli_photozone_half_trans.png');
	}
	 
	#condition:hover {
		cursor: pointer;
	}

	.item:hover {
		cursor: pointer;
	}
	
	#admin-btn {
		margin-top: 60px;
		text-align: center;
	}
	
	#admin-btn button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #E6AAAE;
	}
	
	.block-bubbling {
		display: inline-block;
		padding: 20px;
	}
	
	.condition-btn > button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #FFF;
	}
	
	#content .munti-content-container {
		margin-top: 30px;
	}
	
</style>
</head>
<body>
	<!-- /activity/photozone/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">	
			<h2><a href="/ddstudio/activity/photozone.do">포토존</a></h2>
			<br>
			<p>DD Studio의 지브리와 함께하는 다양한 포토존에서 기념 사진을 촬영해보세요!</p>
		</div>

		
		<div id="content">
		
			<!-- 관리자용 추가 버튼 -->
			<c:if test="${not empty email && lv == 2}">
				<div id="admin-btn">
					<button type="button" id="add-btn" onclick="location.href='/ddstudio/activity/photozoneadd.do'"><i class="fa-solid fa-plus"></i>등록</button>
				</div>
			</c:if>
	
			<!-- 포토존 컨텐츠 이미지 -->
			<div class="munti-content-container">
				<c:forEach items="${list}" var="dto">
					<div class="item" onclick="location.href= '/ddstudio/activity/photozonedetail.do?seq=' + ${dto.photozone_seq};">
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


