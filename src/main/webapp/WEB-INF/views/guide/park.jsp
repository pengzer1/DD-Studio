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
	#title {
   		margin-top: 123px;
   		background-image: url('/ddstudio/asset/image/background-10.jpg');
	}
	#title > p{
		color: white;
		font-size: 20px;
	}
	.wide-multi-content-container{
		margin: 30px;
	}
	#content_box{
		text-align:left;
	}
	h3{
		margin-top: 30px;
	}
	.wide-item{
		margin-top:20px;
	}
	img{
		width: 50px;
		height:50px;
	}
	.wide-item{
		border: 1px solid black;
		width: 800px;
		text-align: center;
		margin: 0 auto;
		margin-bottom: 25px;
	}
	#content_box{
		display:flex;
		flex-wrap: wrap;
		align-items:center;
		justify-content: center;
	}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2 style="color:white;">파크 이용안내</h2>
			<br>
			<p>★ 여러분~이것만은 꼭꼭! 지켜주세요! ★</p>
		</div>
		
		<div id="sub-title">
			<h3 style="text-align:center;">주의 사항</h3>
		</div>

		<div id="content">
			<div class="wide-multi-content-container" style="margin-top:80px;">
				<div class="wide-item">
					<div>다음의 내용은 가지고 입장하실 수 없습니다!</div>
					<div id="content_box">
						<div><img src="/ddstudio/asset/image/park/dog.png"> 아이템 2 설명</div>
						<div><img src="/ddstudio/asset/image/park/자전거.png">아이템 3 설명</div>
						<div><img src="/ddstudio/asset/image/park/주류.png">아이템 5 설명</div>
						<div><img src="/ddstudio/asset/image/park/의자.png">아이템 6 설명</div>
						<div><img src="/ddstudio/asset/image/park/카메라.png">아이템 7 설명</div>
						<div><img src="/ddstudio/asset/image/park/드론.png">아이템 8 설명</div>
						<div><img src="/ddstudio/asset/image/park/총.png">아이템 9 설명</div>
						<div><img src="/ddstudio/asset/image/park/스피커.png">아이템 10 설명</div>
						<div><img src="/ddstudio/asset/image/park/페인트.png">아이템 11 설명</div>
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
