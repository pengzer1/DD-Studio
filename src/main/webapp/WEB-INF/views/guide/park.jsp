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
	#title > p{
		color: black;
		font-size: 20px;
	}
	.wide-multi-content-container{
		margin: 30px;
	}
	#content_box{
		text-align:left;
	}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>파크 이용안내</h2>
			<br>
			<p>★ 여러분~이것만은 꼭꼭! 지켜주세요! ★</p>
		</div>
		
		<div id="sub-title">
			<h3 style="text-align:center;">주의 사항</h3>
		</div>

		<div id="content">
		
			<div class="wide-multi-content-container">
				<div class="wide-item">
					<div>밑에 내용들은 가지고 입장하실 수 없어요ㅠㅠ</div>
					<div id="content_box">
						<div>아이템 2 설명</div>
						<div>아이템 3 설명</div>
						<div>아이템 4 설명</div>
					</div>
				</div>
				<div class="wide-item">
					<div>아이템 2</div>
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
