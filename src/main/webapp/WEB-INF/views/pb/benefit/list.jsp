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

        .btn{
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
        <h2>요금 혜택</h2>
    </div>




    <div id="content">
        <div id="condition">
            <h3>기능 (예시 조건검색-롯데월드에 있던거 참고)</h3>
        </div>

        <c:if test="${not empty email && lv == 2}">

        <div class="container">
            <div id="btn3" class="btn">
                <button type="button" class="add" onclick="location.href='/ddstudio/pb/benefitadd.do';">일반 혜택 추가</button>
                <button type="button" class="add" onclick="location.href='/ddstudio/pb/partnershipbenefitadd.do';">카드/통신사 혜택 추가</button>
            </div>
        </div>
        </c:if>


        <div class="benefitBt">
            <a href="javascript:" class="bnftClasCd on" data-cd="01">일반혜택</a>
            <a href="javascript:" class="bnftClasCd " data-cd="02">카드혜택</a>
        </div>



        <div class="munti-content-container">





            <div class="munti-content-container">
                <c:forEach items="${list}" var="dto">
                    <div class="item" onclick="location.href= '/ddstudio/pb/benefitdetail.do?seq=' + ${dto.benefit_seq - 1};">
                        <div style="background-image: url('/ddstudio/asset/image/${dto.img}');"></div>
                        <div>${dto.name}</div>
                        <div>${dto.start_date}~${dto.end_date}</div>
                    </div>
                </c:forEach>
            </div>






            <!-- 추가 아이템들 -->
        </div>

    </div>

</main>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<!-- Footer -->

<script>

    $('#btn1').click(function() {

        const hong = {
            name: '홍길동',
            age: 20,
            hello: function() {

            }
        };

        $.ajax({

            //Ajax
            //- 비동기 자바스크립트 통신

            //ajax.open('GET', 'do') > 페이지 요청 정보
            type: 'GET',
            url: '/ajax/ex03data.do',

            //async: true, //true(비동기), false(동기)

            //ex03data.do?name=홍길동
            data: 'name=홍길동',

            //onreadystatechange + readyState(4) + status(200)
            success: function(result) {
                //result == ajax.responseText
                $('#txt1').val(result);
            },

            //에러 발생 시 호출(이벤트)
            error: function(a, b, c) {
                console.log(a, b, c);
            }

        });

    });

</script>
</body>
</html>


