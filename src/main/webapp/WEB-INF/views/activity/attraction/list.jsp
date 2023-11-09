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
	.item:hover {
		cursor: pointer;
	}

	#admin-btn {
		/* text-align: right; */
		float: right;
		margin: 3px 0;
	}
	
	#admin-btn button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #E6AAAE;
	}
	
	#condition {
		/* 조건검색 누르면 아래로 확장되게 해야함!! */
	}
</style>
</head>
<body>
	<!-- /activity/attraction/list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>어트랙션</h2>
			<br>
			<p>모험과 환상의 나라 더블디 스튜디오의 어트랙션을 경험해보세요!</p>
		</div>

		
		<div id="content">
			<!-- 조건 검색 누르면  -->
			<div id="condition">
				<h3>조건검색(테마/운휴일정/위치정보)</h3>
			</div>
			
			<!-- 관리자용 추가 버튼 > 조건 걸기 필요 -->
			<div id="admin-btn">
				<button type="button" id="add-btn" onclick="location.href='/ddstudio/activity/attractionadd.do'"><i class="fa-solid fa-plus"></i>추가</button>
			</div>

			<!-- 어트랙션 컨텐츠 이미지 -->
			<div class="munti-content-container">
				<c:forEach items="${list}" var="dto">
					<div class="item" onclick="detail(${dto.attraction_seq})">
						<div style="background-image: url('/ddstudio/asset/image/${dto.img}');"></div>
						<div>${dto.name}</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
	
		/* $('.item').click(function() {
			
			alert();
			location.href= '/ddstudio/activity/attractiondetail.do?seq='${dto.attraction_seq};
		});	 */
		
		function detail(seq) {
			
			//alert(seq);
			location.href= '/ddstudio/activity/attractiondetail.do?seq=' + seq;
			
		}
		
	</script>
</body>
</html>


