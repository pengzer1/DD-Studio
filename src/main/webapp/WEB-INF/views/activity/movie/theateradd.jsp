<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/ddstudio/asset/css/main.css">
<link rel="stylesheet" href="/ddstudio/asset/css/user.css">
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<style>

	#cancel {
	margin-right: 15px;
	}
	
	#duplicate-check {
		padding: 0;
	}
	
	select {
	   width: 85%;
	   padding: 10px;
	   font-size: 14px;
	   border: 1px solid #ccc;
	   border-radius: 4px;
	   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	   appearance: none;
	   -webkit-appearance: none;
	   background-position: right 10px center;
	   background-repeat: no-repeat;
	}
	
	select option:checked {
	   background-color: #ddd;
	}
	
    #restriction {
    	width: 500px;
    	max-width: 500px;
    	
    }
    
    td > div > textarea {
    	border: 1.5px solid #eeeeee;
    }
    
    textarea::placeholder {
		font-size: 16px;
		font-weight: 00;
		color: #9e9e9e;
		text-align: center;
	}
	
	input::placeholder {
		font-size: 16px;
		font-weight: 00;
		color: #9e9e9e;
		text-align: center;
	}
	
	table {
		width: 700px;
		margin: 0 auto;
	}
	
	td > div > input[type=radio] {
		width: auto;
		height: auto;
		border: 1.5px solid #ccc;
		border-radius: 7px;
		appearance: auto;
	}
	
	table {
	  	border-left: 2px solid #d1d1d1;
	    border-right: 2px solid #d1d1d1;
	    border-radius: 20px;
	    border-collapse: separate;
	}
    
</style>
</head>
<body>
	<!-- /ddstudio/activity/movie/theateradd.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="main">
	<h1>영화관 추가</h1>

	<div class="sub-title">
		<p>영화관 정보 입력</p>
	</div>
		
	<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/activity/theateradd.do" onsubmit="return true;" id="form">
					<table>
						<!-- 영화관명 필드 -->
						<tr>
							<th class="required">영화관명</th>
							<td>
								<div>
									<input type="text" name="name" id="name" class="middle-flat" placeholder="영화관명을 입력해주세요." required>
								</div>
							</td>
						</tr>
						<!-- 위치 필드 -->
						<tr>
							<th class="required">위치</th>
							<td>
								<div id="total-map">
									<div>
										<div id="map" class="middle-flat" style="height: 380px;"></div>
									</div>
								</div>
							</td>
						</tr>
		                <!-- 전달 부분 -->
						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<button id="submit" class="check button">추가</button>
									<button type="button" id="cancel" class="button" onclick="location.href='/ddstudio/activity/theater.do';">취소</button>
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="lat" id="lat">
					<input type="hidden" name="lng" id="lng">
				</form>
			</div>
		</div>
	</main>	
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae4c975e0553221a835879cdf6246a66"></script>
	<script>
		const latInput = document.getElementById('lat');
		const lngInput = document.getElementById('lng');
		    
		    const container = document.getElementById('map');
			const options = {
				center : new kakao.maps.LatLng(33.3808, 126.5450),
				level : 10,
				draggable : true, // 이동 금지
				disableDoubleClick : true, // 더블클릭 확대 금지
				scrollwheel : false
			// 휠 확대/축소 금지
			};
			
			const map = new kakao.maps.Map(container, options);
			
			let m = null;
			let lat = null;
			let lng = null;
			
			 kakao.maps.event.addListener(map, 'click', function(evt) {
			        lat = evt.latLng.getLat();
			        lng = evt.latLng.getLng();
	
			        if (m != null) {
			            // 기존 마커 제거
			            m.setMap(null);
			        }
	
			        m = new kakao.maps.Marker({
			            position: new kakao.maps.LatLng(lat, lng)
			        });
	
			        m.setMap(map);
			        
			        latInput.value = lat;
			        lngInput.value = lng;
			        
			    });
			 
		 
	</script>
</body>
</html>


