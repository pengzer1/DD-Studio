<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#add-notice {
				text-align: center;
				margin-top: 150px;
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
			#add-form .option::before {
				content: "* ";
				color: #6495ED;
			}
			#add-form td {
				width: 70%;
				text-align: left;
			}
			#add-form tr:nth-child(2) td {
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
			    padding: 10px;
			    margin: 30px;
			    resize: none;
			    outline: none;
			}
			#add-form tr:nth-child(3) td input {
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
		
		<main id="add-notice">
			<h1>공지사항 등록</h1>
			
			<form method="POST" action="/ddstudio/communicate/noticeadd.do" enctype="multipart/form-data">
				<table id="add-form">
					<tr>
						<th class="required">제목</th>
						<td><input type="text" name="subject" size="86" autofocus></td>
					</tr>
					<tr>
						<th class="option">내용</th>
						<td><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<th class="option">첨부파일</th>
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<th class="required">고정여부</th>
						<td>
							<label><input type="radio" name="fix" value="y"> 네</label>
					        <label><input type="radio" name="fix" value="n" checked> 아니오</label>
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
				var subject = document.querySelector('input[name="subject"]');
				var content = document.querySelector('textarea[name="content"]');
				var file = document.querySelector('input[name="file"]');
				
				if (!subject.value.trim()) {
					alert('제목을 입력하세요.');
					subject.focus();
					return false;
				}
				
				if (!content.value.trim() && !file.files.length) {
					alert('내용을 입력하거나 첨부파일을 선택하세요.');
					content.focus();
					return false;
				} else {
					return true;
				}
			});
			
			$('#back-button').click(function () {
				location.href='/ddstudio/communicate/notice.do';
			});
		</script>
	</body>
</html>