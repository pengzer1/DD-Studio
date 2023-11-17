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

.form-group {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.form-group select {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
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

		<div id="title" style="background-image: url('/ddstudio/asset/image/chihiro015.jpg');">
			<h2>문의 내역</h2>
			<br>
		</div>
	

		<div class="container">
			<h2 style="text-align: center;">칭찬/불편/건의 상세내역</h2>
			
			<div class="question-section">
                <h3>Q. 질문</h3>
                <hr>
                <p><strong>제목:</strong> ${dto.subject}</p>
                <p><strong>내용:</strong> ${dto.content}</p>
                <p><strong>첨부파일:</strong> ${dto.attach}</p>
            </div>

            <div class="answer-section">
                <h3>A. 답변</h3>
                <hr>
                <p><strong>답변 내용:</strong> ${dto.answer}</p>
            </div>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
		
	</script>

</body>
</html>


