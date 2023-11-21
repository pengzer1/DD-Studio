<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#edit-faq {
				text-align: center;
				margin-top: 180px;
			}
			#edit-faq > h1 {
				font-family: 'SUIT-Regular';
			}
			#edit-form {
				width: 80%;
				border-top: 2px solid #000;
				margin: 50px auto 0;
			}
			#edit-form th, #edit-form td {
				height: 80px;
				color: #555;
				border-bottom: 1px solid #E1E1E1;
			}
			#edit-form th {
				width: 30%;
				font-size: 1.1rem;
				border-right: 1px solid #E1E1E1;
			}
			#edit-form .required::before {
				content: "* ";
				color: #F00;
			}
			#edit-form td {
				width: 70%;
				text-align: left;
			}
			#edit-form tr:nth-child(1) td select {
				width: 200px;
				height: 45px;
			    margin-left: 30px;
			    outline: none;
			}
			#edit-form tr:nth-child(3) td {
				height: 500px;
			}
			#edit-form input {
				padding: 10px;
				margin-left: 30px;
				outline: none;
			}
			#edit-form textarea {
			    width: 93%;
			    height: 88%;
			    box-sizing: border-box;
			    padding: 10px;
			    margin: 30px;
			    resize: none;
			    outline: none;
			}
			#button-list i {
				margin-right: 10px;
			}
			#edit-button, #back-button {
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
		
		<main id="edit-faq">
			<h1>FAQ 수정</h1>
			
			<form method="POST" action="/ddstudio/communicate/faqedit.do?seq=${dto.faq_seq}">
				<table id="edit-form">
					<tr>
						<th class="required">카테고리</th>
						<td>
							<select name="type" id="type">
							    <option value="이용정보" ${dto.type == '이용정보' ? 'selected' : ''}>이용정보</option>
							    <option value="액티비티" ${dto.type == '액티비티' ? 'selected' : ''}>액티비티</option>
							    <option value="혜택" ${dto.type == '혜택' ? 'selected' : ''}>혜택</option>
							    <option value="예매" ${dto.type == '예매' ? 'selected' : ''}>예매</option>
							    <option value="기타" ${dto.type == '기타' ? 'selected' : ''}>기타</option>
							 </select>
						</td>
					</tr>
					<tr>
						<th class="required">질문</th>
						<td><input type="text" name="question" id="question" size="86" value="${dto.question}"></td>
					</tr>
					<tr>
						<th class="required">답변</th>
						<td><textarea name="answer" id="answer">${dto.answer}</textarea></td>
					</tr>
				</table>
				
				<div id="button-list">
					<button type="submit" id="edit-button"><i class="fa-solid fa-pen-to-square"></i>수정</button>
					<button type="button" id="back-button"><i class="fa-solid fa-circle-arrow-left"></i>취소</button>
				</div>
			</form>
		</main>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
		    $('#edit-button').click(function () {
		    	var question = document.querySelector('input[name="question"]');
				var answer = document.querySelector('textarea[name="answer"]');
				
				if (!question.value.trim()) {
					alert('질문을 입력하세요.');
					question.focus();
					return false;
				}
				
				if (!answer.value.trim()) {
					alert('답변을 입력하세요.');
					answer.focus();
					return false;
				} else {
					return true;
				}
			});
			
			$('#back-button').click(function () {
				location.href='/ddstudio/communicate/faq.do?type=이용정보';
			});
		</script>
	</body>
</html>