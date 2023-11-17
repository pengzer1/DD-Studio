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
	#content{
		padding-top: 150px;
	}
	#title {
   margin-top: 123px;
   background-image: url('/ddstudio/asset/image/background-9.jpg');
	}
	#choose>img{
		width:450px;
		height:200px;
	}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>편의시설</h2>
		</div>
		
		<div id="content">	
			
			<div id="choose">
				<button type="button" id="conveni" onclick="location.href='/ddstudio/guide/convenientdetail.do';">편의시설</button>
			</div>
			<div>
				<img src="/ddstudio/asset/image/고양이버스.png"><button type="button" id="shuttle" onclick="location.href='/ddstudio/guide/bus.do';">셔틀버스</button>
			</div>
			
			
			
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


