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
#cancel {
	margin-right: 15px;
}

#duplicate-check {
	padding: 0;
}

select {
   width: 85%;
   padding: 10px;
   font-size: 14px;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   appearance: none;
   -webkit-appearance: none;
   background-position: right 10px center;
   background-repeat: no-repeat;
}

select option:checked {
   background-color: #ddd;
}
</style>
</head>
<body>
	<!-- register.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>상품 수정</h1>

		<div class="sub-title">
			<p>상품정보입력</p>
		</div>

		<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/shop/item/edit.do" enctype="multipart/form-data">
					<table>
						<!-- 샵명 필드 -->
						<tr>
							<th class="required">상품명</th>
							<td>
								<div class="name">
									<input type="text" name="name" id="name" required
										class="middle-flat" value="${dto.name}">
								</div>
							</td>
						</tr>
						<!-- 정보 필드 -->
						<tr>
							<th class="required">상품 정보</th>
							<td>
								<div>
									<input type="text" name="info" id="info" required
										class="middle-flat" value="${dto.info}">
								</div>
							</td>
						</tr>
						<!-- 가격 필드 -->
						<tr>
							<th class="required">가격</th>
							<td>
								<div>
									<input type="number" name="price" id="price" required class="middle-flat" value="${dto.price}">
								</div>
							</td>
						</tr>
						<!-- 이미지 필드 -->
						<tr>
							<th class="required">이미지</th>
							<td>
								<input type="file" name="images" id="images" multiple>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<!-- validateAndSubmit 함수로 가입 버튼 클릭 시 유효성 검사 -->
									<!-- <div id="ok-message"></div> -->
									<button type="submit" id="join" class="check button">수정</button>
									<button type="button" id="cancel" class="button"
										onclick="location.href='/ddstudio/shop/item/detail.do?seq=${dto.item_seq}';">취소</button>
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="item_seq" value="${dto.item_seq}">
				</form>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

	
	<script>
	</script>

</body>
</html>