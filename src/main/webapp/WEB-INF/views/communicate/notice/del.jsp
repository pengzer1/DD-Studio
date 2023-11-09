<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#delete-notice {
				text-align: center;
				margin-top: 150px;
			}
			table {
				width: 80%;
				border-top: 2px solid black;
				margin: 50px auto 0;
			}
			#delete-button, #back-button {
				width: 100px;
				height: 33px;
				background-color: #FBF2F3;
				border: 2px solid #F49097;
				border-radius: 15px;
				margin: 50px 10px 0;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="delete-notice">
			<h1>공지사항 삭제</h1>
			
			<form method="POST" action="/ddstudio/communicate/noticedel.do?seq=${seq}" name="delete-form">
				<input type="hidden" name="seq" value="${seq}">
				
				<table>
					<tr>
						<td>
							<button type="submit" id="delete-button" onclick="confirmDelete()">삭제</button>
							<button type="button" id="back-button" onclick="location.href='/ddstudio/communicate/noticedetail.do?seq=${seq}';">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</main>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
	        function confirmDelete() {
	            var result = confirm("정말로 삭제하시겠습니까?");
	            
	            if (result) {
	                document.forms["delete-form"].submit();
	            }
	        }
	    </script>
	</body>
</html>