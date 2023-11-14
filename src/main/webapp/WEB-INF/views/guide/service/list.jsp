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
	h2{
		font-size: 40px;
	}
	#operating-time, #date, #today-close{
		display: grid;
		place-items: center;
	}
	#date{
		padding-top: 20px;
		border: 2px solid black;
		font-size: 35px;
	}
	#operating-time{
		border: 1px solid black;
		background-color: black;
		 width: 50%;
		 margin: 0 auto;
		 position: relative;
	}
	#operating-time > #timeKorea{
		font-size: 28px;
		color: white;
	}
	#operating-time > #timeNum{
		font-size: 50px;
		color:white;
	}
	#today-close{
		color: black;
		padding-top: 60px;
		font-size: 35px;
		font-weight: bold;
	}
	.item>div:nth-child(2) {
		font-weight: bold;
    	color: black;
    	font-size: larger;
	}
	 #add-button{
      margin: 3px;
      border: 0;
      border-radius: 10px;
      padding: 10px 10px;
      color: #222;
      background-color: #E6AAAE;
      font-size: 15px;
   }
	
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>운영 / 운휴</h2>
		</div>
		
		<div id="date">
			<p>날짜 넣는 칸</p>
		</div>
		<br>
		<div id="operating-time">
			<div id="timeKorea">운영시간</div>
			<div id="timeNum">10:00 - 21:00</div>
		</div>
		
		<div id="today-close">&lt; 오늘의 운휴시설 &gt;
			<c:if test="${not empty email && lv == 2}">
			<div id="button-list"><button type="button" id="add-button" onclick="location.href='/ddstudio/guide/serviceadd.do';"><i class="fa-solid fa-plus"></i>등록</button></div>
			</c:if>
		</div>

		<div id="content">
			<div class="munti-content-container">
				<div class="item">
					<div style="background-image: url('/ddstudio/asset/image/chromi.png');"></div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
					<div>아이템 1 설명</div>
				</div>
				<div class="item">
					<div>아이템 1</div>
					<div>아이템 1 설명</div>
				</div>
				<!-- 추가 아이템들 -->
			</div>
		</div>
		
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


