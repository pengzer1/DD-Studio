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
        <h2>일반 혜택 추가</h2>
    </div>

    <div class="form-container">
        <form method="post" action="/ddstudio/pb/benefitadd.do" enctype="multipart/form-data">
            <table class="vertical">
                <tr>
                    <th>혜택명</th>
                    <td><input type="text" name="benefitName" required></td>
                </tr>
                <tr>
                    <th>시작일</th>
                    <td><input type="date" name="start" id="start" oninput="validateDates()" required ></td>
                </tr>
                <tr>
                    <th>종료일</th>
                    <td><input type="date" name="end" id="end" oninput="validateDates()" required></td>
                </tr>
                <tr>
                    <th>할인율</th>
                    <td><input type="text" name="discount" required></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="pic" id="pic" class="long" required></td>
                </tr>

            </table>
            <div>
                <input type="submit" value="추가">
                <input type="button" value="취소"onclick="location.href='/ddstudio/pb/benefit.do'">
            </div>

        </form>

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


</script>
</body>
</html>


