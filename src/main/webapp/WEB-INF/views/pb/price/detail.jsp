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
        .btn{
            display: flex;
            align-items: center;
            justify-content: right;
        }


        .wide-item div {
            display: flex;
            justify-content: space-between;
        }
        .wide-item div > div {
            display: flex;
            align-items: center;
            margin: 0 10px; /* 가로 방향으로 좌우에 10px의 마진을 추가합니다. */
        }

    </style>
</head>
<body>
<!-- Template.jsp --ㅈ>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<-- Header -->

<main id="main">
    <div id="title">
        <h2>티켓 요금</h2>
    </div>


    <div class="container">
        <div id="btn3" class="btn">
            <button type="button" class="add" onclick="location.href='/ddstudio/pb/benefit.do';">혜택</button>
        </div>
    </div>



    <div id="sub-title">
        <div class="container">
            <h3>개인</h3>
            <c:if test="${not empty email && lv == 2}">

            <div id="btn1" class="btn">
                <button type="button" class="add" onclick="location.href='/ddstudio/pb/priceadd.do';">추가</button>
                <button type="button" class="add" onclick="location.href='/ddstudio/pb/pricedel.do';">삭제</button>
                <button type="button" class="add" onclick="location.href='/ddstudio/pb/priceedit.do';">수정</button>
            </div>
            </c:if>

        </div>
    </div>

    <div id="content">

        <div class="wide-content-container">
            <div class="wide-item">
                <div>1Day</div>
                <div>
                    <c:forEach items="${personTypeList}" var="dto">
                        <c:if test="${dto.ticket_type eq '1Day'}">
                            <div>
                                <div>${dto.age}</div>
                                <div>${dto.price}</div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <div class="wide-item">
                <div>After4</div>
                <div>
                    <c:forEach items="${personTypeList}" var="dto">
                        <c:if test="${dto.ticket_type eq 'After4'}">
                            <div>
                                <div>${dto.age}</div>
                                <div>${dto.price}</div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <!-- 추가 아이템들 -->
        </div>


        <div id="sub-title1" align="center">
            <h3>단체</h3>
<c:if test="${not empty email && lv == 2}">

            <div id="btn2" class="btn">
                <button type="button" class="add" onclick="location.href='/ddstudio/pb/group-priceadd.do';">추가</button>
                <button type="button" class="add" onclick="location.href='/ddstudio/pb/group-pricedel.do';">삭제</button>
                <button type="button" class="add" onclick="location.href='/ddstudio/pb/group-priceedit.do';">수정</button>
            </div>
</c:if>
        </div>


        <div class="wide-item">
            <div>단체 기준 인원</div>
        </div>

        <div class="wide-content-container">
            <div class="wide-item">
                <div>1Day</div>
                <div>
                    <c:forEach items="${groupList}" var="dto">
                        <c:if test="${dto.ticket_type eq '1Day'}">
                            <div>
                                <div>${dto.age}</div>
                                <div>${dto.price}</div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <div class="wide-item">
                <div>After4</div>
                <div>
                    <c:forEach items="${groupList}" var="dto">
                        <c:if test="${dto.ticket_type eq 'After4'}">
                            <div>
                                <div>${dto.age}</div>
                                <div>${dto.price}</div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
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


