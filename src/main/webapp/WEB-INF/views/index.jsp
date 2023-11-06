<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/ddstudio/asset/css/main.css">
<style>

</style>
</head>
<body>
	<!-- index.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %> <!-- Header -->
	<!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="/ddstudio/asset/image/Ghibli-festival-sample3.png" alt="Image">
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="/ddstudio/asset/image/Ghibli-festival-sample2.png" alt="Image">
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
    <!-- Carousel End -->
    
    <div class="col-lg-12 col-md-6 text-center">
        <h1 class="text-uppercase mb-4">운영시간 07:00 ~ 22:00</h1>
    </div>

    <!-- Programe Start -->
    <div class="container-fluid programe position-relative px-5 mt-5" style="margin-bottom: 135px;">
        <div class="row g-5 gb-5">
            <div class="col-lg-4 col-md-6">
                <div class="bg-light rounded text-center p-5">
                    <h5 class="best-attraction">이 달의 BEST 어트랙션 1위</h5>
                    <img src="/ddstudio/asset/image/파라오의 분노.png" alt="Image" class="main-thumbnail">
                    <h3 class="text-uppercase my-4">파라오의 분노</h3>
                    <a class="text-uppercase" href="">자세히 보기 <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="bg-light rounded text-center p-5">
                    <h5 class="best-attraction">이 달의 BEST 어트랙션 2위</h5>
                    <img src="/ddstudio/asset/image/쌍용열차.jpg" alt="Image" class="main-thumbnail">
                    <h3 class="text-uppercase my-4">쌍용열차</h3>
                    <a class="text-uppercase" href="">자세히 보기 <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="bg-light rounded text-center p-5">
                    <h5 class="best-attraction">이 달의 Best 어트랙션 3위</h5>
                    <img src="/ddstudio/asset/image/회전목마.jpg" alt="Image" class="main-thumbnail">
                    <h3 class="text-uppercase my-4">회전목마</h3>
                    <a class="text-uppercase" href="">자세히 보기 <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Programe Start -->
    
    <!-- Blog Start -->
    <div class="container-fluid p-5">
        <div class="mb-5 text-center">
            <h5 class="text-primary text-uppercase">추천</h5>
            <h1 class="display-3 text-uppercase mb-0">오늘은 어떻게 놀아볼까?</h1>
        </div>
        <div class="row g-5">
            <div class="col-lg-4">
                <div class="blog-item">
                    <div class="position-relative overflow-hidden rounded-top">
                        <img class="img-fluid" src="/ddstudio/asset/image/취향테스트.jpg" alt="Image">
                    </div>
                    <div class="bg-dark d-flex align-items-center rounded-bottom p-4">
                        <div class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
                            <h6 class="text-light text-uppercase mb-0">취향테스트</h6>
                            <span>놀이기구 추천</span>
                        </div>
                        <a class="h5 text-uppercase text-light" href="">나의 취향은?</h4></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="blog-item">
                    <div class="position-relative overflow-hidden rounded-top">
                        <img class="img-fluid" src="/ddstudio/asset/image/DD월드컵.jpg" alt="">
                    </div>
                    <div class="bg-dark d-flex align-items-center rounded-bottom p-4">
                        <div class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
                            <h6 class="text-light text-uppercase mb-0">월드컵</h6>
                            <span>놀이기구, 코스 추천</span>
                        </div>
                        <a class="h5 text-uppercase text-light" href="">DD 월드컵</h4></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="blog-item">
                    <div class="position-relative overflow-hidden rounded-top">
                        <img class="img-fluid" src="/ddstudio/asset/image/MBTI.png" alt="">
                    </div>
                    <div class="bg-dark d-flex align-items-center rounded-bottom p-4">
                        <div class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
                            <h6 class="text-light text-uppercase mb-0">MBTI</h6>
                            <span>놀이기구, 코스 추천</span>
                        </div>
                        <a class="h5 text-uppercase text-light" href="">MBTI별 추천 놀이기구 & 코스</h4></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Blog End -->
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %> <!-- Footer -->
    <div class="col-lg-12 col-md-6 text-center bg-dark" style="padding: 2rem;">
        <h1 class="text-uppercase text-light mb-4">더 빠른 탑승을 위한 최고의 선택!</h1>
        <a href="" class="btn btn-primary py-3 px-5">어트랙션 예약</a>
    </div>

	<script>
		
	</script>
</body>
</html>