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
	#content{
		padding-top: 0px;
	}
	#title {
   margin-top: 123px;
   background-image: url('/ddstudio/asset/image/background-9.jpg');
	}
	.item>img{
		width:450px;
		height:190px;
	}
	
	button {
    background-color: #007bff; /* 배경색 */
    color: #fff; /* 텍스트 색상 */
    border: none;
    border-radius: 5px; /* 둥근 모서리 */
    padding: 10px 20px; /* 내부 패딩 */
    font-size: 16px; /* 폰트 크기 */
    text-align: center;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 */
}

button:hover {
    background-color: #0056b3; /* 마우스 호버 시 배경색 변경 */
}

.item{
	background-color: white;
	width: 450px;
    height: 230px;
}
.item img.totoro-image {
        height: 280px; /* 이미지 높이 조절 */
        transition: transform 0.3s ease-in-out; /* 변환 속성에 대한 전환 효과 추가 */
    }

    .item:hover img.cat-bus {
        animation: shake 2s ease-in-out infinite; /* hover 시에만 흔들리는 애니메이션 적용 */
        transform: translateX(0); /* 초기 위치에서 시작 */
    }

    @keyframes shake {
        0%, 100% {
            transform: translateX(0); /* 처음과 마지막에는 변화 없음 */
        }
        10%, 30%, 50%, 70%, 90% {
            transform: translateX(-5px); /* 좌측으로 흔들림 */
        }
        20%, 40%, 60%, 80% {
            transform: translateX(5px); /* 우측으로 흔들림 */
        }
    }
	
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2>편의시설</h2>
		</div>
		
		<div id="content">	
		<div class="munti-content-container">
			<div class="item">
				<img src="/ddstudio/asset/image/고양이버스.png" alt="고양이버스" class="cat-bus">
				<div><button type="button" id="conveni" onclick="location.href='/ddstudio/guide/convenientdetail.do';">편의시설</button></div>
			</div>
			<div class="item">
				<img src="/ddstudio/asset/image/고양이버스.png" alt="고양이버스" class="cat-bus">
				<div><button type="button" id="shuttle" onclick="location.href='/ddstudio/guide/bus.do';">셔틀버스</button></div>
			</div>
			</div>

			<c:if test="${not empty email && lv == 2}">

				<div class="container">
					<div id="btn3" class="btn">
						<button type="button" class="add" onclick="location.href='/ddstudio/guide/busadd.do';">추가</button>
						<button type="button" class="add" onclick="location.href='/ddstudio/guide/busdel.do';">삭제</button>
					</div>
				</div>
			</c:if>



			<main id="main">

				<div id="title" style="margin-top:123px;">
					<h2>제목</h2>
					<br>
					<p>내용을 입력하세요</p>
				</div>

				<div id="sub-title">
					<h3>제목</h3>
				</div>

				<div id="content">

					<div class="wide-content-container">
						<div class="wide-item">
							<div>번호</div>
							<div>
								<c:forEach items="${routeList}" var="dto">
								<div>${dto.bus_seq}</div>
								</c:forEach>
							</div>
						</div>
						<div class="wide-item">
							<div>노선(출발-종료)</div>
							<div>
								<c:forEach items="${routeList}" var="dto">
									<div>${dto.start_name} ~ ${dto.end_name}</div>
								</c:forEach>
							</div>
						</div>
						<div class="wide-item">
							<div>시작 시간</div>
							<div>
								<c:forEach items="${routeList}" var="dto">
								<div>${dto.start_time}</div>
								</c:forEach>
							</div>
						</div>
						<div class="wide-item">
							<div>배차</div>
							<div>
								<c:forEach items="${routeList}" var="dto">
									<div>${dto.interval}</div>
								</c:forEach>
							</div>
						</div>
						<!— 추가 아이템들 —>
					</div>





				</div>
			</main>
			
			
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!— Footer —>

	<script>
		
	</script>
</body>
</html>


