<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#add-lost-property {
				text-align: center;
				margin-top: 180px;
			}
			#add-lost-property > h1 {
				font-family: 'SUIT-Regular';
			}
			#add-form {
				width: 80%;
				border-top: 2px solid #000;
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
				color: #F00;
			}
			#add-form td {
				width: 70%;
				text-align: left;
			}
			#add-form tr:nth-child(1) td select {
				width: 200px;
				height: 45px;
			    margin-left: 30px;
			    outline: none;
			}
			#add-form input {
				padding: 10px;
				margin-left: 30px;
				outline: none;
			}
			#add-form tr:nth-child(4) td input {
			    width: 150px;
			}
			#add-form tr:nth-child(5) td input {
			    margin-left: 20px;
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
		
		<main id="add-lost-property">
			<h1>분실물 등록</h1>
			
			<form method="POST" action="/ddstudio/communicate/lostpropertyadd.do" enctype="multipart/form-data">
				<table id="add-form">
					<tr>
						<th class="required">구분</th>
						<td>
							<select name="type" id="type">
							    <option value="귀금속" selected>귀금속</option>
							    <option value="카드">카드</option>
							    <option value="지갑">지갑</option>
							    <option value="핸드폰">핸드폰</option>
							    <option value="가방">가방</option>
							    <option value="의류">의류</option>
							    <option value="카메라">카메라</option>
							    <option value="안경">안경</option>
							    <option value="기타">기타</option>
							 </select>
						</td>
					</tr>
					<tr>
						<th class="required">습득물</th>
						<td><input type="text" name="name" size="35"></td>
					</tr>
					<tr>
						<th class="required">습득장소</th>
						<td><input type="text" name="location" size="60"></td>
					</tr>
					<tr>
						<th class="required">습득일</th>
						<td><input type="date" name="date" value="<%= java.time.LocalDate.now() %>"></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="file"></td>
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
				var name = document.querySelector('input[name="name"]');
				var location = document.querySelector('input[name="location"]');
				
				if (!name.value.trim()) {
					alert('습득물을 입력하세요.');
					subject.focus();
					return false;
				}
				
				if (!location.value.trim()) {
					alert('습득장소를 입력하세요.');
					content.focus();
					return false;
				} else {
					return true;
				}
			});
			
			$('#back-button').click(function () {
				location.href='/ddstudio/communicate/lostproperty.do';
			});
		</script>
	</body>
</html>