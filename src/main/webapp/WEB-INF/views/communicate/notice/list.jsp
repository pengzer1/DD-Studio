<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#notice {
				text-align: center;
				margin-top: 70px;
			}
			#search-form {
				margin-top: 30px;
			}
			#category {
				width: 100px;
				height: 40px;
				margin-right: 5px;
			}
			#search-field {
				height: 40px;
			}
			#search-button {
				background-color: transparent;
				border: none;
				outline: none;
			}
			#search-button span {
				font-size: 40px;
				position: relative;
				top: 13px;
			}
			#list {
				width: 80%;
				text-align: center;
				border-top: 2px solid black;
				margin: 50px auto 0;
			}
			#list th, #list td {
				height: 60px;
				font-color: #555;
				padding: 10px;
				border-bottom: 1px solid #E1E1E1;
			}
			#list th, #list td:nth-child(2) {
				font-color: #000;
				font-weight: bold;
			}
			#list th:nth-child(1) {
				width: 20%;
			}
			#list th:nth-child(2) {
				width: 60%;
			}
			#list th:nth-child(3) {
				width: 20%;
			}
			#list td:nth-child(2) {
				font-size: 1.1rem;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<div id="notice">
			<h1>공지사항</h1>
				
			<form method="GET" action="/ddstudio/communicate/list.do" id="search-form">
				<select name="category" id="category">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
					
				<input type="text" name="word" id="search-field" size="60" pattern=".{2,}" placeholder="두 글자 이상의 단어를 입력하세요." required>
					
				<button type="submit" id="search-button"><span class="material-symbols-outlined">search</span></button>
			</form>
			
			<table id="list">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항</td>
						<td>2023.11.07</td>
					</tr>
				</tbody>
			</table>
		</div>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
			
		</script>
	</body>
</html>