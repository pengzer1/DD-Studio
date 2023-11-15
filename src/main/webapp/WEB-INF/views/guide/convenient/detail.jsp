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
		padding-top:15px;
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
		
		<div id="convenient-map">
			<div id="map" style="width: 1125px; height: 400px;"></div>
		</div>
		
		<hr>

		<!-- 편의시설 이미지 -->
		<div id="content">
			<div class="munti-content-container">
			<c:forEach items="${list}" var="dto">
				<div class="item">
					<div style="background-image: url('/ddstudio/asset/image/convenient/${dto.img}');"></div>
					<div style="color:black;">${dto.name}</div>
					<div style="color:black;">운영시간 : ${dto.time}</div>
					<div style="color:black;">전화번호 : ${dto.tel}</div>
				</div>
				</c:forEach>
			</div>
		</div>
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40256c0b64f3ce915f7db1ab8f75aeca"></script>
	<script>
	const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    
    const options = { //지도를 생성할 때 필요한 기본 옵션
       center : new kakao.maps.LatLng(33.3808, 126.5450), //지도의 중심좌표.
       level : 10, //지도의 레벨(확대, 축소 정도)
       draggable : false, // 이동 금지
       disableDoubleClick : true, // 더블클릭 확대 금지
       scrollwheel : false  // 휠 확대/축소 금지
    };

    const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    
    //마커 출력
    let imageSrc = '/ddstudio/asset/image/marker/info1.png'; // 마커이미지의 주소
    const imageSize = new kakao.maps.Size(40,40);
    const option = {};
    
    //마커 설정 완료
    const markerImg = new kakao.maps.MarkerImage(imageSrc, imageSize, option);
      
    <c:forEach items="${list}" var="dto" varStatus="status">
      
    const m${status.count} = new kakao.maps.Marker({
       position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng})
    });
    
    //markers.push(marker); // 마커를 배열에 추가
      
    m${status.count}.setImage(markerImg);
    m${status.count}.setMap(map);
    
    <%--m${status.count}.seq = ${dto.location_seq};  //클릭이벤트를 했을때 연결해주는 seq
    
    /*
     kakao.maps.event.addListener(m${status.count}, 'click', function (evt) {
    	 // 이미지를 클릭하면 해당 마커에 효과주기
    	 
    	 selPlace(this.seq);
    	 $('#map > div > div > div > div > div > img').css('opacity', '.3');
    	 $(event.target).css('opacity', '1');
     });
    
     markers.push({
    	 
   	  seq: ${dto.seq},
   	  lat: ${dto.lat},
   	  lng: ${dto.lng}
   	  
     });
     */
      --%>
    </c:forEach>
  
     /*
    function selPlace(seq) {
  	  
  	  $('#content .item').css('background-color', 'transparent');
  	  $('#content #item' + seq).css('background-color', 'gold');
  	  
    }
     */
		
	</script>
</body>
</html>