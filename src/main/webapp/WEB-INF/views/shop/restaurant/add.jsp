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
			<p>식당정보입력</p>
		</div>

		<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/shop/restaurant/add.do">
					<table>
						<!-- 이메일 필드와 에러 메시지 -->
						<tr>
							<th class="required">식당명</th>
							<td>
								<div class="name">
									<input type="text" name="name" id="name" required class="middle-flat">
								</div>
							</td>
						</tr>
						<!-- 비밀번호 필드와 에러 메시지 -->
						<tr>
							<th class="required">대표 메뉴</th>
							<td>
								<div>
									<input type="text" name="menu" id="menu" required class="middle-flat" placeholder="여기에 이름을 입력해주세요">
								</div>
							</td>
						</tr>
						<!-- 비밀번호 확인 필드와 에러 메시지 -->
						<tr>
							<th class="required">운영 시간</th>
							<td>
								<div>
									<input type="time" name="time" id="time" required class="short-flat">
									<input type="time" name="time" id="time" required class="short-flat">
								</div>
							</td>
						</tr>
						<!-- 이름 필드와 에러 메시지 -->
						<tr>
							<th class="required">수용 인원</th>
							<td>
								<div>
									<input type="text" name="capacity" id="capacity" required class="middle-flat">
								</div>
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
								<div class="button-container">
									<!-- validateAndSubmit 함수로 가입 버튼 클릭 시 유효성 검사 -->
									<!-- <div id="ok-message"></div> -->
									<button type="submit" id="join" class="check button" disabled>추가</button>
									<button type="button" id="cancel" class="button" onclick="location.href='/ddstudio/shop/restaurant.do';">취소</button>
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
const inputs = document.querySelectorAll('input[required]');
    
    // 모든 입력 요소에 대한 이벤트 리스너를 추가합니다.
    inputs.forEach(input => {
        input.addEventListener('input', function() {
            let allFilled = true;
            inputs.forEach(requiredInput => {
                // 어느 하나의 input이 비어있다면 버튼을 비활성화합니다.
                if (requiredInput.value === '') {
                    allFilled = false;
                }
            });

            // 모든 input이 채워졌다면 버튼을 활성화합니다.
            const joinButton = document.getElementById('join');
            if (allFilled) {
                joinButton.disabled = false;
            } else {
                joinButton.disabled = true;
            }
        });
    });
	</script>
	
</body>
</html>