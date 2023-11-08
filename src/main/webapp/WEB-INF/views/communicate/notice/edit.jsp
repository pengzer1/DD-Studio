<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="edit-notice">
			<h1>공지사항 수정</h1>
			
			<form method="POST" action="/ddstudio/communicate/notice/edit.do" enctype="multipart/form-data">
				<input type="hidden" name="seq" value="${dto.seq}">
				
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject" value="${dto.subject}" required autofocus></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="content" required>${dto.content}</textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="file" id="file">
							
							<c:if test="${not empty dto.attach}">
					            ${dto.attach}
					        </c:if>
						</td>
					</tr>
					<tr>
						<th>고정여부</th>
						<td><input type="text" name="fix" id="fix" value="${dto.fix}" pattern="[yn]" placeholder="y 또는 n을 입력하세요." required></td>
					</tr>
				</table>
				
				<div>
					<button type="submit" id="edit-button">수정</button>
					<button type="button" id="back-button" onclick="location.href='/ddstudio/communicate/notice/detail.do?seq=${dto.seq}';">취소</button>
				</div>
			</form>
		</main>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	</body>
</html>