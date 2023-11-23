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
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
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
	
    #restriction {
    	width: 500px;
    	max-width: 500px;
    	
    }
    
    td > div > textarea {
    	border: 1.5px solid #eeeeee;
    }
    
    textarea::placeholder {
		font-size: 16px;
		font-weight: 00;
		color: #9e9e9e;
		text-align: center;
	}
	
	input::placeholder {
		font-size: 16px;
		font-weight: 00;
		color: #9e9e9e;
		text-align: center;
	}
	
	table {
		width: 700px;
		margin: 0 auto;
	}
	
	td > div > input[type=radio] {
		width: auto;
		height: auto;
		border: 1.5px solid #ccc;
		border-radius: 7px;
		appearance: auto;
	}
	
	table {
	  	border-left: 2px solid #d1d1d1;
	    border-right: 2px solid #d1d1d1;
	    border-radius: 20px;
	    border-collapse: separate;
	}
	
	#admin-btn button {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #E6AAAE;
		margin-top: 20px;
	}
	
	#admin-btn {
		text-align: center;
		margin-bottom: 50px;
	}
	
	#list-btn {
		margin: 3px;
		border: 0;
		border-radius: 10px;
		padding: 10px 10px;
		color: #222;
		background-color: #E6AAAE;
		margin-top: 20px;
	}
	
	#content {
		margin-top: 0px;
	}
	
	#checkbox input {
		
		border: 1px solid black;
		width: 10px;
		appearance: auto;
		
	}
	
    
</style>
</head>
<body>
	<!-- /ddstudio/activity/movie/theater.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="main">
		<h1>영화관 관리</h1>

		<div id="admin-btn">
			<button type="button" id="del-btn"><i class="fa-solid fa-plus"></i>영화관 삭제</button>
			<button type="button" id="edit-btn"><i class="fa-solid fa-plus"></i>영화관 수정</button>
			<button type="button" id="add-btn" onclick="location.href='/ddstudio/activity/theateradd.do';"><i class="fa-solid fa-plus"></i>영화관 등록</button>
		</div>

		<div id="content">
			<div class="wide-item">
				<table>
					<tr>
						<th> </th>
						<th>영화관 번호</th>
						<th>영화관명</th>
					</tr>
					<c:forEach items="${list}" var="dto">
					<tr>
						<td>
							<div id="checkbox">
								<input type="checkbox" name="seq" value="${dto.theater_seq}" data-seq="${dto.theater_seq}" onclick="checkOnlyOne(this)"/>
							</div>
						</td>
						<td>
							<div>${dto.theater_seq}</div>
						</td>
						<td>
							<div>${dto.name}</div>
						</td>
					</tr>
					</c:forEach>
				</table>
				<button id="list-btn" type="button" onclick="location.href='/ddstudio/activity/movie.do';">영화 목록</button>
			</div>
		</div>
	</main>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
	
		let sequence;
	
		function checkOnlyOne(element) {
			  
			  const checkboxes 
			      = document.getElementsByName("seq");
			  
			  checkboxes.forEach((cb) => {
			    cb.checked = false;
			  })
			  
			  element.checked = true;
			  
			  sequence = $(input).val
		}
		
		
		$('#del-btn').click(function () {
			
			const seq = $('input[type="checkbox"]:checked').val();
			
			if (seq == undefined) {
				alert('삭제할 영화관을 선택해주세요.');				
			} else {
				
				location.href='/ddstudio/activity/theaterdel.do?seq=' + seq;
			}		
			
		});

		$('#edit-btn').click(function () {
			
			const seq = $('input[type="checkbox"]:checked').val();
			
			if (seq == undefined) {
				alert('수정할 영화관을 선택해주세요.');				
			} else {
				
				location.href='/ddstudio/activity/theateredit.do?seq=' + seq;
			}		
			
		});
		 
		
	</script>
</body>
</html>


