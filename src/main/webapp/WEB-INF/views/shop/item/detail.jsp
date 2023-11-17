<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/ddstudio/asset/css/main.css">
<link rel="stylesheet" href="/ddstudio/asset/css/user.css">
<style>
#main {
	margin-top: 0;
}

ul, ol, li {
	list-style: none;
}

select {
	vertical-align: middle;
	border: 1px solid #999;
	border-radius: 3px;
	appearance: auto;
}

ul {
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

#cancel {
	margin-right: 15px;
}

.detail {
	border-top: 2px solid #e1e1e1;
	border-bottom: 2px solid #e1e1e1;
	padding: 44px 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 100px auto;
}

.img {
	width: 600px;
	height: 500px;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	margin-left: 150px;
}

.infoArea {
	border: 1px solid #bbb;
	border-radius: 10px;
	padding: 0;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	width: calc(100% - 615px);
	margin: 0 40px;
	padding-top: 20px;
	word-wrap: break-word;
	word-break: keep-all;
	min-height: 512px;
	height: auto;
	float: right;
}

.infoArea li {
	margin-bottom: 20px;
	display: table;
	min-height: 80px;
	padding-left: 95px;
	color: #000;
}

.infoArea li.op1 {
	background: url('/ddstudio/asset/image/dininginfo_icon1.png') no-repeat
		0 center;
}

.infoArea li.op2 {
	background: url('/ddstudio/asset/image/dininginfo_icon2.png') no-repeat
		0 center;
}

.infoArea li.op3 {
	background: url('/ddstudio/asset/image/dininginfo_icon3.png') no-repeat
		0 center;
}

.infoArea li.op6 {
	background: url('/ddstudio/asset/image/dininginfo_icon6.png') no-repeat
		0 center;
}

.infoArea li.op7 {
	background: url('/ddstudio/asset/image/close_icon2.png') no-repeat 0
		center;
}

.infoArea li.op8 {
	background: url('/ddstudio/asset/image/calendar_icon2.png') no-repeat 0
		center;
}

.infoArea li .tableCell {
	display: table-cell;
	vertical-align: middle;
	min-height: 80px;
}

.infoArea li .txt1 {
	font-size: 18px;
	color: #555555;
	text-align: left;
	font-weight: 800;
}

.infoArea li .txt1 span {
	border-bottom: 3px solid #777;
	padding: 0 10px 3px 0
}

.infoArea li .txt2 {
	margin-top: 8px;
	color: #555555;
	line-height: 20px;
	text-align: left;
}

#duplicate-check {
	padding: 0;
}

.sub-title {
	font-size: 26px;
	color: #000;
	text-align: center;
	margin-bottom: 30px;
}

#total-map {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
}

#admin-btn {
	text-align: right;
}

#admin-btn button {
	margin: 3px;
	border: 0;
	border-radius: 10px;
	padding: 10px 10px;
	color: #222;
	background-color: #E6AAAE;
}

#admin-btn button:last-child {
	margin-right: 15px;
}

.btn {
	padding: 10px 20px;
	background-color: #0074cc;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.item:hover div:nth-child(2) {
	background-color: rgba(200, 229, 229, 0.95);
}

#overlay-div {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 400px;
	background-color: black;
	opacity: 0.65; /* 투명도 조절 */
	z-index: 1; /* 다른 요소들보다 위에 위치하도록 설정 */
}

#title h2, #title p {
	color: #EEE;
	z-index: 2;
}
</style>
</head>
<body>
	<!-- register.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->


	<main id="main">
		<c:if test="${not empty lv && lv == 2}">
			<div style="height: 50px">
				<div id="admin-btn">
					<button type="button" id="del-btn"
						onclick="location.href='/ddstudio/shop/item/del.do?seq=${dto.item_seq}'">
						<i class="fa-solid fa-trash"></i>삭제
					</button>
					<button type="button" id="edit-btn"
						onclick="location.href='/ddstudio/shop/item/edit.do?seq=${dto.item_seq}'">
						<i class="fa-solid fa-pen-to-square"></i>수정
					</button>
				</div>
			</div>
		</c:if>

		<div id="title"
			style="margin-top: 100px; background-image: url('/ddstudio/asset/image/background-5.jpg');">
			<div id="overlay-div"></div>
			<h2>상품 상세 정보</h2>
		</div>

		<div id="content">

			<form method="POST" action="/ddstudio/member/purchase/view.do">
				<div class="detail">
					<div class="img"
						style="background-image: url('/ddstudio/asset/image/item/${dto.img}');"></div>
					<ul class="infoArea">
						<li>
							<div class="tableCell">
								<p class="txt1">
									<span>상품명</span>
								</p>
								<p class="txt2">${dto.name}</p>
							</div>
						</li>
						<li>
							<div class="tableCell">
								<p class="txt1">
									<span>상품정보</span>
								</p>
								<p class="txt2">${dto.info}</p>
							</div>
						</li>
						<li>
							<div class="tableCell">
								<p class="txt1">
									<span>가격</span>
								</p>
								<p class="txt2">${dto.price}원</p>
							</div>
						</li>
						<li>
							<div class="tableCell">
								<p class="txt1">
									<span>수량</span>
								</p>
								<p class="txt2">
									<select name="number" class="personnel">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select> 개
								</p>
							</div>
						</li>
						<c:if test="${not empty email && lv == 1}">
							<li>
								<div class="tableCell">
									<button class="btn" type="button" id="cart">장바구니</button>
									<button class="btn" type="submit">바로 구매</button>
								</div>
							</li>
						</c:if>
						<c:if test="${empty email}">
							<div class="tableCell">
								<button class="btn" type="button"
									onclick="location.href='/ddstudio/user/login.do';">로그인</button>
							</div>
						</c:if>
					</ul>
				</div>
				<input type="hidden" name="item_seq" value="${dto.item_seq}">
				<input type="hidden" name="name" value="${dto.name}"> <input
					type="hidden" name="price" value="${dto.price}">
			</form>
		</div>

		<div class="container" style="margin-top: 40px;">
			<button type="button" class="btn"
				onclick="location.href='/ddstudio/shop/giftshop/detail.do?seq=${shopSeq}'">돌아가기</button>
		</div>

	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	<script>
		$('#cart').click(function() {
			let num = $('input[name="num"]').val(); // 입력 필드에서 값을 가져옴
			let item_seq = '${dto.item_seq}';
			$.ajax({
				type : 'POST',
				url : '/ddstudio/member/cart/list.do',
				data : {
					num : num,
					item_seq : item_seq
				},
				dataType : 'json',
				success : function(result) {
					alert('장바구니에 추가되었습니다!');
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		});
	</script>
</body>
</html>