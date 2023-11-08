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
table, td, th {
	/* border: 1px solid #CCC; */
	
}

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
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

td>div {
	padding: 10px;
}

#email {
	width: 270px;
}

#postal-code {
	width: 230px;
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

.id>.check {
	width: 120px;
}

.address>.check {
	width: 160px;
}

button.check {
	background-color: cornfrowerblue;
}

table.vertical {
	margin: 0 auto;
}
</style>
</head>
<body>
	<!-- login.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title">
			<h2>회원가입</h2>
		</div>

		<div id="sub-title">
			<p>회원정보입력</p>
		</div>

		<div id="content">
			<div class="wide-item">

				<form method="POST" action="/ddstudio/user/login.do">
					<table class="vertical">
						<tr>
							<th>이메일 (아이디)</th>
							<td>
								<div class="id">
									<input type="text" name="email" id="email" required class="middle-flat">
									<button type="button" class="button check">중복검사</button>
								</div>
							</td>
						</tr>
						<tr>
						    <th></th>
						    <td>
						        <div id="email-error" class="email-error-message" style="display:none;"></div>
						    </td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<div>
									<input type="text" name="pw" id="pw" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<div>
									<input type="text" name="pwok" id="pwok" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<div>
									<input type="text" name="name" id="name" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<div>
									<input type="text" name="birth" id="birth" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>
								<div>
									<input type="text" name="tel" id="tel" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<div class="address">
									<input type="text" name="postal-code" id="postal-code" required
									class="middle-flat" placeholder="우편번호">
									<button type="button" class="button check">우편번호 검색</button>
								</div>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<div class="address">
									<input type="text" name="address-basis" id="address-basis"
										required class="middle-flat" placeholder="기본주소">
								</div>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<div class="address">
									<input type="text" name="address-detail" id="address-detail"
										required class="middle-flat" placeholder="상세주소">
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="2">
								<div class="button-container">
									<button type="button" id="check" class="button"
										onclick="location.href='/ddstudio/index';">가입</button>
									<button type="button" id="cancle" class="button"
										onclick="location.href='/ddstudio/index';">취소</button>
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
	document.addEventListener("DOMContentLoaded", function () {
	    const emailField = document.getElementById("email");
	    const emailErrorDiv = document.getElementById("email-error");

	    emailField.addEventListener("input", function () {
	        const emailRegex = /^[a-z0-9]{6,16}$/;
	        const isValidEmail = emailRegex.test(emailField.value);

	        emailErrorDiv.textContent = isValidEmail ? "" : "아이디는 6-16자의 영어 소문자와 숫자만 허용됩니다.";
	        emailErrorDiv.style.display = isValidEmail ? "none" : "block";
	    });

	    const checkButton = document.querySelector(".button.check");
	    checkButton.addEventListener("click", function () {
	        emailErrorDiv.textContent = "";
	        emailErrorDiv.style.display = "none";
	    });
	});

	</script>
</body>
</html>