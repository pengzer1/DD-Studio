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
	width: 50%; /* 테이블의 너비를 조정합니다. */
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 8px;
	text-align: center;
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
					<div class="name">결제 내역</div>
					<div>
						<table>
							<tr>
								<td>${dto.ticket_book_seq}
									<div class="cell-content">내용 1-1</div>
								</td>
								<td>방문일
									<div class="cell-content">내용 1-2</div>
								</td>
							</tr>
							<tr>
								<td>예매일
									<div class="cell-content">내용 2-1</div>
								</td>
								<td>혜택
									<div class="cell-content">내용 2-2</div>
								</td>
							</tr>
							<tr>
								<td>수량
									<div class="cell-content">내용 3-1</div>
								</td>
								<td>결제금액
									<div class="cell-content">내용 3-2</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="buttons-container">
				<button class="button">예매 취소</button> <!-- 누르면 팝업으로 취소창 구현해야함..ㅋㅋ -->
				<!-- <button class="button" onclick="location.href='/ddstudio/member/history/ticket.do';">리뷰 작성</button> -->
				</div>
				
				<div class="wide-item">
					<div class="name">이전 결제 내역</div>
					<div>
						<table>
							<tr>
								<td>주문번호
									<div class="cell-content">내용 1-1</div>
								</td>
								<td>방문일
									<div class="cell-content">내용 1-2</div>
								</td>
							</tr>
							<tr>
								<td>예매일
									<div class="cell-content">내용 2-1</div>
								</td>
								<td>혜택
									<div class="cell-content">내용 2-2</div>
								</td>
							</tr>
							<tr>
								<td>수량
									<div class="cell-content">내용 3-1</div>
								</td>
								<td>결제금액
									<div class="cell-content">내용 3-2</div>
								</td>
							</tr>
						</table>
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


