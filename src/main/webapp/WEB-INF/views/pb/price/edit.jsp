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
    </style>
</head>
<body>
<!-- Template.jsp -->
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<!-- Header -->

<main id="main">

    <div id="title">
        <h2>개인 요금 수정</h2>
    </div>

    <div class="form-container">
        <form method="post" action="/ddstudio/pb/priceedit.do">
            <table class="vertical">
                <tr>
                    <th>종류</th>
                    <td> <select name="ticket_type">
                    <c:forEach items="${ticketTypeList}" var="dto">
                        <option value="${dto.ticket_type}">${dto.ticket_type}</option>
                    </c:forEach>
                    </select>
                    </td>
                </tr>
                <tr>
                    <th>구분</th>
                    <td><select name="age">
                        <c:forEach items="${ageList}" var="dto">
                            <option value="${dto.age}">${dto.age}</option>
                        </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td><input type="text" name="price" required></td>
                </tr>
            </table>
            <div>
                <input type="submit" value="수정">
                <input type="button" value="취소"onclick="location.href='/ddstudio/pb/price.do'">
            </div>
        </form>
    </div>
</main>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<!-- Footer -->

<script>

</script>
</body>
</html>


