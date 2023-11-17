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
	
	/* Tagify 사용 시도 */
	.tagify{
		width: 550px;
		max-width: 550px;
	}
	
	.tagify--outside{
        border: 0;
    }

    .tagify--outside .tagify__input{
      order: -1;
      flex: 100%;
      border: 1px solid var(--tags-border-color);
      margin-bottom: 1em;
      /* transition: .1s; */
    }

    .tagify--outside .tagify__input:hover{ border-color:var(--tags-hover-border-color); }
    .tagify--outside.tagify--focus .tagify__input{
      transition:0s;
      border-color: var(--tags-focus-border-color);
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
    
</style>
</head>
<body>
	<!-- /ddstudio/activity/attraction/add.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="main">
	<h1>어트랙션 추가</h1>

	<div class="sub-title">
		<p>어트랙션 정보 입력</p>
	</div>
		
	<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/activity/attractionadd.do" enctype="multipart/form-data" onsubmit="return true;" id="form">
					<table>
						<!-- 어트랙션명 필드 -->
						<tr>
							<th class="required">어트랙션명</th>
							<td>
								<div class="name">
									<input type="text" name="name" id="name" class="middle-flat" placeholder="어트랙션명을 입력해주세요." required>
								</div>
							</td>
						</tr>
						<!-- 탑승 인원 필드 -->
						<tr>
							<th class="required">탑승 인원</th>
							<td>
								<div>
									<input type="number" name="capacity" id="capacity" min="1" class="middle-flat" placeholder="탑승 인원(숫자)을 입력해주세요." required>
								</div>
							</td>
						</tr>
						<!-- 이용 정보 필드 -->
						<tr>
							<th>이용 정보</th>
							<td>
								<div>
									<textarea name="restriction" id="restriction" placeholder="제한사항 등 해당 어트랙션의 이용정보를 작성해주세요."></textarea>
								</div>
							</td>
						</tr>
						<!-- 고객 맞춤형 추천 목록 사용 여부 필드 -->
						<tr>
							<th class="required">Test 사용 여부</th>
							<td>
								<div>
									<input type="radio" name="is_test" value="Y" id="test_y"/><label for="test_y">사용</label>
									<input type="radio" name="is_test" value="N" id="test_n" checked/><label for="test_n">미사용</label>
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
						<!-- 해시태그 필드 -->
						<tr>
							<th class="required">해시태그</th>
							<td>
								<textarea name='tags' placeholder='반드시 태그를 입력해주세요.(최대 5개 입력 가능)'></textarea>
							</td>
						</tr>
						<!-- 이미지 필드 -->
						<tr>
	                    	<th> </th>
		                	<td>
		                    	<input type="file" name="images1" class="images">
		                    </td>
		                </tr>
		                <tr>
		                	<th>이미지</th>
		                    <td>
		                    	<input type="file" name="images2" class="images">
		                    </td>
	                    </tr>
		                <tr>
		                	<th> </th>
		                    <td>
		                    	<input type="file" name="images3" class="images">
		                    </td>
		                </tr>
		                <!-- 전달 부분 -->
						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<button id="submit" class="check button">추가</button>
									<button type="button" id="cancel" class="button" onclick="location.href='/ddstudio/activity/attraction.do';">취소</button>
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="lng" id="lng">
					<input type="hidden" name="lat" id="lat">
				</form>
			</div>
		</div>
	</main>	
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae4c975e0553221a835879cdf6246a66"></script>
	<script>
		const inputs = document.querySelectorAll('input[required]');
		const latInput = document.getElementById('lat');
		const lngInput = document.getElementById('lng');
		    
		
		/*
		    // 모든 입력 요소에 대한 이벤트 리스너를 추가합니다.
		    inputs.forEach(input => {
		        input.addEventListener('input', function() {
		            let allFilled = true;
		            inputs.forEach(requiredInput => {
		                // 어느 하나의 input이 비어있다면 버튼을 비활성화합니다.
		                if (requiredInput.value === '') {
		                    allFilled = false;
		                }
		            });
	
		            // 모든 input이 채워졌다면 버튼을 활성화합니다.
		            const submitButton = document.getElementById('submit');
		            if (allFilled) {
		                submitButton.disabled = false;
		            } else {
		                submitButton.disabled = true;
		            }
		        });
		    });
		    */
		    
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
			 
			 
		 //Tagify whitelist용 변수 생성
		 const taglist = ${taglist}
		 
		 
		 //Tagify 도전기
		 var input = document.querySelector('textarea[name=tags]'),
		 	tagify = new Tagify(input, {
		    enforceWhitelist : true,
		    maxTags          : 5,
 		    delimiters       : null,
 		    whitelist        : taglist
		  });

		 //tagify 해시태그 목록 드롭다운 메뉴 표출
		 tagify.on('input', onInput)
		 function onInput(e){
	        console.log("onInput: ", e.detail);
	        
	        tagify.dropdown.show(e.detail.value); // 드롭다운 메뉴 보여주기
   		 }
		 
	</script>
</body>
</html>


