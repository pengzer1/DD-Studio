<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#delete-lost-property {
				text-align: center;
				margin-top: 180px;
			}
			#delete-lost-property > h1 {
				font-family: 'SUIT-Regular';
			}
			table {
				width: 80%;
				border-top: 2px solid #000;
				margin: 50px auto 0;
			}
			i {
				margin-right: 10px;
			}
			#delete-button, #back-button {
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
		
		<main id="delete-lost-property">
			<h1>분실물 삭제</h1>
			
			<form method="POST" action="/ddstudio/communicate/lostpropertydel.do?seq=${seq}" name="delete-form">				
				<table>
					<tr>
						<td>
							<button type="submit" id="delete-button"><i class="fa-solid fa-trash"></i>삭제</button>
							<button type="button" id="back-button"><i class="fa-solid fa-circle-arrow-left"></i>취소</button>
						</td>
					</tr>
				</table>
			</form>
		</main>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
	        $('#delete-button').click(function () {
	            var result = confirm("정말로 삭제하시겠습니까?");
	            
	            if (result) {
	                document.forms["delete-form"].submit();
	            } else {
	            	return false;
	            }
	        });
	        
	        $('#back-button').click(function () {
	        	location.href='/ddstudio/communicate/lostproperty.do';
	        });
	    </script>
	</body>
</html>