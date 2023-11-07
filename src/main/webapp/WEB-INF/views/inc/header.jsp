
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Header Start -->
<div id="ddstudio-header" class="container-fluid px-0"
	style="margin-top: 20px; margin-bottom: 20px;">
	<div class="row gx-0">
		<div class="col-lg-3 d-none d-lg-block">
			<a href="/ddstudio/index.do" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
				<h1 class="m-0 display-4 text-uppercase" id="ddstudio-logo">DD Studio</h1>
			</a>
		</div>
		<div class="col-lg-9">
			<nav class="navbar navbar-expand-lg p-3 p-lg-0"
				style="margin-top: 13px; font-family: 'JalnanGothic';">
				<div class="collapse navbar-collapse justify-content-between"
					id="navbarCollapse"
					style="font-size: 1.2rem;">
					<div class="navbar-nav mr-auto py-0">
						<a href="/ddstudio/pb/price.do" class="nav-item nav-link active index-navi">
							<div class="material-symbols-outlined nav-icon">Local_Activity</div>
							<div class="nav-menu-name">요금/혜택</div>
						</a>
						<a href="/ddstudio/activity/attraction.do"
							class="nav-item nav-link index-navi">
							<div class="material-symbols-outlined nav-icon">Attractions</div>
							<div class="nav-menu-name">액티비티</div>
						</a>
						<a href="class.html" class="nav-item nav-link index-navi">
							<div class="material-symbols-outlined nav-icon">Recommend</div>
							<div class="nav-menu-name">추천</div>
						</a>
						<a href="team.html" class="nav-item nav-link index-navi">
							<div class="material-symbols-outlined nav-icon">Redeem</div>
							<div class="nav-menu-name">샵</div>
						</a>
						<a href="team.html" class="nav-item nav-link index-navi">
							<div class="material-symbols-outlined nav-icon">notification_important</div>
							<div class="nav-menu-name">가이드</div>
						</a>
						<a href="team.html" class="nav-item nav-link index-navi">
							<div class="material-symbols-outlined nav-icon">sms</div>
							<div class="nav-menu-name">소통</div>
						</a>
						<a href="team.html" class="nav-item nav-link index-navi">
							<div class="material-symbols-outlined nav-icon">search</div>
							<div class="nav-menu-name">검색</div>
						</a>
						<a href="contact.html" class="nav-item nav-link index-navi">
							<div class="material-symbols-outlined nav-icon">book_online</div>
							<div class="nav-menu-name">예매</div>
						</a>
<<<<<<< HEAD
						<c:if test="${empty eamil}">
							<a href="/ddstudio/user/login.do">로그인</a>
							<a href="/ddstudio/user/register.do">회원가입</a>
						</c:if>
						<c:if test="${not empty eamil}">
							<a href="/ddstudio/user/logout.do">로그아웃</a>
							<a href="/ddstudio/member/mypage.do">마이페이지</a>
						</c:if>
=======
>>>>>>> b7e0f54fd55abb3f2f50f53f734f1ba1441a12ef
					</div>
				</div>
				<c:if test="${empty email}">
					<div class="header-login">
						<a href="/ddstudio/user/login.do">로그인</a>
						<a href="/ddstudio/user/register.do">회원가입</a>
					</div>
				</c:if>
				<c:if test="${not empty email}">
					<div class="header-login">
						<a href="/ddstudio/user/logout.do">로그아웃</a>
						<a href="/ddstudio/member/mypage.do">마이페이지</a>
					</div>
					<div>
						<span style="font-size: 15px; color: #CCC; margin-right: 10px;">${name}(${email})</span>
					</div>
				</c:if>
			</nav>
		</div>
	</div>
</div>
<!-- Header End -->
