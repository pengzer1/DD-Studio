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
	<!-- /activity/attraction/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>어트랙션</h2>
			<br>
			<p>모험과 환상의 나라 더블디 스튜디오의 어트랙션을 경험해보세요!</p>
		</div>

		<div id="content">
			<div id="condition">
				<h3>조건검색(테마/운휴일정/위치정보)</h3>
			</div>

			<div class="munti-content-container">
				
				<c:forEach items="${list}" var="dto">
				<div class="item">
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
	
		$('.item').click.(function() {
			
			alert();
			location.href= '/ddstudio/activity/attractiondetail.do?seq=${dto.attraction_seq}';
		});		
		
	</script>
</body>
</html>


