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