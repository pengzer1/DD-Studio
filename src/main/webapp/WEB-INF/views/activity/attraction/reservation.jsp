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
		margin: 30px;
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
		margin: 20px 0;
	}
	
	
	.select-time-container {
		margin: 0 auto;
		text-align: center;
	}
	
	.select-time-container > button {
		margin: 0 auto;
	
	}
	
	.value {
		margin: 0 50px;
	}
	
	.value > input {
		width: 100px;
		height: 40px;
		border: 2px solid black;
		border-radius: 7px;
	}
	
	.value > input::placeholder {
		text-align: center;
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
		background-color: #FFFFFF;
		border: 2px solid black;
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
			
			<form method="POST" action="/ddstudio/activity/attractionreservation.do" id="attractionreservationForm">
				<div class="reserve-container">
					<div class="reserve-box">
						<div class="label">시간 선택</div>
						<div class="value select-time-container">
							<c:forEach var="i" begin="10" end="20">
								<c:if test="${now < i}">
									<!-- value에 보내는 값이 tblAttractionBook의 attraction_book_seq -->
									<button type="button" value="${i-9}" class="reserve-btn">${i}:00</button>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="reserve-box">
						<div class="label">인원 선택</div>
						<div class="value">
							<input type="number" placeholder="인원(숫자)" min="1" max="3" name="capacity" required/>
						</div>
					</div>
					<input type="hidden" name="seq" value="${dto.attraction_seq}"/>
					<input type="hidden" name="time" id="time" />
				</div>
				
				
				<div id="reservation-content">
					<div class="btn">
						<button><i class="fa-solid fa-calendar-check"></i> 예약</button>
						<button type="button" onclick="location.href= '/ddstudio/activity/attractiondetail.do?seq=' + ${dto.attraction_seq};"><i class="fa-solid fa-circle-arrow-left"></i> 취소</button>
					</div>
				</div>
			</form>
			
			
			
			
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
	
		let flag = 0;
		
		$('.reserve-btn').eq(0).css('background-color', 'gold');
		$('#time').val($('.reserve-btn').eq(0).val());
	
		$('.reserve-btn').click(function() {
		
			$('.reserve-btn').css('background-color', '#FFF');

			$(this).css('background-color', 'gold');
			
			$('#time').val($(this).val());

		});
		
	</script>
</body>
</html>


