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
        #sub-title1 {
            text-align: center;

        }
        .noteDiv {
            border: 1px solid #e1e1e1;
            background: #f8f8f8;
            padding: 50px 50px 60px 50px;
            margin-top: 100px;
        }

        .noteDiv .tit {
            font-size: 24px;
            font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
            color: #000;
        }


        .label {
            font-weight: bold;
            margin-right: 5px;
            display: table-cell
        }

        .value {
            display: table-cell
        }
        .container {
            display: flex;
            justify-content: end;
        }


    </style>
</head>
<body>
<!-- Template.jsp -->
<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->



<main id="main">

    <div id="title" style="margin-top:123px;">
        <h2>혜택명</h2>
        <p>내용을 입력하세요</p>
    </div>

    <c:if test="${not empty email && lv == 2}">
    <div class="container">
        <div id="btn3" class="btn">
            <button type="button" class="add" onclick="location.href='/ddstudio/pb/benefitdel.do?seq='+${seq+1};">삭제</button>
            <button type="button" class="add" onclick="location.href='/ddstudio/pb/benefitedit.do?seq='+${seq +1};">수정</button>

        </div>
    </div>
    </c:if>



    <div id="sub-title">
        <h3>1Day</h3>
    </div>

    <div id="content">

        <div class="wide-content-container">
            <div class="wide-item">
                <div>구분</div>
                <div>
                    <c:forEach items="${list}" var="dto">
                        <c:if test="${dto.ticket_type eq '1Day'}">
                            <div>${dto.age}</div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="wide-item">
                <div>정상가</div>
                <div>
                    <c:forEach items="${list}" var="dto">
                        <c:if test="${dto.ticket_type eq '1Day'}">
                            <div>${dto.price}</div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="wide-item">
                <div>우대가</div>
                <div>
                    <c:forEach items="${discountList1Day}" var="discount">
                            <div>${discount}</div>
                    </c:forEach>
                </div>
            </div>
        </div>







        <div id="sub-title1">
            <h3>After4</h3>
        </div>

        <div id="content1">

            <div class="wide-content-container">
                <div class="wide-item">
                    <div>구분</div>
                    <div>
                        <c:forEach items="${list}" var="dto">
                            <c:if test="${dto.ticket_type eq 'After4'}">
                                <div>${dto.age}</div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="wide-item">
                    <div>정상가</div>
                    <div>
                        <c:forEach items="${list}" var="dto">
                            <c:if test="${dto.ticket_type eq 'After4'}">
                                <div>${dto.price}</div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="wide-item">
                    <div>우대가</div>
                    <div>
                        <c:forEach items="${discountListAfter4}" var="discount">
                            <div>${discount}</div>
                        </c:forEach>
                    </div>
                </div>
            </div>



        <%--> 밑에 정보란 수정해야함--%>

        <div class="result-container">
            <div class="result-item">
                <div class="label">기간</div>
                <c:forEach items="${benefitInfoList}" var="dto">
                <div class="value">${dto.start_date}~${dto.end_date}</div>
                </c:forEach>
            </div>
            <div class="result-item">
                <div class="label">대상</div>
                <div class="value">${dto.capacity}</div>
            </div>
            <div class="result-item">
                <div class="label">인증방법</div>
                <div class="value">${dto.restriction}</div>
            </div>
            <div class="result-item">
                <div class="label">위치</div>
                <div class="value">${dto.location_seq}</div>
            </div>
        </div>

        <%--> 밑에 정보란--%>


            <div class="noteDiv">
                <p class="tit">꼭 알아두세요</p>
                <div class="txtArea">
                    <p class="dotTit fLight">타 우대와 중복할인 되지 않습니다.
                    </p>
                    <p class="dotTit fLight">입장 후, (부분)환불이 불가합니다.
                    </p>
                    <p class="dotTit fLight">현장 상황에 따라 조기 종료될 수 있습니다.</p>
                </div>
            </div>

    </div>



    <%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

    <script>

    </script>

</body>
</html>


