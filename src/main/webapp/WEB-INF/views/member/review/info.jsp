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

.name {
	font-weight: bold;
	font-size: 24px;
}

.wide-multi-content-container {
	display: flex;
	justify-content: space-between;
	gap: 20px; /* 테이블 간격을 조정합니다. */
}

.buttons-container {
	text-align: right;
}

.button {
	background-color: #0074cc;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button:hover {
	background-color: #0056a4;
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

.review {
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 20px;
	padding: 10px;
}

.review-image {
	max-width: 100%;
	height: auto;
}

.review-title {
	font-size: 18px;
	font-weight: bold;
	margin: 10px 0;
}

.review-content {
	margin: 10px 0;
}

.review-info {
	font-size: 14px;
	color: #777;
}

.review-image {
	width: 500px; /* 이미지의 가로 크기를 50px로 조정 */
	height: 500px; /* 이미지의 세로 크기를 50px로 조정 */
	object-fit: cover; /* 이미지 비율을 유지하며 크기 조정 */
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>리뷰</h2>
			<br>
			<p></p>
		</div>

		<hr>

		<div id="sub-title">
			<h3></h3>
		</div>

		<div id="content">

			<div class="wide-multi-content-container">
				<div class="container">
					<h2>리뷰 내역</h2>
					<!-- 첫 번째 리뷰 -->
					<div class="review">
						<img class="review-image" src="/ddstudio/asset/image/파라오의 분노.png"
							alt="리뷰 이미지 1">
						<h3 class="review-title">제품 사용 후기</h3>
						<p class="review-content">이 제품을 사용한 후 놀라운 결과를 얻었습니다. 정말
							효과적이에요!</p>
						<p class="review-info">등록일: 2023-11-20 | 조회수: 100</p>
					</div>
					<!-- 두 번째 리뷰 -->
					<div class="review">
						<img class="review-image" src="/ddstudio/asset/image/쌍용열차.jpg"
							alt="리뷰 이미지 2">
						<h3 class="review-title">좋은 제품</h3>
						<p class="review-content">이 제품은 정말 훌륭하고 효과적입니다. 다시 구매하고 싶어요.</p>
						<p class="review-info">등록일: 2023-11-22 | 조회수: 75</p>
					</div>
					<!-- 세 번째 리뷰 -->
					<div class="review">
						<img class="review-image" src="/ddstudio/asset/image/회전목마.jpg"
							alt="리뷰 이미지 3">
						<h3 class="review-title">만족스럽다</h3>
						<p class="review-content">이 제품은 내 기대를 넘어서요. 강력 추천합니다.</p>
						<p class="review-info">등록일: 2023-11-25 | 조회수: 120</p>
					</div>
				</div>


			</div>
			<div class="buttons-container">
				<button class="button"
					onclick="location.href='/ddstudio/member/review/add.do';">리뷰작성</button>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


