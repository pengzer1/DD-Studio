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




        .benefitBt {
            text-align: center;
            margin: 84px;
        }


    </style>
</head>
<body>
<!-- Template.jsp -->
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<!-- Header -->

<main id="main">

    <div id="title">
        <h2>요금 혜택</h2>
    </div>

    <div id="content">
        <div id="condition">
            <h3>기능 (예시 조건검색-롯데월드에 있던거 참고)</h3>
        </div>
        <div class="benefitBt">
            <a href="javascript:" class="bnftClasCd on" data-cd="01">일반혜택</a>
            <a href="javascript:" class="bnftClasCd " data-cd="02">카드혜택</a>
    </div>

        <div class="munti-content-container">


        <c:forEach items="${list}" var="dto">
            <div class="item">
                <div style="background-image: url('/ddstudio/asset/image/chromi.png');"></div>
                <div>${dto.benefit_date}</div>
                <div>${dto.name}</div>
            </div>
        </c:forEach>
            <div class="item">
                <div style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
                <div>아이템 1 설명</div>
                <div> 되잖아 이건</div>
            </div>
            <div class="item">
                <div style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
                <div>아이템 1 설명</div>
            </div>
            <div class="item">
                <div style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
                <div>아이템 1 설명</div>
            </div>
            <div class="item">
                <div style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
                <div>아이템 1 설명</div>
            </div>
            <div class="item">
                <div style="background-image: url('/ddstudio/asset/image/about.jpg');"></div>
                <div>아이템 1 설명</div>
            </div>






            <!-- 추가 아이템들 -->
        </div>

    </div>

</main>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<!-- Footer -->

<script>

</script>
</body>
</html>


