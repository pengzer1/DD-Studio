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
	#attraction {
		text-align: center;
		margin-top: 150px;
	}
	
	#admin-btn {
		text-align: right;
	}
	
	#admin-btn button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #E6AAAE;
	}
	
	#admin-btn button:last-child {
		margin-right: 15px;
	}
	
	#reservation-btn {
		border: 0;
		border-radius: 10px;
		padding: 15px 15px;
		color: #222;
		background-color: #E6AAAE;
		font-size: 1.3rem;
	}

	#carouselExampleIndicators {
	}
	
	.carousel-inner div {
		display: flex;
		justify-content: center;
	}
	
	.carousel-item {
		width: 700px;
		height: 500px;
		overflow: hidden;
	}
	
	.carousel-item img {
		max-width: 100%
		max-height: 100%
	}
	
	#detail-line {
		color: #777;
	}
	
	.result-container {
		/* display: flex;
		flex-direction: column; */
		display: table;
		table-layout: fixed;
		/* align-items: center; */
	}
	
	.result-item {
		/* display: flex;
		flex-direction: row; */
		/* display: table-row */
		/* align-items: center;
		margin-right: 10px; */
	}
	
	.label {
		font-weight: bold;
		margin-right: 5px;
		display: table-cell
	}
	
	.value {
		display: table-cell
	}
	
</style>
</head>
<body>
	<!-- /ddstudio/activity/attraction/detail.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	
	<!-- main -->
	<main id="attraction">
		<h1><c:out value="${dto.name}"/></h1>

		<!-- 관리자용 수정/삭제 버튼 -->
		<c:if test="${not empty email && lv == 2}">
		<div id="admin-btn">
			<button type="button" id="del-btn" onclick="location.href='/ddstudio/activity/attractiondel.do?seq=${dto.attraction_seq}'"><i class="fa-solid fa-trash"></i>삭제</button>
			<button type="button" id="edit-btn" onclick="location.href='ddstudio/activity/attractionedit.do?seq=${dto.attraction_seq}'"><i class="fa-solid fa-pen-to-square"></i>수정</button>
		</div>
		</c:if>
		
		<hr id="detail-line"/>
		
		<!-- 어트랙션 해시태그 -->
		<!-- 해시태그 dao, dto에서 가져와서 하기 -->
		<%-- <div id="hashtag">
			<c:forEach items="${}" var="dto">
				<div><c:out>${}</div></c:out>
			</c:forEach>
		</div> --%>
		
		
		<!-- 어트랙션 이미지 슬라이더 -->
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			<!-- 하단 이미지 선택바 -->
			<div class="carousel-indicators">
				<c:forEach items="${imgList}" var="dto" varStatus="status">
					<c:if test="${status.first}">
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="active" aria-current="true" aria-label="Slide ${status.count}"></button>
					</c:if>
					<c:if test="${!status.first}">
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" aria-label="Slide ${status.count}"></button>
					</c:if>
				</c:forEach>
			</div>
			<!-- 슬라이드 이미지 -->
			<div class="carousel-inner">
				<c:forEach items="${imgList}" var="dto" varStatus="status">
					<c:if test="${status.first}">
						<div class="carousel-item active">
							<img src="/ddstudio/asset/image/${dto.img}" class="d-block w-100" alt="Image">
						</div>
					</c:if>
					<c:if test="${!status.first}">
						<div class="carousel-item">
							<img src="/ddstudio/asset/image/${dto.img}" class="d-block w-100" alt="Image">
						</div>
					</c:if>
				</c:forEach>
			</div>
			<!-- 사진 양 옆 화살표 버튼 -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
		<!-- 어트랙션 정보 -->
		<!-- 운휴일정, 운영시간, 탑승인원, 이용정보, 테마, 위치, 예약 순 -->
			
		<div class="result-container">
			<div class="result-item">
				<div class="label">운휴일정</div>
				<div calss="value">
					<c:if test="${close_dto.attraction_close_seq != null}">
						금일 운휴
						<%-- <c:out value="${now}" /> --%><!-- 금일 날짜 -->
					</c:if>	
					<c:if test="${close_dto.attraction_close_seq == null}">
						정상 운영
					</c:if>
				</div>
			</div>
			<div class="result-item">
				<div class="label">운영시간</div>
				<div class="value">${dto.time}</div>
			</div>
			<div class="result-item">
				<div class="label">탑승인원</div>
				<div class="value">${dto.capacity}</div>
			</div>
			<div class="result-item">
				<div class="label">이용정보</div>
				<div class="value">${dto.restriction}</div>
			</div>
			<!-- 테마 가져와야함 -->
			<div class="result-item">
				<div class="label">테마</div>
				<div class="value">${dto.theme_seq}</div>
			</div>
			<div class="result-item">
				<div class="label">위치</div>
				<div class="value">${dto.location_seq}</div>
			</div>
		</div>
		
		<!-- 예약 버튼 -->
		<div>
			<button type="button" id="reservation-btn" onclick="location.href='/ddstudio/activity/attractionreservation.do?seq=${dto.attraction_seq}'">어트랙션 예약하기</button>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
	
		
	</script>
</body>
</html>


