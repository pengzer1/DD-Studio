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
#main>#title, .item div {
	background-color: white;
}

.name {
	font-weight: bold;
	font-size: 24px;
}

.wide-multi-content-container {
  display: flex;
  justify-content: space-between;
  gap: 20px; /* 테이블 간격을 조정합니다. */
}

.buttons-container {
  text-align: center;
}

.button {
  background-color: #0074cc;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.button:hover {
  background-color: #0056a4;
}

/* body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
    } */

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
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-group input[type="text"],
    .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .form-group textarea {
      height: 200px;
    }

    .btn-container {
      text-align: center;
      margin-top: 20px;
    }

    .btn {
      padding: 10px 20px;
      background-color: #0074cc;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .btn.cancel {
      background-color: #ccc;
    }
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>리뷰 작성</h2>
			<br>
			<p></p>
		</div>

		<hr>

		<div id="sub-title">
			<h3></h3>
		</div>

		<div class="container">
    <h2>리뷰 작성</h2>
    <form action="/ddstudio/member/review/add.do" method="post" enctype="multipart/form-data">
    <input type="hidden" id="seq" name="seq" value="${seq}">
    <input type="hidden" id="review_seq" name="review_seq" value="${review_seq}">
   <div class="form-group">
      <label for="subject">제목</label>
      <input type="text" id="subject" name="subject" required>
   </div>
   <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" name="content" required></textarea>
   </div>
   <div class="form-group">
      <label for="file">첨부 파일</label>
      <input type="file" id="file" name="file">
   </div>	
   <!-- 등록 및 취소 버튼 -->
   <div class="btn-container">
      <button type="submit" class="btn">등록</button>
      <button type="button" class="btn cancel" onclick="location.href='/ddstudio/member/review/info.do'">취소</button>
   </div>
   
</form>

  </div>
			
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


