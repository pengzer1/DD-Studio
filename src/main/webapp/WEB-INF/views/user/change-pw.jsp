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
	/* border: 1px solid #ccc; */
	font-size: 16px;
	margin: 0;
	margin-left: 15px;
	align-items: center;
	justify-content: center;
}

td>div {
	padding: 10px;
}

#post-code {
	width: 228px;
}

#birth-button {
	width: 40px;
}

#acceptnum {
	width: 192px;
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

#cancel {
	margin-right: 13px;
}

#main {
	text-align: center;
	margin-top: 150px;
}

.sub-title {
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

		<div class="sub-title">
			<p>회원정보입력</p>
		</div>

		<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/user/changepw.do">
					<table>
						<!-- 이메일 필드와 에러 메시지 -->
						<tr>
							<th class="required">이메일 (아이디)</th>
							<td>
								<div class="email">
									<input type="text" name="email" id="email" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
						    <th></th>
						    <td>
						        <div id="email-error" class="error-message" style="display:none;"></div>
						        <span id="duplicate-check-message" class="error-message" style="display:none;"></span>
						    </td>
						</tr>
						 <!-- 연락처 필드와 에러 메시지 -->
						<tr>
							<th class="required">연락처</th>
							<td>
								<div>
									<input type="text" name="tel" id="tel" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
						    <th></th>
						    <td>
						        <div id="tel-error" class="error-message" style="display:none;"></div>
						    </td>
						</tr>
						
						<tr>
							<th>
								<div>인증번호</div>
							</th>
							<td>
								<div>
									<input type="text" name="acceptnum" id="acceptnum" required class="middle-flat">
									<button type="submit" id="acceptreq" class="check button" disabled>요청</button>
									<button type="submit" id="acceptok" class="check button" disabled>확인</button>
								</div>
							</td>
						</tr>
						
						<!-- 비밀번호 필드와 에러 메시지 -->
						<tr>
							<th class="required">새로운 비밀번호</th>
							<td>
								<div>
									<input type="password" name="pw" id="pw" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
						    <th></th>
						    <td>
						        <div id="pw-error" class="error-message" style="display:none;"></div>
						    </td>
						</tr>
						<!-- 비밀번호 확인 필드와 에러 메시지 -->
						<tr>
							<th class="required">비밀번호 확인</th>
							<td>
								<div>
									<input type="password" name="pwok" id="pwok" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
						    <th></th>
						    <td>
						        <div id="pw-confirm-error" class="error-message" style="display:none;"></div>
						    </td>
						</tr>
						
						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<button type="submit" id="change" class="check button" disabled>변경</button>
									<button type="button" id="cancel" class="button" onclick="location.href='/ddstudio/user/login.do';">취소</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->
		
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		let isValid = [false, false]; // 검사 결과 저장
		let isPasswordValid = [false, false]; // 비밀번호 검사 결과 저장
		
		document.addEventListener("DOMContentLoaded", function () {
			
			const acceptReqButton = document.getElementById("acceptreq");
			const changeButton = document.getElementById("change");
	
		    function updateButtonStatus() {
		        const isAllValid = isValid.every((value) => value);
	
		        if (isAllValid) {
		        	acceptReqButton.removeAttribute("disabled");
		            //document.getElementById("ok-message").textContent = "true";
		        } else {
		        	acceptReqButton.setAttribute("disabled", "disabled");
		            //document.getElementById("ok-message").textContent = "false";
		        }
		    }
		    
		    function updateChangeButtonStatus() {
		        const isAllPasswordValid = isPasswordValid.every((value) => value);
	
		        if (isAllPasswordValid) {
		            changeButton.removeAttribute("disabled");
		            //document.getElementById("ok-message").textContent = "true";
		        } else {
		        	changeButton.setAttribute("disabled", "disabled");
		            //document.getElementById("ok-message").textContent = "false";
		        }
		    }
		    
	        /* 이메일 유효성 검사 */
		    const emailField = document.getElementById("email");
		    const emailErrorDiv = document.getElementById("email-error");
		    const emailRegex = /^[a-z0-9._%+-]{1,20}\@[a-z0-9.-]{1,8}\.[a-z]{1,5}$/;
	        
		    emailField.addEventListener("input", function () {
		    	isValid[0] = emailRegex.test(emailField.value);
		    	
		        emailErrorDiv.textContent = isValid[0] ? "" : "올바른 이메일 형식을 입력하세요. (예: park@email.com)";
		        emailErrorDiv.style.display = isValid[0] ? "none" : "block";

		        $('#duplicate-check-message').css('display', 'none');
		        
		        if (emailField.value.length === 0) {
		        	emailErrorDiv.textContent = "";
		        	emailErrorDiv.style.display = "none";
		        }
	            
		        updateButtonStatus();
		    });
	        
	        /* 연락처 유효성 검사 */
		    const telField = document.getElementById("tel");
		    const telErrorDiv = document.getElementById("tel-error");
	        const telRegex = /^010-[0-9]{4}-[0-9]{4}$/; // 010-XXXX-XXXX 형식의 전화번호
	
		    telField.addEventListener("input", function () {
		    	isValid[1] = telRegex.test(telField.value);
	
		        telErrorDiv.textContent = isValid[1] ? "" : "올바른 전화번호 형식을 입력하세요. (예: 010-XXXX-XXXX)";
		        telErrorDiv.style.display = isValid[1] ? "none" : "block";
	
		        if (telField.value.length === 0) {
		            telErrorDiv.textContent = "";
		            telErrorDiv.style.display = "none";
		        }
		        
		        updateButtonStatus();
		    });

		    /* 비밀번호 유효성 검사 */
		    const passwordField = document.getElementById("pw");
		    const passwordErrorDiv = document.getElementById("pw-error");
		    const passwordConfirmField = document.getElementById("pwok");
		    const passwordConfirmErrorDiv = document.getElementById("pw-confirm-error");
	        const passwordRegex = /^(?=.*[0-9])(?=.*[A-Za-z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/
	        
		    passwordField.addEventListener("input", function () {
		    	isPasswordValid[0] = passwordRegex.test(passwordField.value);
		    	isPasswordValid[1] = passwordConfirmField.value === passwordField.value;
	
		        passwordErrorDiv.textContent = isPasswordValid[0] ? "" : "8-15자의 영문/숫자/특수문자를 함께 입력하세요.";
		        passwordErrorDiv.style.display = isPasswordValid[0] ? "none" : "block";
		        
		        passwordConfirmErrorDiv.textContent = isPasswordValid[1] ? "" : "비밀번호가 동일하지 않습니다.";
		        passwordConfirmErrorDiv.style.display = isPasswordValid[1] ? "none" : "block";
	
		        if (passwordField.value.length === 0) {
		            passwordErrorDiv.textContent = "";
		            passwordErrorDiv.style.display = "none";
		        }
	
		        if (passwordConfirmField.value.length === 0) {
		            passwordConfirmErrorDiv.textContent = "";
		            passwordConfirmErrorDiv.style.display = "none";
		        }
		        
		        updateChangeButtonStatus();
		    });
	
		    /* 비밀번호 확인 유효성 검사 */
		    passwordConfirmField.addEventListener("input", function () {
		    	isPasswordValid[1] = passwordConfirmField.value === passwordField.value;
		        
		        passwordConfirmErrorDiv.textContent = isPasswordValid[1] ? "" : "비밀번호가 동일하지 않습니다.";
		        passwordConfirmErrorDiv.style.display = isPasswordValid[1] ? "none" : "block";
		        
		        if (passwordConfirmField.value.length === 0) {
		            passwordConfirmErrorDiv.textContent = "";
		            passwordConfirmErrorDiv.style.display = "none";
		        }
		        
		        updateChangeButtonStatus();
		    });
		    
		    const cancelButton = document.getElementById("cancel");
	
		    cancelButton.addEventListener("click", function () {
		        emailField.value = "";
		        passwordField.value = "";
		        passwordConfirmField.value = "";
		        telField.value = "";
	
		        emailErrorDiv.style.display = "none";
		        passwordErrorDiv.style.display = "none";
		        passwordConfirmErrorDiv.style.display = "none";
		        telErrorDiv.style.display = "none";
		        
		        isValid = [false, false];
		        isPasswordValid = [false, false];
		        updateButtonStatus();
		        updateChangeButtonStatus();
		    });
		});
	</script>
</body>
</html>