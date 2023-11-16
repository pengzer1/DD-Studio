<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#edit-notice {
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
			#edit-form .option::before {
				content: "* ";
				color: #6495ED;
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
			#edit-form tr:nth-child(3) td input {
			    margin-left: 20px;
			    margin-right: -120px;
			}
			#edit-form tr:nth-child(3) td .material-symbols-outlined {
    			vertical-align: middle;
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
		
		<main id="edit-notice">
			<h1>공지사항 수정</h1>
			
			<form method="POST" action="/ddstudio/communicate/noticeedit.do?seq=${dto.notice_seq}" enctype="multipart/form-data">
				<table id="edit-form">
					<tr>
						<th class="required">제목</th>
						<td><input type="text" name="subject" size="86" value="${dto.subject}" autofocus></td>
					</tr>
					<tr>
						<th class="option">내용</th>
						<td><textarea name="content">${dto.content}</textarea></td>
					</tr>
					<tr>
						<th  class="option">첨부파일</th>
						<td>
							<input type="file" name="file" onchange="removeFileName()">
							
							<c:if test="${not empty dto.attach}">
					            <span class="material-symbols-outlined file-name">attach_file</span>
					            <span class="file-name">${dto.attach}</span>
					        </c:if>
						</td>
					</tr>
					<tr>
						<th class="required">고정여부</th>
						<td>
							<label><input type="radio" name="fix" value="y" ${dto.fix == 'y' ? 'checked' : ''}> 예</label>
					        <label><input type="radio" name="fix" value="n" ${dto.fix == 'n' ? 'checked' : ''}> 아니오</label>
						</td>
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
		    function removeFileName() {
		        var file = document.querySelector('input[name="file"]');
		        var fileNames = document.querySelectorAll('.file-name');
		
		        if (file && fileNames) {
		            fileNames.forEach(function(fileName) {
		                fileName.style.display = file.files.length > 0 ? 'none' : 'block';
		            });
		        }
		    }
		    
		    $('#edit-button').click(function () {
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
				location.href='/ddstudio/communicate/noticedetail.do?seq=${dto.notice_seq}';
			});
		</script>
	</body>
</html>