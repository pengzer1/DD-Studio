<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/ddstudio/asset/css/main.css">
<link rel="stylesheet" href="/ddstudio/asset/css/user.css">
<style>
#cancel {
	margin-right: 40px;
}

#img {
	border-bottom: 0;
    margin-left: 0;
}

.button {
	font-size: 16px;
	border: 1px solid #ccc;
    border-radius: 5px;
    background-color: white;
    box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<!-- /test/course/add.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>코스 추가</h1>

		<div class="sub-title"></div>
		
		<div id="content">
			<div class="wide-item">
			
				<form method="POST" action="/ddstudio/test/courseadd.do" enctype="multipart/form-data">
					<table>
						<tr>
							<th class="required">코스명</th>
							<td>
								<div>
									<input type="text" name="name" id="name" required class="middle-flat">
								</div>
							</td>
						</tr>

						<tr>
							<th>첨부파일</th>
							<td>
								<div>
									<input type="file" name="img" id="img" class="middle-flat">
								</div>
							</td>
						</tr>
						
						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<button type="submit" id="add" class="check button">추가</button>
									<button type="button" id="cancel" class="button" onclick="location.href='/ddstudio/test/recommend.do';">취소</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
				
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->
	<script>

	</script>
</body>
</html>