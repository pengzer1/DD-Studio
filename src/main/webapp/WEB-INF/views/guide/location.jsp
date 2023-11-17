<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <%@ include file="/WEB-INF/views/inc/asset.jsp"%>
    <link rel="stylesheet" href="/ddstudio/asset/css/main.css">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 1.6;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        #total-map {
            padding-top: 60px;
            padding-bottom: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        li {
            padding: 8px;
            text-align: left;
        }

        #container {
            margin: 0 auto;
            width: 70%;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #come {
            font-size: 30px;
            font-weight: bold;
            border-bottom: 2px solid #0074cc;
            padding: 20px;
            margin-bottom: 15px;
            color: #0074cc;
        }

        .left,
        .right {
            width: 100%;
            margin-bottom: 20px;
        }

        .left p,
        .right p {
            font-size: 18px;
            color: #0074cc;
        }

        .left ul,
        .right ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .left ul li,
        .right ul li {
            padding: 10px 0;
        }

        .fa-plane,
        .fa-ship {
            color: cornflowerblue;
        }

        #map {
            width: 100%;
            height: 380px;
        }
        
        #title h2 {
        	color: white;
        } 
    </style>
</head>
<body>
    <!-- Template.jsp -->
    <%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

    <main id="main">

        <div id="title" style="margin-top: 123px; background-image: url('/ddstudio/asset/image/howl012.jpg');">
            <h2>오시는길</h2>
        </div>

        <div id="total-map">
            <div id="map"></div>
        </div>

        <div id="container">
            <div id="come" style="color:black;">DD studio로 오시는 방법(제주 특별 자치도)</div>
            <div class="left">
                <p><i class="fas fa-plane"></i> 비행기 이용시</p>
                <ul>
                    <li>
                        <p>인천 국제공항 <i class="fas fa-arrow-right"></i> 제주 공항</p>
                    </li>
                    <li>
                        <p>김포 공항 <i class="fas fa-arrow-right"></i> 제주 공항</p>
                    </li>
                </ul>
            </div>
            <hr>
            <div class="right">
                <p><i class="fas fa-ship"></i> 배 이용시</p>
                <ul>
                    <li>
                        <p> 부산항 여객터미널 <i class="fas fa-arrow-right"></i> 제주</p>
                    </li>
                    <li>
                        <p> 여수항 여객터미널 <i class="fas fa-arrow-right"></i> 제주</p>
                    </li>
                    <li>
                        <p>마산항 여객터미널 <i class="fas fa-arrow-right"></i> 제주</p>
                    </li>
                </ul>
            </div>
        </div>

    </main>
    <%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40256c0b64f3ce915f7db1ab8f75aeca"></script>
    <script>
        const container = document.getElementById('map');
        const options = {
            center: new kakao.maps.LatLng(33.3808, 126.5450),
            level: 10,
            draggable: false,
            disableDoubleClick: true,
            scrollwheel: false
        };
        const map = new kakao.maps.Map(container, options);

        let imageSrc = '/ddstudio/asset/image/marker/놀이공원.png';
        let imageSize = new kakao.maps.Size(100, 100);
        let imageOption = {};

        let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
        let markerPosition = new kakao.maps.LatLng(33.3808, 126.5450);

        let marker = new kakao.maps.Marker({
            position: markerPosition,
            image: markerImage
        });

        marker.setMap(map);
    </script>
</body>
</html>
