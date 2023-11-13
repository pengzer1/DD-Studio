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
	#main{
		margin-top:150px;
	}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">
		<h1> 운휴 등록하기</h1>
		<form method="POST" action="/ddstudio/guide/serviceadd.do"
			enctype="multipart/form-data" onsubmit="return validateForm()">
			<div id="category-box">
				<table>
					<tr>
						<td>
							<select name="category" id="category">
								<option value="attraction">어트랙션</option>
								<option value="shop">기프트샵</option>
								<option value="theater">영화관</option>
								<option value="restaurant">식당</option>
							</select>
							<c:if test=${ }
							<input type="date" name="birth" id="birth" required class="middle-flat">
							<input type="date" name="birth" id="birth" required class="middle-flat">
						</td>
					</tr>
				</table>
			</div>

			<div id="button-list">
				<button type="submit" id="add-button">등록</button>
				<button type="button" id="back-button"
					onclick="location.href='/ddstudio/guide/service.do';">취소</button>
			</div>
		</form>



	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


