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
#content {
	margin: 0;
	padding: 30px 350px 0 350px;
}

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

.tit_lt {
	position: relative;
    float: left;
    width: 20%;
    height: 51px;
    line-height: 51px;
    padding-left: 2%;
    border-right: 0 none;
    box-sizing: border-box;
    font-size: 30px;
}

.tit_rt {
    float: left;
    width: 38%;
    height: 51px;
    line-height: 51px;
    padding-right: 2%;
    font-size: 25px;
    margin: 0;
    text-align: left;
    font-weight: 700;
}

.ex {
	font-size: 16px;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px; background-image: url('/ddstudio/asset/image/background-6.jpg');">
			<h2>예매</h2>
			<br>
			<p>예매 방법을 선택하세요.</p>
		</div>
		
		<div id="content">
		<div class="wide-content-container">
            <div class="wide-item">
               <div><i class="fa-solid fa-user tit_lt"></i><p class="tit_rt">개인 예매</p></div>
               <div>
               <div class="ex">
               <p>1Day 티켓부터 After4 티켓까지</p>
               <p>다양한 혜택과 함께 누려보세요!</p>
               </div>
               <button type="button" class="ticket-button" onclick="location.href='/ddstudio/ticket/single-reservation.do'">
				예매하기
				</button></div>
            </div>
            <div class="wide-item">
               <div><i class="fa-solid fa-users tit_lt"></i><p class="tit_rt">단체 예매</p></div>
               <div>
               <div class="ex">
               <p>최대 100명까지 예약할 수 있는</p>
               <p>DD Studio의 특별한 모험을 떠나보세요!</p>
               </div>
               <button type="button" class="ticket-button" onclick="location.href='/ddstudio/ticket/group-reservation.do'">
				예매하기
				</button>
				</div>
            </div>
         </div>
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


