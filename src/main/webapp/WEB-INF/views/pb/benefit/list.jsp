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

        .item {
            transition: transform 0.3s ease, border-color 0.3s ease;
        }

        .item:hover {
            transform: scale(1.05); /* Slightly enlarge on hover */
            border: 2px solid #FFA500; /* Add a border color on hover */
        }


        .benefitBt {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn{
            display: flex;
            align-items: center;
            justify-content: right;
        }


        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .munti-content-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }

        .item {
            width: 300px;
            margin: 20px;
            padding: 20px;
            box-sizing: border-box;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .item:hover {
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .item > div {
            margin-bottom: 10px;
        }

        .item img {
            max-width: 100%;
            border-radius: 6px;
        }

        .item-title {
            font-size: 1.2em;
            font-weight: 700;
            color: #333;
        }
        #title {
            background-image: url('/ddstudio/asset/image/detail_background_resizing.png');
        }

    </style>
</head>
<body>
<!-- Template.jsp -->
<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

<main id="main">

    <div id="title" style="margin-top: 123px; background-image: url('/ddstudio/asset/image/chihiro015.jpg');">
        <h2>혜택</h2>
    </div>

    <div class="form-group">
        <ul class="tab tab_red">
            <li id="sel00" class="two"><a href="#tab00" id="selTab00">전체</a></li>
            <li id="sel01" class="two on"><a href="#tab01" id="selTab01">일반혜택</a></li>
            <li id="sel02" class="two"><a href="#tab02" id="selTab02">카드/통신사혜택</a></li>
        </ul>

        <c:if test="${not empty email && lv == 2}">

            <div class="container">
                <div id="btn3" class="btn">
                    <button type="button" class="add" onclick="location.href='/ddstudio/pb/benefitadd.do';">일반 혜택 추가</button>
                    <button type="button" class="add" onclick="location.href='/ddstudio/pb/partnershipbenefitadd.do';">카드/통신사 혜택 추가</button>
                </div>
            </div>
        </c:if>


        <div id="tab01" style="display: none;">
            <div id="main_box">
                <hr>
                <div
                        style="display: flex; flex-wrap: wrap; align-items: center; margin-left: 10px; justify-content: center;">
                    <c:forEach items="${normalList}" var="dto">
                        <div class="item" data-category="${dto.type}" onclick="location.href= '/ddstudio/pb/benefitdetail.do?seq=' + ${dto.benefit_seq};">
                            <div style="background-image: url('/ddstudio/asset/image/benefit/${dto.img}');"></div>
                            <div class="item-title">${dto.name}</div>
                            <div>${dto.start_date}~${dto.end_date}</div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
        <div id="tab02" style="display: none;">
            <div id="main_box">
                <hr>
                <div
                        style="display: flex; flex-wrap: wrap; align-items: center; margin-left: 10px; justify-content: center;">
                    <c:forEach items="${cardList}" var="dto">
                        <div class="item" data-category="${dto.type}" onclick="location.href= '/ddstudio/pb/benefitdetail.do?seq=' + ${dto.benefit_seq};">
                            <div style="background-image: url('/ddstudio/asset/image/benefit/${dto.img}');"></div>
                            <div class="item-title">${dto.name}</div>
                            <div>${dto.start_date}~${dto.end_date}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div id="tab00" style="display: none;">
            <div id="main_box">
                <hr>
                <div
                        style="display: flex; flex-wrap: wrap; align-items: center; margin-left: 10px; justify-content: center;">
                    <c:forEach items="${list}" var="dto">
                        <div class="item" data-category="${dto.type}" onclick="location.href= '/ddstudio/pb/benefitdetail.do?seq=' + ${dto.benefit_seq};">
                            <div style="background-image: url('/ddstudio/asset/image/benefit/${dto.img}');"></div>
                            <div class="item-title">${dto.name}</div>
                            <div>${dto.start_date}~${dto.end_date}</div>
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

    showTab("tab01");

    document.getElementById("selTab00").addEventListener("click", function() {
        event.preventDefault();
        showTab("tab00");

        document.getElementById("sel00").classList.add("on");
        document.getElementById("sel01").classList.remove("on");
        document.getElementById("sel02").classList.remove("on");
    });

    document.getElementById("selTab01").addEventListener("click", function() {
        event.preventDefault();
        showTab("tab01");

        document.getElementById("sel01").classList.add("on");
        document.getElementById("sel02").classList.remove("on");
        document.getElementById("sel00").classList.remove("on");
    });

    document.getElementById("selTab02").addEventListener("click", function() {
        event.preventDefault();
        showTab("tab02");

        document.getElementById("sel02").classList.add("on");
        document.getElementById("sel01").classList.remove("on");
        document.getElementById("sel00").classList.remove("on");
    });

    function showTab(tabId) {
        // 모든 탭 숨기기
        document.getElementById("tab00").style.display = "none";
        document.getElementById("tab01").style.display = "none";
        document.getElementById("tab02").style.display = "none";

        // 선택한 탭 보이기
        document.getElementById(tabId).style.display = "block";
    }

</script>
</body>
</html>