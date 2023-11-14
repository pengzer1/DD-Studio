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
#cancel {
	margin-right: 15px;
}

#duplicate-check {
	padding: 0;
}
</style>
</head>
<body>
	<!-- register.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>식당 추가</h1>

		<div class="sub-title">
			<p>회원정보입력</p>
		</div>

		<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/user/register.do">
					<table>
						<!-- 이메일 필드와 에러 메시지 -->
						<tr>
							<th class="required">이메일 (아이디)</th>
							<td>
								<div class="email">
									<input type="text" name="email" id="email" required class="middle-flat">
									<input type="button" id="duplicate-check" class="button check" disabled value="중복검사"></input>
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
									<input type="date" name="birth" id="birth" required class="middle-flat">
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
							<th></th>
							<td>
								<div class="button-container">
									<!-- validateAndSubmit 함수로 가입 버튼 클릭 시 유효성 검사 -->
									<!-- <div id="ok-message"></div> -->
									<button type="submit" id="join" class="check button" disabled>가입</button>
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
		
	<script>
		let isValid = [false, false, false, false, false, false, false]; // 검사 결과 저장
		
		/* 이메일 (아이디) 중복 검사 */
		$('#duplicate-check').click(function(){
			$.ajax({
				type: 'POST',
				url: '/ddstudio/user/duplicatecheck.do',
				data: {
					email: $('#email').val()
				},
				dataType: 'json',
				success: function(result) {
					//alert(result.message); //사용 가능(0) 사용중(1)
					
					if (result.message == 0) {
						//console.log("true");
					    $('#duplicate-check-message').css('display', 'block');
						$('#duplicate-check-message').text('사용 가능한 아이디입니다.');
						$('#join').prop('disalbed', false);
						
						isValid[1] = true;
					}
					else {
						//console.log("false");
					    $('#duplicate-check-message').css('display', 'block');
						$('#duplicate-check-message').text('이미 사용중인 아이디입니다.');
						$('#join').prop('disalbed', true);
						
						isValid[1] = false;
					}
				},
				errors: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});
	
		// 이메일(아이디)를 수정하면 가입 불가능
		$('#email').change(function() {
			$('#join').prop('disabled', true);
		});
		
		document.addEventListener("DOMContentLoaded", function () {
			
			const joinButton = document.getElementById("join");
	
		    function updateButtonStatus() {
		        const isAllValid = isValid.every((value) => value);
	
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
		    const emailRegex = /^[a-z0-9._%+-]{1,20}\@[a-z0-9.-]{1,8}\.[a-z]{1,5}$/;

			const duplicateCheck = document.getElementById("duplicate-check");
	        
		    emailField.addEventListener("input", function () {
		    	isValid[0] = emailRegex.test(emailField.value);
		    	isValid[1] = false;
		    	
		        emailErrorDiv.textContent = isValid[0] ? "" : "올바른 이메일 형식을 입력하세요. (예: park@email.com)";
		        emailErrorDiv.style.display = isValid[0] ? "none" : "block";

		        $('#duplicate-check-message').css('display', 'none');
		        
		        if (emailField.value.length === 0) {
		        	emailErrorDiv.textContent = "";
		        	emailErrorDiv.style.display = "none";
		        }
	
		        if (isValid[0]) {
		        	duplicateCheck.removeAttribute("disabled");
		        } else {
		        	duplicateCheck.setAttribute("disabled", "disabled");
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
		    	isValid[2] = passwordRegex.test(passwordField.value);
		    	isValid[3] = passwordConfirmField.value === passwordField.value;
	
		        passwordErrorDiv.textContent = isValid[2] ? "" : "8-15자의 영문/숫자/특수문자를 함께 입력하세요.";
		        passwordErrorDiv.style.display = isValid[2] ? "none" : "block";
		        
		        passwordConfirmErrorDiv.textContent = isValid[3] ? "" : "비밀번호가 동일하지 않습니다.";
		        passwordConfirmErrorDiv.style.display = isValid[3] ? "none" : "block";
	
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
		    	isValid[3] = passwordConfirmField.value === passwordField.value;
		        
		        passwordConfirmErrorDiv.textContent = isValid[3] ? "" : "비밀번호가 동일하지 않습니다.";
		        passwordConfirmErrorDiv.style.display = isValid[3] ? "none" : "block";
		        
		        if (passwordConfirmField.value.length === 0) {
		            passwordConfirmErrorDiv.textContent = "";
		            passwordConfirmErrorDiv.style.display = "none";
		        }
	
		        updateButtonStatus();
		    });
		    
		    /* 이름 유효성 검사 */
		    const nameField = document.getElementById("name");
		    const nameErrorDiv = document.getElementById("name-error");
	        const nameRegex = /^[가-힣]{2,6}$/; // 2글자에서 6글자의 한글 이름만 허용
	
		    nameField.addEventListener("input", function () {
		    	isValid[4] = nameRegex.test(nameField.value);
		        
		        nameErrorDiv.textContent = isValid[4] ? "" : "2-6자의 한글 이름을 입력하세요.";
		        nameErrorDiv.style.display = isValid[4] ? "none" : "block";
	
		        if (nameField.value.length === 0) {
		            nameErrorDiv.textContent = "";
		            nameErrorDiv.style.display = "none";
		        }
	
		        updateButtonStatus();
		    });
	        
	        /* 생년월일 유효성 검사 */
		    const birthField = document.getElementById("birth");
		    const birthErrorDiv = document.getElementById("birth-error");
		    const birthRegex = /^(19|20)\d\d-[0-1]\d-[0-3]\d$/; // YYYY-MM-DD 형식
	
		    birthField.addEventListener("input", function () {
		    	isValid[5] = birthRegex.test(birthField.value);
	
		        birthErrorDiv.textContent = isValid[5] ? "" : "올바른 생년월일 형식을 입력하세요. (예: YYYY-MM-DD)";
		        birthErrorDiv.style.display = isValid[5] ? "none" : "block";

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
		    	isValid[6] = telRegex.test(telField.value);
	
		        telErrorDiv.textContent = isValid[6] ? "" : "올바른 전화번호 형식을 입력하세요. (예: 010-XXXX-XXXX)";
		        telErrorDiv.style.display = isValid[6] ? "none" : "block";
	
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
		        $('#duplicate-check-message').css('display', 'none');
	
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
	
</body>
</html>