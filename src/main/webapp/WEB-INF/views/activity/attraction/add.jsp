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
	#attraction-add {
		text-align: center;
		margin-top: 150px;
	}
	
	#add-line {
		color: #777;
	}
	
	#add-content {
		display: flex;
		justify-content: center;
		text-align: left;
	}
	
	#form-table tr > th {
		width: 200px;
	}
	
	#form-table tr > td {
		width: 400px;
	}
	
	#form-table tr > td > input {
		width: 100%;
		height: 100%;
	}
	
</style>
</head>
<body>
	<!-- /ddstudio/activity/attraction/add.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="attraction-add">
		<h1>어트랙션 <small>추가하기</small></h1>
		
		<hr id="add-line"/>
		<div id="add-content">
			<form method="POST" action="/ddstudio/activity/attractionadd.do">
				<table id="form-table">
					<tbody>
						<tr>
							<th>어트랙션명</th>
							<td><input type="text" name="name"/></td>
						</tr>
						<tr>
							<th>운영시간</th>
							<td><input type="text" name="time"/></td>
						</tr>
						<tr>
							<th>탑승인원</th>
							<td><input type="text" name="capacity"/></td>
						</tr>
						<tr>
							<th>이용정보</th>
							<td><input type="text" name="restriction"/></td>
						</tr>
						<tr>
							<th>위치</th>
							<td>
								<select name="location" id="location-select" class="selectbox">
									<c:forEach items="${locationList}" var="dto">
									<option value="${dto.info}">${dto.info}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>테마</th>
							<td>
								<select name="theme" id="theme-select" class="selectbox">
									<c:forEach items="${themeList}" var="dto">
									<option value="${dto.name}">${dto.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>해시태그</th>
							<td>
								<input type="text" name="hashtag" id="hashtag-text"/>
								<%-- <select name="hashtag" id="hashtag-select" class="selectbox">
									<c:forEach items="${hashtagList}" var="dto">
									<option value="${dto.name}">${dto.name}</option>
									</c:forEach>
								</select> --%>
							</td>
						</tr>
						<tr>
							<th>이미지</th>
							<td><input type="file" name="img1"/></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


