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
.button-container {
	display: flex;
}

.item {
	width: 50%;
	height: 600px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: #CCC; /* transparent */
	border-radius: 8px;
	margin: 10px;
	padding: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease-in-out;
	cursor: pointer;
	font-size: 40px;
	font-weight: 600;
	color: #333;
	position: relative;
	overflow: hidden;
}

.item>div:nth-child(1) {
	background-color: transparent;
}

.item div.img-container {
	width: 100%;
	height: 100%;
	background-size: cover;
	background-position: center;
}

.item:hover {
	transform: scale(1.02);
}

.item h3 {
	margin: 0;
	font-size: 18px;
	color: #333;
}

#title {
	margin-top: 123px;
}

#content {
	margin-top: 50px !important;
	padding: 0;
}

#worldcup-container {
	width: 100%;
	display: flex;
}
</style>
</head>
<body>
	<%-- /test/worldcup/detail.jsp --%>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
        <div id="title" style="margin-top: 123px;">
            <h2>DD 월드컵</h2>
        </div>

        <div id="worldcup-container" class="button-container">
            <!-- 어트랙션을 출력 -->
            <c:forEach var="attraction" items="${selectedTwoAttractions}">
                <div class="item" onclick="selectAttraction('${attraction.attraction_seq}')">
                    <div class="img-container" style="background-image: url('/ddstudio/asset/image/${attraction.img}');"></div>
                    <h3>${attraction.name}</h3>
                </div>
            </c:forEach>
        </div>
    </main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	  <script>
		  let selectedTwoAttractions;
	
		  $(document).ready(function () {
		      // 페이지가 로드될 때 세션 초기화 요청
		      initializeSession();
		  });
	
		  function initializeSession() {
		      $.ajax({
		          type: 'POST',
		          url: '/ddstudio/test/worldcupdetail.do',
		          data: {
		              'isNewSession': true
		          },
		          success: function (data) {
		              console.log('세션 초기화 완료:', data);
		          },
		          error: function (a, b, c) {
		              console.error('세션 초기화 에러:', a, b, c);
		          }
		      });
		  }
	
		  function selectAttraction(attractionSeq) {
		      $.ajax({
		          type: 'POST',
		          url: '/ddstudio/test/worldcupdetail.do',
		          data: {
		              'attractionSeq': attractionSeq
		          },
		          success: function (data) {
		              console.log('선택한 어트랙션 정보:', data.selectedTwoAttractions);
		              console.log('남은 어트랙션:', data.remainingAttractionSeqs);
	
		              // 전역 변수에 할당
		              selectedTwoAttractions = data.selectedTwoAttractions;
	
		              // refreshScreen 함수 호출
		              refreshScreen();
		          },
		          error: function (a, b, c) {
		              console.error(a, b, c);
		          }
		      });
		  }
	
		  function refreshScreen() {
		      console.log('refreshScreen 함수 호출');
	
		      // 모든 어트랙션을 화면에 갱신
		      $('#worldcup-container').empty();
		      for (let i = 0; i < selectedTwoAttractions.length; i++) {
		          const attraction = selectedTwoAttractions[i];
		          const imgUrl = attraction.img ? '/ddstudio/asset/image/' + attraction.img : '쌍용열차.jpg';
		          const item = $('<div class="item" onclick="selectAttraction(' + attraction.attraction_seq + ')">')
		              .append('<div class="img-container" style="background-image: url(\'' + imgUrl + '\');"></div>')
		              .append('<h3>' + attraction.name + '</h3>');
		          $('#worldcup-container').append(item);
		      }
		  }
    </script>
</body>
</html>
