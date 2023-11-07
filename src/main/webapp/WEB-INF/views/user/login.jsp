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
th input#email.middle, th input#pw.middle {
	color: #000;
	margin-top: 50px;
	width: 400px;
	height: 80px;
	padding: 10px;
	border: 1px solid #ccc;
	font-size: 16px;
	display: block;
	margin: -1px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

th input#email.middle {
	margin-top: 30px;
}

th input#pw.middle {
	margin-bottom: 30px;
}

th input#email.middle:focus, th input#pw.middle:focus {
	border-color: #000;
}

th input#pw.middle {
	border-top: 0;
}

th input#email.middle+th input#pw.middle {
	margin-top: 0;
}

.button {
	width: 120px;
	height: 40px;
	font-size: 16px;
	margin: 10px;
	background-color: transparent;
	border: 1px solid #ccc;
}

table.vertical {
    margin: 0 auto;
    text-align: center;
}

</style>
</head>
<body>
	<!-- login.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>로그인</h2>
		</div>

		<div id="sub-title">
			<p>회원 이메일과 비밀번호로 로그인하세요.</p>
		</div>

		<div id="content">
			<div class="wide-item">

				<form method="POST" action="/ddstudio/user/login.do">
					<table class="vertical">
						<tr>
							<th><input type="text" name="email" id="email" required
								class="middle"></th>
						</tr>
						<tr>
							<th><input type="text" name="pw" id="pw" required
								class="middle"></th>
						</tr>
					</table>

					<div>
						<button type="button" class="button find" onclick="location.href='/ddstudio/index.do';">아이디 찾기</button>
						<button type="button" class="button find" onclick="location.href='/ddstudio/index.do';">비밀번호 찾기</button>
					</div>
					<div>
						<button type="submit" class="button login">로그인</button>
					</div>
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
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		window.addEventListener('load', function() {
			// 이메일과 비밀번호 입력란을 가져옵니다.
			const emailInput = document.getElementById('email');
			const passwordInput = document.getElementById('pw');

			// 초기값을 설정합니다.
			const emailPlaceholder = '이메일';
			const passwordPlaceholder = '비밀번호';

			// 이메일 입력란에 초기값 설정
			emailInput.value = emailPlaceholder;

			// 비밀번호 입력란에 초기값 설정
			passwordInput.value = passwordPlaceholder;

			// 이메일 입력란에 포커스를 주면 초기값을 지우고 내용을 입력할 수 있게 합니다.
			emailInput.addEventListener('focus', function() {
				if (emailInput.value === emailPlaceholder) {
					emailInput.value = '';
				}
			});

			// 이메일 입력란에서 포커스를 잃으면 초기값이 표시되도록 합니다.
			emailInput.addEventListener('blur', function() {
				if (emailInput.value === '') {
					emailInput.value = emailPlaceholder;
				}
			});

			// 비밀번호 입력란에 포커스를 주면 초기값을 지우고 내용을 입력할 수 있게 합니다.
			passwordInput.addEventListener('focus', function() {
				if (passwordInput.value === passwordPlaceholder) {
					passwordInput.value = '';
					passwordInput.type = 'password'; // 입력 중에 비밀번호를 숨김 문자로 표시
				}
			});

			// 비밀번호 입력란에서 포커스를 잃으면 초기값이 표시되고, 다시 일반 텍스트로 표시합니다.
			passwordInput.addEventListener('blur', function() {
				if (passwordInput.value === '') {
					passwordInput.value = passwordPlaceholder;
					passwordInput.type = 'text'; // 포커스를 잃으면 다시 일반 텍스트로 표시
				}
			});
		});
	</script>
</body>
</html>