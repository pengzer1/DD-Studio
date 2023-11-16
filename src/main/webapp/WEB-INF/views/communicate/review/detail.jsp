<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#review-detail {
				text-align: center;
				margin-top: 180px;
			}
			#date {
				width: 80%;
				padding: 10px 20px 20px;
				border-bottom: 2px solid #000;
				margin-top: 30px;
				margin-left: 150px;
			}
			#date > span {
				margin: 0 30px;
			}
			#date span i {
				margin-right: 6px;
			}
			#date span span {
				font-size: 1.02rem;
				font-weight: bold;
				margin-right: 8px;
			}
		    .slideshow {
		        width: 800px;
		        height: 400px;
		        margin: 50px auto;
		        position: relative;
		        overflow: hideen;
		    }
		    .slide {
		    	display: none;
		    	min-width: 800px;
		    	height: 400px;
		    }
		    .slide img {
		    	display: block;
			    width: auto;
			    height: auto;
			    max-width: 100%;
			    max-height: 100%;
			    margin: 0 auto;
			}
		    .back-button, .next-button {
		    	font-size: 1.7rem;
		    	font-weight: bold;
		    	color: #CCC;
			    padding: 16px;
			    position: absolute;
			    top: 40%;
			    transition: 0.6s ease;
			    cursor: pointer;
		    }
		    .back-button {
		    	left: 0;
		    }
		    .next-button {
		     	right: 0;
		    }
		    .back-button:hover, .next-button:hover {
		    	color: #F00;
		    }
		    .fade {
			    animation-name: fade;
			    animation-duration: 1.5s;
		    }
		    @keyframes fade {
			    from {
			    	opacity: 0.4
			    }
			    to {
			    	opacity: 1
		    	}
		    }
			.fade:not(.show) {
				opacity: 1;
			}
			#content {
				width: 80%;
				font-size: 1.2rem;
				color: #444;
				text-align: left;
				padding: 30px 30px 0;
				border-top : 2px solid #E1E1E1;
				margin-top: 30px;
				margin-left: 150px;
			}
			#button-list i {
				margin-right: 10px;
			}
			#back-button, #edit-button, #delete-button {
				width: 90px;
				height: 40px;
				background-color: transparent;
				border: 2px solid #CCC;
				margin: 50px 10px 0;
			}
			.nav-icon {
				font-size: 50px;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>

		<main id="review-detail">
			<h1>${dto.subject}</h1>
			
			<div id="date">
				<span><i class="fa-regular fa-calendar"></i><span>방문일</span> ${dto.visit_date}</span>
				<span><i class="fa-regular fa-calendar"></i><span>등록일</span> ${dto.regdate}</span>
				<span><i class="fa-solid fa-eye"></i><span>조회수</span> ${dto.readcount}</span>
			</div>

		    <div class="slideshow">
			    <c:forEach items="${imgList}" var="dto">
				    <div class="slide fade">
				      <img src="/ddstudio/asset/image/${dto.img}">
				    </div>
			  	</c:forEach>

			    <a class="back-button" onclick="plusSlides(-1)">&#10094;</a>
			    <a class="next-button" onclick="plusSlides(1)">&#10095;</a>
		    </div>

			<div id="content">${dto.content}</div>
			
			<div id="button-list">
				<button type="button" id="back-button" onclick="location.href='/ddstudio/communicate/review.do?sort=최신순'"><i class="fa-solid fa-list"></i>목록</button>
			
				<c:if test="${lv == 2}">
					<button type="button" id="edit-button" onclick="location.href='/ddstudio/communicate/reviewedit.do?seq=${dto.review_seq}'"><i class="fa-solid fa-pen-to-square"></i>수정</button>
					<button type="button" id="delete-button" onclick="location.href='/ddstudio/communicate/reviewdel.do?seq=${dto.review_seq}'"><i class="fa-solid fa-trash"></i>삭제</button>
				</c:if>
			</div>
		</main>
		
		<%@include file="/WEB-INF/views/inc/footer.jsp"%>

		<script>
		    let slideIndex = 1;
		    
	        showSlides(slideIndex);

	        function plusSlides(n) {
	        	showSlides(slideIndex += n);
	        }

	        function currentSlide(n) {
	        	showSlides(slideIndex = n);
	        }
	
	        function showSlides(n) {
	        	let i;
	        	let slides = document.getElementsByClassName("slide");
	        	
	        	if (n > slides.length) {
	        		slideIndex = 1
	        	}
	        	
	        	if (n < 1) {
	        		slideIndex = slides.length
	        	}
	        	
	        	for (i = 0; i < slides.length; i++) {
	            	slides[i].style.display = "none";
	        	}
	        	
	        	slides[slideIndex-1].style.display = "block";
	        }
		</script>
	</body>
</html>