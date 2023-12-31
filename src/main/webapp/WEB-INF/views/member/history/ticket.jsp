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
#main>#title, .item div {
	background-color: white;
}

.name {
	font-weight: bold;
	font-size: 24px;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
}

table, th, td {
	border: 1px solid #333;
}

th, td {
	padding: 10px;
	text-align: center;
}

th {
	background-color: #333;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:nth-child(odd) {
	background-color: #fff;
}

.wide-multi-content-container {
	display: flex;
	justify-content: space-between;
	gap: 20px; /* 테이블 간격을 조정합니다. */
}

.buttons-container {
	position: relative;
}

.button {
	background-color: #0074cc;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button:hover {
	background-color: #0056a4;
}

#content{
	margin-top: 100px;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style="background-image: url('/ddstudio/asset/image/ponyo013.jpg');">
			<h2>예매 확인/취소</h2>
		</div>

		<div id="content">

			<div class="wide-multi-content-container">
				<div class="wide-item">
					<div class="name">예매 내역</div>
					<div>
						<table>
							<tr>
								<th>번호</th>
								<th>방문예정일</th>
								<th>예매일</th>
								<th>할인율</th>
								<th>수량</th>
								<th>결제금액</th>
								<th></th>
							</tr>
							<form name="delete-form" action="/ddstudio/member/ticketdel.do" method="post">
								<c:forEach items="${list}" var="dto">
									<tr>
										<td>${dto.user_book_seq}</td>
										<td>${dto.visit_date}</td>
										<td>${dto.book_date}</td>
										<td>${dto.discount_rate}</td>
										<td>${dto.ea}</td>
										<td>${dto.total_price}</td>
										<td class="checkbox-col"><input type="checkbox"
											name="reservationCheckbox" value="${dto.user_book_seq}"></td>
									</tr>
								</c:forEach>
							</form>
						</table>
				<div class="buttons-container">
					<button class="button" id="delete-button">예매 취소</button>
				</div>
					</div>
				</div>




				<div class="wide-item">
					<div class="name">이전 예매 내역</div>
					<div>
						<table>
							<tr>
								<th>번호</th>
								<th>방문 예정일</th>
								<th>예매일</th>
								<th>할인율</th>
								<th>수량</th>
								<th>결제금액</th>
								<th></th>
							</tr>
							<c:forEach items="${plist}" var="dto">
								<tr>
									<td>${dto.user_book_seq}</td>
									<td>${dto.visit_date}</td>
									<td>${dto.book_date}</td>
									<td>${dto.discount_rate}</td>
									<td>${dto.ea}</td>
									<td>${dto.total_price}</td>
									<td class="checkbox-col"><input type="checkbox"
										name="reviewCheckbox" value="${dto.user_book_seq}"></td>
								</tr>
							</c:forEach>
						</table>
						<div class="buttons-container">
							<button class="button" onclick="writeReview()">리뷰작성</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
		$('#delete-button').click(function() {
			var result = confirm("정말 예매를 취소하시겠습니까?");

			if (result) {
                var selectedUserBookSeqs = $('input[name="reservationCheckbox"]:checked').map(function() {
                    return this.value;
                }).get();

                // 선택된 예매 정보를 서버로 전송
                $.ajax({
                    type: 'POST',
                    url: '/ddstudio/member/ticketdel.do',
                    data: { user_book_seq: selectedUserBookSeqs },
                    traditional: true,
                    
                    dataType: 'json',
                    success: function(data) { //data == { "result" : 1 }
                        // 서버에서의 응답에 대한 처리
                        // 예를 들면, 삭제 후에 어떤 동작을 할지에 대한 로직을 추가할 수 있습니다.
                        if (data.result == 1) {
                        	location.reload(); // 예제로 새로고침을 수행하도록 했습니다.
                        } else {
                        	alert('failed');
                        }
                    },
                    error: function() {
                        alert('예매 취소에 실패했습니다.');
                    }
                });
            } else {
                return false;
            }
        });
		
		
		function writeReview() {
	        var selectedUserBookSeq = $('input[name="reviewCheckbox"]:checked').val();

	        if (selectedUserBookSeq) {
	            // 선택된 예매 정보의 user_book_seq를 이용하여 리뷰 작성 페이지로 이동
	            location.href = '/ddstudio/member/review/add.do?seq=' + selectedUserBookSeq;
	        } else {
	            alert('예매 정보를 선택하세요.');
	        }
	    }
	</script>
</body>
</html>


