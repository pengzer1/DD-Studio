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
        #btn1{
            display: flex;
            align-items: center;
            justify-content: right;
        }

    </style>
</head>
<body>
<!-- Template.jsp -->
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<!-- Header -->

<main id="main">
    <div id="title">
        <h2>티켓 요금</h2>
    </div>

    <div id="sub-title">
        <div class="container">
            <h3>개인</h3>
            <div id="btn1">
                <button type="button" class="add" onclick="location.href='/ddstudio/pb/priceadd.do';">추가</button>
                <button type="button" class="add" onclick="location.href='';">삭제</button>
                <button type="button" class="add" onclick="location.href='';">수정</button>
            </div>
        </div>
    </div>

    <div id="content">

        <div class="wide-content-container">
            <div class="wide-item">
                <div>1Day</div>
                <div>
                    <div>62,000</div>
                    <div>54,000</div>
                    <div>47,000</div>
                    <div>15,000</div>
                </div>
            </div>

            <div class="wide-item">
                <div>After4</div>
                <div>요금</div>
            </div>
            <!-- 추가 아이템들 -->
        </div>


        <div id="sub-title1" align="center">
            <h3>단체</h3>
        </div>


        <div class="wide-item">
            <div>단체 기준 인원</div>
        </div>

        <div class="wide-content-container">
            <div class="wide-item">
                <div>1Day</div>
                <div>요금</div>
            </div>

            <div class="wide-item">
                <div>After4</div>
                <div>요금</div>
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


