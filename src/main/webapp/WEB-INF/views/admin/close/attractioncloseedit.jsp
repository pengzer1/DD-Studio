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
#attractionclose-edit {
	text-align: center;
	margin-top: 150px;
}

#add-line {
	color: #777;
}

#add-content {
	display: flex;
	justify-content: center;
	text-align: left;
}

#form-table tr>th {
	width: 200px;
}

#form-table tr>td {
	width: 400px;
}

#form-table tr>td>input {
	width: 100%;
	height: 100%;
}

#admin-btn {
	float: center;
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: center;
}

#admin-btn button {
	margin: 3px;
	border: 0;
	border-radius: 10px;
	padding: 10px 20px;
	color: #fff;
	cursor: pointer;
	background-color: #E6AAAE;
}

.back-btn {
	background-color: #6c757d;
}

.add-btn {
	background-color: #007bff;
}
#question{
	margin:0;
}
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="attractionclose-edit">
		<h1>
			어트랙션 운휴 <small>수정하기</small>
		</h1>

		<hr id="bottom-line" />
		<div id=question>수정하실 어트랙션을 선택해주세요.</div>
		<div id="add-content">
			<form name="AttEditForm" method="POST"
				action="/ddstudio/admin/attractioncloseedit.do">
				<table id="form-table">
					<tbody>
						<tr>
							<th>어트랙션명</th>
							<td>
								<select name="attraction">
									<c:forEach items="${list}" var="dto">
										<option value="${dto.attraction_close_seq}">${dto.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<%-- <c:if test="${ }" var="dto">  <!-- 오늘 포함 이전이면 start_date를 그대로 가져오고 수정불가 -->
							<th>운휴시작일</th>
							<td><input type="date" name="start_date" id="closedate" value="${dto.start_date}"></td>
							</c:if>
							<c:if test="${ }" var="dto">
							<th>운휴시작일</th>
							<td><input type="date" name="start_date" id="closedate" value="${dto.start_date}"></td>
							</c:if> --%>
							<th>운휴시작일</th>
							<td><input type="date" name="start_date" id="start_date"></td>
						</tr>
						<tr>
							<th>운휴종료일</th>
							<td><input type="date" name="end_date" id="end_date"></td>
						</tr>
					</tbody>
				</table>
		</div>
		<div id="admin-btn">
			<button type="button" class="back-btn" onclick="location.href='/ddstudio/admin/attractionclose.do';">
				<i class="fa-regular fa-circle-xmark"></i>취소
			</button>
			<button type="submit" class="edit-btn">
				<i class="fa-solid fa-pen-to-square"></i>수정
			</button>
		</div>
		</form>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
	
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
				$('#start_date').val(close_list[i].start_date.substr(0,  10));
				$('#start_date').prop('readOnly', true);  //운휴가 현재날짜보다 이전이면 -> 운휴 이미 시작이므로 readonly.
			} else {
				$('#start_date').attr('min', nowStr);
				$('#start_date').val(close_list[i].start_date.substr(0,  10));
				$('#start_date').prop('readOnly', false);
			}

			changeDate(i);
			
		}
		
		function changeDate(i) {
			$('#end_date').attr('min', date.value);  //end_date는 재선택한 운휴시작일 넣어주기
			$('#end_date').val(close_list[i].end_date.substr(0,  10));
			$('#start_date').change(function() {
				$('#end_date').attr('min', date.value);
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