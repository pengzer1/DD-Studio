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
body {
	background-color: #EEE;
}

#main>#title, .item div {
	background-color: white;
}

.middle-flat {
	color: #000;
	margin-top: 50px;
	width: 400px;
	height: 40px;
	padding: 10px;
	border: 1px solid #ccc;
	font-size: 16px;
	margin: 0;
	align-items: center;
	justify-content: center;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form>#condition {
	box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.4);
	text-align: center;
	background-color: rgba(43, 114, 201, 0.3);
	height: 70px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-bottom: 15px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input[type="text"], .form-group input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.form-group input[type="password"] {
	margin-bottom: 10px;
}

.form-group input[type="tel"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.btn-container {
	text-align: center;
	margin-top: 20px;
}

.btn {
	padding: 10px 20px;
	background-color: #0074cc;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn.cancel {
	background-color: #ccc;
}

#personnel {
	display: flex;
 	flex-wrap: wrap;
 	
}

#personnel > div {
  flex: 0 0 calc(33.33% - 20px);
  align-text: center;
  margin: 10px;
  justify-content: space-around;
  align-items: center;
  
}

ul {
list-style-type: none;
margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 200px;
    font-size: 14px;
    width: 100%;
}

li {
	display: inline-block;
    width: 80%;
    position: relative;
    vertical-align: top;
}


.amountWrap {
    color: #505050;
    border: 3px solid #61656a;
    
}

.payWrap .amountWrap .totalOrder {
    border-width: 3px 0 3px 0;
    background-color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
}

.amountWrap ul li {
	margin: auto 0;
    margin-top: 10px;
}

.amountWrap ul li:first-child {
    margin-top: 0;
}

.tit_order {
    padding-bottom: 8px;
    border-bottom: 1px solid #ccc;
    font-weight: 500;
    font-size: 16px;
}

.txtColorType03, table td.txtColorType03 {
    color: #e12f36 !important;
}

.amountWrap ul li span, .amountWrap .total span {
float: right;
    font-size: 16px;
    font-weight: 600;
}
.inlineblock {
    display: inline-block !important;
}

.fn {
    float: none !important;
}

.amountWrap .price i {
    margin-right: 6px;
    font-size: 15px;
    font-style: normal;
    text-decoration: line-through;
    color: #aaa;
}

b {
    font-weight: 700;
}

.amountWrap .scheduledPay {
    padding-right: 140px;
    padding-left: 140px;
    padding: 18px 3.74%;
    color: #fff;
    background-color: #61656a;
}

.amountWrap .scheduledPay .total span {
    font-size: 23px;
    color: #ff5b62;
}

#content {
	margin-top: 20px;
}

</style>
</head>
<body>
	<!-- Template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<!-- Header -->

	<main id="main">

		<div id="title" style=" background-image: url('/ddstudio/asset/image/background-6.jpg');">
			<h2>개인 예매</h2>
		</div>

		<div id="content">


			<div class="container">
				<form action="/ddstudio/ticket/addReservation.do" method="post">
					<div id="condition">
						<h3>예약자 정보</h3>
					</div>
					<div class="form-group">
						<label for="name">이름</label> <input type="text" id="name"
							name="name" required value=${name} disabled>
					</div>
					<div class="form-group">
						<label for="email">이메일</label> <input type="text" id="email"
							name="email" value=${email} disabled>
					</div>
					
					<div id="condition">
						<h3>예매 확인</h3>
					</div>
					<c:if test="${discount_rate != 0}">
					<div class="payWrap">
						<div class="amountWrap">
							<div class="totalOrder">
								<ul>
									<li class="tit_order fs18 txtColorType03">${benefit_name} ${discount_rate}% - 
									<span class="inlineblock fn">${date}</span>
									</li>
									<c:if test="${adult != 0}">
									<li>어른 X ${adult}
									<span class="price"><i>${adultDTO.price * adult}</i>
									<b>${Math.round(adultDTO.price * adult - adultDTO.price * adult * discount_rate / 100)} 원</b></span>
									</li>
									</c:if>
									<c:if test="${teenager != 0}">
									<li>청소년 X ${teenager}
									<span class="price"><i>${teenagerDTO.price * teenager}</i>
									<b>${Math.round(teenagerDTO.price * teenager - teenagerDTO.price * teenager * discount_rate / 100)} 원</b></span>
									</li>
									</c:if>
									<c:if test="${child != 0}">
									<li>어린이 X ${child}
									<span class="price"><i>${childDTO.price * child}</i>
									<b>${Math.round(childDTO.price * child - childDTO.price * child * discount_rate / 100)} 원</b></span>
									</li>
									</c:if>
									<li class="total">
										총 주문금액
										<span class="price">
										<i>${adultDTO.price * adult + teenagerDTO.price * teenager + childDTO.price * child}</i>
										<b>${Math.round(adultDTO.price * adult - adultDTO.price * adult * discount_rate / 100 + teenagerDTO.price * teenager - teenagerDTO.price * teenager * discount_rate / 100 + childDTO.price * child - childDTO.price * child * discount_rate / 100)}</b> 원
										</span>
									</li>
								</ul>
							</div>
							<div class="scheduledPay">
								<div class="total">
									결제예정금액
									<span class="price">
										<b id="payPreAmt">${Math.round(adultDTO.price * adult - adultDTO.price * adult * discount_rate / 100 + teenagerDTO.price * teenager - teenagerDTO.price * teenager * discount_rate / 100 + childDTO.price * child - childDTO.price * child * discount_rate / 100)} 원</b>
									</span>
								</div>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${discount_rate == 0}">
					<div class="payWrap">
						<div class="amountWrap">
							<div class="totalOrder">
								<ul>
									<li class="tit_order fs18 txtColorType03">혜택 없음 - 
									<span class="inlineblock fn">${date}</span>
									</li>
									<c:if test="${adult != 0}">
									<li>어른 X ${adult}
									<span class="price"><b>${adultDTO.price * adult} 원</b></span>
									</li>
									</c:if>
									<c:if test="${teenager != 0}">
									<li>청소년 X ${teenager}
									<span class="price"><b>${teenagerDTO.price * teenager} 원</b></span>
									</li>
									</c:if>
									<c:if test="${child != 0}">
									<li>어린이 X ${child}
									<span class="price"><b>${childDTO.price * child} 원</b></span>
									</li>
									</c:if>
									<li class="total">
										총 주문금액
										<span class="price">
										<b>${adultDTO.price * adult + teenagerDTO.price * teenager + childDTO.price * child} 원</b>
										
										</span>
									</li>
								</ul>
							</div>
							<div class="scheduledPay">
								<div class="total">
									결제예정금액
									<span class="price">
										<b id="payPreAmt">${Math.round(adultDTO.price * adult - adultDTO.price * adult * discount_rate / 100 + teenagerDTO.price * teenager - teenagerDTO.price * teenager * discount_rate / 100 + childDTO.price * child - childDTO.price * child * discount_rate / 100)} 원</b>
									</span>
								</div>
							</div>
						</div>
					</div>
					</c:if>

					<div class="btn-container">
						<button type="button" class="btn" onclick="location.href='/ddstudio/ticket/single-reservation.do'">뒤로가기</button>
						<button type="submit" class="btn">결제하기</button>
					</div>
					
					<input type="hidden" name="date" value="${date}">
					<input type="hidden" name="adult_ea" value="${adult}">
					<input type="hidden" name="adult_seq" value="${adultDTO.seq}">
					<input type="hidden" name="teenager_ea" value="${teenager}">
					<input type="hidden" name="teenager_seq" value="${teenagerDTO.seq}">
					<input type="hidden" name="child_ea" value="${child}">
					<input type="hidden" name="child_seq" value="${childDTO.seq}">
					<input type="hidden" name="adult_price" value="${Math.round(adultDTO.price * adult - adultDTO.price * adult * discount_rate / 100)}">
					<input type="hidden" name="teenager_price" value="${Math.round(teenagerDTO.price * teenager - teenagerDTO.price * teenager * discount_rate / 100)}">
					<input type="hidden" name="child_price" value="${Math.round(childDTO.price * child - childDTO.price * child * discount_rate / 100)}">
					<input type="hidden" name="benefit_seq" value="${benefit_seq}">
				</form>
			</div>

		</div>

	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


