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

.sub-title > p {
	font-size: 20px;
    font-weight: 800;
}

.button {
	background-color: rgba(200, 229, 229, 0.6);
}

table {
	border-left: 2px solid #d1d1d1;
    border-right: 2px solid #d1d1d1;
    border-radius: 20px;
    border-collapse: separate;
    background: #eeeef0;
}

table th {
	padding: 0 10px;
}
</style>
</head>
<body>
	<!-- register.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>기프트샵 수정</h1>

		<div class="sub-title">
			<p>샵정보입력</p>
		</div>

		<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/shop/giftshop/edit.do" enctype="multipart/form-data">
					<table>
						<!-- 샵명 필드 -->
						<tr>
							<th class="required">기프트샵명</th>
							<td>
								<div class="name">
									<input type="text" name="name" id="name" required
										class="middle-flat" value="${dto.name}">
								</div>
							</td>
						</tr>
						<!-- 운영 시간 필드 -->
						<tr>
							<th class="required">운영 시간</th>
							<td>
								<div>
									<input type="time" name="start-time" id="start-time" required
										class="short-flat" value="${dto.startTime}"> <input type="time" name="end-time"
										id="end-time" required class="short-flat" value="${dto.endTime}">
								</div>
							</td>
						</tr>
						<!-- 이름 필드 -->
						<tr>
							<th class="required">샵 정보</th>
							<td>
								<div>
									<input type="text" name="info" id="info" required
										class="middle-flat" value="${dto.info}">
								</div>
							</td>
						</tr>
						<!-- 연락처 필드 -->
						<tr>
							<th class="required">연락처</th>
							<td>
								<div>
									<input type="text" name="tel" id="tel" required class="middle-flat" value="${dto.tel}" placeholder="010-XXXX-XXXX">
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
						<!-- 이미지 필드 -->
						<tr>
							<th class="required">이미지</th>
							<td>
								<input type="file" name="images1" id="images">
							</td>
						</tr>
						<tr>
							<th> </th>
							<td>
								<input type="file" name="images2" id="images">
							</td>
						</tr>
						<tr>
							<th> </th>
							<td>
								<input type="file" name="images3" id="images">
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<!-- validateAndSubmit 함수로 가입 버튼 클릭 시 유효성 검사 -->
									<!-- <div id="ok-message"></div> -->
									<button type="submit" id="join" class="check button">수정</button>
									<button type="button" id="cancel" class="button"
										onclick="location.href='/ddstudio/shop/giftshop.do';">취소</button>
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="lng" id="lng" value="${dto.lng}"> <input
						type="hidden" name="lat" id="lat" value="${dto.lat}">
					<input type="hidden" name="shop_seq" value="${dto.shop_seq}">
				</form>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

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
	let lat = ${dto.lat};
	let lng = ${dto.lng};
	
	m = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(lat, lng)
    });

    m.setMap(map);
	
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