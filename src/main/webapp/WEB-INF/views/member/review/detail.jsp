<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/ddstudio/asset/css/main.css">
<style>
#main > #title{
	background-color: white;
}

#title > h2{
	color: black;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.search-box {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

h2, h3 {
    color: #0074cc;
}

.question-section,
.answer-section {
    margin-bottom: 30px;
    padding: 20px;
    border-radius: 8px;
    background-color: #f9f9f9;
}

.question-section p,
.answer-section p {
    line-height: 1.6;
}

.question-section strong,
.answer-section strong {
    font-weight: 600;
}

.question-section {
    border-bottom: 1px solid #ddd;
}

.answer-section {
    border-top: 1px solid #ddd;
}

.question-section p,
.answer-section p {
    line-height: 1.6;
    margin-bottom: 100px; /* 원하는 간격으로 조절 가능 */
}

.question-section h3,
.answer-section h3 {
    line-height: 1.6;
    margin-bottom: 50px; /* 원하는 간격으로 조절 가능 */
}

.question-section hr, 
.answer-section hr{
    margin: 20px 0; /* 원하는 간격으로 조절 가능 */
    border: 0;
    height: 1px;
    background-color: black;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>리뷰</h2>
			<br>
		</div>
	

		<div class="container">
			<h2 style="text-align: center;">리뷰 자세히보기</h2>
			
			<div class="question-section">
                <h3>리뷰</h3>
                <hr>
                <p><strong>제목:</strong> ${dto.subject}</p>
                <p><strong>내용:</strong> ${dto.content}</p>
                <p><strong>등록일:</strong> ${dto.regdate}</p>
                <p><strong>조회수:</strong> ${dto.readcount}</p>
            </div>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
		
	</script>

</body>
</html>


