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


#main > #title, .item div {
	background-color: white;
}

button {
    background-color: #007bff; /* 배경색 */
    color: #fff; /* 텍스트 색상 */
    border: none;
    border-radius: 5px; /* 둥근 모서리 */
    padding: 10px 20px; /* 내부 패딩 */
    font-size: 16px; /* 폰트 크기 */
    text-align: center;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 */
}

button:hover {
    background-color: #0056b3; /* 마우스 호버 시 배경색 변경 */
}


</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>마이페이지</h2>
			<br>
		</div>
		
		<hr>
		
		<div id="sub-title">
			<h3>${name}님 안녕하세요!</h3>
		</div>

		<div id="content">
			
			<div class="wide-content-container">
				<div class="wide-item">
					<div style="background-image: url('/ddstudio/asset/image/놀이기구.png'); background-size: 50px 50px;"></div>
					<div><button type="button" onclick="location.href='/ddstudio/member/history/ticket.do';">예매 확인/취소</button></div>
				</div>
				<div class="wide-item">
					<div style="background-image: url('/ddstudio/asset/image/놀이기구.png'); background-size: 50px 50px;"></div>
					<div><button type="button" onclick="location.href='/ddstudio/member/history/reservation.do';">어트랙션 예약 확인/취소</button></div>
				</div>
				<!-- 추가 아이템들 -->
			</div>
			
			
			<div class="munti-content-container">
				<div class="item">
					<div style="background-color: white; background-image: url('/ddstudio/asset/image/토토로.png');"></div>
					<div><button type="button" onclick="location.href='/ddstudio/member/mypage/edit.do';">정보수정</button></div>
				</div>
				<div class="item">
					<div style="background-color: white; background-image: url('/ddstudio/asset/image/토토로.png');"></div>
					<div><button type="button" onclick="location.href='/ddstudio/member/purchase/history.do';">구매내역</button></div>
				</div>
				<div class="item">
					<div style="background-color: white; background-image: url('/ddstudio/asset/image/토토로.png');"></div>
					<div><button type="button" onclick="location.href='/ddstudio/member/history/inquiry/inquiry.do';">문의내역</button></div>
				</div>
				<div class="item">
					<div style="background-color: white; background-image: url('/ddstudio/asset/image/토토로.png');"></div>
					<div><button type="button" onclick="location.href='/ddstudio/member/review/info.do';">리뷰관리</button></div>
				</div>
				<div class="item">
					<div style="background-color: white; background-image: url('/ddstudio/asset/image/토토로.png');"></div>
					<div><button type="button" onclick="location.href='/ddstudio/member/unregister/confirm.do';">회원탈퇴</button></div>
				</div>
			</div>
			
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


