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
	#main {
		text-align: center;
		margin-top: 150px;
	}
	
	#title > h2 {
		color: #FFF;
	}
	
	#title > h2 > a {
		color: #FFF;
		font-family: 'SUIT-Regular';
	}
	
	#title > p {
		color: #000;
	}
	 
	#main > #title {
	 	background-color: transparent;
	 	background-repeat: no-repeat;
	}
	 
	#title {
	 	background-image: url('/ddstudio/asset/image/movie/moive_background.jpg');
	}
	
	#background {
		background-image: url('/ddstudio/asset/image/movie/movie_detail_background.jpg');
		background-color: transparent;
		background-repeat: no-repeat;
		background-position: center;
		background-size: 100%;
	}
	
	#admin-btn {
		text-align: right;
		margin-top: -60px;
	}
	
	#admin-btn button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #FFF;
	}
	
	#admin-btn button:last-child {
		margin-right: 15px;
	}
	
	#hashtag {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		margin: 30px auto;
	}
	
	#hashtag > i {
		font-size: 2rem;
		margin-right: 10px;
	}
	
	#hashtag > div {
		margin: 3px 5px;
		font-size: 1.1rem;
		border: 0.8px solid #777;
		border-radius: 20px;
		padding: 7px 10px;
	}

	.result-container {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		height: 600px;
	}

	.result-item {
		display: flex;
		flex-direction: column;
		/* justify-content: center; */
		align-items: center;
		border: 0px solid #888;
		width: 276px;
		height: 370px;
		padding: 30px;
		margin: 30px;
		/* background-color: #FFFBD0; */
		background-color: #FFF;
		border-radius: 5px;
	}
	
	.label {
		font-weight: bold;
		font-size: 1.5rem;
		margin: 20px 10px;
		color: #000;
	}
	
	.value {
		margin: 20px 10px;
		font-size: 1.2rem;
	}
	
	/* .result-container > .result-item:nth-child(1) > .value {
		font-size: 1.3rem;
	} */
	
	.value.location {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	.location {
		display: flex;
		flex-direction: column;
	}
	
	.location .label {
		margin-bottom: 0;
	}
	
	.icon {
		width: 60px;
		height: 60px;
		margin: 20px 10px;
	}

    @keyframes fade {
    from {opacity: .4}
    to {opacity: 1}
    }

	.fade:not(.show) {
		opacity: 1;
	}
	
	.sub-title {
		font-size: 26px;
		color: #000;
		text-align: center;
		margin-bottom: 30px;
		border: 0;
		font-weight: bold;
	}
	
	.poster > img {
		width: 700px;
		height: 1000px;
		margin-bottom: 100px; 
	}
	
    
</style>
</head>
<body>
	<!-- /ddstudio/activity/festival/detail.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	
	<!-- Main -->
	<main id="main">
		
		<!-- Title -->
		<div id="title">
			<h2><c:out value="${dto.movie_name}"/></h2>
		</div>
	
		<!-- 관리자용 수정/삭제 버튼 -->
		<c:if test="${not empty email && lv == 2}">
		<div id="admin-btn">
			<button type="button" id="del-btn" onclick="location.href='/ddstudio/activity/moviedel.do?seq=${dto.movie_seq}'"><i class="fa-solid fa-trash"></i> 삭제</button>
			<button type="button" id="edit-btn" onclick="location.href='/ddstudio/activity/movieedit.do?seq=${dto.movie_seq}'"><i class="fa-solid fa-pen-to-square"></i> 수정</button>
		</div>
		</c:if>
		
		<!-- 영화 해시태그 -->
		<div id="hashtag">
			<c:if test="${not empty hashtagList}">
				<i class="fa-solid fa-tag fa-rotate-90"></i>
			</c:if>
			<c:forEach items="${hashtagList}" var="dto">
				<div><c:out value="${dto.hashtag_name}" /></div>
			</c:forEach>
		</div>
		
		
		<!-- 영화 이미지 -->
		<div class="poster">
			<img src="/ddstudio/asset/image/movie/${dto.img}" alt="Image" />
		</div>
		
		<!-- 영화 정보 -->
		<!-- 정보, 시간 시작일, 종료일, 위치 순 -->
		<div id="background">
			<div class="result-container">
				<div class="result-item">
					<img src="/ddstudio/asset/image/info_icon.png" alt="Image" class="icon"/>
					<div class="label">상영 영화관</div>
					<div class="value">${dto.theater_name}</div>
				</div>
				<div class="result-item">
					<img src="/ddstudio/asset/image/time_icon.png" alt="Image" class="icon"/>
					<div class="label">상영 시간</div>
					<div class="value">${dto.start_time}</div>
				</div>
				<div class="result-item">
					<img src="/ddstudio/asset/image/calendar_icon.png" alt="Image" class="icon"/>
					<div class="label">상영 기간</div>
					<div class="value">${dto.start_date}<br>~<br>${dto.end_date}</div>
				</div>
			</div>
		</div>
		
		<!-- 위치 정보 -->
		<div class="location">
			<div class="label">위치 정보</div>
			<div class="value location">
				<div id="map" style="width:768px;height:400px;"></div>
			</div>
		</div>
		
	</main>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c089ee6f3d885cfbe52b2f15d8f3f531"></script>
	<script>
		const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	    
	    const options = { //지도를 생성할 때 필요한 기본 옵션
	       center : new kakao.maps.LatLng(33.361488, 126.529212), //지도의 중심좌표.
	       level : 10, //지도의 레벨(확대, 축소 정도)
	       draggable : false, // 이동 금지
		   disableDoubleClick : true, // 더블클릭 확대 금지
		   scrollwheel : false // 휠 확대/축소 금지
	    };
	
	    const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
	  	//마커 출력
	    let imageSrc = '/ddstudio/asset/image/marker/movie_marker.png'; // 마커이미지의 주소
	    const imageSize = new kakao.maps.Size(40,40);
	    const option = {};
	    
	    //마커 설정
	    const markerImg = new kakao.maps.MarkerImage(imageSrc, imageSize, option);
	    
	    const m1 = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng}),
			image: markerImg
		});
	    
	  	//마커 지도에 출력
	    m1.setMap(map);
	    
        
	</script>
</body>
</html>


