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
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>추가하기</h2>
			<br>
			<p>내용을 입력하세요</p>
		</div>
		
		<div id="sub-title">
			<h3>추가하기</h3>
		</div>

		<div id="content">
		
		<form method="POST" action="/ddstudio/activity/attractionadd.do">
			<table>
				<tbody>
					<tr>
						<th>어트랙션명</th>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<th>위치</th>
						<td>
						<select name="" id="">
							<c:forEach>
							<option value="${} }"></option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<th>운영시간</th>
						<td><input type="text" name="time"/></td>
					</tr>
					<tr>
						<th>수용인원</th>
						<td><input type="text" name="capacity"/></td>
					</tr>
					<tr>
						<th>이용정보</th>
						<td><input type="text" name="restriction"/></td>
					</tr>
					<tr>
						<th>테마</th>
						<td><input type="text" name="theme"/></td>
					</tr>
					<tr>
						<th>해시태그</th>
						<td><input type="text" name="hashtag"/></td>
					</tr>
					<tr>
						<th>이미지</th>
						<td><input type="text" name="img"/></td>
					</tr>
				</tbody>
			</table>
			</form>
		
			<div class="wide-multi-content-container">
				<div class="wide-item">
					<div>아이템 2</div>
					<div>아이템 2 설명</div>
				</div>
				<div class="wide-item">
					<div>아이템 2</div>
					<div>아이템 2 설명</div>
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


