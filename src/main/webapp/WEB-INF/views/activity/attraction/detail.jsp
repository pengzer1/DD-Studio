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
	
	#background {
		background-image: url('/ddstudio/asset/image/detail_background_half_trans.png');
		background-color: transparent;
		background-repeat: no-repeat;
		background-position: center;
		background-size: 100%
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
	
	.close-container {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 30px 0;
		padding-top: 50px;
	}
	
	.close-item {
		width: 1277px;
		/* border: 1px solid #999; */
		border-radius: 5px;
		background-color: #FFFFFF;
	}
	
	.close-time > .value {
		margin: 0 auto;
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
			<button type="button" id="edit-btn" onclick="location.href='/ddstudio/activity/attractionedit.do?seq=${dto.attraction_seq}'"><i class="fa-solid fa-pen-to-square"></i>수정</button>
		</div>
		</c:if>
		
		<hr id="detail-line"/>
		
		<!-- 어트랙션 해시태그 -->
		<!-- 해시태그 dao, dto에서 가져와서 하기 -->
		<div id="hashtag">
			<c:if test="${not empty hashtagList}">
				<i class="fa-solid fa-tag fa-rotate-90"></i>
			</c:if>
			<c:forEach items="${hashtagList}" var="dto">
				<div><c:out value="${dto.hashtag_name}" /></div>
			</c:forEach>
		</div>
		
		
		<!-- 어트랙션 이미지 슬라이더 -->
		<!-- Slideshow container -->
	    <div class="slideshow-container">
	
	    <!-- Full-width images with number and caption text -->
	    <c:forEach items="${imgList}" var="dto">
		    <div class="mySlides fade">
		      <img src="/ddstudio/asset/image/attraction/${dto.img}">
		    </div>
	  	</c:forEach>
  
	    <!-- Next and previous buttons -->
	    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	    <a class="next" onclick="plusSlides(1)">&#10095;</a>
	    </div>
	
	    <br>
	  
	    <!-- The dots/circles -->
	    <div style="text-align:center">
	    <c:forEach items="${imgList}" var="dto" varStatus="status">
		    <span class="dot" onclick="currentSlide(${status.count})"></span>
	    </c:forEach>
	    </div>
		
		<!-- 어트랙션 정보 -->
		<!-- 운휴일정, 운영시간, 탑승인원, 이용정보, 테마, 위치, 예약 순 -->
		<div id="background">
			<div class="close-container">
				<div class="close-item">
					<div class="label">운휴일정</div>
					<div class="value">
						<c:if test="${close_dto.attraction_close_seq != null}">
							<img src="/ddstudio/asset/image/close_icon.png" alt="Image" class="icon"/>
							금일 운휴
							<%-- <c:out value="${now}" /> --%><!-- 금일 날짜 -->
						</c:if>	
						<c:if test="${close_dto.attraction_close_seq == null}">
							<img src="/ddstudio/asset/image/calendar_icon.png" alt="Image" class="icon"/>
							정상 운영
						</c:if>
					</div>
				</div>
			</div>
			<div class="result-container">
				<div class="result-item">
					<img src="/ddstudio/asset/image/time_icon.png" alt="Image" class="icon"/>
					<div class="label">운영시간</div>
					<div class="value">${dto.time}</div>
				</div>
				<div class="result-item">
					<img src="/ddstudio/asset/image/people_icon.png" alt="Image" class="icon"/>
					<div class="label">탑승인원</div>
					<div class="value">${dto.capacity}명</div>
				</div>
				<div class="result-item">
					<img src="/ddstudio/asset/image/info_icon.png" alt="Image" class="icon"/>
					<div class="label">이용정보</div>
					<c:if test="${dto.restriction == null}">
						<div class="value">제한 없음</div>
					</c:if>
					<c:if test="${dto.restriction != null}">
						<div class="value">${dto.restriction}</div>
					</c:if>
				</div>
				<%-- <div class="result-item">
					<img src="/ddstudio/asset/image/theme_icon.png" alt="Image" class="icon"/>
					<div class="label">테마</div>
					<div class="value">${dto.theme}</div>
				</div> --%>
			</div>
		</div>
		
		
		<div class="location">
			<div class="label">위치 정보</div>
			<div class="value location">
				<div id="map" style="width:768px;height:400px;"></div>
			</div>
		</div>
		
		<!-- 예약 버튼 -->
		<div>
			<button type="button" id="reservation-btn" onclick="location.href='/ddstudio/activity/attractionreservation.do?seq=${dto.attraction_seq}'">어트랙션 예약하기</button>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c089ee6f3d885cfbe52b2f15d8f3f531"></script>
	<script>
		const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	    
	    const options = { //지도를 생성할 때 필요한 기본 옵션
	       center : new kakao.maps.LatLng(33.361488, 126.529212), //지도의 중심좌표.
	       level : 10 //지도의 레벨(확대, 축소 정도)
	    };
	
	    const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
	    //마커 출력
	    const m1 = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(${location_dto.lat}, ${location_dto.lng})
		});
	    
	    m1.setMap(map);
	    
	    //확대/축소, 드래그 제어
		map.setZoomable(false);
	    map.setDraggable(false);
	    
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


