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
	 	background-image: url('/ddstudio/asset/image/photozone/Ghibli_photozone_half_trans.png');
	}
	
	#background {
		background-image: url('/ddstudio/asset/image/photozone/Ghibli_photozone_half_trans.png');
		background-color: transparent;
		background-repeat: no-repeat;
		background-position: center;
		background-size: 100%;
		padding: 150px 0;
		margin-top: 30px;
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

	#detail-line {
		color: #777;
	}
	
	.result-container {
		display: flex;
		flex-direction: row;
		justify-content: center;
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
		background-color: #FFFFFF;
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

    /* Slideshow container */
    .slideshow-container {
        width: 1000px;
        height: 650px;
        overflow: hideen;
        position: relative;
        margin: 0 auto;
    }

    /* Hide the images by default */
    .mySlides {
    	display: none;
    	min-width: 1000px;
    	height: 650px;
    }

    .mySlides img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    /* Next & previous buttons */
    .prev, .next {
    cursor: pointer;
    position: absolute;
    top: 50%;
    width: auto;
    margin-top: -22px;
    padding: 16px;
    color: white;
    font-weight: bold;
    font-size: 18px;
    transition: 0.6s ease;
    border-radius: 0 3px 3px 0;
    user-select: none;
    }

	/* 왼쪽/오른쪽 버튼 */
    .prev {
    	left: 0;
   		border-radius: 3px 0 0 3px;
    }

    .next {
     right: 0;
     border-radius: 3px 0 0 3px;
    }
    
    .prev:hover, .next:hover {
    	/* color: rgba(0,0,0,0.8); */
    	background-color: rgba(0,0,0,0.8);
    	color: #FFF;
    }

    /* The dots/bullets/indicators */
    .dot {
    cursor: pointer;
    height: 15px;
    width: 15px;
    margin: 0 2px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
    }

    /* Fading animation */
    .fade {
    animation-name: fade;
    animation-duration: 1.5s;
    }

    @keyframes fade {
    from {opacity: .4}
    to {opacity: 1}
    }

	.fade:not(.show) {
		opacity: 1;
	}
	
    
</style>
</head>
<body>
	<!-- /ddstudio/activity/photozone/detail.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	
	<!-- main -->
	<main id="main">
		
		<div id="title">	
			<h2><c:out value="${dto.name}"/></h2>
		</div>
	
		<!-- 관리자용 수정/삭제 버튼 -->
		<c:if test="${not empty email && lv == 2}">
		<div id="admin-btn">
			<button type="button" id="del-btn" onclick="location.href='/ddstudio/activity/photozonedel.do?seq=${dto.photozone_seq}'"><i class="fa-solid fa-trash"></i>삭제</button>
			<button type="button" id="edit-btn" onclick="location.href='ddstudio/activity/photozoneedit.do?seq=${dto.photozone_seq}'"><i class="fa-solid fa-pen-to-square"></i>수정</button>
		</div>
		</c:if>
		
		<hr id="detail-line"/>
		
		<!-- 포토존 이미지 슬라이더 -->
		<!-- Slideshow container -->
	    <div class="slideshow-container">
	
	    <!-- Full-width images with number and caption text -->
	    <c:forEach items="${imgList}" var="dto">
		    <div class="mySlides fade">
		      <img src="/ddstudio/asset/image/photozone/${dto.img}">
		    </div>
	  	</c:forEach>
  
	    <!-- Next and previous buttons -->
	    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	    <a class="next" onclick="plusSlides(1)">&#10095;</a>
	    </div>
	
	    <br>
	  
	    <!-- The dots/circles -->
	    <div style="text-align:center; margin-bottom: 20px;">
	    <c:forEach items="${imgList}" var="dto" varStatus="status">
		    <span class="dot" onclick="currentSlide(${status.count})"></span>
	    </c:forEach>
	    </div>
		
		<!-- 포토존 정보 -->
		<!-- 정보, 시간 시작일, 종료일, 위치 순 -->
		<div id="background">
			<div class="result-container">
				<div class="result-item">
					<img src="/ddstudio/asset/image/time_icon.png" alt="Image" class="icon"/>
					<div class="label">시간</div>
					<div class="value">${dto.time}</div>
				</div>
				<div class="result-item">
					<img src="/ddstudio/asset/image/theme_icon.png" alt="Image" class="icon"/>
					<div class="label">정보</div>
					<div class="value">${dto.info}</div>
				</div>
			</div>
		</div>
		<div class="location">
			<div class="label">위치 정보</div>
			<div class="value location">
				<div id="map" style="width:768px;height:400px;"></div>
			</div>
		</div>
		
	</main>
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

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
	    let imageSrc = '/ddstudio/asset/image/marker/photo_marker3.png'; // 마커이미지의 주소
	    const imageSize = new kakao.maps.Size(40,40);
	    const option = {};
	    
	    //마커 설정
	    const markerImg = new kakao.maps.MarkerImage(imageSrc, imageSize, option);
	    
	    const m1 = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(${location_dto.lat}, ${location_dto.lng}),
			image: markerImg
		});
	    
	  	//마커 지도에 출력
	    m1.setMap(map);
	    
	    /* 이미지 슬라이더용 */
	    let slideIndex = 1;
	    showSlides(slideIndex);
	
	    // Next/previous controls
	    function plusSlides(n) {
	    showSlides(slideIndex += n);
	    }
	
	    // Thumbnail image controls
	    function currentSlide(n) {
	    showSlides(slideIndex = n);
	    }
	
	    function showSlides(n) {
	    let i;
	    let slides = document.getElementsByClassName("mySlides");
	    let dots = document.getElementsByClassName("dot");
	    if (n > slides.length) {slideIndex = 1}
	    if (n < 1) {slideIndex = slides.length}
	    for (i = 0; i < slides.length; i++) {
	        slides[i].style.display = "none";
	    }
	    for (i = 0; i < dots.length; i++) {
	        dots[i].className = dots[i].className.replace(" active", "");
	    }
	    slides[slideIndex-1].style.display = "block";
	    dots[slideIndex-1].className += " active";
	    }
        
	</script>
</body>
</html>


