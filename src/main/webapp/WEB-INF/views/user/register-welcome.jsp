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
#main > #title {
	margin-top: 0;
}

th input#email.middle-high, th input#pw.middle-high {
	color: #000;
	margin-top: 50px;
	width: 400px;
	height: 80px;
	padding: 10px;
	border: 1px solid #ccc;
	font-size: 16px;
	margin: -1px; /* 이메일 비밀번호 상자 연결 */
	flex-direction: column;
	align-items: center;
}

th input#email.middle-high {
	margin-top: 30px;
}

th input#pw.middle-high {
	margin-bottom: 30px;
}

th input#email.middle-high:focus, th input#pw.middle-high:focus {
	border-color: #000;
}

th input#pw.middle-high {
	border-top: 0;
}

th input#email.middle-high+th input#pw.middle-high {
	margin-top: 0;
}

.button-container {
    display: flex;
    justify-content: space-between;
}

.button {
	width: 183px;
	height: 40px;
	font-size: 16px;
	background-color: transparent;
	border: 1px solid #ccc;
}

#check {
	background-color: cornflowerblue;
}

table.vertical {
	margin: 0 auto;
	text-align: center;
}

.round-button {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	font-size: 16px;
	margin-left: 50px;
	background-color: transparent;
	border: 1px solid #ccc;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- register-welcome.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>환영합니다!</h2>
			<br>
			<p>DD STUDIO에 회원가입되셨습니다.</p>
		</div>
		
		<div id="sub-title">
			<p>회원 이메일과 비밀번호로 로그인하세요.</p>
		</div>

		<div id="content">
			<div class="wide-item">

				<form method="POST" action="/ddstudio/user/login.do">
					<table class="vertical">
						<tr>
							<th><input type="text" name="email" id="email" required class="middle-high" placeholder="이메일"></th>
							<td rowspan="2">
								<button class="login round-button" id="login check" onclick="location.href='/ddstudio/user/login.do';">로그인</button>
							</td>
						</tr>
						<tr>
							<th><input type="password" name="pw" id="pw" required class="middle-high" placeholder="비밀번호"></th>
						</tr>
						<tr>
							<td>
								<div class="button-container">
									<button type="button" class="button" onclick="location.href='/ddstudio/user/find-id.do';">아이디 찾기</button>
									<button type="button" class="button" onclick="location.href='/ddstudio/user/change-pw.do';">비밀번호 변경</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


