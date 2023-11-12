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
}

select option:checked {
	background-color: #ddd;
}

#courseImage {
	width: 375px;
	justify-content: center; align-items : center;
	text-align: center;
	align-items: center;
}
</style>
</head>
<body>
	<!-- /test/course/add.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>코스 삭제</h1>

		<div class="sub-title"></div>

		<div id="content">
			<div class="wide-item">

				<form method="POST" action="/ddstudio/test/coursedel.do"
					enctype="multipart/form-data">
					<table>
						<tr>
							<th class="required">코스명</th>
							<td>
								<div>
									<select name="name" id="name" required class="middle-flat">
										<!-- <option value="f1">사과</option> -->
									</select>
								</div>
							</td>
						</tr>

						<tr>
							<th>첨부파일</th>
							<td><img id="courseImage" alt="코스 이미지"></td>
						</tr>

						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<button type="button" id="change" class="check button">삭제</button>
									<button type="button" id="cancel" class="button"
										onclick="location.href='/ddstudio/test/recommend.do';">취소</button>
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
		$(document).ready(function() {
			load();
		});

		function load() {
			$.ajax({
				type : 'GET',
				url : '/ddstudio/test/coursedel.do',
				dataType : 'json',
				success : function(result) {
					var select = $('#name');
					select.empty();

					$(result).each(
							function(index, item) {
								var option = $('<option>').val(item.course_seq)
										.text(item.name);
								select.append(option);
							});

					// Update the image when the course list is loaded
					updateImage(result);

					// Attach change event handler to update image when the selection changes
					select.on('change', function() {
						updateImage(result);
					});
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}

		// 코스 이미지 업데이트
		function updateImage(result) {
			var selectedCourseSeq = $('#name').val();
			var imageSrc = '';

			var selectedCourse = result.find(function(course) {
				return course.course_seq === selectedCourseSeq;
			});

			if (selectedCourse) {
				imageSrc = '/ddstudio/asset/image/course/' + selectedCourse.img;
			}

			$('#courseImage').attr('src', imageSrc);
		}

		// 삭제 버튼 클릭 이벤트
		$('#change').on('click', function(e) {
			e.preventDefault();

			var delCourseSeq = $('#name').val();

			console.log(delCourseSeq);
			$.ajax({
				type : 'POST',
				url : '/ddstudio/test/coursedel.do',
				data : {
					courseSeq : delCourseSeq
				},
				success : function(result) {
					if (result == 1) {
						alert("코스를 삭제했습니다.");
						load();
					} else {
						alert("failed");
					}
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		});
	</script>

</body>
</html>