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
.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-group {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.form-group select {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.search-box {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
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

#main>#title, .item div {
	background-color: white;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>문의 내역</h2>
			<br>
		</div>



		<div class="container">
			<h2>문의 내역</h2>
			<div class="form-group">
				<select>
					<option value="이용문의">이용문의</option>
					<option value="칭찬/불편/건의">칭찬/불편/건의</option>
				</select> <input type="text" class="search-box" placeholder="검색">
			</div>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>문의 유형</th>
						<th>제목</th>
						<th>등록일</th>
						<th>답변 상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 문의 내역 목록을 여기에 추가할 수 있습니다. -->
					<tr>
						<td>1</td>
						<td>이용문의</td>
						<td>결제 관련 문의</td>
						<td>2023-11-15</td>
						<td>미답변</td>
					</tr>
					<tr>
						<td>2</td>
						<td>불편</td>
						<td>서비스 오류 신고</td>
						<td>2023-11-16</td>
						<td>답변 완료</td>
					</tr>
					<!-- 추가 문의 내역을 여기에 추가할 수 있습니다. -->
				</tbody>
			</table>
		</div>

		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


