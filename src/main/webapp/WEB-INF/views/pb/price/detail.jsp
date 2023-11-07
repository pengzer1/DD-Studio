<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/WEB-INF/views/inc/asset.jsp" %>
    <style>

        .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }


    </style>
</head>
<body>
<!-- template.jsp -->
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<main id="main">
    <h1 align="center">티켓 요금</h1>
</main>

<hr>
<div class="container">
    <div>개인</div>
    <div id="btn1">
        <button type="button" class="add" onclick="location.href='';">추가</button>
        <button type="button" class="del" onclick="location.href='';">삭제</button>
        <button type="button" class="edit" onclick="location.href='';">수정</button>
    </div>
</div>

<div>
    <table>
        <tr>
            <th>1Day</th>
            <th>After4</th>
            <td>넣어봄</td>
        </tr>
    </table>
</div>

<hr>
<div class="container">
    <div>단체</div>
    <div id="btn2">
        <button type="button" class="add" onclick="location.href='';">추가</button>
        <button type="button" class="del" onclick="location.href='';">삭제</button>
        <button type="button" class="edit" onclick="location.href='';">수정</button>
    </div>
</div>


<script>

</script>
</body>
</html>





