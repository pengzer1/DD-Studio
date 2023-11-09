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
	
	#add-content {
		display: flex;
		justify-content: center;
		text-align: left;
	}
	
	#form-table tr > th {
		width: 200px;
	}
	
	#form-table tr > td {
		width: 400px;
	}
	
	#form-table tr > td > input {
		width: 100%;
		height: 100%;
	}
	
	table.vertical {
		margin:0 auto;
	}
	
</style>
</head>
<body>
	<!-- /ddstudio/activity/attraction/add.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="attraction-del">
	
		<div>
			<h2>어트랙션 삭제하기</h2>
		</div>
		
		<hr id="attraction-line"/>
		
		<div id="sub-title">
			<p>어트랙션 삭제</p>
		</div>
		
		<div id="del-content">
			<form method="POST" action="/ddstudio/activity/attractiondel.do">
				<div>
					<button>취소</button>
					<button>삭제</button>
				</div>
				<input type="hidden" name="seq" value="${seq}" />
			</form>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	<!-- Footer -->

	<script>
		
	</script>
</body>
</html>


