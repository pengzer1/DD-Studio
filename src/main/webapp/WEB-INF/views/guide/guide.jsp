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
			<h2>코스 이미지</h2>
		</div>
		
		<div id="convenient-map">
			<div id="map" style="width: 1125px; height: 400px;"></div>
		</div>
		
		<hr>
		
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

    
    //
    var positions = [  // 마커를 표시할 위치
        {
            title: '천공의 성', 
            latlng: new kakao.maps.LatLng(33.271351, 126.697224)
        },
        {
            title: '황야의 무법자', 
            latlng: new kakao.maps.LatLng(33.382156, 126.3013)
        },
        {
            title: '코쿠리코 언덕에서', 
            latlng: new kakao.maps.LatLng(33.353147, 126.708275)
        },
        {
        	title: '마루 밑 아리에티를 찾아서', 
            latlng: new kakao.maps.LatLng(33.4471, 126.4226)
        }
    ];
    
    //마커 출력
    let imageSrc = '/ddstudio/asset/image/marker/heart_marker3.png'; // 마커이미지의 주소
    let imageSize = new kakao.maps.Size(40,40);
    let option = {};
    
    //마커 설정 완료
    let markerImg = new kakao.maps.MarkerImage(imageSrc, imageSize, option);
      
    for (var i = 0; i < positions.length; i ++) {
        // 마커를 생성
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시
            image : markerImg // 마커 이미지 
        });
        
     	// 인포윈도우를 생성
        var infowindow = new kakao.maps.InfoWindow({
            position : positions[i].latlng, 
            content : '<div style="padding:0;">' + positions[i].title + '</div>'
        });
     	
        infowindow.open(map, marker); 

    }

  
		
	</script>
</body>
</html>