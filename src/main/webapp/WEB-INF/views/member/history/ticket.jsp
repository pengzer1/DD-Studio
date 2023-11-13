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

.modal {
	display: flex;
	width: 100%;
	height: 100%;
	background-color: rgba(22, 22, 22, 0.6);
	align-items: center;
	position: fixed;
	left: 0;
	top: 0;
}

.modal-content {
	display: flex;
	width: 50%;
	height: 70%;
	background-color: #FFF;
	align-items: center;
	justify-content: center;
	padding: 20px;
	border: 1px solid #888;
	border-radius: 10px;
	overflow-y: auto;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.modal-content img {
	max-width: 100%;
	max-height: 100%;
	margin: auto;
}

.close {
	font-size: 28px;
	font-weight: bold;
	color: #9E9E9E;
	position: absolute;
	top: 5px;
	right: 15px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title">
			<h2>예매 확인/취소</h2>
			<br>
			<p></p>
		</div>

		<hr>

		<div id="sub-title">
			<h3></h3>
		</div>

		<div id="content">

			<div class="wide-multi-content-container">
				<div class="wide-item">
					<div class="name">예매 내역</div>
					<div>
						<table>
							<tr>
								<th>번호</th>
								<th>방문일</th>
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
										<td>${dto.price}</td>
										<td class="checkbox-col"><input type="checkbox"
											name="reservationCheckbox"></td>
									</tr>
								</c:forEach>
							</form>
						</table>
					</div>
				</div>


				<div class="buttons-container">
					<button class="button" id="delete-button">예매 취소</button>
					<button class="button"
						onclick="location.href='/ddstudio/member/review/add.do';">리뷰
						작성</button>
				</div>



				<!-- <button id="open-modal-btn">Open Modal</button>

				<div id="modal" class="modal" style="display: none;"
					onclick="closeModal()">
					<div class="modal-content" onclick="event.stopPropagation()">
						<span class="close" onclick="closeModal()">&times;</span> <img
							src="asset/images/wall19.jpg" alt="분실물">
					</div>
				</div> -->




				<div class="wide-item">
					<div class="name">이전 예매 내역</div>
					<div>
						<table>
							<tr>
								<th>번호</th>
								<th>방문일</th>
								<th>예매일</th>
								<th>할인율</th>
								<th>수량</th>
								<th>결제금액</th>
								<!-- <th></th> -->
							</tr>
							<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.user_book_seq}</td>
									<td>${dto.visit_date}</td>
									<td>${dto.book_date}</td>
									<td>${dto.discount_rate}</td>
									<td>${dto.ea}</td>
									<td>${dto.price}</td>
									<!-- <td class="checkbox-col"><input type="checkbox"
										name="reservationCheckbox"></td> -->
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		/* document.getElementById('open-modal-btn').addEventListener('click',
				openModal);

		function openModal() {
			document.getElementById('modal').style.display = 'flex';
		}

		function closeModal() {
			document.getElementById('modal').style.display = 'none';
		} */

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
                    success: function(data) {
                        // 서버에서의 응답에 대한 처리
                        // 예를 들면, 삭제 후에 어떤 동작을 할지에 대한 로직을 추가할 수 있습니다.
                        location.reload(); // 예제로 새로고침을 수행하도록 했습니다.
                    },
                    error: function() {
                        alert('예매 취소에 실패했습니다.');
                    }
                });
            } else {
                return false;
            }
        });
	</script>
</body>
</html>


