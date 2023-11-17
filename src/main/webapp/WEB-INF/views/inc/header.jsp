<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#ddstudio-header {
	border-bottom: 2px solid #CCC;
	/* background-image: url('/ddstudio/asset/image/cloud2.png'); */
	background-size: contain;
	background-position: center;
}

.navbar-nav .sub-menu, .navbar-nav .sub-sub-menu {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 1;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border: 1px solid #e5e5e5;
	padding: 10px;
	width: 100%;
	right: 0;
	text-align: left;
}

.sub-menu, .sub-sub-menu {
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 1;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border: 1px solid #e5e5e5;
	padding: 10px;
	width: 100%;
	right: 0;
	text-align: left;
}

.navbar-nav .nav-item:hover>.sub-menu {
	display: block;
}

.sub-menu .nav-item:hover>.sub-sub-menu {
	display: block;
}
</style>

<!-- Header Start -->
<div id="ddstudio-header" class="container-fluid px-0">
	<div class="row gx-0">
		<div class="col-lg-3 d-none d-lg-block">
			<a href="/ddstudio/index.do"
				class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
				<!-- <h1 class="m-0 display-4 text-uppercase" id="ddstudio-logo">DD Studio</h1> -->
				<img src="/ddstudio/asset/image/DDstudio.png" alt="DD Studio Logo" style="width: 70%;">
			</a>
		</div>
		<div class="col-lg-9">
			<nav class="navbar navbar-expand-lg p-3 p-lg-0"
				style="margin-top: 13px; font-family: 'JalnanGothic';">
				<div class="collapse navbar-collapse justify-content-between"
					id="navbarCollapse" style="font-size: 1.2rem;">
					<div class="navbar-nav mr-auto py-0">
						<div class="nav-item nav-link index-navi">
							<a href="/ddstudio/pb/price.do" class="nav-item nav-link active index-navi">
								<div class="material-symbols-outlined nav-icon">Local_Activity</div>
								<div class="nav-menu-name">요금/혜택</div>
								<div class="sub-menu">
									<div>
										<a href="/ddstudio/pb/price.do">요금</a>
									</div>
									<div>
										<a href="/ddstudio/pb/benefit.do">혜택</a>
									</div>
								</div>
							</a>
						</div>
						<div class="nav-item nav-link index-navi">
							<a href="/ddstudio/activity/attraction.do" class="nav-item nav-link index-navi">
								<div class="material-symbols-outlined nav-icon">Attractions</div>
								<div class="nav-menu-name">액티비티</div>
								<div class="sub-menu">
									<div>
										<a href="/ddstudio/activity/attraction.do">어트랙션</a>
									</div>
									<div>
										<a href="/ddstudio/activity/movie.do">영화</a>
									</div>
									<div>
										<a href="/ddstudio/activity/festival.do">페스티벌</a>
									</div>
									<div>
										<a href="/ddstudio/activity/photozone.do">포토존</a>
									</div>
								</div>
							</a>
						</div>
						<div class="nav-item nav-link index-navi">
							<a href="/ddstudio/test/recommend.do" class="nav-item nav-link index-navi">
								<div class="material-symbols-outlined nav-icon">Recommend</div>
								<div class="nav-menu-name">추천</div>
								<div class="sub-menu">
									<div>
										<a href="/ddstudio/test/worldcup.do">DD 월드컵</a>
									</div>
									<div>
										<a href="/ddstudio/test/mbti.do">MBTI 추천</a>
									</div>
								</div>
							</a>
						</div>
						<div class="nav-item nav-link index-navi">
							<a href="/ddstudio/shop/restaurant.do" class="nav-item nav-link index-navi">
								<div class="material-symbols-outlined nav-icon">Redeem</div>
								<div class="nav-menu-name">샵</div>
								<div class="sub-menu">
									<div>
										<a href="/ddstudio/shop/restaurant.do">식당</a>
									</div>
									<div>
										<a href="/ddstudio/shop/giftshop.do">기프트샵</a>
									</div>
								</div>
							</a>
						</div>
						<div class="nav-item nav-link index-navi">
							<a href="/ddstudio/guide/guide.do" class="nav-item nav-link index-navi">
								<div class="material-symbols-outlined nav-icon">notification_important</div>
								<div class="nav-menu-name">가이드</div>
								<div class="sub-menu">
									<div>
										<a href="/ddstudio/guide/park.do">파크 이용안내</a>
									</div>
									<div>
										<a href="/ddstudio/guide/convenient.do">편의시설</a>
									</div>
									<div>
										<a href="/ddstudio/guide/location.do">오시는 길</a>
									</div>
									<div>
										<a href="/ddstudio/guide/guide.do">가이드맵</a>
									</div>
								</div>
							</a>
						</div>
						<div class="nav-item nav-link index-navi">
							<a href="/ddstudio/communicate/notice.do" class="nav-item nav-link index-navi">
								<div class="material-symbols-outlined nav-icon">sms</div>
								<div class="nav-menu-name">소통</div>
								<div class="sub-menu">
									<div>
										<a href="/ddstudio/communicate/notice.do">공지사항</a>
									</div>
									<div>
										<a href="/ddstudio/communicate/faq.do?type=이용정보">FAQ</a>
									</div>
									<div>
										<a href="/ddstudio/communicate/review.do?sort=최신순">리뷰</a>
									</div>
									<div>
										<a href="/ddstudio/communicate/usageinquiry.do">고객소리함</a>
										<div class="sub-sub-menu">
											<div>
												<a href="/ddstudio/communicate/usageinquiry.do">이용문의</a>
											</div>
											<div>
												<a href="/ddstudio/communicate/voc.do">칭찬/불편/건의</a>
											</div>
											<div>
												<a href="/ddstudio/communicate/lostproperty.do">분실물 찾기</a>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<a href="/ddstudio/user/search.do" class="nav-item nav-link index-navi">
							<div class="material-symbols-outlined nav-icon">search</div>
							<div class="nav-menu-name">검색</div>
						</a>
						<c:if test="${not empty email}">
							<a href="/ddstudio/ticket/select.do" class="nav-item nav-link index-navi">
								<div class="material-symbols-outlined nav-icon">book_online</div>
								<div class="nav-menu-name">예매</div>
							</a>
						</c:if>
						<c:if test="${empty email}">
							<a href="/ddstudio/user/login.do" class="nav-item nav-link index-navi">
								<div class="material-symbols-outlined nav-icon">book_online</div>
								<div class="nav-menu-name">예매</div>
							</a>
						</c:if>

					</div>
				</div>
				<c:if test="${empty email}">
					<div class="header-login">
						<a href="/ddstudio/user/login.do">로그인</a> <a href="/ddstudio/user/register.do">회원가입</a>
					</div>
				</c:if>
				<c:if test="${not empty email}">
					<div class="header-login" style="right: 3%;">
						<a href="/ddstudio/user/logout.do">로그아웃</a>
						<c:if test="${lv==1}">
							<a href="/ddstudio/member/mypage/info.do">마이페이지</a>
							<a href="/ddstudio/member/cart/list.do" class="cart-icon"><i class="fa-solid fa-cart-shopping"></i></a>
						</c:if>
						<c:if test="${lv==2}">
							<a href="/ddstudio/admin/adminpage.do">관리자페이지</a>
						</c:if>
					</div>
					<div>
						<span style="font-size: 15px; color: #CCC; margin-right: 60px;">${name}님 환영합니다!</span>
					</div>
				</c:if>
			</nav>
		</div>
		<div class="cloud-image"></div>
	</div>
</div>
<!-- Header End -->

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var subMenus = document.querySelectorAll('.navbar-nav .sub-menu');
		var subSubMenus = document.querySelectorAll('.navbar-nav .sub-sub-menu');

		function showMenu(menu) {
			menu.style.display = 'block';
		}

		function hideMenu(menu) {
			menu.style.display = 'none';
		}

		function attachEvents(parent, menu) {
			parent.addEventListener('mouseenter', function() {
				showMenu(menu);
			});

			parent.addEventListener('mouseleave', function() {
				hideMenu(menu);
			});
		}

		subMenus.forEach(function(menu) {
			attachEvents(menu.parentElement, menu);

			// Attach events for sub-sub-menus
			var subSubMenusInSubMenu = menu.querySelectorAll('.sub-sub-menu');
			subSubMenusInSubMenu.forEach(function(subSubMenu) {
				attachEvents(subSubMenu.parentElement, subSubMenu);
			});
		});

		subSubMenus.forEach(function(subSubMenu) {
			attachEvents(subSubMenu.parentElement, subSubMenu);
		});
	});
</script>

<!--
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var subMenus = document.querySelectorAll('.navbar-nav .sub-menu');
        var subSubMenus = document.querySelectorAll('.navbar-nav .sub-sub-menu');

        function showMenu(menu) {
            menu.style.display = 'block';
        }

        function hideMenu(menu) {
            setTimeout(function () {
                menu.style.display = 'none';
            }, 2000);
        }

        function attachEvents(parent, menu) {
            parent.addEventListener('mouseenter', function() {
                showMenu(menu);
            });

            parent.addEventListener('mouseleave', function() {
                hideMenu(menu);
            });
        }

        subMenus.forEach(function(menu) {
            attachEvents(menu.parentElement, menu);

            // Attach events for sub-sub-menus
            var subSubMenusInSubMenu = menu.querySelectorAll('.sub-sub-menu');
            subSubMenusInSubMenu.forEach(function(subSubMenu) {
                attachEvents(subSubMenu.parentElement, subSubMenu);
            });
        });

        subSubMenus.forEach(function(subSubMenu) {
            attachEvents(subSubMenu.parentElement, subSubMenu);
        });

        // Hide sub-sub-menu when mouse leaves both sub-menu and main nav-item
        subMenus.forEach(function(menu) {
            var mainNavItem = menu.parentElement;

            mainNavItem.addEventListener('mouseleave', function() {
                var subSubMenusInSubMenu = menu.querySelectorAll('.sub-sub-menu');
                subSubMenusInSubMenu.forEach(function(subSubMenu) {
                    hideMenu(subSubMenu);
                });
            });
        });
    });
</script>
-->