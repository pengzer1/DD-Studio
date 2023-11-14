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
#content {
	margin-top: 70px !important;
}

button {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

button:hover {
    background-color: #0056b3;
}

.item{
	background-color: white;
}
.item img.totoro-image {
    height: 280px;
    transition: transform 0.3s ease-in-out;
}

.item:hover img.totoro-image {
    animation: shake 2s ease-in-out infinite;
    transform: translateX(0);
}

@keyframes shake {
    0%, 100% {
        transform: translateX(0);
    }
    10%, 30%, 50%, 70%, 90% {
        transform: translateX(-5px);
    }
    20%, 40%, 60%, 80% {
        transform: translateX(5px);
    }
}
</style>
</head>
<body>
	<!-- /test/wordcup/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>DD 월드컵</h2>
		</div>

		<!-- 관리자 -->
		<c:if test="${lv == 2}">
			<div id="admin-btn">
				<button type="button" id="add-btn" onclick="location.href='/ddstudio/test/preferencetestadd.do'">
					<i class="fa-solid fa-plus"></i>추가
				</button>
				<button type="button" id="del-btn" onclick="location.href='/ddstudio/test/preferencetestdel.do?seq=${dto.attraction_seq}'">
					<i class="fa-solid fa-trash"></i>삭제
				</button>
				<button type="button" id="edit-btn" onclick="location.href='/ddstudio/test/preferencetestdel.do?seq=${dto.attraction_seq}'">
					<i class="fa-solid fa-pen-to-square"></i>수정
				</button>
			</div>
		</c:if>
		
		<div id="content">			
			<div class="munti-content-container">
				<div class="item">
					<img src="/ddstudio/asset/image/chromi.png" alt="어트랙션" class="totoro-image">
					<div><button type="button" onclick="location.href='/ddstudio/test/worldcupdetail.do';">어트랙션</button></div>
				</div>
				<div class="item">
					<img src="/ddstudio/asset/image/토토로.png" alt="코스" class="totoro-image">
					<div><button type="button" onclick="location.href='/ddstudio/test/worldcupdetail.do';">코스</button></div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		
	</script>
</body>
</html>


