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
	
	#main > #title {
		background-color: transparent;
		background-repeat: no-repeat;
	}
	
	#title {
		background-image: url('/ddstudio/asset/image/detail_background_resizing.png');
	}
	
	#sub-title > h3 {
		text-align: center;
	}
	
	#content {
		margin-top: 0;
	}
	
	/* 전체 구조 틀 CSS */
	.reserve-container {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	.reserve-box {
		display: flex;
		flex-direction: row;
		align-items: center;
		width: 800px;
	}
	
	
	.select-time-container {
		margin: 0 auto;
		text-align: center;
	}
	
	.select-time-container > button {
		margin: 0 auto;
	
	}
	
	.value > input {
		margin: 10px;
	}
	
	/* 예약/취소 버튼 관련 CSS */
	#reservation-content {
		display: flex;
		justify-content: center;
	}
	
	.btn {
		text-align: center;
	}
	
	.btn > button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #E6AAAE;
	}
	
	.select-time-container > button {
		background-color: #999;
		border: 0;
		border-radius: 7px;
		padding: 10px;
	}
	

</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>어트랙션 예약</h2>
		</div>
		
		<div id="sub-title">
			<h3>${dto.name}</h3>
		</div>

		<div id="content">
			
			<div class="reserve-container">
				<div class="reserve-box">
					<div class="label">시간 선택</div>
					<div class="value select-time-container">
						<button type="button">10:00</button>
						<button type="button">11:00</button>
						<button type="button">12:00</button>
						<button type="button">13:00</button>
						<button type="button">14:00</button>
						<button type="button">15:00</button>
					</div>
				</div>
				<div class="reserve-box">
					<div class="label">인원 선택</div>
					<div class="value">
						<input type="number" placeholder="인원(숫자)" min="1" max="5"/>
					</div>
				</div>
			</div>
			
			
			<div id="reservation-content">
				<form method="POST" action="/ddstudio/activity/attractionreservation.do">
					<div class="btn">
						<button><i class="fa-solid fa-calendar-check"></i> 예약</button>
						<button type="button" onclick="location.href= '/ddstudio/activity/attractiondetail.do?seq=' + ${dto.attraction_seq};"><i class="fa-solid fa-circle-arrow-left"></i> 취소</button>
					</div>
				</form>
			</div>
			
			
			
			
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


