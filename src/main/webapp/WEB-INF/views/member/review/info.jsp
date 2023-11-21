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
	text-align: right;
	margin-top: 20px;
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

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #007bff;
	color: #fff;
}

a {
	text-decoration: none;
	color: #1f1f1f;
	font-weight: bold;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

#content {
	margin-top: 100px;
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

		<div id="title" style="background-image: url('/ddstudio/asset/image/kazetachinu042.jpg');">
			<h2>리뷰</h2>
			<p></p>
		</div>

		<div id="content">
			<div class="wide-multi-content-container">
				<div class="container">
					<h2>리뷰 내역</h2>
					<table>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.review_seq}</td>
									<td><a
										href='/ddstudio/member/review/detail.do?seq=${dto.review_seq}'>${dto.subject}</a></td>
									<td>${dto.regdate}</td>
									<td>${dto.readcount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="buttons-container">
						<button class="button"
							onclick="location.href='/ddstudio/member/review/add.do';">리뷰작성</button>
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


