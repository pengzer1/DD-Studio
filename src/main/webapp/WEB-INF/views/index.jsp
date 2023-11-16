<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
.nav-icon {
    font-size: 50px;
}

.nav-menu-name {
    font-size: 15px;
}

.header-login {
    position: absolute;
    top: -15%;
    right: 2%;
}

.header-login a {
    padding: 0 5px;
}

.carousel-item active{
    padding-top:150px;
}
	
.blog-item {
    display: flex;
    flex-direction: column;
    height: 100%;
}

.blog-item > * {
    flex: 1; /* 각 요소를 균일하게 키우기 위해 */
}

.blog-item .bg-dark {
    flex: 1;
    display: flex;
    /* flex-direction: column; */
    padding: 10px;
}

.blog-item .bg-dark .flex-shrink-0 {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.blog-item img {
    width: 100%; /* 이미지를 박스에 꽉 채우기 위해 */
     height: 100%;/* 이미지를 박스에 꽉 채우기 위해 */
    object-fit: cover; /* 이미지가 박스에 맞게 잘리거나 확대/축소되도록 설정 */
    border-radius: 10px 10px 0 0;
}

.bg-dark.d-flex {
    padding: 10px; /* 기존 4개의 방향 패딩을 전체적으로 10px로 줄입니다 */
}

.flex-shrink-0 {
    padding-right: 8px; /* 텍스트와 여백을 좁히기 위해 오른쪽 패딩을 줄입니다 */
}

.text-light {
    font-size: 16px; /* 텍스트 크기를 줄입니다 */
}

.blog-item .position-relative {
    padding-bottom: 80%; /* 이미지 영역을 8:2 비율로 설정 */
    position: relative;
}

.blog-item .position-relative img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지를 박스에 맞게 잘리거나 확대/축소되도록 설정 */
}

.blog-item {
    cursor: pointer;
}
</style>
</head>
<body>
	<!-- index.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %> <!-- Header -->
	<!-- 회전 이미지 시작 -->
    <div class="container-fluid p-0 mb-5">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="/ddstudio/asset/image/festival/Ghibli-festival-sample3.png" alt="Image">
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="/ddstudio/asset/image/festival/Ghibli-festival-sample2.png" alt="Image">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- 회전 이미지 끝 -->
    
    <div class="col-lg-12 col-md-6 text-center">
        <h1 class="text-uppercase mb-4">운영시간 07:00 ~ 22:00</h1>
    </div>

    <!-- Best Attraction 시작 -->
    <div class="container-fluid programe position-relative px-5 mt-5" style="margin-bottom: 135px;">
        <div class="row g-5 gb-5">
            <div class="col-lg-4 col-md-6">
                <div class="bg-light rounded text-center p-5">
                    <h5 class="best-attraction">이 달의 BEST 어트랙션 1위</h5>
                    <img src="/ddstudio/asset/image/attraction/토토로스핀.jpeg" alt="Image" class="main-thumbnail">
                    <h3 class="text-uppercase my-4">토토로스핀</h3>
                    <a class="text-uppercase" href="/ddstudio/activity/attractiondetail.do?seq=15">자세히 보기 <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="bg-light rounded text-center p-5">
                    <h5 class="best-attraction">이 달의 Best 어트랙션 2위</h5>
                    <img src="/ddstudio/asset/image/attraction/지브리특급1.jpeg" alt="Image" class="main-thumbnail">
                    <h3 class="text-uppercase my-4">지브리특급</h3>
                    <a class="text-uppercase" href="/ddstudio/activity/attractiondetail.do?seq=1">자세히 보기 <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="bg-light rounded text-center p-5">
                    <h5 class="best-attraction">이 달의 BEST 어트랙션 3위</h5>
                    <img src="/ddstudio/asset/image/attraction/마루 밑 아리에티를 찾아서.jpeg" alt="Image" class="main-thumbnail">
                    <h3 class="text-uppercase my-4">마루 밑 아리에티를 찾아서</h3>
                    <a class="text-uppercase" href="/ddstudio/activity/attractiondetail.do?seq=25">자세히 보기 <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Best Attraction 끝 -->
    
    <!-- 추천 시작 -->
    <div class="container-fluid p-5">
        <div class="mb-5 text-center">
            <h5 class="text-primary text-uppercase">추천</h5>
            <h1 class="display-3 text-uppercase mb-0">오늘은 어떻게 놀아볼까?</h1>
        </div>
        <div class="row g-5">
            <div class="col-lg-4">
                <div class="blog-item" onclick="window.location.href='/ddstudio/test/worldcup/attraction/detail.do'">
            	    <div class="position-relative overflow-hidden rounded-top">
                        <img class="img-fluid" src="/ddstudio/asset/image/취향테스트.jpg" alt="Image">
                    </div>
                    <div class="bg-dark d-flex align-items-center rounded-bottom p-4">
                        <div class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
                            <h6 class="text-light text-uppercase mb-0">DD 월드컵</h6>
                            <span>어트랙션 추천</span>
                        </div>
                        <a class="h5 text-uppercase text-light" href="/ddstudio/test/worldcup/attraction/detail.do">어트랙션 월드컵</h4></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="blog-item" onclick="window.location.href='/ddstudio/test/worldcup/course/detail.do'">
            	    <div class="position-relative overflow-hidden rounded-top">
                        <img class="img-fluid" src="/ddstudio/asset/image/DD월드컵.jpg" alt="">
                    </div>
                    <div class="bg-dark d-flex align-items-center rounded-bottom p-4">
                        <div class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
                            <h6 class="text-light text-uppercase mb-0">DD 월드컵</h6>
                            <span>코스 추천</span>
                        </div>
                        <a class="h5 text-uppercase text-light" href="/ddstudio/test/worldcup/course/detail.do">코스 월드컵</h4></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="blog-item" onclick="window.location.href='/ddstudio/test/mbti.do'">
            	    <div class="position-relative overflow-hidden rounded-top">
                        <img class="img-fluid" src="/ddstudio/asset/image/MBTI.png" alt="">
                    </div>
                    <div class="bg-dark d-flex align-items-center rounded-bottom p-4">
                        <div class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
                            <h6 class="text-light text-uppercase mb-0">MBTI</h6>
                            <span>놀이기구, 코스 추천</span>
                        </div>
                        <a class="h5 text-uppercase text-light" href="/ddstudio/test/mbti.do">MBTI별 추천 놀이기구 & 코스</h4></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 추천 끝 -->
    
    <div class="col-lg-12 col-md-6 text-center bg-dark" style="padding: 2rem;">
        <h1 class="text-uppercase text-light mb-4">더 빠른 탑승을 위한 최고의 선택!</h1>
        <a href="/ddstudio/ticket/select.do" class="btn btn-primary py-3 px-5">어트랙션 예약</a>
    </div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %> <!-- Footer -->

	<script>
		
	</script>
</body>
</html>