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
	/* 
	#title > h2 {
		margin-top: 70px;
	}
	 */
	 
	 #title {
	 	/* background-image: url('/ddstudio/asset/image/Ghibli-Park.jpeg'); */
	 }
	 
	#condition:hover {
		cursor: pointer;
	}

	.item:hover {
		cursor: pointer;
	}
	
	#admin-btn {
		/* text-align: right; */
		margin: 3px 0;
	}
	
	#admin-btn::after {
		clear: both;
	}
	
	#admin-btn button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #E6AAAE;
		float: right;
	}
	
	#condition {
		/* 조건검색 누르면 아래로 확장되게 해야함!! */
	}
	
	#hidden-searchbar {
		display: none;
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
			<div id="condition">
			
				<!-- 조건 검색 (click 전) -->
				<div id="default-searchbar">
					<h3><i class="fa-solid fa-magnifying-glass"></i>조건검색(테마/운휴일정)</h3>
				</div>

				<!-- 조건 검색 (click 후) -->
				<div id="hidden-searchbar">
					<h4><i class="fa-solid fa-magnifying-glass"></i>조건검색</h4>
					<div>
						<div>테마</div>
						<select name="theme" id="theme-select" class="selectbox">
							<c:forEach items="${themeList}" var="dto">
							<option value="${dto.name}">${dto.name}</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<div>운휴일정</div>
						<select name="close" id="close-select" class="selectbox">
							<option value="open">정상운영</option>
							<option value="close">운휴</option>
						</select>
					</div>
				</div>
			</div>
			
			<!-- 관리자용 추가 버튼 -->
			<c:if test="${not empty email && lv == 2}">
				<div id="admin-btn">
					<button type="button" id="add-btn" onclick="location.href='/ddstudio/activity/attractionadd.do'"><i class="fa-solid fa-plus"></i>등록</button>
				</div>
			</c:if>
	
			<!-- 어트랙션 컨텐츠 이미지 -->
			<div class="munti-content-container">
				<c:forEach items="${list}" var="dto">
					<div class="item" onclick="location.href= '/ddstudio/activity/attractiondetail.do?seq=' + ${dto.attraction_seq};">
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
		
		/* function detail(seq) {
			
			//alert(seq);
			location.href= '/ddstudio/activity/attractiondetail.do?seq=' + seq;
			
		} */
		
		$('#condition').click(function(){
			//alert();
			
			//if (현재 display 상태를 확인해서 그게 ==block이면)
			//alert($(this).children().css("display"));
			
			if ($('#default-searchbar').children().css("display") == "block") {
				
				$('#default-searchbar').css('display', none)
			} else {
				$('#default-searchbar').css('display', block)
			}
				
				
			//$('#hidden-searchbar').css('display', block);
			//$('#default-searchbar').css('display', none);
		});
		
	</script>
</body>
</html>


