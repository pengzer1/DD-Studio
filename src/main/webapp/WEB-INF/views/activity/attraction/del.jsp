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
	#attraction-del {
		text-align: center;
		margin-top: 150px;
	}
	
	#del-line {
		color: #777;
	}
	
	#del-content {
		display: flex;
		justify-content: center;
		text-align: left;
	}
	
	#btn {
		text-align: center;
	}
	
	#btn button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #E6AAAE;
	}
	
	.del-box {
		border: 1px solid #777;
		text-align: left;
		display: inline-block;
		width: 470px;
		padding: 10px 13px;
		border-radius: 7px;
	}
	
	.del-box p {
		margin-bottom: 0;
	}
	
	#sub-title > p:first-child {
		color: #dc3545;
	}
	
	#sub-title > p:last-child {
		margin-top: 1rem;
	}
	
	
</style>
</head>
<body>
	<!-- /ddstudio/activity/attraction/add.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="attraction-del">
	
		<div>
			<h2>어트랙션 삭제하기</h2>
		</div>
		
		<hr id="del-line"/>
		
		<div id="sub-title">
			<p class="--bs-red"><i class="fa-solid fa-triangle-exclamation"></i>주의사항<i class="fa-solid fa-triangle-exclamation"></i></p>
					<p>하단의 삭제버튼을 누르는 즉시 어트랙션은 삭제 처리 되며, 하기 내용의 업무가 더이상 불가능하게됩니다.</p>
				<div class="del-box">
					<p>1. 위치/테마 정보 조회에서 해당 어트랙션 조회가 불가합니다.</p>
					<p>2. 해시태그 조회에서 해당 어트랙션 조회가 불가합니다.</p>
					<p>3. MBTI별 추천 항목에서 해당 어트랙션이 제외됩니다.</p>
				</div>
			<p>정말로 선택하신 어트랙션을 삭제하시겠습니까?</p>
		</div>
		
		<div id="del-content">
			<form method="POST" action="/ddstudio/activity/attractiondel.do">
				<div id="btn">
					<button type="button" onclick="location.href= '/ddstudio/activity/attractiondetail.do?seq=' + ${seq};"><i class="fa-solid fa-circle-arrow-left"></i>취소</button>
					<button><i class="fa-solid fa-trash"></i>삭제</button>
				</div>
				<input type="hidden" name="seq" value="${seq}" />
			</form>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


