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
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>예매</h2>
			<br>
			<p>예매 방법을 선택하세요.</p>
		</div>
		
		<div id="content">
			<div class="munti-content-container">
				<button type="button" class="ticket-button" onclick="location.href='/ddstudio/ticket/single-reservation.do'">
				<i class="fa-solid fa-user"></i><br>개인 예매
				</button>
				<button type="button" class="ticket-button" onclick="location.href='/ddstudio/ticket/group-reservation.do'">
				<i class="fa-solid fa-users"></i><br>단체 예매
				</button>
			</div>
			
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


