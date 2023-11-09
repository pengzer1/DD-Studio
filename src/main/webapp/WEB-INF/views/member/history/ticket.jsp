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
					<div class="name">예매 내역</div>
					<div>
						<table>
							<tr>
								<th>내용</th>
								<th>방문일</th>
								<th>예매일</th>
								<th>혜택</th>
								<th>수량</th>
								<th>결제금액</th>
							</tr>
							<tr>
								<td>${dto.user_book_seq}</td>
								<td>${dto.visit_date}</td>
								<td>${dto.book_date}</td>
								<td>${dto.discount_rate}</td>
								<td>${dto.ea}</td>
								<td>${dto.price}</td>
							</tr>
							<tr>
								<td>1</td>
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
					<button class="button">예매 취소</button>
					<!-- 누르면 팝업으로 취소창 구현해야함..ㅋㅋ -->
					<!-- <button class="button" onclick="location.href='/ddstudio/member/history/ticket.do';">리뷰 작성</button> -->
				</div>

				<div class="wide-item">
					<div class="name">이전 예매 내역</div>
					<div>
						<table>
							<tr>
								<th>내용</th>
								<th>방문일</th>
								<th>예매일</th>
								<th>혜택</th>
								<th>수량</th>
								<th>결제금액</th>
							</tr>
							<tr>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
							<tr>
								<td>1</td>
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


