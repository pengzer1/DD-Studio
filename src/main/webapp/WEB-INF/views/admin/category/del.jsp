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
#category-del {
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
	width: 200px;
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

.del-btn {
	background-color: #007bff;
}
</style>
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="category-del">
		<h1>
			카테고리 <small>삭제하기</small>
		</h1>

		<hr id="add-line" />
		<div id="add-content">
			<form name="categoryForm" method="POST"
				action="/ddstudio/admin/categorydel.do">
				<table id="form-table">
					<tbody>
						<tr>
							<th>카테고리명</th>
							<td>
								<select name="category_name">
									<c:forEach items="${list}" var="dto">  <!-- Catedorydel.java가 보낸 list에서 for문 돌리기 -->
                            			<option value="${dto.category_seq}">${dto.name}</option>
                        			</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
		</div>
		<div id="admin-btn">
			<button type="button" class="back-btn" onclick="location.href='/ddstudio/admin/category.do';">
				<i class="fa-regular fa-circle-xmark"></i>취소
			</button>
			<button type="submit" class="del-btn">
				<i class="fa-solid fa-trash"></i>삭제
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