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
#email {
	width: 400px;
}

#cancel, #acceptok {
	margin-right: 10px;
}

#valid > tbody > tr:nth-child(5) > td > div > input {
	margin-left: -10px;
}

.certification {
	margin-left: 30px;
}

td > div > input {
	width: 80%;
}

.sub-title > p {
	font-size: 20px;
    font-weight: 800;
}

.button {
    border: none;
    border-radius: 5px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    background-color: white;
    box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.1);
    transition: background 0.3s ease, box-shadow 0.3s ease, color 0.3s ease;
}

/*
table {
	border-left: 2px solid #d1d1d1;
    border-right: 2px solid #d1d1d1;
    border-radius: 20px;
    border-collapse: separate;
    background: transparent;
}
*/

table th {
	padding: 0 0 0 10px;
}

td > div > input {
	background: transparent;
    border-bottom: 1.5px solid #cecece;
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
					<table id="valid">
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
							<th class="required">인증번호</th>
							<td>
								<div class="certification">
									<input type="text" name="authcode" placeholder="6자리 숫자" class="certificationNumber" autocomplete="off">
									<span class="certificationTime">03:00</span>
								</div>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<button type="button" id="acceptreq" class="acceptreq check button" disabled>요청</button>
									<button type="button" id="acceptok" class="check button" disabled>확인</button>
								</div>
							</td>
						</tr>
					</table>
					
					<div class="sub-title">
						<p>새로운 비밀번호 입력</p>
					</div>
					<table id="check">
						<!-- 비밀번호 필드와 에러 메시지 -->
						<tr>
							<th class="required">새로운 비밀번호</th>
							<td>
								<div>
									<input type="password" name="pw" id="pw" required class="middle-flat" disabled>
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
									<input type="password" name="pwok" id="pwok" required class="middle-flat" disabled>
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
									<button type="button" id="change" class="check button" disabled>변경</button>
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
	<script>
	    let countTime = 0; //타이머 초기값
	    let intervalCall; //타이머 식별
	    let authCode; //인증 코드
	    let popupLayer; //팝업 레이어
	
	    //타이머 시작
	    $.time = function (time) {
	        countTime = time; //시간 초기화
	        clearInterval(intervalCall); // 이전 타이머 중단
	        intervalCall = setInterval(alertFunc, 1000);
	    }
	
	    //타이머 중단
	    $.closeTime = function () {
	        clearInterval(intervalCall);
	    }
	
	    //타이머 호출
	    function alertFunc() {
	        let min = Math.floor(countTime / 60);
	        let sec = countTime - (60 * min);
	        
	        //타이머 출력
	        if (sec > 9) {
	            $('.certificationTime').text(min + ':' + sec + '');
	        } else {
	            $('.certificationTime').text(min + ':0' + sec + '');
	        }
	        
	        /* 인증번호 시간이 만료되면 재요청 필요 */
	        if (countTime <= 0) {
	            clearInterval(intervalCall); //타이머 중단
	            $('#acceptok').attr('disabled', 'disabled'); //확인 버튼 비활성화
	        }
	        
	        countTime--;
	    };
	
	    //인증번호 요청
	    $('.acceptreq').on("click", function () {
	        authCode = Math.floor(100000 + Math.random() * 900000); //랜덤한 6자리

	        // 기존에 열린 팝업이 있다면 닫기
	        if (popupLayer) {
	            popupLayer.remove();
	        }
	        
	        showPopup(authCode); //팝업으로 생성된 코드 출력
	
	        $('input[name="authcode"]').val(authCode); //생성된 코드를 인증번호 입력란에 입력
	        $('#acceptok').removeAttr('disabled'); //확인 버튼 활성화
	        $.time(179); //179초 타이머 시작
	    });
	
	    function showPopup(authCode) {
	        popupLayer = $('<div class="popup-layer"</div>');
	        let popupBox = $('<div class="popup-box"><p>인증번호: ' + authCode + '</p><button class="close-popup">Close</button></div>');
	
	        popupLayer.append(popupBox);
	
	        $('body').append(popupLayer);
	        $('.close-popup').on('click', function () {
	            popupLayer.remove();
	            popupLayer = null; // 팝업이 닫힐 때 변수 초기화
	        });
	    }
		
		$('#acceptok').on('click', function () {
	        let enteredCode = $('input[name="authcode"]').val();
	        $('#pw').val("");
	        $('#pwok').val("");
            $('#pw').prop('disabled', true);
            $('#pwok').prop('disabled', true);
	
	        if (authCode !== null && enteredCode === authCode.toString()) {
	            //alert('일치');
        	    $.ajax({
        	        type: 'POST',
        	        url: '/ddstudio/user/changepw.do',
        	        data: {
        	            email: $('#email').val(),
        	            tel: $('#tel').val(),
           	            pw: null
        	        },
        	        dataType: 'json',
        	        success: function (result) {
        	            if (result.cnt == 1) {
        	                alert("계정을 확인했습니다.");
        	                $('#pw').prop('disabled', false);
        	                $('#pwok').prop('disabled', false);
        	            } else {
        	                alert("해당 정보로 가입한 회원이 없습니다.");
        	                $('#pw').prop('disabled', true);
        	                $('#pwok').prop('disabled', true);
        	            }
        	        },
        	        errors: function(a,b,c) {
        				console.log(a,b,c);
        			}
        	    });
	        } else {
	            alert('인증번호가 일치하지 않습니다.');
	        }
	    });
		

		$('#change').on('click', function () {

       	    $.ajax({
       	        type: 'POST',
       	        url: '/ddstudio/user/changepw.do',
       	        data: {
    	            email: $('#email').val(),
    	            tel: $('#tel').val(),
       	            pw: $('#pw').val()
       	        },
       	        dataType: 'json',
       	        success: function (result) {
       	            if (result.message == 1) {
       	                alert("비밀번호를 변경했습니다.");
       	                window.location.replace('/ddstudio/index.do');
       	            } else {
       	                alert("비밀번호 변경에 실패했습니다.");
       	            }
       	        },
       	        errors: function(a,b,c) {
       				console.log(a,b,c);
       			}
       	    });
	    });
	</script>
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
		        
		        if (emailField.value.length === 0) {
		        	emailErrorDiv.textContent = "";
		        	emailErrorDiv.style.display = "none";
		        }

	            $('#pw').prop('disabled', true);
	            $('#pwok').prop('disabled', true);
	            $('#acceptok').attr('disabled', 'disabled');
	            
		        updateButtonStatus();
		        updateChangeButtonStatus();
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

	            $('#pw').prop('disabled', true);
	            $('#pwok').prop('disabled', true);
	            $('#acceptok').attr('disabled', 'disabled');
	            
		        updateButtonStatus();
		        updateChangeButtonStatus();
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
		        
		        $('input[name="authcode"]').val("");
		        $('#pw').val("");
		        $('#pwok').val("");
	            $('#pw').prop('disabled', true);
	            $('#pwok').prop('disabled', true);
	            $('#acceptok').attr('disabled', 'disabled');
		        
		        isValid = [false, false];
		        isPasswordValid = [false, false];
		        updateButtonStatus();
		        updateChangeButtonStatus();
		        
		        // 타이머 정지
			    clearInterval(intervalCall);

		        // 팝업 레이어 닫기
		        if (popupLayer) {
		            popupLayer.remove();
		            popupLayer = null;
		        }
		    });
		});
	</script>
</body>
</html>