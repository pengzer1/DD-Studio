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
#main>#title, .item div {
	background-color: white;
}

.container {
	width: 80%;
	/* margin: 0 auto; */
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.totoro-image {
	max-width: 100%;
	height: auto;
	display: block;
	margin: 0 auto;
}

.button-container {
	text-align: center;
	margin-top: 20px;
}

.button {
	font-size: 24px;
	background-color: #0074cc;
	color: white;
	padding: 20px 40px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin-right: 20px;
}

.button:hover {
	background-color: #0056a4;
}

#sub-title{
	text-align: center;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>회원탈퇴</h2>
			<br>
			<p></p>
		</div>

		<div id="content">

		<div id="sub-title">
			<h3>정말로 탈퇴하시겠습니까?</h3>
		</div>

			<div class="container">
				<img class="totoro-image" src="/ddstudio/asset/image/흑화토토로.png"
					alt="토토로 이미지">
				<div class="button-container">
					<button class="button"
						onclick="location.href='/ddstudio/user/logout.do'" style = "background-color : tomato">탈퇴</button>
					<button class="button"
						onclick="location.href='/ddstudio/member/mypage/info.do'">취소</button>
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


