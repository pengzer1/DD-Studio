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
td input.middle-flat {
	color: #000;
	margin-top: 50px;
	width: 400px;
	height: 40px;
	padding: 10px;
	border: 1px solid #ccc;
	font-size: 16px;
	margin: 0;
	margin-left: 15px;
	align-items: center;
	justify-content: center;
}

td>div {
	padding: 10px;
}

#email {
	width: 270px;
}

#post-code {
	width: 228px;
}

#birth-button {
	width: 40px;
}

form {
	margin-top: 20px;
}

td input.middle-flat:focus {
	border-color: #000;
}

.button-container {
	margin-top: 20px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.button {
	width: 90px;
	margin-left: 10px;
	height: 40px;
	font-size: 16px;
	background-color: transparent;
	border: 1px solid #ccc;
}

.email>.check {
	width: 120px;
}

.address>.check {
	width: 160px;
}

table {
	width: 600px;
	margin: 0 auto;
}

.error-message {
	font-size: 14px;
	padding: 5px;
}

th.required::before {
	content: "* ";
	color: cornflowerblue;
}

#main {
	text-align: center;
	margin-top: 150px;
}

#sub-title {
	width: 80%;
	text-align: center;
	border-top: 2px solid black;
	margin: 50px auto 0;
	justify-content: center;
	align-items: center;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- change-pw.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>비밀번호 변경</h1>

		<div id="sub-title">
			<p>회원정보입력</p>
		</div>

		<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/user/changepw.do">
					
				</form>
			</div>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->
		
	<script>
		
	</script>
</body>
</html>