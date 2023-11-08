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
		
		<main id="delete-notice">
			<h1>공지사항 삭제</h1>
			
			<form method="POST" action="/ddstudio/communicate/notice/del.do">
				<input type="hidden" name="seq" value="${seq}">
				
				<div>
					<button type="submit" id="delete-button">삭제</button>
					<button type="button" id="back-button" onclick="location.href='/ddstudio/communicate/notice/detail.do?seq=${seq}';">취소</button>
				</div>
			</form>
		</main>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	</body>
</html>