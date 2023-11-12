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
#cancel, #acceptok {
	margin-right: 35px;
}
</style>
</head>
<body>
	<!-- find-id.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>아이디 찾기</h1>

		<div class="sub-title">
			<p>회원정보입력</p>
		</div>

		<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/user/findid.do">
					<table id="valid">
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
								<div id="name-error" class="error-message" style="display: none;"></div>
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
								<div id="tel-error" class="error-message" style="display: none;"></div>
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
						<p>본인 이메일 (아이디) 확인</p>
					</div>
					<table id="check">
						<!-- 본인 이메일 확인 필드 -->
						<tr>
							<th>이메일 (아이디)</th>
							<td>
								<div>
									<input type="text" name="myid" id="myid" class="middle-flat" style="pointer-events: none;">
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="2">
								<div class="button-container">
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
	
	    /* 인증번호 확인 */
	    $('#acceptok').on('click', function () {
	        let enteredCode = $('input[name="authcode"]').val();
	        $('#myid').val("");
	
	        if (authCode !== null && enteredCode === authCode.toString()) {
	            //alert('일치');
        		$.ajax({
        			type: 'POST',
        			url: '/ddstudio/user/findid.do',
        			data: {
        				name: $('#name').val(),
        				tel: $('#tel').val()
        			},
        			dataType: 'json',
        			success: function(result) {
        				//alert(result.email);

        				if (result.email != null) {
        					$('#myid').val(result.email);
        				} else {
        					$('#myid').val('해당 정보로 가입한 회원이 없습니다.');
        				}
        			},
        			errors: function(a,b,c) {
        				console.log(a,b,c);
        			}
        		});
	        } else {
	            alert('인증번호가 일치하지 않습니다.');
	            //toastr.error('인증번호가 일치하지 않습니다.', '인증 오류');
       			/* Swal.fire({
		            icon: 'error',
		            title: '인증번호 불일치',
		            text: '인증번호가 일치하지 않습니다.',
		        }); */
	        }
	    });
	</script>
	<script>
		let isValid = [false, false]; // 검사 결과 저장
		
		document.addEventListener("DOMContentLoaded", function () {
			
			const acceptReqButton = document.getElementById("acceptreq");
	
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
		    
		    /* 이름 유효성 검사 */
		    const nameField = document.getElementById("name");
		    const nameErrorDiv = document.getElementById("name-error");
	        const nameRegex = /^[가-힣]{2,6}$/; // 2글자에서 6글자의 한글 이름만 허용
	
		    nameField.addEventListener("input", function () {
		    	isValid[0] = nameRegex.test(nameField.value);
		        
		        nameErrorDiv.textContent = isValid[0] ? "" : "2-6자의 한글 이름을 입력하세요.";
		        nameErrorDiv.style.display = isValid[0] ? "none" : "block";
	
		        if (nameField.value.length === 0) {
		            nameErrorDiv.textContent = "";
		            nameErrorDiv.style.display = "none";
		        }

		        $('#acceptok').attr('disabled', 'disabled');
		        
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

		        $('#acceptok').attr('disabled', 'disabled');
		        
		        updateButtonStatus();
		    });
	        
		    const cancelButton = document.getElementById("cancel");
		    
		    cancelButton.addEventListener("click", function () {
		        nameField.value = "";
		        telField.value = "";
		        nameErrorDiv.style.display = "none";
		        telErrorDiv.style.display = "none";
		        $('#acceptok').attr('disabled', 'disabled');
		        $('input[name="authcode"]').val("");
		        $('#myid').val("");
		        
		        isValid = [false, false];
		        updateButtonStatus();

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