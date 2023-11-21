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

.name {
	font-weight: bold;
	font-size: 24px;
}

.wide-multi-content-container {
	display: flex;
	justify-content: space-between;
	gap: 20px; /* 테이블 간격을 조정합니다. */
}

.buttons-container {
	margin-top: 20px;
	position: relative;
	text-align: center;
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

#content {
	margin-top: 100px;
}

.cart-container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	width: 80%; /* 변경된 부분: 전체 폭의 80%로 조정 */
	margin: 0 auto;
	padding: 20px;
}

table {
	width: 100%; /* 변경된 부분: 테이블을 100%로 확장 */
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 15px; /* 변경된 부분: 셀 내부의 패딩을 조금 늘림 */
	text-align: center;
}

th {
	background-color: #007bff;
	color: #fff;
}

#overlay-div {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 400px;
	background-color: black;
	opacity: 0.4; /* 투명도 조절 */
	z-index: 1; /* 다른 요소들보다 위에 위치하도록 설정 */
}

#title h2 {
	color: #ddd;
}

#title h2, #title p {
	z-index: 2;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style=" background-image: url('/ddstudio/asset/image/background-1.jpg');">
		<div id="overlay-div"></div>
			<h2>장바구니</h2>
		</div>

		<hr>

		<div class="cart-container">
			<header>
				<h3>장바구니</h3>
			</header>
			<form method="post" action="/ddstudio/member/purchase/view.do">
				<table>
					<thead>
						<tr>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>합계</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.name}</td>
								<td>${dto.price}</td>
								<td>${dto.ea}</td>
								<td>${dto.total_price}</td>
								<td class="checkbox-col"><input type="checkbox"
									name="reservationCheckbox" class="cart-checkbox" value="${dto.user_cart_seq}"></td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
				<c:if test="${not empty list}">
				<div class="buttons-container">
					<button type="submit" id="orderButton" class="button" disabled>주문하기</button>
				</div>
				</c:if>
			</form>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		var checkboxes = document.querySelectorAll(".cart-checkbox");
		var orderButton = document.getElementById("orderButton");

		checkboxes.forEach(function(checkbox) {
			checkbox.addEventListener("change", function() {
				var checkedCheckboxes = document
						.querySelectorAll(".cart-checkbox:checked");
				orderButton.disabled = checkedCheckboxes.length === 0;
			});
		});
	</script>
</body>
</html>