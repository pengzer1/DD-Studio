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

body, h1, h2, h3, p, ul, li {
    margin: 0;
    padding: 0;
}

body {
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    background-color: white;
    color: #343a40;
    line-height: 1.6;
}

#main {
    margin-top: 20px;
}

.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Title Styles */

#main > #title {
    background-color: white;
    padding: 20px;
    text-align: center;
}

#title h2 {
    color: white;
    
}

/* Sub Title Styles */

#sub-title {
    text-align: center;
    margin-top: 30px;
    margin-bottom: 100px;
}

#sub-title h3 {
    color: #1f1f1f;
}

/* Button Styles */

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
    transition: background-color 0.3s;
}

button:hover {
    background-color: #0056b3;
}

/* Item Styles */

.wide-content-container,
.munti-content-container {
    display: flex;
    justify-content: space-between;
    gap: 20px;
}

.wide-item,
.item {
    background-color: white;
    text-align: center;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

.wide-item img.totoro-image,
.item img.totoro-image {
    height: 280px;
    transition: transform 0.3s ease-in-out;
}


.item:hover {
    animation: shake 2s ease-in-out infinite;
    transform: translateX(0);
}

@keyframes shake {
    0%, 100% {
        transform: translateX(0);
    }
    10%, 30%, 50%, 70%, 90% {
        transform: translateX(-5px);
    }
    20%, 40%, 60%, 80% {
        transform: translateX(5px);
    }
}

.munti-content-container {
    display: flex;
    justify-content: space-between;
    gap: 20px; /* Increased the gap between items */
    margin-bottom: 200px;
}

.item {
    width: calc(20% - 20px); /* 20% of the container width with gap in between */
    box-sizing: border-box; /* Include padding and border in the element's total width and height */
}

.item img.totoro-image {
    max-width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞춤 */
    height: auto;
    display: block; /* 인라인 요소에서 블록 요소로 변경하여 세로 간격이 생기지 않도록 함 */
    margin: 0 auto; /* 가로 중앙 정렬을 위한 margin 설정 */
}

</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style="background-image: url('/ddstudio/asset/image/chihiro016.jpg');">
			<h2>운휴 관리 페이지</h2>
		</div>
		
		<div id="sub-title">
			<h3>${name}님 안녕하세요!</h3>
		</div>

		<div id="content">			
			<div class="munti-content-container">
				<div class="item">
					<img src="/ddstudio/asset/image/토토로.png" alt="토토로 이미지" class="totoro-image">
					<div><button type="button" onclick="location.href='/ddstudio/admin/attractionclose.do';">어트랙션 운휴관리</button></div>
				</div>
				<div class="item">
					<img src="/ddstudio/asset/image/토토로.png" alt="토토로 이미지" class="totoro-image">
					<div><button type="button" onclick="location.href='/ddstudio/admin/giftshopclose.do';">기프트샵 운휴관리</button></div>
				</div>
				<div class="item">
					<img src="/ddstudio/asset/image/토토로.png" alt="토토로 이미지" class="totoro-image">
					<div><button type="button" onclick="location.href='/ddstudio/admin/restaurantclose.do';">식당 운휴관리</button></div>
				</div>
				<div class="item">
					<img src="/ddstudio/asset/image/토토로.png" alt="토토로 이미지" class="totoro-image">
					<div><button type="button" onclick="location.href='/ddstudio/admin/theaterclose.do';">영화관 운휴관리</button></div>
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