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
button {
	background-color: #007bff; 
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

button:hover {
	background-color: #0056b3;
}

#content {
	padding: 0 600px;
}

.item {
	background-color: white;
	text-align: center;
	padding: 20px;
	position: relative;
	width: 330px;
	aspect-ratio: 1.1;
}

.item img.dust-image {
	height: 180px;
	transform-origin: bottom center;
	transition: transform 0.5s ease-in-out;
}

.item:hover img.dust-image {
	animation: jump 1s infinite ease-in-out;
}

@
keyframes jump { 0%, 100% {
	transform: translateY(0);
}

50
%
{
transform
:
translateY(
-20px
);
}
}
#title {
	margin-top: 123px;
	background-image: url('/ddstudio/asset/image/background-7.jpg');
}

#overlay-div {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 400px;
	background-color: black;
	opacity: 0.45; /* 투명도 조절 */
	z-index: 1; /* 다른 요소들보다 위에 위치하도록 설정 */
}

#title h2 {
	color: #EEE;
	z-index: 2;
}
</style>
</head>
<body>
	<!-- /test/wordcup/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" title="작가 senivpetro 출처 Freepik">
			<div id="overlay-div"></div>
			<h2>DD 월드컵</h2>
		</div>

		<div id="content">
			<div class="munti-content-container">
				<div class="item">
					<img src="/ddstudio/asset/image/dust.png" alt="먼지 이미지"
						class="dust-image">
					<div>
						<button type="button"
							onclick="location.href='/ddstudio/test/worldcup/attraction/detail.do';">어트랙션
							월드컵</button>
					</div>
				</div>
				<div class="item">
					<img src="/ddstudio/asset/image/dust.png" alt="먼지 이미지"
						class="dust-image">
					<div>
						<button type="button"
							onclick="location.href='/ddstudio/test/worldcup/course/detail.do';">코스
							월드컵</button>
					</div>
				</div>
			</div>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


