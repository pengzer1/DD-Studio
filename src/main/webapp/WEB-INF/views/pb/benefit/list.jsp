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
            <a href="javascript:" class="bnftClasCd on" data-cd="일반">일반혜택</a>
            <a href="javascript:" class="bnftClasCd " data-cd="카드/통신사">카드혜택</a>
        </div>



        <div class="munti-content-container">





            <div class="munti-content-container">
                <c:forEach items="${list}" var="dto">
                    <div class="item" data-category="${dto.type}" onclick="location.href= '/ddstudio/pb/benefitdetail.do?seq=' + ${dto.benefit_seq};">
                        <div style="background-image: url('/ddstudio/asset/image/${dto.img}');"></div>
                        <div class="item-title">${dto.name}</div>
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
    document.addEventListener('DOMContentLoaded', function () {
        const benefitButtons = document.querySelectorAll('.bnftClasCd');
        const benefitContainer = document.getElementById('benefitContainer');

        benefitButtons.forEach(button => {
            button.addEventListener('click', function () {
                const category = this.getAttribute('data-cd');
                filterBenefits(category);
            });
        });

        function filterBenefits(category) {
            const items = document.querySelectorAll('.item');
            items.forEach(item => {
                const itemCategory = item.getAttribute('data-category');
                if (category === 'all' || category === itemCategory) {
                    item.classList.remove('hidden');
                } else {
                    item.classList.add('hidden');
                }
            });
        }
    });

</script>
</body>
</html>


