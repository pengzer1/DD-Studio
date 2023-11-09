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

table {
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
}

table, th, td {
	border: 1px solid #333;
}

th, td {
	padding: 10px;
	text-align: center;
}

th {
	background-color: #333;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:nth-child(odd) {
	background-color: #fff;
}

.wide-multi-content-container {
	display: flex;
	justify-content: space-between;
	gap: 20px; /* 테이블 간격을 조정합니다. */
}

.buttons-container {
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
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>예매 확인/취소</h2>
			<br>
			<p></p>
		</div>

		<hr>

		<div id="sub-title">
			<h3></h3>
		</div>

		<div id="content">

			<div class="wide-multi-content-container">
				<div class="wide-item">
					<div class="name">예약 내역</div>
					<div>
						<table>
							<tr>
								<th>어트랙션 이름</th>
								<th>예약번호</th>
								<th>예약일자</th>
								<th>예약시간</th>
								<th>예약인원</th>
							</tr>
							<tr>
								<td>${dto.name}</td>
								<td>${dto.attraction_book_seq}</td>
								<td>${dto.regdate}</td>
								<td>${dto.book_time}</td>
								<td>${dto.capacity}</td>
							</tr>
							<tr>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
							<!-- 여기에 추가 결제 내역을 추가할 수 있습니다. -->
						</table>
					</div>
				</div>

				<div class="buttons-container">
					<button class="button">예약 취소</button>
					<!-- 누르면 팝업으로 취소창 구현해야함..ㅋㅋ -->
				</div>

				<div class="wide-item">
					<div class="name">이전 예약 내역</div>
					<div>
						<table>
							<tr>
								<th>어트랙션 이름</th>
								<th>예약번호</th>
								<th>예약일자</th>
								<th>예약시간</th>
								<th>예약인원</th>
							</tr>
							<tr>
								<td>${dto.name}</td>
								<td>${dto.attraction_book_seq}</td>
								<td>${dto.regdate}</td>
								<td>${dto.book_time}</td>
								<td>${dto.capacity}</td>
							</tr>
							<tr>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
							<!-- 여기에 추가 결제 내역을 추가할 수 있습니다. -->
						</table>
					</div>
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


