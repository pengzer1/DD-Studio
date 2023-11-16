<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#edit-review {
				text-align: center;
				margin-top: 180px;
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
			#edit-form tr:nth-child(2) td {
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
		
		<main id="edit-review">
			<h1>리뷰 수정</h1>
			
			<form method="POST" action="/ddstudio/communicate/reviewedit.do?seq=${dto.review_seq}">
				<table id="edit-form">
					<tr>
						<th class="required">제목</th>
						<td><input type="text" name="subject" size="86" value="${dto.subject}" autofocus></td>
					</tr>
					<tr>
						<th class="required">내용</th>
						<td><textarea name="content">${dto.content}</textarea></td>
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
				var subject = document.querySelector('input[name="subject"]');
				var content = document.querySelector('textarea[name="content"]');
				
				if (!subject.value.trim()) {
					alert('제목을 입력하세요.');
					subject.focus();
					return false;
				}
				
				if (!content.value.trim()) {
					alert('내용을 입력하세요.');
					content.focus();
					return false;
				} else {
					return true;
				}
			});
			
			$('#back-button').click(function () {
				location.href='/ddstudio/communicate/reviewdetail.do?seq=${dto.review_seq}';
			});
		</script>
	</body>
</html>