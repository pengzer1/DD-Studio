<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#notice-detail {
				text-align: center;
				margin-top: 150px;
			}
			#regdate {
				margin-top: 30px;
			}
			#detail {
				width: 80%;
				border-top: 2px solid black;
				margin: 20px auto 0;
			}
			#content {
			    font-size: 1.03rem;
			    color: #555;
			    text-align: left;
			    padding: 30px 40px;
			    border-bottom: 2px solid black;
			}
			#detail:has(#attach) #content {
			    border-bottom: 2px solid #E1E1E1;
			}
			#attach {
			    padding: 30px 0;
			    border-bottom: 2px solid black;
			}
			#button-list i {
				margin-right: 10px;
			}
			#back-button, #edit-button, #delete-button {
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
		
		<main id="notice-detail">
			<h1>${dto.subject}</h1>
			
			<div id="regdate">${dto.regdate}</div>
			
			<table id="detail">
				<c:if test="${dto.content != null && !dto.content.trim().equals('')}">
					<tr>
						<td id="content">${dto.content}</td>
					</tr>
				</c:if>
				
				<c:if test="${dto.attach != null}">
					<tr>
						<td id="attach"><img src="/ddstudio/asset/image/${dto.attach}"></td>
					</tr>
				</c:if>
			</table>
			
			<div id="button-list">
				<button type="button" id="back-button"><i class="fa-solid fa-list"></i>목록</button>
			
				<c:if test="${not empty email && lv == 2}">
					<button type="button" id="edit-button"><i class="fa-solid fa-pen-to-square"></i>수정</button>
					<button type="button" id="delete-button"><i class="fa-solid fa-trash"></i>삭제</button>
				</c:if>
			</div>
		</main>
		
		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
			$('#back-button').click(function () {
				location.href='/ddstudio/communicate/notice.do';
			});
			
			$('#edit-button').click(function () {
				location.href='/ddstudio/communicate/noticeedit.do?seq=${dto.notice_seq}';
			});
			
			$('#delete-button').click(function () {
				location.href='/ddstudio/communicate/noticedel.do?seq=${dto.notice_seq}';
			});
		</script>
	</body>
</html>