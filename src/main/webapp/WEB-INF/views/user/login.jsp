<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/ddstudio/asset/css/main.css">
<link rel="stylesheet" href="/ddstudio/asset/css/user.css">
<style>
.button-container {
    display: flex;
    justify-content: space-between;
}

.button {
	width: 183px;
	margin-left: 0;
	height: 40px;
	font-size: 16px;
	background-color: transparent;
	border: 1px solid #ccc;
}

.button-container {
	margin-top: 0;
}
</style>
</head>
<body>
	<!-- login.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title">
			<h2>로그인</h2>
		</div>

		<div class="sub-title">
			<p>회원 이메일과 비밀번호로 로그인하세요.</p>
		</div>

		<div id="content">
			<div class="wide-item">

				<form method="POST" action="/ddstudio/user/login.do">
					<table>
						<tr>
							<th><input type="text" name="email" id="email" required class="middle-high" placeholder="이메일"></th>
						</tr>
						<tr>
							<th><input type="password" name="pw" id="pw" required class="middle-high" placeholder="비밀번호"></th>
							<td><button class="login round-button" id="login check" onclick="location.href='/ddstudio/user/login.do';">로그인</button></td>
						</tr>
						<tr>
							<td>
								<div class="button-container">
									<button type="button" class="button" onclick="location.href='/ddstudio/user/findid.do';">아이디 찾기</button>
									<button type="button" class="button" onclick="location.href='/ddstudio/user/changepw.do';">비밀번호 변경</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>

			<!-- 자동 로그인 시작 (추후 삭제) -->
			<hr>
			
			<h2>자동 로그인 (관리자용)</h2>
			<div id="form-list">
				<form method="POST" action="/ddstudio/user/login.do">
					<input type="hidden" name="email" value="park@example.com">
					<input type="hidden" name="pw" value="1111">
					<button type="submit" class="login">박나래</button>
				</form>
				<form method="POST" action="/ddstudio/user/login.do">
					<input type="hidden" name="email" value="hwang@example.com">
					<input type="hidden" name="pw" value="1111">
					<button type="submit" class="login">황주원</button>
				</form>
				<form method="POST" action="/ddstudio/user/login.do">
					<input type="hidden" name="email" value="cha@example.com">
					<input type="hidden" name="pw" value="1111">
					<button type="submit" class="login">차민재</button>
				</form>
				<form method="POST" action="/ddstudio/user/login.do">
					<input type="hidden" name="email" value="admin@example.com">
					<input type="hidden" name="pw" value="1111">
					<button type="submit" class="login">관리자</button>
				</form>
			</div>
			<!-- 자동 로그인 끝 -->
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>