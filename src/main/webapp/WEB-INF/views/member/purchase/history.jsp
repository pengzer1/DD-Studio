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
#main>#title, .item div {
	background-color: white;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 100px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #0074cc;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.button {
	background-color: #0074cc;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button:hover {
	background-color: #0056a4;
}

.button-container {
	position: relative;
}

#content{
	margin-top: 100px;
}

.name {
	font-weight: bold;
	font-size: 24px;
	color: #686A6F;
	text-align:center;
}

#title h2 {
	color:white;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style="background-image: url('/ddstudio/asset/image/chihiro048.jpg');">
			<h2>구매 내역</h2>
		</div>

		<div id="content">
			<div class="container">
				<h2 class="name">주문 내역</h2>
				<hr>
				<table>
					<thead>
						<tr>
							<th>샵 이름</th>
							<th>품목</th>
							<th>수량</th>
							<th>가격</th>
							<th>결제일</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.shopName}</td>
								<td>${dto.itemName}</td>
								<td>${dto.ea}</td>
								<td>${dto.price}</td>
								<td>${dto.buy_date}</td>
								<td class="checkbox-col"><input type="checkbox"
									name="reservationCheckbox" value="${dto.user_buy_seq}">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="buttons-container">
					<button class="button" id="delete-button">주문 취소</button>
				</div>

			</div>

			<div class="container">
				<h2 class="name">이전 기프트샵 구매 내역</h2>
				<hr>
				<table>
					<thead>
						<tr>
							<th>샵 이름</th>
							<th>품목</th>
							<th>수량</th>
							<th>가격</th>
							<th>결제일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${plist}" var="dto">
							<tr>
								<td>${dto.shopName}</td>
								<td>${dto.itemName}</td>
								<td>${dto.ea}</td>
								<td>${dto.price}</td>
								<td>${dto.buy_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 추가 품목 별 내용을 여기에 추가할 수 있습니다. -->
			</div>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		$('#delete-button').click(
				function() {
					var result = confirm("정말 예매를 취소하시겠습니까?");

					if (result) {
						var selectedUserBookSeqs = $(
								'input[name="reservationCheckbox"]:checked')
								.map(function() {
									return this.value;
								}).get();

						// 선택된 예매 정보를 서버로 전송
						$.ajax({
							type : 'POST',
							url : '/ddstudio/member/purchasedel.do',
							data : {
								user_buy_seq : selectedUserBookSeqs
							},
							traditional : true,

							dataType : 'json',
							success : function(data) { //data == { "result" : 1 }
								// 서버에서의 응답에 대한 처리
								// 예를 들면, 삭제 후에 어떤 동작을 할지에 대한 로직을 추가할 수 있습니다.
								if (data.result == 1) {
									location.reload(); // 예제로 새로고침을 수행하도록 했습니다.
								} else {
									alert('failed');
								}
							},
							error : function() {
								alert('예매 취소에 실패했습니다.');
							}
						});
					} else {
						return false;
					}
				});
	</script>
</body>
</html>


