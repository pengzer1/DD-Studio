<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	#main {
		display: flex;
		align-items: flex-start;
	}
	#main table {
		width: 384px;
		margin: 0px 16px;
		margin-bottom: 10px;
	}
	
	#list td {
		cursor: pointer;
	}
	
	/* 목록 내 삭제 버튼 우측 정렬 */
	#list td span:last-child {
		float: right;
		display: none;
	}

	#list td:hover span:last-child {
		display: inline;
	}
</style>
</head>
<body class="wide">
	<!-- ex04.jsp -->
	<h1>Map <small>즐겨찾기(CRD)</small></h1>
	
	<div id="main">
		<div id="map" style="width:768px;height:400px;"></div>
	<div>
		<table>
			<tr>
				<td>
					<select name="category" id="category">
						<option value="default">기본</option>
						<option value="cafe">카페</option>
						<option value="food">음식점</option>
						<option value="private">개인</option>
					</select>
					<input type="text" name="name" id="name" class="middle" />
					<input type="button" value="추가하기" id="btn" />
				</td>
			</tr>
		</table>
			
		<table id="list">
			<tbody></tbody>
			<!-- <tr>
				<td>AAA</td>
			</tr> -->
		</table>
	</div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c089ee6f3d885cfbe52b2f15d8f3f531"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
	
	 	/* 지도를 담을 영역의 DOM 레퍼런스 */
		const container = document.getElementById('map');
	 	//var to const changed > 요즘 스타일로 바꿈~~
		
		/* 지도를 생성할 때 필요한 기본 옵션 */
	 	const options = { 
 			center: new kakao.maps.LatLng(37.499316, 127.033192), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		let m = null;
		let lat = null;
		let lng = null;
		
		kakao.maps.event.addListener(map, 'click', function(evt){
			
			lat = evt.latLng.getLat();
			lng = evt.latLng.getLng();
			
			if(m != null) { //null이 아니면 기존 마커가 이미 만들어져있다는 얘기!
				
				//기존 마커 제거
				m.setMap(null);
			}

			
			//카테고리 확인
			//$('#category').val() > 아이콘 이미지명
			let imageUrl = '/toy/asset/marker/' + $('#category').val() + '.png';
			let imageSize = new kakao.maps.Size(40, 40);
			let option = {
				//spriteOrigin: new kakao.maps.Point(10, 20),
				//spriteSize: new kakao.maps. Size(36, 98)
			}
			
			//let markerImage = new kakao.maps.MarkerImage(src, size, option);
			let markerImage = new kakao.maps.MarkerImage(imageUrl, imageSize, option);
			
			//기존 마커에 연결해주는 작업만 하면 끝!

			m = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(lat, lng)
			});
			
			m.setImage(markerImage);
			m.setMap(map);
			
			$('#name').select();
			
		});
		
		
		$('#category').change(function(){
			
			//마커가 있다면 > 아이콘 변경
			
			if (m != null) {
				
				let imageUrl = '/toy/asset/marker/' + $('#category').val() + '.png';
				let imageSize = new kakao.maps.Size(40, 40);
				let option = {};
				
				let markerImage = new kakao.maps.MarkerImage(imageUrl, imageSize, option);
				
				m.setImage(markerImage);
			}
			
		});
		
		
		
		//추가하기
		$('#btn').click(function() {
			
			$.ajax({
				type: 'POST',
				url: '/toy/map/addplace.do',
				data: {
					lat: lat,
					lng: lng,
					name: $('#name').val(),
					category: $('#category').val()
				},
				dataType: 'json',
				success: function(result) {
					
					if (result.result == 1) {
						
						$('#category').val('default');
						$('#name').val('');
						$('#name').select();
						
						//추가한 목록을 아래 테이블에 출력
						load();
						
					} else {
						alert('failed');
					}
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
			
			
		});
		
		
		//목록보기
		load(); //함수 호이스팅
		
		function load(){
			
			$.ajax({
				type: 'GET',
				url: '/toy/map/listplace.do',
				dataType: 'json',
				success: function(result) {
					
					//이전 내용 초기화 작업
					$('#list tbody').html('');
					
					
					$(result).each((index, item) => {
						
						$('#list tbody').append(` //템플릿스트링 사용하기
								
								<tr>
									<td onclick="selPlace(\${item.lat}, \${item.lng}, '\${item.category}');">
									
										<span>\${item.name}</span><span title="delete" onclick="delPlace(\${item.seq});">&times;</span></td>
								</tr>
								
								`);
						
						
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});
		}
		
		function selPlace(lat, lng, category) {
			
			//해당 장소 > 위도, 경도 > 마커 출력하기
			//alert(lat + ',' + lng);
			
			if(m != null) { //null이 아니면 기존 마커가 이미 만들어져있다는 얘기!
				
				//기존 마커 제거
				m.setMap(null);
			}

			
			m = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(lat, lng)
			});
			
			
			m.setImage(markerImage);
			m.setMap(map);
			
			//map.setCenter()
			map.panTo(new kakao.maps.LatLng(lat, lng));
			
			$('#list td').css('background-color', 'transparent');
			$(event.currentTarget).css('background-color', 'gold');
			
		}
		
		
	</script>	
</body>
</html>