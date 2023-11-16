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



        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh;
        }

        .vertical {
            text-align: left;
        }

        .vertical th {
            text-align: right;
            padding-right: 10px;
        }

        .vertical tr > td {
            width: 400px;
        }
        .vertical tr > td > input{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<!-- Template.jsp -->
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<!-- Header -->

<main id="main">

    <div id="title">
        <h2>혜택 삭제</h2>
    </div>

    <div class="form-container">
        <form method="post" action="/ddstudio/pb/benefitdel.do"`>
            <table class="vertical">
                <tr>
                    <th>혜택명</th>
                    <td>${dto.name}</td>
                </tr>
                <tr>
                    <th>시작일</th>
                    <td>${dto.start_date}</td>
                </tr>
                <tr>
                    <th>종료일</th>
                    <td>${dto.end_date}</td>
                </tr>
                <tr>
                    <th>할인율</th>
                    <td>${dto.discount_rate}%</td>
                </tr>
            </table>


            <div>
                <input type="submit" value="삭제" onclick="delOk()">
                <input type="button" value="취소"onclick="location.href='/ddstudio/pb/benefitdetail.do?seq='+${seq-1}">
            </div>

            <input type="hidden" name="seq" value="${seq}">


        </form>
    </div>
</main>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<!-- Footer -->

<script>

    function validateDates() {
        var startDate = document.getElementById('start').value;
        var endDate = document.getElementById('end').value;

        // 시작일과 종료일이 둘 다 선택된 경우에만 비교
        if (startDate && endDate) {
            if (endDate <= startDate) {
                alert('종료일은 시작일보다 늦은 날짜여야 합니다.');
                document.getElementById('end').value = ''; // 종료일 초기화
            }
        }
    }


    function delOk(){
        if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
            return false;
        }
    }

</script>
</body>
</html>


