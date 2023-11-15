<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
	    <style>
			#faq {
				text-align: center;
				margin-top: 150px;
			}
			#search-form {
				margin-top: 50px;
			}
			#search-field {
				height: 40px;
			}
			#search-button {
				background-color: transparent;
				border: none;
				outline: none;
			}
			#search-button span {
				font-size: 40px;
				position: relative;
				top: 13px;
			}
			#type {
			    display: flex;
			    justify-content: space-around;
			    width: 70%;
			    margin: 40px auto 0;
			}
			#type a {
				font-size: 1.5rem;
				font-weight: bold;
				color: #444;
				text-decoration: none;
				border: 0;
			}
			#type a:hover, #type a.selected {
			    color: #29D6AB;
			}
			.faq-list {
			  	width: 80%;
				text-align: center;
				border-top: 2px solid #000;
				margin: 25px auto 0;
			}
			.faq-list input {
			    float: left;
			    margin-top: 46px;
			}
			.faq {
				color: #444;
				text-align: left;
				padding: 30px;
				border-bottom: 1px solid #E1E1E1;
			  	overflow: hidden;
			  	position: relative;
			  	transition: 0.3s ease;
			}
			.question {
				display: flex;
				align-items: center;
				height: 50px;
				font-size: 1.3rem;
				color: #333;
				margin-right: 50px;
			}
			.question i {
				font-size: 1.6rem;
				color: #FFD46F;
				margin-right: 30px;
			}
			.answer {
			  	display: none;
			  	font-size: 1.08rem;
			  	color: #444;
			  	margin: 40px 0 0;
			}
			.faq.toggle .answer {
			  	display: block;
			}
			.toggle-button {
				display: flex;
			  	align-items: center;
			  	justify-content: center;
				width: 30px;
				height: 30px;
				font-size: 16px;
			  	background-color: transparent;
			  	border: 0;
			  	border-radius: 50%;
			  	position: absolute;
			  	top: 35px;
			  	right: 30px;
			  	cursor: pointer;
			}
			#up-button {
			  display: none;
			}
			.toggle #down-button {
			  	display: none;
			}
			.toggle #up-button {
				display: block;
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
			#button-list {
    			text-align: right;
			}
			#button-list i {
				margin-right: 10px;
			}
			#add-button, #edit-button, #delete-button {
				width: 90px;
				height: 40px;
				background-color: transparent;
				border: 2px solid #CCC;
				margin: 30px 10px 0;
			}
			#delete-button {
				margin-right: 150px;
			}
			.nav-icon {
				font-size: 50px;
			}
	    </style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="faq">
			<h1>FAQ</h1>
			
			<form method="GET" action="/ddstudio/communicate/faq.do" id="search-form">
				<input type="hidden" name="type" value="${map.type}">
				<input type="text" name="word" id="search-field" size="60" pattern=".{2,}" placeholder="두 글자 이상의 단어를 입력하세요." value="${map.word}" required>
					
				<button type="submit" id="search-button"><span class="material-symbols-outlined">search</span></button>
			</form>
			
			<div id="type">
			    <a href="/ddstudio/communicate/faq.do?type=이용정보" class="${param.type == '이용정보' ? 'selected' : ''}"># 이용정보</a>
			    <a href="/ddstudio/communicate/faq.do?type=액티비티" class="${param.type == '액티비티' ? 'selected' : ''}"># 액티비티</a>
			    <a href="/ddstudio/communicate/faq.do?type=혜택" class="${param.type == '혜택' ? 'selected' : ''}"># 혜택</a>
			    <a href="/ddstudio/communicate/faq.do?type=예매" class="${param.type == '예매' ? 'selected' : ''}"># 예매</a>
			    <a href="/ddstudio/communicate/faq.do?type=기타" class="${param.type == '기타' ? 'selected' : ''}"># 기타</a>
			</div>

			<div class="faq-list">
				<c:forEach items="${list}" var="dto">
					<c:if test="${lv == 2}">
						<input type="checkbox" data-seq="${dto.faq_seq}">
			        </c:if>
			        
	      			<div class="faq">
	        			<span class="question"><i class="fa-solid fa-q"></i>${dto.question}</span>
	        			<span class="answer">${dto.answer}</span>
	
	        			<button class="toggle-button">
	        				<i id="down-button" class="fas fa-chevron-down"></i>
	        				<i id="up-button" class="fas fa-chevron-up"></i>
	        			</button>
	      			</div>
      			</c:forEach>
      		</div>
		</main>
		
		<div id="page-bar">${pageBar}</div>
		
		<c:if test="${lv == 2}">
			<div id="button-list">
				<button type="button" id="add-button"><i class="fa-solid fa-plus"></i>등록</button>
				<button type="button" id="edit-button"><i class="fa-solid fa-pen-to-square"></i>수정</button>
				<button type="button" id="delete-button"><i class="fa-solid fa-trash"></i>삭제</button>
			</div>
		</c:if>
		
		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
			document.addEventListener('DOMContentLoaded', function () {
		        var searchField = document.getElementById('search-field');
	
		        searchField.addEventListener('keyup', function (event) {
		            if (event.key === 'Enter') {
		                document.getElementById('search-form').submit();
		            }
		        });
		    });
		
			const toggles = document.querySelectorAll(".toggle-button");
	
			toggles.forEach((toggle) => {
			    toggle.addEventListener("click", () => {
			        const faq = toggle.parentNode;
			        faq.classList.toggle("toggle");
			        
			        toggles.forEach((otherToggle) => {
			            if (otherToggle !== toggle) {
			                otherToggle.parentNode.classList.remove("toggle");
			            }
			        });
			    });
			});
			
			document.addEventListener('keydown', function(event) {
			    if (event.key === 'F5' || ((event.ctrlKey || event.metaKey) && event.key === 'F5')) {
			    	location.href='/ddstudio/communicate/faq.do?type=이용정보';
			    }
			});
			
			$('#add-button').click(function () {
				location.href='/ddstudio/communicate/faqadd.do';
			});
			
			$('#edit-button').click(function () {
		        var selectedCheckboxes = $('input[type="checkbox"]:checked');

		        if (selectedCheckboxes.length === 1) {
		            var seq = selectedCheckboxes.data('seq');
		            location.href = '/ddstudio/communicate/faqedit.do?seq=' + seq;
		        } else {
		            alert('하나의 항목을 선택하세요.');
		        }
		    });

		    $('#delete-button').click(function () {
		        var selectedCheckboxes = $('input[type="checkbox"]:checked');

		        if (selectedCheckboxes.length === 1) {
		            var seq = selectedCheckboxes.data('seq');
		            location.href = '/ddstudio/communicate/faqdel.do?seq=' + seq;
		        } else {
		            alert('하나의 항목을 선택하세요.');
		        }
		    });
		</script>
	</body>
</html>