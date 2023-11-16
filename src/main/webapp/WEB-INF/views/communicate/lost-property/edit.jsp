<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#edit-lost-property {
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
			#edit-form tr:nth-child(1) td select, #edit-form tr:nth-child(6) td select {
				width: 200px;
				height: 45px;
			    margin-left: 30px;
			    outline: none;
			}
			#edit-form input {
				padding: 10px;
				margin-left: 30px;
				outline: none;
			}
			#edit-form tr:nth-child(4) td input {
			    width: 150px;
			}
			#edit-form tr:nth-child(5) td input {
			    margin-left: 20px;
			    margin-right: -120px;
			}
			#edit-form tr:nth-child(5) td .material-symbols-outlined {
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
		
		<main id="edit-lost-property">
			<h1>분실물 수정</h1>
			
			<form method="POST" action="/ddstudio/communicate/lostpropertyedit.do?seq=${dto.lost_property_seq}" enctype="multipart/form-data">
				<table id="edit-form">
					<tr>
						<th class="required">구분</th>
						<td>
							<select name="type" id="type">
							    <option value="귀금속" ${dto.type == '귀금속' ? 'selected' : ''}>귀금속</option>
							    <option value="카드" ${dto.type == '카드' ? 'selected' : ''}>카드</option>
							    <option value="지갑" ${dto.type == '지갑' ? 'selected' : ''}>지갑</option>
							    <option value="핸드폰" ${dto.type == '핸드폰' ? 'selected' : ''}>핸드폰</option>
							    <option value="가방" ${dto.type == '가방' ? 'selected' : ''}>가방</option>
							    <option value="의류" ${dto.type == '의류' ? 'selected' : ''}>의류</option>
							    <option value="카메라" ${dto.type == '카메라' ? 'selected' : ''}>카메라</option>
							    <option value="안경" ${dto.type == '안경' ? 'selected' : ''}>안경</option>
							    <option value="기타" ${dto.type == '기타' ? 'selected' : ''}>기타</option>
							 </select>
						</td>
					</tr>
					<tr>
						<th class="required">습득물</th>
						<td><input type="text" name="name" size="35" value="${dto.name}"></td>
					</tr>
					<tr>
						<th class="required">습득장소</th>
						<td><input type="text" name="location" size="60" value="${dto.location}"></td>
					</tr>
					<tr>
						<th class="required">습득일</th>
						<td><input type="date" name="date" value="${dto.lost_property_date}"></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="file" onchange="removeFileName()">
							
							<c:if test="${not empty dto.img}">
					            <span class="material-symbols-outlined file-name">attach_file</span>
					            <span class="file-name">${dto.img}</span>
					        </c:if>
						</td>
					</tr>
					<tr>
						<th class="required">처리결과</th>
						<td>
							<select name="result" id="result">
							    <option value="보관중" selected>보관중</option>
							    <option value="수령완료">수령완료</option>
							 </select>
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