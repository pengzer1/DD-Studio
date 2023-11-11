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


#main > #title, .item div {
	background-color: white;
}

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


</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>관리자 페이지ㅎㅅㅎ</h2>
			<br>
		</div>
		
		<hr>
		
		<div id="sub-title">
			<h3>${name}님 안녕하세요!</h3>
		</div>

		<div id="content">			
			<div class="munti-content-container">
				<div class="item">
					<div style="background-color: white; background-image: url('/ddstudio/asset/image/토토로.png');"></div>
					<div><button type="button" onclick="location.href='/ddstudio/admin/category.do';">카테고리 관리</button></div>
				</div>
				<div class="item">
					<div style="background-color: white; background-image: url('/ddstudio/asset/image/토토로.png');"></div>
					<div><button type="button" onclick="location.href='/ddstudio/admin/hashtag.do';">해시태그 관리</button></div>
				</div>
				<div class="item">
					<div style="background-color: white; background-image: url('/ddstudio/asset/image/토토로.png');"></div>
					<div><button type="button" onclick="location.href='/ddstudio/admin/theme.do';">테마 관리</button></div>
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