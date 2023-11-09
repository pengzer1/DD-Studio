<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#inquiry {
				text-align: center;
				margin-top: 150px;
			}
			#add-form {
				width: 80%;
				border-top: 2px solid black;
				margin: 50px auto 0;
			}
			#add-form th, #add-form td {
				height: 100px;
				color: #555;
				border-bottom: 1px solid #E1E1E1;
			}
			#add-form th {
				width: 30%;
				font-size: 1.1rem;
				border-right: 1px solid #E1E1E1;
			}
			#add-form td {
				width: 70%;
				text-align: left;
			}
			#add-form tr:nth-child(1) td select {
				width: 300px;
				height: 45px;
			    margin-left: 30px;
			    outline: none;
			}
			#add-form tr:nth-child(5) td {
				height: 500px;
			}
			#add-form input {
				padding: 10px;
				margin-left: 30px;
				outline: none;
			}
			#add-form textarea {
			    width: 93%;
			    height: 88%;
			    box-sizing: border-box;
			    padding: 10px;
			    margin: 30px;
			    resize: none;
			    outline: none;
			}
			#add-form tr:nth-child(6) td input {
			    margin-left: 20px;
			}
			#add-form tr:nth-child(7) td > div {
				height: 150px;
				padding: 20px 30px;
				overflow-y: scroll;
				overflow: auto;
			}
			#add-form tr:nth-child(7) td > div > div {
				text-align: right;
			}
			#add-form tr:nth-child(7) td > div > div > label {
				font-weight: bold;
				margin: 10px 10px 0;
			}
			#add-button, #back-button {
				width: 100px;
				height: 33px;
				background-color: #FBF2F3;
				border: 2px solid #F49097;
				border-radius: 15px;
				margin: 50px 10px 0;
			}
			.nav-icon {
				font-size: 50px;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="inquiry">
			<h1>이용문의</h1>
			
			<form method="POST" action="/ddstudio/communicate/usageinquiry.do" enctype="multipart/form-data" onsubmit="return validateForm()">
				<table id="add-form">
					<tr>
						<th>문의유형</th>
						<td>
							<select name="type" id="type" onblur="onBlur(type)">
							    <option value="pb" selected>요금/혜택</option>
							    <option value="attraction">어트랙션</option>
							    <option value="festival">페스티벌</option>
							    <option value="movie">영화</option>
							    <option value="test">추천 기능</option>
							    <option value="giftshop">기프트샵</option>
							    <option value="ticketing">예매</option>
							    <option value="etc">기타</option>
							 </select>
							 <div id="message">문의 유형을 선택하세요.</div>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" size="40" value="${name}" disabled></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" size="40" value="${email}" disabled></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject" size="86"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<th>개인정보수집동의</th>
						<td>
							<div>
		                        본인은 DD Studio 홈페이지 이용을 위하여 다음과 같이 회사가 본인의 개인정보를 수집∙이용하는 것에 동의합니다.<br>
		                        1. 개인정보 수집항목<br>
		                        작성자 개인, 단체 정보 (이름, 단체명, 이메일주소, 핸드폰번호) 및 서비스 이용기록, 접속로그, 쿠키 등<br>
		                        2. 개인정보 이용목적<br>
		                        DD Studio 온라인 상담, 서비스 신청, 상품예약, 제휴문의, 인재채용 등 관련 소식 안내, DD Studio 홈페이지 이용 관련 통계 및 분석 등<br>
		                        3. 개인정보 보유기간<br>
		                        홈페이지 이용일로부터 1년<br>
		                        DD Studio 온라인 상담, 서비스 신청, 상품예약, 제휴문의, 인재채용 등 운영을 위하여 필요한 최소한의 개인정보이므로 동의해 주셔야 홈페이지를 이용하실 수 있습니다. 또한 위 동의를 철회할 경우, 철회 이후 홈페이지 이용 과정에 불이익이 발생할 수 있습니다.
		                        
		                        <div><input type="checkbox" name="agree" id="agree"><label for="agree">동의함</label></div>
							</div>
						</td>
					</tr>
				</table>
				
				<div id="button-list">
					<button type="submit" id="add-button">등록</button>
					<button type="button" id="back-button" onclick="location.href='/ddstudio/communicate/notice.do';">취소</button>
				</div>
			</form>
		</main>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
			function onBlur(id) {
				var value = document.getElementById(id).value;

				if (value === "") {
					$.ajax({
						url: "/ddstudio/usageinquiry.do",
						type: "POST",
						data: {
							value: value,
						},
						success: function(result) {
							document.getElementById("message").innerHTML = result;
							document.getElementById("message").style.display = "block";
						},
					});
				} else {
					document.getElementById("message").style.display = "none";
				}
			}
		</script>
	</body>
</html>