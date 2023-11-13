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
	#attraction-add {
		text-align: center;
		margin-top: 150px;
	}
	
	#add-line {
		color: #777;
	}
	
	/* #add-content {
		width: 800px;
		background-color: gold;
	} */
	
	.add-table {
		margin: 0 30%;
		border: 0px solid #777;
		border-collapse: collapse;
		width: 800px;	
	}
	
	.add-table th, .add-table td {
		border: 0px solid #777;
	}
	
	.add-table th {
		text-align: left;
		width: 13%;
	}
	
	.add-table td {
		text-align: left;
		width: 60%;
	}
	
	.add-table input {
		width: 100%;
		height: 100%;
	}
	
	
	.add-table textarea {
		width: 100%;
		height: 100%;
	}
	
	
</style>
</head>
<body>
	<!-- /ddstudio/activity/attraction/add.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="attraction-add">
	
		<div>
			<h2>어트랙션 등록하기</h2>
		</div>
		
		<hr id="add-line"/>
		
		<div id="sub-title">
			<p>신규 어트랙션 등록</p>
		</div>
		
		<!-- <div id="add-content"> -->
			<form method="POST" action="/ddstudio/activity/attractionadd.do" enctype="multipart/form-data" class="add-form">
				<table class="add-table">
					<tbody>
						<tr>
							<th class="required">어트랙션명</th>
							<td>
								<div>
									<input type="text" name="name"/>
								</div>
							</td>
						</tr>
						<tr>
							<th class="required">운영시간</th>
							<td>
								<div>
									<input type="text" name="time"  placeholder="HH:MM - HH:MM 형식으로 작성해주세요."/>
								</div>
							</td>
							<!-- 올바르지 않은 형식을 입력 시 warning message가 출력될 부분 -->
							<td></td>
						</tr>
						<tr>
							<th class="required">탑승인원</th>
							<td>
								<div>
									<input type="number" name="capacity"  placeholder="숫자 형식으로 작성해주세요." min="1" />
								</div>
							</td>
							<!-- 올바르지 않은 형식을 입력 시 warning message가 출력될 부분 -->
							<td></td>
						</tr>
						<tr>
							<th>이용정보</th>
							<td>
								<div>
									<textarea name="restriction" placeholder="제한사항 등 해당 어트랙션의 이용정보를 작성해주세요."></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th class="required">위치</th>
							<td>
								<button type="button" onclick="location.href='/ddstudio/activity/locationadd.do';">위치 등록</button>
							</td>
						</tr>
						<tr>
							<th>해시태그</th>
							<td>
								<input type="text" name="hashtag" id="hashtag-text"/>
								<%-- <select name="hashtag" id="hashtag-select" class="selectbox">
									<c:forEach items="${hashtagList}" var="dto">
									<option value="${dto.name}">${dto.name}</option>
									</c:forEach>
								</select> --%>
							</td>
							<!-- 입력받은 해시태그가 출력될 부분 -->
							<td></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td><input type="file" name="img"/></td>
						</tr>
					</tbody>
				</table>
			</form>
		<!-- </div> -->
		
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


