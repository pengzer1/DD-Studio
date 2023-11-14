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
	#total-map {
		padding-top: 60px;
		padding-bottom: 30px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	li{
		padding: 8px; /* 내용과 선 사이에 간격을 조절 */
		text-align: left;
	}
	#container{
    	margin: 0 auto;
    	width: 70%;
	}
	.fa-plane, .fa-ship{
    	color: cornflowerblue;
	}
	.left{
		float:left;
		width: 350px;
	}
	.right{
		float:left:
	}
	#come{
		width: 1050px;
		border-bottom: 2px solid #CCC;
    	display: inline-block;
    	margin-bottom: 15px;
	}
	#total{
		margin-top: 10px;
	}
	
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top: 123px;">
			<h2>가이드맵</h2>
		</div>

		<div id="total-map">
			<div>
				<div id="map" style="width: 1125px; height: 380px;"></div>
			</div>
		</div>

		<div id="container">
			<div style="font-size:20px; font-weight:bold; padding-bottom:8px;" id="guidemap">
				<select id="choice" name="choice">
					<option id="attraction" value="${location.seq}">어트랙션</option>
					<option id="convenient" value="${location.seq}">편의시설</option>
				</select>
			</div>
			<div id="total">
				<div class="left">
						
				</div>
			</div>
		</div>

		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40256c0b64f3ce915f7db1ab8f75aeca"></script>
	<script>
		const container = document.getElementById('map');
		const options = {
			center : new kakao.maps.LatLng(33.3808, 126.5450),
			level : 10,
			draggable : false, // 이동 금지
			disableDoubleClick : true, // 더블클릭 확대 금지
			scrollwheel : false
		// 휠 확대/축소 금지
		};
		const map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>