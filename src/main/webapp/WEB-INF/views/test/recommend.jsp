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

.item{
	background-color: white;
}
.item img.totoro-image {
    height: 280px; /* 이미지 높이 조절 */
    transition: transform 0.3s ease-in-out; /* 변환 속성에 대한 전환 효과 추가 */
}

.item:hover img.totoro-image {
    animation: shake 2s ease-in-out infinite; /* hover 시에만 흔들리는 애니메이션 적용 */
    transform: translateX(0); /* 초기 위치에서 시작 */
}

@keyframes shake {
    0%, 100% {
        transform: translateX(0); /* 처음과 마지막에는 변화 없음 */
    }
    10%, 30%, 50%, 70%, 90% {
        transform: translateX(-5px); /* 좌측으로 흔들림 */
    }
    20%, 40%, 60%, 80% {
        transform: translateX(5px); /* 우측으로 흔들림 */
    }
}
</style>
</head>
<body>
	<!-- recommend.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top: 123px;">
			<h2>추천</h2>
			<br>
			<p>나에게 딱 맞는 어트랙션을 찾아보세요!</p>
		</div>

		<div id="content">			
			<div class="munti-content-container">
				<div class="item">
    				<img src="/ddstudio/asset/image/토토로.png" alt="토토로 이미지" class="totoro-image">
    				<div><button type="button" onclick="location.href='/ddstudio/test/worldcup.do';">DD 월드컵</button></div>
				</div>
				<div class="item">
					<img src="/ddstudio/asset/image/토토로.png" alt="토토로 이미지" class="totoro-image">
					<div><button type="button" onclick="location.href='/ddstudio/test/mbti.do';">MBTI별 추천</button></div>
				</div>
				
			</div>
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


