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

		<div id="title">
			<h2>로그인</h2>
			<br>
			<p>내용을 입력하세요</p>
		</div>

		<div id="sub-title">
			<h3>제목</h3>
		</div>

		<div id="content">

			<form method="POST" action="/ddstidio/user/login.do">
				<table class="vertical">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" id="id" required class="middle"></td>
					</tr>
					<tr>
						<th>암호</th>
						<td><input type="password" name="pw" id="pw" required class="middle"></td>
					</tr>
				</table>
				<div>
					<button type="button" class="back" onclick="location.href='/ddstudio/index.do';">돌아가기</button>
					<button type="submit" class="login">로그인</button>
				</div>
			</form>

			<hr>
			<h2>자동 로그인 (관리자용)</h2>
			<div id="form-list">
				<form method="POST" action="/ddstudio/user/login.do">
					<input type="hidden" name="id" value="isaac"> <input
						type="hidden" name="pw" value="1111">
					<button type="submit" class="login">아이작</button>
				</form>
				<form method="POST" action="/ddstudio/user/login.do">
					<input type="hidden" name="id" value="sopia"> <input
						type="hidden" name="pw" value="1111">
					<button type="submit" class="login">소피아</button>
				</form>
				<form method="POST" action="/ddstudio/user/login.do">
					<input type="hidden" name="id" value="admin"> <input
						type="hidden" name="pw" value="1111">
					<button type="submit" class="login">관리자</button>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


