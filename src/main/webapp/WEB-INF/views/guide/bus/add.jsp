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
        <h2>노선 추가</h2>
    </div>

    <div class="form-container">
        <form method="post" action="/ddstudio/guide/busadd.do">
            <table class="vertical">
                <tr>
                    <th>노선순서</th>
                    <td><input type="text" name="route" required></td>
                </tr>
                <tr>
                    <th>셔틀버스 번호</th>
                    <td><select name="busNum" id="busNum">
                        <c:forEach items="${busList}" var="dto">
                            <option value="${dto.bus_seq}">${dto.bus_seq}</option>
                        </c:forEach>
                    </select> </td>
                </tr>
                <tr>
                    <th>출발 어트랙션명</th>
                    <td><select name="start_name" id="start_name">
                        <c:forEach items="${attList}" var="dto">
                        <option value="${dto.name}">${dto.name}</option>
                        </c:forEach>
                    </select> </td>
                </tr>
                <tr>
                    <th>도착 어트랙션명</th>
                    <td><select name="end_name" id="end_name">
                        <c:forEach items="${attList}" var="dto">
                            <option value="${dto.name}">${dto.name}</option>
                        </c:forEach>
                    </select> </td>
                </tr>

            </table>
            <div>
                <input type="submit" value="추가">
                <input type="button" value="취소"onclick="location.href='/ddstudio/guide/convenient.do'">
            </div>

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
            if (endDate < startDate) {
                alert('종료일은 시작일보다 늦은 날짜여야 합니다.');
                document.getElementById('end').value = ''; // 종료일 초기화
            }
        }
    }


</script>
</body>
</html>


