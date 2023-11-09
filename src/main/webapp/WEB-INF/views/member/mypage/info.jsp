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
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>마이페이지</h2>
			<br>
			<p>OOO 님 안녕하세요!</p>
		</div>
		
		<div id="sub-title">
			<h3>제목</h3>
		</div>

		<div id="content">
			
			<div class="wide-content-container">
				<div class="wide-item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<div class="wide-item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<!-- 추가 아이템들 -->
			</div>
			<div class="single-content-container">
				<div class="wide-item">
					<div>아이템 1 설명</div>
				</div>
				<!-- 추가 아이템들 -->
			</div>
			
			<div class="wide-content-container">
				<div class="wide-item">
					<div style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
					<div>아이템 2 설명</div>
				</div>
				<div class="wide-item">
					<div style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
					<div>아이템 2 설명</div>
				</div>
			</div>
			<div class="single-content-container">
				<div class="wide-item">
					<div>아이템 2 설명</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


