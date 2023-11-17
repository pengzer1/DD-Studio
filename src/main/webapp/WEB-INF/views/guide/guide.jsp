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
#convenient-map{
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 15px;
}

#main>.item div {
	background-color: white;
}

.middle-flat {
	color: #000;
	margin-top: 50px;
	width: 400px;
	height: 40px;
	padding: 10px;
	border: 1px solid #ccc;
	font-size: 16px;
	margin: 0;
	align-items: center;
	justify-content: center;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input[type="text"], .form-group input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.form-group input[type="password"] {
	margin-bottom: 10px;
}

.form-group input[type="tel"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.address-group {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	
}

.address-group input[type="text"] {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.btn-container {
	text-align: center;
	margin-top: 20px;
}

.btn {
	padding: 10px 20px;
	background-color: #0074cc;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn.cancel {
	background-color: #ccc;
}

#personnel {
	display: flex;
	flex-wrap: wrap;
}

#personnel>div {
	flex: 0 0 calc(33.33% - 20px);
	align-text: center;
	margin: 10px;
	justify-content: space-around;
	align-items: center;
}

ul {
	list-style-type: none;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	font-size: 14px;
}

li {
	display: inline-block;
	width: 80%;
	position: relative;
	vertical-align: top;
}

.personnel ul li .txt_wrap {
	float: left;
	padding-bottom: 0;
	text-align: left;
	width: 53%;
	display: block;
}

.personnel ul li .txt_wrap .tit {
	margin: 0;
	padding: 0;
	border: 0;
	color: #505050;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	margin-top: 0;
	margin-bottom: 1rem;
}

.personnel ul li .count_wrap {
	float: right;
	margin-top: 3px;
	/* width: 120px; */
}

table {
	height: 46px;
	margin: auto;
	font-size: 20px;
}

table td {
	width: 250px;
	margin: auto;
}

#ticket-type {
	height: 46px;
	text-align: center;
	font-size: 22px;
}

#ticket-type input {
	margin: 0px 10px;
}

#ticket-type label {
	display: inline-block;
}

.tab_red {
	position: relative;
	background: #3e3e4d;
	z-index: 1;
}

.tab {
	overflow: hidden;
	width: 100%;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-ms-box-sizing: border-box;
	background: url(/images/common/bg_tab.gif) repeat-x;
	box-shadow: 0 1px 5px rgba(0, 0, 0, .4);
}

.tab li {
	float: left;
}

.tab .two {
	width: 45%;
}

.tab_red .on {
	background-color: #2b72c9;
}

.tab li a {
	display: block;
	width: 86%;
	height: 48px;
	margin: 0 auto;
	line-height: 48px;
	color: #777;
	text-align: center;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-ms-box-sizing: border-box;
	font-size: 20px;
}

.tab_red li a {
	padding: 0;
	color: #787883;
}

.tab_red .on a {
	color: white;
}

#tbl01, #tbl02 {
	text-align: center;
	justify-content: space-around;
	align-items: center;
}

.res_benefit {
	text-align: center;
	/* justify-content: space-around; */
	align-items: center;
}

.res_benefit li.line {
	margin-bottom: 20px;
	border-bottom: 1px solid #e5e5e5;
}

.res_benefit li .tit {
	float: left;
	width: 100px;
	margin-bottom: 20px;
}

.res_benefit li .tit .tit_lt {
	position: relative;
	float: left;
	width: 60%;
	height: 51px;
	line-height: 51px;
	padding-left: 2%;
	background: #f7f7f7;
	border: 1px solid #e5e5e5;
	border-right: 0 none;
	box-sizing: border-box;
	font-size: 18px;
}

.res_benefit li .tit .tit_rt {
	float: left;
	width: 38%;
	height: 51px;
	line-height: 51px;
	padding-right: 2%;
	background: #eee;
	font-size: 18px;
	text-align: right;
}

.res_benefit li .cont {
	float: left;
	width: 60%;
	margin-bottom: 20px;
	border-right: 1px solid #e5e5e5;
	box-sizing: border-box;
}

.res_benefit li .it {
	float: left;
	width: 36%;
	padding: 0 2%;
	margin-bottom: 6px;
}

.res_benefit li .cont .img {
	float: left;
	width: 35%;
}

.res_benefit li .cont .img .img_box {
	position: relative;
	height: 196px;
	border: 1px solid #e5e5e5;
	box-sizing: border-box;
}

.res_benefit li .cont .txt {
	float: left;
	width: 55%;
	padding: 0 5%;
}

#main_box {
	border: 1px solid black;
	width: 1300px;
	text-align: center;
	padding-top: 5px;
	margin: 0 auto;
}

#content_box {
	border: 1px solid black;
	align-items: center;
	width: 200px;
	height: 30px;
	padding: 5px;
	margin: 5px 10px;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">

		<div id="title" style="margin-top: 123px; background-image: url('/ddstudio/asset/image/ponyo013.jpg');">
			<h2>코스 이미지</h2>
		</div>

		<div class="form-group">
			<ul class="tab tab_red" style="margin-top:100px; margin-bottom:100px; width:100%;">
				<li id="sel01" class="two on"><a href="#tab01" id="selTab01">어트랙션</a></li>
				<li id="sel02" class="two"><a href="#tab02" id="selTab02">편의시설</a></li>
			</ul>
			<div id="tab01" style="display: none;">
				<div id="main_box">
					<p style="text-align: center;">현재 등록되어 있는 어트랙션입니다.</p>
					<hr>
					<div
						style="display: flex; flex-wrap: wrap; align-items: center; margin-left: 10px; justify-content: center;">
						<c:forEach items="${alist}" var="dto">
							<div id="content_box">
								<p style="text-align: center;">${dto.name}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="tab02" style="display: none;">
				<div id="main_box">
					<p style="text-align: center;">현재 등록되어 있는 편의시설입니다.</p>
					<hr>
					<div
						style="display: flex; flex-wrap: wrap; align-items: center; margin-left: 10px; justify-content: center;">
						<c:forEach items="${clist}" var="dto">
							<div id="content_box">
								<p>${dto.name}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<div id="convenient-map">
			<div id="map" style="width: 1125px; height: 400px;"></div>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40256c0b64f3ce915f7db1ab8f75aeca"></script>
	<script>
	

    const alist = [];  //어트랙션 마커들을 담을 배열
    const clist = [];  //편의시설 마커들을 담을 배열
    
    <c:forEach items="${alist}" var="dto" varStatus="status">
    
    const m${status.count} = new kakao.maps.Marker({
       position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng})
    });  //alist 위치 생성

    alist.push(m${status.count});  //배열에 push
    
    </c:forEach>
    
    <c:forEach items="${clist}" var="dto" varStatus="status">
    
    const n${status.count} = new kakao.maps.Marker({
       position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng})
    });  //clist 위치 생성

    clist.push(n${status.count});  //배열에 위치 push
    </c:forEach>
    
    
	const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    
    const options = { //지도를 생성할 때 필요한 기본 옵션
       center : new kakao.maps.LatLng(33.3808, 126.5450), //지도의 중심좌표.
       level : 10, //지도의 레벨(확대, 축소 정도)
       draggable : false, // 이동 금지
       disableDoubleClick : true, // 더블클릭 확대 금지
       scrollwheel : false  // 휠 확대/축소 금지
    };

    const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
  	
  	//
  
    //
    showTab("tab01", "heart_marker3.png");  //페이지 초기화 값
	
	document.getElementById("selTab01").addEventListener("click", function() {  //tab01을 눌렀을때
		event.preventDefault();
      showTab("tab01", "heart_marker3.png");
      
      document.getElementById("sel01").classList.add("on");
      document.getElementById("sel02").classList.remove("on");
    });

    document.getElementById("selTab02").addEventListener("click", function() {   //tab02을 눌렀을때
    	event.preventDefault();
      	showTab("tab02", "info1.png");
      
      	document.getElementById("sel02").classList.add("on");
      	document.getElementById("sel01").classList.remove("on");
    });
    
    function showTab(tabId, imgname) {
    
    	//마커 출력
        let imageSrc; // 마커이미지의 주소
        if (imgname === "heart_marker3.png") {
            imageSrc = '/ddstudio/asset/image/marker/heart_marker3.png';
        } else if (imgname === "info1.png") {
            imageSrc = '/ddstudio/asset/image/marker/info1.png';
        } else {
            // 기본 이미지 주소 또는 예외 처리
            imageSrc = '/ddstudio/asset/image/marker/festival_marker4.png';
        }
        const imageSize = new kakao.maps.Size(40,40);
        const option = {};
        
        //마커 설정 완료
        const markerImg = new kakao.maps.MarkerImage(imageSrc, imageSize, option);
         
        if (tabId == 'tab01') {
    		for (let i=0; i<alist.length; i++) {
    			alist[i].setImage(markerImg);  //설정한 마커 넣어주고
    			alist[i].setMap(map);  //지도에 찍기
    		}
    		for (let i=0; i<clist.length; i++) {  //어트랙션 찍을때는 편의시설 마크 지워주기
    			clist[i].setMap(null);
    		}
    	} else {  //tabId == 'tab02'
    		for (let i=0; i<clist.length; i++) {
    			clist[i].setImage(markerImg);
    			clist[i].setMap(map);
    		}
    		for (let i=0; i<alist.length; i++) {
    			alist[i].setMap(null);
    		}
    	}
       
    	
    	// 모든 탭 숨기기
        document.getElementById("tab01").style.display = "none";
        document.getElementById("tab02").style.display = "none";

        // 선택한 탭 보이기
        document.getElementById(tabId).style.display = "block";
    	 
      }
    
    document.addEventListener('DOMContentLoaded', function () {
    	  const contentBoxes = document.querySelectorAll('#content_box');
		
    	  contentBoxes.forEach((box, index) => {
    	    box.addEventListener('click', function (event) {
    	      const itemId = this.id;

    	      contentBoxes.forEach((box) => {
    	        box.style.backgroundColor = 'white'; // 모든 박스의 배경색 초기화
    	      });
    	      this.style.backgroundColor = 'gold'; // 클릭된 박스의 배경색 변경

    	      // 클릭된 리스트 아이템에 대한 추가 동작
    	      setMarkersOpacity(index, 1);
    	    });
    	  });
    	});

    	function setMarkersOpacity(clickedIndex, opacity) {
    	  // 모든 마커의 투명도를 초기화
    	  alist.forEach((marker) => {
    	    marker.setOpacity(0.3);
    	  });
    	  
    	  clist.forEach((marker) => {
    	    marker.setOpacity(0.3);
    	  });

    	  // 클릭된 인덱스에 해당하는 마커의 투명도를 조절
    	  if (document.getElementById('sel01').classList.contains('on')) {
    	    // 어트랙션 탭이 선택된 경우
    	    if (alist[clickedIndex]) {
    	      alist[clickedIndex].setOpacity(opacity);
    	    }
    	  } else if (document.getElementById('sel02').classList.contains('on')) {
    	    // 편의시설 탭이 선택된 경우
    	    clickedIndex -= alist.length;
    	    if (clist[clickedIndex]) {
    	      clist[clickedIndex].setOpacity(opacity);
    	    }
    	  }
    	}
		
	</script>
</body>
</html>