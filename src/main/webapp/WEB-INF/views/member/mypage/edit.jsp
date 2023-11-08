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
#main>#title, .item div {
	background-color: white;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input[type="text"], .form-group input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.form-group input[type="password"] {
	margin-bottom: 10px;
}

.form-group input[type="tel"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.address-group {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.address-group input[type="text"] {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.btn-container {
	text-align: center;
	margin-top: 20px;
}

.btn {
	padding: 10px 20px;
	background-color: #0074cc;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn.cancel {
	background-color: #ccc;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>회원정보 수정</h2>
			<br>
			<p></p>
		</div>

		<div id="content">
			<div id="condition">
				<h3>회원정보 수정</h3>
			</div>

			<div class="container">
				<form action="/update_profile" method="post">
					<div class="form-group">
						<label for="email">이메일</label> <input type="email" id="email"
							name="email" required>
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							id="password" name="password" required>
					</div>
					<div class="form-group">
						<label for="confirmPassword">비밀번호 확인</label> <input
							type="password" id="confirmPassword" name="confirmPassword"
							required>
					</div>
					<div class="form-group">
						<label for="name">이름</label> <input type="text" id="name"
							name="name" required>
					</div>
					<div class="form-group">
						<label for="birthdate">생년월일</label> <input type="text"
							id="birthdate" name="birthdate" required>
					</div>
					<div class="form-group">
						<label for="phoneNumber">연락처</label> <input type="tel"
							id="phoneNumber" name="phoneNumber" required>
					</div>
					<div class="form-group">
						<label for="postalCode">우편번호</label> <input type="text"
							id="postalCode" name="postalCode" required>
					</div>
					<div class="address-group">
						<input type="text" id="basicAddress" name="basicAddress"
							placeholder="기본 주소" required> <input type="text"
							id="detailAddress" name="detailAddress" placeholder="상세 주소"
							required>
					</div>
					<div class="btn-container">
						<button type="submit" class="btn" onclick="location.href='/ddstudio/member/mypage/info.do'">수정</button>
						<button type="button" class="btn cancel" onclick="location.href='/ddstudio/member/mypage/info.do'">취소</button>
					</div>
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


