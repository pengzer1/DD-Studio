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
	margin-top: 100px;
}

.form-group {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	width: 35%;
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

tbody tr:hover {
	background-color: #cce5ff; /* 호버됐을 때 배경색 변경 */
	cursor: pointer; /* 호버됐을 때 커서 모양 변경 */
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

		<div id="title" style="background-image: url('/ddstudio/asset/image/chihiro014.jpg');">
			<h2>문의 내역</h2>
		</div>

		<div class="container">
			<h2 class="name">문의 내역</h2>
			<div class="form-group">
				<select id="sel1">
					<option value="tblInquiry" selected>이용문의</option>
					<option value="tblVOC">칭찬/불편/건의</option>
				</select>
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
					<c:forEach items="${list}" var="dto">
						<c:if test="${option == 'tblInquiry'}">
							<tr
								onclick="location.href='/ddstudio/member/history/inquiry/detail.do?seq=${dto.seq}';">
						</c:if>
						<c:if test="${option == 'tblVOC'}">
							<tr
								onclick="location.href='/ddstudio/member/history/voc/detail.do?seq=${dto.seq}';">
						</c:if>
						<td>${dto.seq}</td>
						<td>${dto.type}</td>
						<td>${dto.subject}</td>
						<td>${dto.regdate}</td>
						<c:if test="${empty dto.answer}">
							<td>답변 대기</td>
						</c:if>
						<c:if test="${not empty dto.answer}">
							<td>답변 완료</td>
						</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		$("#sel1")
				.change(
						function() {

							location.href = '/ddstudio/member/history/inquiry/inquiry.do?option='
									+ $(this).val();

						});

		$('#sel1').val('${option}');
	</script>

</body>
</html>


