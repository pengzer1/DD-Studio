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
#title h2, #title p {
color: #EEE;
}

.item>div:nth-child(2) {
	height: 25%;
	display: flex;
	flex-direction: column;
	text-align: left;
	justify-content: left;
	align-items: normal;
	margin: 8px;
}

.item {
	border: 1px solid #AAAAAA;
	transition: transform 0.5s;
}

.item:hover {
cursor: pointer;
transform: scale(1.1);
}

p {
	color: #444;
}

.item .item-name {
	font-weight: bold;
	font-size: 1.3rem;
	color: #111;
}

#admin-btn {
      /* text-align: right; */
      float: right;
      margin: 3px 0;
   }
   
   #admin-btn button {
      margin: 5px;
      border: 0;
      border-radius: 10px;
      padding: 10px 10px;
      color: #222;
      background-color: #E6AAAE;
   }
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px; background-image: url('/ddstudio/asset/image/background-5.jpg');">
			<h2>기프트샵</h2>
			<br>
			<p>사랑 가득, 추억 듬뿍! 기프트샵에서 귀여운 상품들을 만나보세요.</p>
		</div>

		<div id="content">
			<div id="condition">
				<h3>기능 (예시 조건검색-롯데월드에 있던거 참고)</h3>
			</div>
			
			<c:if test="${not empty lv && lv == 2}">
			<div id="admin-btn">
            <button type="button" id="add-btn" onclick="location.href='/ddstudio/shop/giftshop/add.do'"><i class="fa-solid fa-plus"></i> 추가</button>
         	</div>
         	</c:if>
         	
			<div class="munti-content-container">
			
				<c:forEach items="${list}" var="dto">
				<div class="item" onclick="detail(${dto.shop_seq})">
					<div style="background-image: url('/ddstudio/asset/image/${dto.img}');"></div>
					<div>
						<p class="item-name">${dto.name}</p>
					</div>
				</div>
				</c:forEach>
				
				
				<!-- 추가 아이템들 -->
			</div>
			
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		function detail(seq) {
			window.location.href = "/ddstudio/shop/giftshop/detail.do?seq="+seq;
		}
	</script>
</body>
</html>


