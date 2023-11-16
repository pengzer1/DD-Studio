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
               <div><i class="fa-solid fa-user" style="font-size: 30px;"></i></div>
               <div><button type="button" class="ticket-button" onclick="location.href='/ddstudio/ticket/single-reservation.do'">
				개인 예매
				</button></div>
            </div>
            <div class="wide-item">
               <div><i class="fa-solid fa-users" style="font-size: 30px;"></i></div>
               <div><button type="button" class="ticket-button" onclick="location.href='/ddstudio/ticket/group-reservation.do'">
				단체 예매
				</button></div>
            </div>
         </div>
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


