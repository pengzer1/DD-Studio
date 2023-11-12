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

.middle-flat {
	color: #000;
	margin-top: 50px;
	width: 400px;
	height: 40px;
	padding: 10px;
	border: 1px solid #ccc;
	font-size: 16px;
	margin: 0;
	align-items: center;
	justify-content: center;
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

form>#condition {
	box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.4);
	text-align: center;
	background-color: cornflowerblue;
	height: 70px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-bottom: 15px;
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

#personnel {
	display: flex;
 	flex-wrap: wrap;
 	
}

#personnel > div {
  flex: 0 0 calc(33.33% - 20px);
  align-text: center;
  margin: 10px;
  justify-content: space-around;
  align-items: center;
  
}

ul {
list-style-type: none;
margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    font-size: 14px;
}

li {
	display: inline-block;
    width: 32%;
    position: relative;
        vertical-align: top;
}

.personnel ul li .txt_wrap {
    float: left;
    padding-bottom: 0;
    text-align: left;
    width: 53%;
    display: block;
}

.personnel ul li .txt_wrap .tit {
    margin: 0;
    padding: 0;
    border: 0;
    color: #505050;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    margin-top: 0;
    margin-bottom: 1rem;
}

.personnel ul li .count_wrap {
    float: right;
    margin-top: 3px;
    /* width: 120px; */
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>개인 예매</h2>
		</div>

		<div id="content">


			<div class="container">
				<form action="/ddstudio/ticket/group-reservation.do" method="post">
					<div id="condition">
						<h3>예약자 정보</h3>
					</div>
					<div class="form-group">
						<label for="name">이름</label> <input type="text" id="name"
							name="name" required value=${name } disabled>
					</div>
					<div class="form-group">
						<label for="email">이메일</label> <input type="text" id="email"
							name="email" value=${email } disabled>
					</div>
					<div id="condition">
						<h3>방문일자/인원 선택</h3>
					</div>
					<div class="form-group">
						<label for="date">방문일</label> <input type="date" id="date"
							name="date" required class="middle-flat">
					</div>
					<div class="form-group">
						<label for="personnel">인원</label>
						<div id="personnel">
							<ul>
							
								
                                
                                
								
									<li>
										<div class="txt_wrap">
											<p class="tit">어른</p>
											<p class="txt">만 19세 이상</p>
										</div>
										<div class="count_wrap">
											<em class="count number_color" id='adultCntEM'>1</em>
											<span class="btn_wrap">
												<button type="button" class="btn_minus on" onclick="fnTypeCnt('adultCntEM',-1)" id="adultCntEMBtn">인원수 제거</button>
												<button type="button" class="btn_plus" onclick="fnTypeCnt('adultCntEM',1)">인원수 추가</button>
											</span>
										</div>
									</li>
					
									<li>
										<div class="txt_wrap">
											<p class="tit">청소년</p>
											<p class="txt">만 13세 이상 ~ 만 18세</p>
										</div>
										<div class="count_wrap">
											<em class="count" id='TeenCntEM'>0</em>
											<span class="btn_wrap">
												<button type="button" class="btn_minus" onclick="fnTypeCnt('TeenCntEM',-1)" id="TeenCntEMBtn">인원수 제거</button>
												<button type="button" class="btn_plus" onclick="fnTypeCnt('TeenCntEM',1)" >인원수 추가</button>
											</span>
										</div>
									</li>
					
									<li>
										<div class="txt_wrap">
											<p class="tit">어린이</p>
											<p class="txt">36개월 이상 ~ 만 12세</p>
										</div>
										<div class="count_wrap">
											<em class="count" id='childCntEM'>0</em>
											<span class="btn_wrap">
												<button type="button" class="btn_minus" onclick="fnTypeCnt('childCntEM',-1)" id="childCntEMBtn">인원수 제거</button>
												<button type="button" class="btn_plus" onclick="fnTypeCnt('childCntEM',1)">인원수 추가</button>
											</span>
										</div>
									</li>
								
							
						</ul>
						</div>
						<input type="text" id="personnel" name="personnel" required>
					</div>
					<div class="form-group">
						<label for="region">지역</label> <input type="text" id="region"
							name="region" required>
					</div>
					<div class="form-group">
						<label for="group-name">단체명</label> <input type="text"
							id="group-name" name="group-name" required>
					</div>

					<div class="form-group">
						<label for="date">방문일</label> <input type="date" id="date"
							name="date" required>
					</div>
					<div class="form-group">
						<label for="time">방문시간</label> <input type="text" id="time"
							name="time" required>
					</div>

					<div class="btn-container">
						<button type="submit" class="btn"
							onclick="location.href='/ddstudio/ticket/group-reservation.do'">예약</button>
					</div>
				</form>
			</div>

		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = '';
							var extraAddr = '';

							if (data.userSelectedType === 'R') { // 도로명 주소 선택
								addr = data.roadAddress;
							} else { // 지번 주소 선택
								addr = data.jibunAddress;
							}

							if (data.userSelectedType === 'R') {
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
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


