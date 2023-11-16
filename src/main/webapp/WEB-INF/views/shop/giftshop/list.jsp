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
#title h2 {
	color: #EEE;
}

.item>div:nth-child(2) {
	display: flex;
	flex-direction: column;
	text-align: left;
	justify-content: left;
	align-items: normal;
	padding: 8px;
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

.condition-btn>button {
	margin: 3px;
	border: 0;
	border-radius: 10px;
	padding: 10px 10px;
	color: #222;
	background-color: #FFF;
}

#default-searchbar {
	padding: 30px
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title"
			style="margin-top: 123px; background-image: url('/ddstudio/asset/image/background-5.jpg');">
			<h2>기프트샵</h2>
			<br>
			<p>사랑 가득, 추억 듬뿍! 기프트샵에서 귀여운 상품들을 만나보세요.</p>
		</div>

		<div id="content">
			<div id="condition">
				<!-- 조건 검색 (click 전) -->
				<div id="default-searchbar">
					<h3>
						<i class="fa-solid fa-magnifying-glass"></i> 조건 검색
					</h3>
				</div>

				<!-- 조건 검색 (click 후) -->
				<form method="GET" action="/ddstudio/shop/giftshop.do">
					<div id="hidden-searchbar">
						<div>
							<h4>
								<i class="fa-solid fa-magnifying-glass"></i> 조건 검색
							</h4>
							<div class="block-bubbling">
								<div class="condition-container">
									<div>운휴일정</div>
									<select name="close" id="close-select" class="selectbox">
										<option value="open">정상운영</option>
										<option value="close">운휴</option>
									</select>
									<div class="condition-btn">
										<button>
											<i class="fa-solid fa-magnifying-glass"></i> 검색
										</button>
										<!-- <button type="button" onclick="location.href='/ddstudio/activity/attraction.do';"><i class="fa-solid fa-circle-arrow-left"></i> 취소</button> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

			<c:if test="${not empty lv && lv == 2}">
				<div id="admin-btn">
					<button type="button" id="add-btn"
						onclick="location.href='/ddstudio/shop/giftshop/add.do'">
						<i class="fa-solid fa-plus"></i> 추가
					</button>
				</div>
			</c:if>

			<div class="munti-content-container">

				<c:forEach items="${list}" var="dto">
					<div class="item" onclick="detail(${dto.shop_seq})">
						<div
							style="background-image: url('/ddstudio/asset/image/${dto.img}');"></div>
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
	if (${not empty close}) {
		
		$('#hidden-searchbar').css('display', 'block');
		$('#condition').css('height', '200px');
		$('#default-searchbar').css('display', 'none');

		if (${close == 'open'}) {
			$('#close-select').val("open").prop("selected", true);
		} else if (${close == 'close'}) {
			$('#close-select').val("close").prop("selected", true);
		}
	}
	
		function detail(seq) {
			window.location.href = "/ddstudio/shop/giftshop/detail.do?seq="+seq;
		}
	</script>
</body>
</html>


