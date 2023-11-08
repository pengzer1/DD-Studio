<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#notice-detail {
				width: 80%;
				margin: 50px auto 0;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<table id="notice-detail">
			<tr id="subject">
				<td>${dto.subject}</td>
			</tr>
			<tr id="regdate">
				<td>${dto.regdate}</td>
			</tr>
			<tr id="content">
				<td>
					${dto.content}
					
					<c:if test="${dto.attach != null}">
						<img src="/ddstudio/asset/image/${dto.attach}">
					</c:if>
				</td>
			</tr>
			<tr id="button-list">
				<td>
					<button type="button" id="back-button" onclick="location.href='/ddstudio/communicate/notice/list.do';">목록</button>
				
					<c:if test="${not empty email && lv == 2}">
						<button type="button" id="edit-button" onclick="location.href='/ddstudio/communicate/notice/edit.do?seq=${dto.seq}';">수정</button>
						<button type="button" id="delete-button" onclick="location.href='/ddstudio/communicate/notice/del.do?seq=${dto.seq}';">삭제</button>
					</c:if>
				</td>
			</tr>
		</table>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	</body>
</html>