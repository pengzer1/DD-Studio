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
#category-add {
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

#form-table tr>th {
	width: 100px;
}

#form-table tr>td {
	width: 400px;
}

#form-table tr>td>input {
	width: 100%;
	height: 100%;
}

#admin-btn {
	float: center;
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: center;
}

#admin-btn button {
	margin: 3px;
	border: 0;
	border-radius: 10px;
	padding: 10px 20px;
	color: #fff;
	cursor: pointer;
	background-color: #E6AAAE;
}

.back-btn {
	background-color: #6c757d;
}

.add-btn {
	background-color: #007bff;
}

#main_box{
	border: 1px solid black;
	width:380px;
	/* height:100px; */
	padding-top:5px;
	margin: 0 auto;
}

#content_box{
	border: 1px solid black;
	align-items: center;
	width: 100px;
	height: 30px;
	padding:5px;
	margin:5px 10px;
	
}
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="category-add">
		<h1>
			카테고리 <small>등록하기</small>
		</h1>

		<hr id="add-line" />
		
		<div id="main_box">
			<p style="text-align:center;">현재 등록되어 있는 카테고리 종류입니다.</p>
			<hr>
			<div style="display: flex; flex-wrap:wrap; align-items:center; margin-left: 10px;">
			<c:forEach items="${list}" var="dto">
				<div id="content_box">
					<p>${dto.name}</p>
				</div>
			</c:forEach>
			</div>
		</div>
		
		<hr id="bottom-line">
		
		 <div id="add-content">
			<form name="categoryForm" method="POST"
				action="/ddstudio/admin/categoryadd.do">
				<table id="form-table">
					<tbody>
						<tr>
							<th>카테고리명</th>
							<td><input type="text" name="name" id="categoryName"
								required autofocus></td>
						</tr>
					</tbody>
				</table>
		 </div>
		<div id="admin-btn">
			<button type="button" class="back-btn" onclick="location.href='/ddstudio/admin/category.do';">
				<i class="fa-regular fa-circle-xmark"></i>취소
			</button>
			<button type="submit" class="add-btn">
				<i class="fa-solid fa-plus"></i>등록
			</button>
		</div>
		</form>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>