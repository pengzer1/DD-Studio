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

#post-code {
	width: 228px;
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

button.check {

}

table.vertical {
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

.formcontrol {
	display: !flex;
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
				<form method="POST" action="/ddstudio/user/register.do">
					<table class="vertical">
						<!-- 이메일 필드와 에러 메시지 -->
						<tr>
							<th class="required">이메일 (아이디)</th>
							<td>
								<div class="email">
									<input type="text" name="email" id="email" required class="middle-flat">
									<button type="button" class="button check">중복검사</button>
								</div>
							</td>
						</tr>
						<tr>
						    <th></th>
						    <td>
						        <div id="email-error" class="error-message" style="display:none;"></div>
						    </td>
						</tr>
						<!-- 비밀번호 필드와 에러 메시지 -->
						<tr>
							<th class="required">비밀번호</th>
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
						<!-- 이름 필드와 에러 메시지 -->
						<tr>
							<th class="required">이름</th>
							<td>
								<div>
									<input type="text" name="name" id="name" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
						    <th></th>
						    <td>
						        <div id="name-error" class="error-message" style="display:none;"></div>
						    </td>
						</tr>
						<!-- 생년월일 필드와 에러 메시지 -->
						<tr>
							<th class="required">생년월일</th>
							<td>
								<div>
									<input type="text" name="birth" id="birth" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
						    <th></th>
						    <td>
						        <div id="birth-error" class="error-message" style="display:none;"></div>
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
						<!-- 주소 필드 -->
						<tr>
							<th>주소</th>
							<td>
								<div class="address">
									<input type="text" name="post-code" id="post-code" class="middle-flat" placeholder="우편번호">
									<button type="button" class="button check" onclick="execDaumPostcode()">우편번호 검색</button>
								</div>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<div class="address">
									<input type="text" name="address-basis" id="address-basis" class="middle-flat" placeholder="기본주소">
								</div>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<div class="address">
									<input type="text" name="address-detail" id="address-detail" class="middle-flat" placeholder="상세주소">
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="2">
								<div class="button-container">
									<!-- validateAndSubmit 함수로 가입 버튼 클릭 시 유효성 검사 -->
									<!-- <div id="ok-message"></div> -->
									<button type="submit" id="join" class="check button">가입</button>
									<button type="button" id="cancel" class="button" onclick="location.href='/ddstudio/index.do';">취소</button>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	document.addEventListener("DOMContentLoaded", function () {

		let isValid = [false, false, false, false, false, false]; // 검사 결과 저장
		
		const joinButton = document.getElementById("join");

	    function updateButtonStatus() {
	        const isAllValid = isValid.every((value) => value);
	        console.log(isValid);

	        if (isAllValid) {
	            joinButton.removeAttribute("disabled");
	            //document.getElementById("ok-message").textContent = "true";
	        } else {
	            joinButton.setAttribute("disabled", "disabled");
	            //document.getElementById("ok-message").textContent = "false";
	        }
	    }
	    
        /* 이메일 유효성 검사 */
	    const emailField = document.getElementById("email");
	    const emailErrorDiv = document.getElementById("email-error");
        const emailRegex = /^[a-z0-9]{6,16}$/;
        
	    emailField.addEventListener("input", function () {
	    	isValid[0] = emailRegex.test(emailField.value);
	        
	        emailErrorDiv.textContent = isValid[0] ? "" : "6-16자의 영어 소문자와 숫자를 입력하세요.";
	        emailErrorDiv.style.display = isValid[0] ? "none" : "block";
	        
	        if (emailField.value.length === 0) {
	        	emailErrorDiv.textContent = "";
	        	emailErrorDiv.style.display = "none";
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
	    	isValid[1] = passwordRegex.test(passwordField.value);
	    	isValid[2] = passwordConfirmField.value === passwordField.value;

	        passwordErrorDiv.textContent = isValid[1] ? "" : "8-15자의 영문/숫자/특수문자를 함께 입력하세요.";
	        passwordErrorDiv.style.display = isValid[1] ? "none" : "block";
	        
	        passwordConfirmErrorDiv.textContent = isValid[2] ? "" : passwordConfirmErrorDiv.textContent = "비밀번호가 동일하지 않습니다.";
	        passwordConfirmErrorDiv.style.display = isValid[2] ? "none" : "block";

	        if (passwordField.value.length === 0) {
	            passwordErrorDiv.textContent = "";
	            passwordErrorDiv.style.display = "none";
	        }

	        if (passwordConfirmField.value.length === 0) {
	            passwordConfirmErrorDiv.textContent = "";
	            passwordConfirmErrorDiv.style.display = "none";
	        }

	        updateButtonStatus();
	    });

	    /* 비밀번호 확인 유효성 검사 */
	    passwordConfirmField.addEventListener("input", function () {
	    	isValid[2] = passwordConfirmField.value === passwordField.value;
	        
	        passwordConfirmErrorDiv.textContent = isValid[2] ? "" : passwordConfirmErrorDiv.textContent = "비밀번호가 동일하지 않습니다.";
	        passwordConfirmErrorDiv.style.display = isValid[2] ? "none" : "block";
	        
	        if (passwordConfirmField.value.length === 0) {
	            passwordConfirmErrorDiv.textContent = "";
	            passwordConfirmErrorDiv.style.display = "none";
	        }

	        updateButtonStatus();
	    });
	    
	    /* 이름 유효성 검사 */
	    const nameField = document.getElementById("name");
	    const nameErrorDiv = document.getElementById("name-error");
        const nameRegex = /^[가-힣]{1,8}$/; // 1글자에서 8글자의 한글 이름만 허용

	    nameField.addEventListener("input", function () {
	    	isValid[3] = nameRegex.test(nameField.value);
	        
	        nameErrorDiv.textContent = isValid[3] ? "" : "1-8자의 한글 이름을 입력하세요.";
	        nameErrorDiv.style.display = isValid[3] ? "none" : "block";

	        if (nameField.value.length === 0) {
	            nameErrorDiv.textContent = "";
	            nameErrorDiv.style.display = "none";
	        }

	        updateButtonStatus();
	    });
        
        /* 생년월일 유효성 검사 */
	    const birthField = document.getElementById("birth");
	    const birthErrorDiv = document.getElementById("birth-error");
        const birthRegex = /^[0-9]{8}$/; // 8자리 숫자 형식 (예: 19960814)

	    birthField.addEventListener("input", function () {
	    	isValid[4] = birthRegex.test(birthField.value);

	        birthErrorDiv.textContent = isValid[4] ? "" : "올바른 생년월일 형식을 입력하세요. (예: 19960814)";
	        birthErrorDiv.style.display = isValid[4] ? "none" : "block";

	        if (birthField.value.length === 0) {
	            birthErrorDiv.textContent = "";
	            birthErrorDiv.style.display = "none";
	        }

	        updateButtonStatus();
	    });
	    
        /* 연락처 유효성 검사 */
	    const telField = document.getElementById("tel");
	    const telErrorDiv = document.getElementById("tel-error");
        const telRegex = /^010-[0-9]{4}-[0-9]{4}$/; // 010-XXXX-XXXX 형식의 전화번호

	    telField.addEventListener("input", function () {
	    	isValid[5] = telRegex.test(telField.value);

	        telErrorDiv.textContent = isValid[5] ? "" : "올바른 전화번호 형식을 입력하세요. (예: 010-XXXX-XXXX)";
	        telErrorDiv.style.display = isValid[5] ? "none" : "block";

	        if (telField.value.length === 0) {
	            telErrorDiv.textContent = "";
	            telErrorDiv.style.display = "none";
	        }
	        
	        updateButtonStatus();
	    });
        
	    const cancelButton = document.getElementById("cancel");

	    const postCodeField = document.getElementById("post-code");
	    const addressBasisField = document.getElementById("address-basis");
	    const addressDetailField = document.getElementById("address-detail");
	    
	    cancelButton.addEventListener("click", function () {
	        emailField.value = "";
	        passwordField.value = "";
	        passwordConfirmField.value = "";
	        nameField.value = "";
	        birthField.value = "";
	        telField.value = "";
	        postCodeField.value = "";
	        addressBasisField.value = "";
	        addressDetailField.value = "";

	        emailErrorDiv.style.display = "none";
	        passwordErrorDiv.style.display = "none";
	        passwordConfirmErrorDiv.style.display = "none";
	        nameErrorDiv.style.display = "none";
	        birthErrorDiv.style.display = "none";
	        telErrorDiv.style.display = "none";
	        
	        isValid = [false, false, false, false, false, false, false];
	        updateButtonStatus();
	    });
	});
	</script>
	
	<!-- 주소 입력 폼 -->
	<script>
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = '';
					var extraAddr = '';

					if (data.userSelectedType === 'R') { // 도로명 주소 선택
						addr = data.roadAddress;
					} else { // 지번 주소 선택
						addr = data.jibunAddress;
					}

					if (data.userSelectedType === 'R') {
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
					} else {
						document.getElementById("address-basis").value = '';
					}

					// 우편번호와 주소 정보를 input 박스에 삽입
					document.getElementById('post-code').value = data.zonecode;
					document.getElementById("address-basis").value = addr;
					document.getElementById("address-basis").value += extraAddr;
					document.getElementById("address-detail").focus(); // 상세주소로 포커스 이동
				}
			}).open();
		}
	</script>
</body>
</html>