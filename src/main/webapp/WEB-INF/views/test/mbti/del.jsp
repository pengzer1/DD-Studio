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
	margin-right: 35px;
}

select {
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	appearance: none;
	-webkit-appearance: none;
	background-position: right 10px center;
	background-repeat: no-repeat;
	margin-left: 20px;
}

#mbti-container {
	display: flex;
	margin-left: 25px;
}

select option:checked {
	background-color: #ddd;
}

#selected-mbti {
	width: 400px;
	margin-left: 47px;
}
</style>
</head>
<body>
	<!-- /test/mbti/del.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>MBTI별 추천 삭제</h1>

		<div class="sub-title"></div>

		<div id="content">
			<div class="wide-item">

				<form method="POST" action="/ddstudio/test/mbtidel.do" id="mbtiForm"
					enctype="multipart/form-data">
					<table>
						<tr>
							<th class="required">MBTI명</th>
							<td>
								<div id="mbti-container">
									<div>
										<select name="selected-mbti" id="selected-mbti" required
											class="middle-flat">
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<button type="button" id="delButton" class="check button"
										onclick="delMBTI()">삭제</button>
									<button type="button" id="cancel" class="button"
										onclick="location.href='/ddstudio/test/mbti.do';">취소</button>
								</div>
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		// 데이터 로드
		$(document).ready(function() {
			load();
		});

		function load() {
			$.ajax({
				type : 'GET',
				url : '/ddstudio/test/mbtilistload.do',
				dataType : 'json',
				success : function(result) {
					var mbtiSelect = $('#selected-mbti');
					mbtiSelect.empty();

					$.each(result, function(index, item) {
						var option = $('<option>').val(item.mbti_seq).text(
								item.mbti);
						mbtiSelect.append(option);
					});
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}

		// MBTI 삭제
		function delMBTI() {
			var mbti_seq = $('#selected-mbti').val();

			$.ajax({
				type : 'POST',
				url : '/ddstudio/test/mbtidel.do',
				data : {
					mbti_seq : mbti_seq
				},
				success : function(response) {
					var result = response.result;

					if (result == 1) {
						//alert("삭제 되었습니다.")
						window.location.href = '/ddstudio/test/mbti.do';
					} else {
						alert("failed");
					}
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}
	</script>

</body>
</html>
