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
	#title {
   		margin-top: 123px;
   		background-image: url('/ddstudio/asset/image/background-10.jpg');
	}
	#title > p{
		color: white;
		font-size: 20px;
	}
	.wide-multi-content-container{
		margin: 30px;
	}
	#content_box{
		text-align:left;
	}
	h3{
		margin-top: 30px;
	}
	.wide-item{
		margin-top:20px;
	}
	img{
		width: 50px;
		height:50px;
	}
	.wide-item{
		border: 15px ridge #f4cccc;
		width: 1000px;
		text-align: center;
		margin: 0 auto;
		margin-bottom: 25px;
	}
	#content_box{
		display:flex;
		flex-wrap: wrap;
		align-items:center;
		justify-content: center;
	}
	#content_box>div{
		width:250px;
	}
	li{
		text-align:left;
	}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style="margin-top:123px;">
			<h2 style="color:white;">파크 이용안내</h2>
			<br>
			<p>★ 여러분~이것만은 꼭꼭! 지켜주세요! ★</p>
		</div>
		
		<div id="sub-title">
			<h3 style="text-align:center;"><i class="fa-solid fa-triangle-exclamation" style="color:pink;"></i>주의 사항<i class="fa-solid fa-triangle-exclamation" style="color:pink;"></i></h3>
		</div>

		<div id="content">
			<div class="wide-multi-content-container" style="margin-top:80px;">
				<div class="wide-item">
					<div style="font-weight:bold; color:tomato;">다음의 내용은 가지고 입장하실 수 없습니다!</div>
					<div id="content_box">
						<div><img src="/ddstudio/asset/image/park/dog.png"> 애완동물(안내견 제외)</div>
						<div><img src="/ddstudio/asset/image/park/자전거.png">자전거, 인라인, 킥보드 등</div>
						<div><img src="/ddstudio/asset/image/park/주류.png">주류 및 불법약품</div>
						<div><img src="/ddstudio/asset/image/park/의자.png">버너, 대형 돗자리</div>
						<div><img src="/ddstudio/asset/image/park/카메라.png">전문 촬영장비</div>
						<div><img src="/ddstudio/asset/image/park/드론.png">드론, 리모컨 조종 장난감</div>
						<div><img src="/ddstudio/asset/image/park/총.png">총, 칼을 휴대하는 행위</div>
						<div><img src="/ddstudio/asset/image/park/스피커.png">과도한 소음</div>
						<div><img src="/ddstudio/asset/image/park/페인트.png">페인트 등 시설에 해가 되는 물품</div>
					</div>
				</div>
				<div class="wide-item">
					<div style="font-weight:bold; color:tomato;">흡연은 흡연실에서만!</div>
					<div>
					DD Studio 내 모든 구역은 금연입니다.<br>흡연을 하시고 싶으신 분은 우도로 가시면 됩니다.<br>미성년자의 흡연은 금지되어 있습니다.
					</div>
				</div>
				<div class="wide-item">
					<div style="font-weight:bold; color:tomato;">다음의 행위들은 파크에서 금지되어 있습니다.</div>
					<div>
						<li>혐오감을 줄 수 있는 과한 분장</li>
						<li>어드벤처 연기자, CAST와 똑같은 코스튬을 입고 CAST 행세를 하는 행위</li>
						<li>CAST들을 위협, 방해하거나 몸을 접촉하는 행위</li>
						<li>땅바닥에 끌리거나, 과한 금속 장식 등 다른 손님에게 피해를 주는 복장</li>
						<li>화장실에서 다른 의상으로 환복하는 행위로 다른 손님들에게 피해를 주는 경우</li>
						<li>전단지 배포, 설문조사, 손님 인터뷰 등 다른 손님들의 파크 이용에 불편을 끼치는 행위</li>
						<li>물품의 진열 및 판매 등 영리 목적의 활동을 하는 행위</li>
					</div>
				</div>
				<div class="wide-item">
					<div style="font-weight:bold; color:tomato;">어트랙션 이용 시에 지켜주세요. <br>손님 여러분의 안전을 위해 다음 내용들은 유의해 주시기 바랍니다.</b></div>
					<div>
						<li>음식물은 다 드신 후에 이용해 주시기 바랍니다.</li>
						<li>탑승 중에는 카메라, 셀카봉, 핸드폰 사용을 삼가 주세요.</li>
						<li>어트랙션별 탑승기준을 준수해 주시기 바랍니다.</li>
						<li>현장 및 기상상황에 따라 예고 없이 어트랙션 운행이 중단될 수 있습니다.</li>
						<li>음주 후 어트랙션 탑승은 불가합니다.</li>
						<li>손님 여러분의 안전을 위한 센서로 인해 어트랙션이 급작스럽게 멈출 수 있습니다.</li>
						<li>어트랙션 탑승 도중 멈추더라도 당황하지 마시고 직원 안내를 기다려 주세요.</li>
					</div>
				</div>
				<div class="wide-item">
					<div style="font-weight:bold; color:tomato;">우리 캐스트들을 존중해 주세요.</div>
					<div>
						명찰을 달고 있는 캐스트를 만난다면 무엇이든 물어보세요. 최대한 친절하게 안내해 드릴 수 있도록 하겠습니다.<br>
						손님의 즐거운 시간을 위해 최선을 다하고 있는 캐스트를 존중해 주세요.<br>
						실수하고 부족하더라도 반말이나 욕설은 삼가주세요.<br>
						혹시 불편 및 건의사항이 있으시다면 아래 게시판을 통해 의견을 남겨주세요.
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>
