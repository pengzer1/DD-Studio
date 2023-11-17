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
		width:500px;
		height:250px;
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

			<c:if test="${not empty email && lv == 2}">

				<div class="container">
					<div id="btn3" class="btn">
						<button type="button" class="add" onclick="location.href='/ddstudio/guide/busadd.do';">추가</button>
						<button type="button" class="add" onclick="location.href='/ddstudio/guide/busdel.do';">삭제</button>
					</div>
				</div>
			</c:if>



			<main id="main">

				<div id="title" style="margin-top:123px;">
					<h2>제목</h2>
					<br>
					<p>내용을 입력하세요</p>
				</div>

				<div id="sub-title">
					<h3>제목</h3>
				</div>

				<div id="content">

					<div class="wide-content-container">
						<div class="wide-item">
							<div>번호</div>
							<div>
								<c:forEach items="${routeList}" var="dto">
								<div>${dto.bus_seq}</div>
								</c:forEach>
							</div>
						</div>
						<div class="wide-item">
							<div>노선(출발-종료)</div>
							<div>
								<c:forEach items="${routeList}" var="dto">
									<div>${dto.start_name} ~ ${dto.end_name}</div>
								</c:forEach>
							</div>
						</div>
						<div class="wide-item">
							<div>시작 시간</div>
							<div>
								<c:forEach items="${routeList}" var="dto">
								<div>${dto.start_time}</div>
								</c:forEach>
							</div>
						</div>
						<div class="wide-item">
							<div>배차</div>
							<div>
								<c:forEach items="${routeList}" var="dto">
									<div>${dto.interval}</div>
								</c:forEach>
							</div>
						</div>
						<!— 추가 아이템들 —>
					</div>





				</div>
			</main>
			
			
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!— Footer —>

	<script>
		
	</script>
</body>
</html>


