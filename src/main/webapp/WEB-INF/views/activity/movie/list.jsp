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
	
	#title > h2 {
		/* margin-top: 70px; */
		/* color: #000; */
	}
	
	#title > h2 > a {
		color: #FFF;
		font-family: 'SUIT-Regular';
	}
	
	#title > p {
		color: #000;
	}
	 
	#main > #title {
	 	background-color: transparent;
	 	background-repeat: no-repeat;
	}
	 
	#title {
	 	background-image: url('/ddstudio/asset/image/movie/moive_background.jpg');
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
		margin-top: 20px;
	}
	
	form {
		width: 100%;
		height: 100%
	}
	
	#hidden-searchbar {
		display: none;
		width: 100%;
		height: 100%;
		padding: 40px;
		position: relative;
	}
	
	#hidden-searchbar .condition-container {
		display: flex;
		justify-content: center;
		/* height: 80%; */
		align-items: center;
	}
	
	.block-bubbling {
		display: inline-block;
		padding: 20px;
	}
	
	.condition-btn > button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #FFF;
	}
	
	#delBtn {
		font-size: 50px;
		top: -10px;
		right: 10px;
		color: #FFF;
	}
	
	#delBtn > a {
		color: #FFF;
	}
	
	#default-searchbar {
		padding: 30px
	}
	
	#date {
		border-radius: 5px;
		height: 30px;
		padding: 5px;
		width: 120px;
	}
	
</style>
</head>
<body>
	<!-- /activity/movie/list.jsp -->
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<main id="main">

		<div id="title">
			<h2><a href="/ddstudio/activity/movie.do">영화</a></h2>
			<br>
			<p>DD Studio의 다양한 지브리 영화를 관람해보세요!</p>
		</div>

		<div id="content">
			<div id="condition">
			
				<!-- 조건 검색 (click 전) -->
				<div id="default-searchbar">
					<h3><i class="fa-solid fa-magnifying-glass"></i> 조건 검색</h3>
				</div>

				<!-- 조건 검색 (click 후) -->
				<form method="GET" action="/ddstudio/activity/movie.do">
					<div id="hidden-searchbar">
						<span id="delBtn"style="position: absolute;"><a href="/ddstudio/activity/movie.do">&times;</a></span>
						<div>
							<h4><i class="fa-solid fa-magnifying-glass"></i> 조건 검색</h4>
							<div class="block-bubbling">
								<div class="condition-container">
									<div style="width: 100px; font-size: 20px; font-weight: bold;">상영일정</div>
										<input type="date" name="date" id="date"/>
									<div class="condition-btn">
										<button><i class="fa-solid fa-magnifying-glass"></i> 검색</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<!-- 관리자용 추가 버튼 -->
			<c:if test="${not empty email && lv == 2}">
				<div id="admin-btn">
					<button type="button" id="add-btn" onclick="location.href='/ddstudio/activity/movieadd.do'"><i class="fa-solid fa-plus"></i>영화 등록</button>
					<button type="button" id="add-btn" onclick="location.href='/ddstudio/activity/theateradd.do'"><i class="fa-solid fa-plus"></i>영화관 등록</button>
					<button type="button" id="add-btn" onclick="location.href='/ddstudio/activity/theaterdel.do'"><i class="fa-solid fa-plus"></i>영화관 삭제</button>
					<button type="button" id="add-btn" onclick="location.href='/ddstudio/activity/theateredit.do'"><i class="fa-solid fa-plus"></i>영화관 수정</button>
					
				</div>
			</c:if>

			<!-- 영화 컨텐츠 이미지 -->
			<div class="munti-content-container">
				<c:forEach items="${list}" var="dto">
					<div class="item" onclick="location.href= '/ddstudio/activity/moviedetail.do?seq=' + ${dto.movie_seq};">
					<div style="background-image: url('/ddstudio/asset/image/movie/${dto.img}');"></div>
					<div>${dto.movie_name}</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
	</main>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
		
		$('.block-bubbling').click(function(event) {
	        event.stopPropagation();
	    });
		$('#delBtn').click(function(event) {
	        event.stopPropagation();
	    });
	
	
		$('#condition').click(function() {
			
			if ($('#condition').css('height') == "100px") {
				
				$('#hidden-searchbar').css('display', 'block');
				$('#condition').css('height', '200px');
				$('#condition').css('transition', 'height .3s');
				$('#default-searchbar').css('display', 'none');
				
			} else {
				
				$('#hidden-searchbar').css('display', 'none');
				$('#condition').css('height', '100px');
				$('#condition').css('transition', 'height .3s');
				$('#default-searchbar').css('display', 'block');
		        
			}
			
		});
		
		$('#delBtn').click(function(event) {
			event.stopPropagation();
			
		})
		
		
		
		//조건 검색이 눌린 상태라면 hidden-searchbar가 내려오도록!
		if (${not empty date}) {
			
			$('#hidden-searchbar').css('display', 'block');
			$('#condition').css('height', '200px');
			$('#default-searchbar').css('display', 'none');
	
			$('#date').val('${date}');
			
		}
		
	
	</script>
</body>
</html>


