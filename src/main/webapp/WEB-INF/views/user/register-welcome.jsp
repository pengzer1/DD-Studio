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
#auto-login {
	display: flex;
	justify-content: space-between;
}

#auto-login .button {
	width: 100px;
}

h2 small {
	font-size: 80%;
}

.button-container {
	margin-top: 0;
    display: flex;
    justify-content: space-between;
}

.button {
	width: 183px;
	margin-left: 0;
	height: 40px;
	font-size: 16px;
	border: 1px solid #ccc;
    border-radius: 5px;
    background-color: white;
    box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.1);
}

/* 
.button {
    background: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
    transition: background 0.3s ease, box-shadow 0.3s ease, color 0.3s ease;
}
 
.button:hover {
    background: #0056b3;
    color: #fff;
    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);
}
 */
 
.round-button {
    background: #007bff;
    background: linear-gradient(to right, #6bC2ff, #007bff);
    color: #fff;
    border: none;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
    transition: background 0.3s ease, box-shadow 0.3s ease, color 0.3s ease;
}

.round-button:hover {
    /* background: #0056b3; */
    color: #fff;
    box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2);
}

#main {
	margin-top: 100px;
}

#main > .sub-title {
	border-top: 0;
	margin-top: 0;
}

.sub-title > p {
	margin-bottom: 0;    
	font-size: 20px;
    font-weight: 800;
}

#title {
	margin-top: 123px;
	background-image: url('/ddstudio/asset/image/background-8.jpg');
}

/*
#title {
    background-image: url('/ddstudio/asset/image/background-4.jpg');
}
*/

#title > h2 {
	color: white;
}
</style>
</head>
<body>
	<!-- login.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>환영합니다!</h2>
			<br>
			<p>DD STUDIO에 회원가입되셨습니다.</p>
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
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>