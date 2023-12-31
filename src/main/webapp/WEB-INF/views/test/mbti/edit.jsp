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
	margin-right: 25px;
}

select {
	width: 85%;
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

.button {
	font-size: 16px;
	border: 1px solid #ccc;
    border-radius: 5px;
    background-color: white;
    box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.1);
}

#mbti-container {
	display: flex;
	margin-left: 25px;
}

#selected-mbti {
	width: 190px;
}

#mbti {
	width: 198px;
	height: 43px;
}

select option:checked {
	background-color: #ddd;
}

#courseImage {
	width: 375px;
	justify-content: center;
	align-items: center;
	text-align: center;
	align-items: center;
}
</style>
</head>
<body>
	<!-- /test/mbti/edit.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>MBTI별 추천 수정</h1>

		<div class="sub-title"></div>

		<div id="content">
			<div class="wide-item">

				<form method="POST" action="/ddstudio/test/mbtiedit.do"
					id="mbtiForm" enctype="multipart/form-data">
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
									<div>
										<input name="mbti" id="mbti" required class="middle-flat">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th class="required">결과</th>
							<td>
								<div>
									<input name="result" id="result" required class="middle-flat">
								</div>
							</td>
						</tr>
						<tr>
							<th class="required">코스명</th>
							<td>
								<div>
									<select name="course-name" id="course-name" required
										class="middle-flat">
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th class="required">어트랙션명</th>
							<td>
								<div>
									<select name="attraction-name" id="attraction-name" required
										class="middle-flat">
									</select>
								</div>
							</td>
						</tr>

						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<button type="button" id="editButton" class="check button"
										onclick="editMBTI()">수정</button>
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

					// 선택된 MBTI 정보 표시 함수 호출
					showSelectedMBTI();
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});

			$.ajax({
				type : 'GET',
				url : '/ddstudio/test/mbtiobjectload.do',
				dataType : 'json',
				success : function(result) {
					var courseSelect = $('#course-name');
					var attractionSelect = $('#attraction-name');

					courseSelect.empty();
					attractionSelect.empty();

					$(result).each(
							function(index, item) {
								var option;

								if (item.type === 'course') {
									option = $('<option>').val(item.course_seq)
											.text(item.course_name);
									courseSelect.append(option);
								} else if (item.type === 'attraction') {
									option = $('<option>').val(
											item.attraction_seq).text(
											item.attraction_name);
									attractionSelect.append(option);
								}
							});
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}

		// MBTI 추가 및 삭제
	    function editMBTI() {
	        var mbti_seq = $('#selected-mbti').val();

	        // 삭제 수행
	        $.ajax({
	            type: 'POST',
	            url: '/ddstudio/test/mbtidel.do',
	            data: {
	                mbti_seq: mbti_seq
	            },
	            success: function (response) {
	                var result = response.result;

	                if (result == 1) {
	                    // 삭제가 성공하면 추가 수행
	                    addMBTI();
	                } else {
	                    alert("failed");
	                }
	            },
	            error: function (a, b, c) {
	                console.log(a, b, c);
	            }
	        });
	    }

	    // MBTI 추가
	    function addMBTI() {
	        $.ajax({
	            type: 'POST',
	            url: '/ddstudio/test/mbtiadd.do',
	            data: {
	                mbti: $('#mbti').val(),
	                result: $('#result').val(),
	                'course-name': $('#course-name').val(),
	                'attraction-name': $('#attraction-name').val()
	            },
	            success: function (response) {
	                var result = response.result;

	                if (result == 1) {
						//alert("수정 되었습니다.")
	                    window.location.href = '/ddstudio/test/mbti.do';
	                } else {
	                    alert("failed");
	                }
	            },
	            error: function (a, b, c) {
	                console.log(a, b, c);
	            }
	        });
	    }
	</script>

</body>
</html>