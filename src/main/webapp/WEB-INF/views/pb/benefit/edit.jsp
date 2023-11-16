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
        <h2>혜택 수정</h2>
    </div>

    <div class="form-container">
        <form method="post" action="/ddstudio/pb/benefitedit.do" enctype="multipart/form-data">
            <table class="vertical">
                <tr>
                    <th>혜택명</th>
                    <td><input type="text" name="benefitName" required value="${dto.name}"></td>
                </tr>
                <tr>
                    <th>시작일</th>
                    <td><input type="date" name="start" id="start" oninput="validateDates()" required  value="${dto.start_date}"></td>
                </tr>
                <tr>
                    <th>종료일</th>
                    <td><input type="date" name="end" id="end" oninput="validateDates()" required value="${dto.end_date}"></td>
                </tr>
                <tr>
                    <th>할인율</th>
                    <td><input type="text" name="discount" required value="${dto.discount_rate}"></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="pic" id="pic" class="long" required value="${dto.img}"></td>
                </tr>
            </table>
            <div>
                <input type="submit" value="수정">
                <input type="button" value="취소"onclick="location.href='/ddstudio/pb/benefitdetail.do?seq='+${seq}">
            </div>


            <input type="hidden" name="seq" value="${dto.benefit_seq}">

        </form>
    </div>
</main>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<!-- Footer -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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

    const date = document.getElementById('start_date');

    $('select[name=attraction]').change(function() {
        for (let i=0; i<close_list.length; i++) {
            if (close_list[i].seq == $(this).val()) {
                //alert(close_list[i].start_date);
                //alert(close_list[i].end_date);

                selDate(i);

            }
        }
    });

    function selDate(i) {

        const now = new Date();  //현재날짜
        const nowStr = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' +  now.getDate();

        //alert(now.getFullYear() + '-' + (now.getMonth() + 1) + '-' +  now.getDate());
        //alert(close_list[i].start_date);


        if (nowStr > close_list[i].start_date) {
            $('#start').val(close_list[i].start_date.substr(0,  10));
            $('#start').prop('readOnly', true);  //운휴가 현재날짜보다 이전이면 -> 운휴 이미 시작이므로 readonly.
        } else {
            $('#start').attr('min', nowStr);
            $('#start').val(close_list[i].start_date.substr(0,  10));
            $('#start').prop('readOnly', false);
        }

        changeDate(i);

    }

    function changeDate(i) {
        $('#end').attr('min', date.value);  //end_date는 재선택한 운휴시작일 넣어주기
        $('#end').val(close_list[i].end_date.substr(0,  10));
        $('#start').change(function() {
            $('#end').attr('min', date.value);
        });


    }

    const close_list = [];
    <c:forEach items="${list}" var="dto">
    close_list.push({
        seq: ${dto.attraction_close_seq},
        start_date:'${dto.start_date}',
        end_date:'${dto.end_date}'
    });

    </c:forEach>

    selDate(0);




</script>
</body>
</html>


