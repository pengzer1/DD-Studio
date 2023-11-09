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
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>구매 내역</h2>

		</div>

		<hr>

		<div id="sub-title">
			<h3></h3>
		</div>

		<div id="content">

			<div class="container">
				<h2>주문 내역</h2>
				<table>
					<thead>
						<tr>
							<th>샵 이름</th>
							<th>품목</th>
							<th>수량</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<!-- 첫 번째 품목 -->
						<tr>
							<td>${dto.shopName}</td>
							<td>${dto.itemName}</td>
							<td>${dto.ea}</td>
							<td>${dto.price}</td>
						</tr>
						<!-- 두 번째 품목 -->
						<tr>
							<td>샵 B</td>
							<td>품목 2</td>
							<td>1</td>
							<td>$15.00</td>
						</tr>
						<!-- 세 번째 품목 -->
						<tr>
							<td>샵 C</td>
							<td>품목 3</td>
							<td>3</td>
							<td>$30.00</td>
						</tr>
					</tbody>
				</table>
				<!-- 추가 품목 별 내용을 여기에 추가할 수 있습니다. -->
			</div>

			<div class="buttons-container">
				<button class="button">주문 취소</button> <!-- 팝업창구현 -->
			</div>

			<div class="container">
				<h2>이전 기프트샵 구매 내역</h2>
				<table>
					<thead>
						<tr>
							<th>샵 이름</th>
							<th>품목</th>
							<th>수량</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<!-- 첫 번째 품목 -->
						<tr>
							<td>샵 A</td>
							<td>품목 1</td>
							<td>2</td>
							<td>$20.00</td>
						</tr>
						<!-- 두 번째 품목 -->
						<tr>
							<td>샵 B</td>
							<td>품목 2</td>
							<td>1</td>
							<td>$15.00</td>
						</tr>
						<!-- 세 번째 품목 -->
						<tr>
							<td>샵 C</td>
							<td>품목 3</td>
							<td>3</td>
							<td>$30.00</td>
						</tr>
					</tbody>
				</table>
				<!-- 추가 품목 별 내용을 여기에 추가할 수 있습니다. -->
			</div>

		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


