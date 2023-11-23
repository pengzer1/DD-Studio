<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#voc {
				text-align: center;
				margin-top: 180px;
			}
			#voc > h1 {
				font-family: 'SUIT-Regular';
			}
			#add-form {
				width: 80%;
				border-top: 2px solid black;
				margin: 50px auto 0;
			}
			#add-form th, #add-form td {
				height: 80px;
				color: #555;
				border-bottom: 1px solid #E1E1E1;
			}
			#add-form th {
				width: 30%;
				font-size: 1.1rem;
				border-right: 1px solid #E1E1E1;
			}
			#add-form .required::before {
				content: "* ";
				color: red;
			}
			#add-form td {
				width: 70%;
				text-align: left;
			}
			#add-form tr:nth-child(1) td select, #add-form tr:nth-child(2) td select, #add-form tr:nth-child(6) td select {
				width: 300px;
				height: 45px;
			    margin-left: 30px;
			    outline: none;
			}
			#add-form tr:nth-child(8) td {
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
			#add-form tr:nth-child(9) td input {
			    margin-left: 20px;
			}
			#add-form tr:nth-child(10) td > div {
				height: 150px;
				padding: 20px 30px;
				overflow-y: scroll;
				overflow: auto;
			}
			#add-form tr:nth-child(10) td > div > div {
				text-align: right;
			}
			#add-form tr:nth-child(10) td > div > div > label {
				font-weight: bold;
				margin: 10px 10px 0;
			}
			#button-list i {
				margin-right: 10px;
			}
			#add-button, #back-button {
				width: 90px;
				height: 40px;
				background-color: transparent;
				border: 2px solid #CCC;
				margin: 50px 10px 0;
			}
			.nav-icon {
				font-size: 50px;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="voc">
			<h1>칭찬/불편/건의</h1>
			
			<form method="POST" action="/ddstudio/communicate/vocadd.do?seq=${seq}" enctype="multipart/form-data">
				<table id="add-form">
					<tr>
						<th class="required">구분</th>
						<td>
							<select name="type" id="type">
							    <option value="칭찬" selected>칭찬</option>
							    <option value="불편">불편</option>
							    <option value="건의">건의</option>
							 </select>
						</td>
					</tr>
					<tr>
						<th class="required">서비스유형</th>
						<td>
							<select name="service-type" id="service-type">
							    <option value="어트랙션" selected>어트랙션</option>
							    <option value="페스티벌">페스티벌</option>
							    <option value="영화">영화</option>
							    <option value="추천 기능">추천 기능</option>
							    <option value="기프트샵">기프트샵</option>
							    <option value="예매">예매</option>
							    <option value="기타">기타</option>
							 </select>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" size="40" value="${name}" disabled></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" size="40" value="${email}" disabled></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" size="40" value="${tel}" disabled></td>
					</tr>
					<tr>
						<th class="required">방문일</th>
						<td>
							<select name="visit-date" id="visit-date">
					            <c:forEach var="date" items="${empty visitDateList ? {'없음'} : visitDateList}">
					                <option value="${date}">${date}</option>
					            </c:forEach>
					        </select>
						</td>
					</tr>
					<tr>
						<th class="required">제목</th>
						<td><input type="text" name="subject" id="subject" size="86"></td>
					</tr>
					<tr>
						<th class="required">내용</th>
						<td><textarea name="content" id="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<th class="required">개인정보수집동의</th>
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
					<button type="submit" id="add-button"><i class="fa-solid fa-plus"></i>등록</button>
					<button type="button" id="back-button"><i class="fa-solid fa-circle-arrow-left"></i>취소</button>
				</div>
			</form>
		</main>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
			$('#add-button').click(function () {
				var visitDate = document.querySelector('select[name="visit-date"]').value;
				var subject = document.querySelector('input[name="subject"]');
				var content = document.querySelector('textarea[name="content"]');
				var agree = document.querySelector('input[name="agree"]');
				
				if (visitDate === '없음') {
					alert('방문 내역이 없어, 서비스 이용이 제한되었습니다. ');
					location.href='/ddstudio/index.do';
					return false;
				}
				
				if (!subject.value.trim()) {
					alert('제목을 입력하세요.');
					subject.focus();
					return false;
				}
				
				if (!content.value.trim()) {
					alert('내용을 입력하세요.');
					content.focus();
					return false;
				}
				
				if (!agree.checked) {
					alert('개인정보수집 동의가 필요합니다.');
					agree.focus();
					return false;
				} else {
					return true;
				}
			});
			
			$('#back-button').click(function () {
			    if (confirm('작성 중인 내용이 저장되지 않을 수 있습니다.\n취소하시겠습니까?')) {
			        location.href='/ddstudio/index.do';
			    }
			});
		</script>
	</body>
</html>