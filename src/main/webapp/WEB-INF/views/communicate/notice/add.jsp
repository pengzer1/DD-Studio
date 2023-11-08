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
		
		<main id="add-notice">
			<h1>공지사항 등록</h1>
			
			<form method="POST" action="/ddstudio/communicate/notice/add.do" enctype="multipart/form-data">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject" required autofocus></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="content" required></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="file" id="file"></td>
					</tr>
					<tr>
						<th>고정여부</th>
						<td><input type="text" name="fix" id="fix" pattern="[yn]" placeholder="y 또는 n을 입력하세요." required></td>
					</tr>
				</table>
				
				<div>
					<button type="submit" id="add-button">등록</button>
					<button type="button" id="back-button" onclick="location.href='/ddstudio/communicate/notice/list.do';">취소</button>
				</div>
			</form>
		</main>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	</body>
</html>