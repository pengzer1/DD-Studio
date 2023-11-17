<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
	  	<style>
	  		#review {
				text-align: center;
				margin-top: 180px;
			}
			#sort {
				width: 80%;
				font-size: 1.1rem;
				font-weight: bold;
				text-align: left;
				padding: 0 20px 10px;
				border-bottom: 2px solid #000;
				margin-top: 50px;
				margin-left: 150px;
			}
			#sort a {
				color: #444;
				text-decoration: none;
				margin-right: 20px;
			}
			#sort a:hover, #sort a.selected {
			    color: #FF0076;
			}
			#sort i {
				margin-right: 7px;
			}
			#review-list {
				display: grid;
  				grid-template-columns: repeat(3, 1fr);
  				place-items: center;
				width: 80%;
			 	margin: 40px auto 0;
			}
			.item {
		  		width: 70%;
		  		height: 330px;
		  		color: #444;
		  		margin-bottom: 40px;
		  		box-sizing: border-box;
		  		transition: transform 0.3s ease;
			}
			.item:hover {
			    transform: scale(1.1);
			}
			.item div:nth-child(2) {
				height: 60px;
				font-size: 1.1rem;
				font-weight: bold;
				background-color: #FFF07C;
				padding-top: 20px;
			}
			.item div:nth-child(3) {
				font-size: 0.8rem;
				background-color: #FFF07C;
				padding: 10px;
			}
			.item div:nth-child(3) span:nth-child(1) {
				margin-right: 60px;
			}
			.item div:nth-child(3) i {
				margin-right: 5px;
			}
			.item div:nth-child(3) span:nth-child(2) {
				margin-left: 70px;
			}
			#page-bar {
				display: flex;
				font-size: 1.2rem;
				justify-content: center;
				margin-top: 50px;
			}
			#previous-button, #current-page, #other-pages, #next-button {
				color: #000;
				margin: 0 10px;
			}
			#previous-button, #next-button {
				display: block;
				margin-top: 1.5px;
			}
			#current-page {
				color: #F00;
			}
			.nav-icon {
				font-size: 50px;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="review">
			<h1>리뷰</h1>
				
			<div id="sort">
				<a href="/ddstudio/communicate/review.do?sort=최신순" class="${param.sort == '최신순' ? 'selected' : ''}">
					<i class="fa-regular fa-calendar-check"></i>최신순
				</a>
				
				<a href="/ddstudio/communicate/review.do?sort=조회순" class="${param.sort == '조회순' ? 'selected' : ''}">
					<i class="fa-solid fa-eye"></i>조회순
				</a>
			</div>
			
			<div id="review-list">
				<c:forEach items="${list}" var="dto" varStatus="status">
					<div class="item" onclick="redirectToReviewDetail(${dto.review_seq})">
						<div style="background-image: url('/ddstudio/asset/image/${dto.img}');"></div>
						<div>${dto.subject}</div>
						<div>
							<span><i class="fa-solid fa-eye"></i>${dto.readcount}</span>
							<span>${dto.regdate}</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</main>
		
		<div id="page-bar">${pageBar}</div>
		
		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
			
		<script>
			function redirectToReviewDetail(reviewId) {
				location.href = '/ddstudio/communicate/reviewdetail.do?seq=' + reviewId;
			}
			
			$('#add-button').click(function () {
				location.href='/ddstudio/communicate/reviewadd.do';
			});
		</script>
	</body>
</html>