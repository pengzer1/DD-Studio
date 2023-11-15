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
    background-color: #007bff; /* 배경색 */
    color: #fff; /* 텍스트 색상 */
    border: none;
    border-radius: 5px; /* 둥근 모서리 */
    padding: 10px 20px; /* 내부 패딩 */
    font-size: 16px; /* 폰트 크기 */
    text-align: center;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 */
}

button:hover {
    background-color: #0056b3; /* 마우스 호버 시 배경색 변경 */
}

.item {
      background-color: white;
      text-align: center;
      padding: 20px;
      position: relative;
}

.item img.dust-image {
	height: 180px;
 	transform-origin: bottom center;
	transition: transform 0.5s ease-in-out;
}

.item:hover img.dust-image {
	animation: jump 1s infinite ease-in-out;
}

@keyframes jump {
	0%, 100% {
		transform: translateY(0);
	}
	50% {
		transform: translateY(-20px);
	}
}

#title {
	margin-top: 123px;
	background-image: url('/ddstudio/asset/image/background-7.jpg');
}
</style>
</head>
<body>
	<!-- /test/wordcup/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" title="작가 senivpetro 출처 Freepik">
			<h2>DD 월드컵</h2>
		</div>
		
		<div id="content">			
			<div class="munti-content-container">
				<div class="item">
					<img src="/ddstudio/asset/image/dust.png" alt="먼지 이미지" class="dust-image">
					<div><button type="button" onclick="location.href='/ddstudio/test/worldcup/attraction/detail.do';">어트랙션 월드컵</button></div>
				</div>
				<div class="item">
					<img src="/ddstudio/asset/image/dust.png" alt="먼지 이미지" class="dust-image">
					<div><button type="button" onclick="location.href='/ddstudio/test/worldcup/course/detail.do';">코스 월드컵</button></div>
				</div>
			</div>
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


