<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#voc {
				text-align: center;
				margin-top: 180px;
			}
			#search-form {
				margin-top: 50px;
			}
			#category {
				width: 110px;
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
			#voc-list {
				width: 80%;
				text-align: center;
				border-top: 2px solid black;
				margin: 50px auto 0;
			}
			#voc-list th, #voc-list td {
				height: 60px;
				color: #444;
				padding: 10px;
				border-bottom: 1px solid #E1E1E1;
			}
			#voc-list th {
				font-size: 1.02rem;
				font-weight: bold;
			}
			#voc-list th:nth-child(1) {
				width: 5%;
			}
			#voc-list th:nth-child(2) {
				width: 5%;
			}
			#voc-list th:nth-child(3) {
				width: 9%;
			}
			#voc-list th:nth-child(4) {
				width: 45%;
			}
			#voc-list th:nth-child(5) {
				width: 18%;
			}
			#voc-list th:nth-child(6) {
				width: 10%;
			}
			#voc-list th:nth-child(7) {
				width: 8%;
			}
			#voc-list td:nth-child(4) {
				font-size: 1.1rem;
			}
			#voc-list td:nth-child(4) a {
				font-weight: bold;
				color: #333;
			}
			#no-answer {
				background-color: #EEFAF0;
			}
			#page-bar {
				display: flex;
				font-size: 1.2rem;
				justify-content: center;
				margin-top: 50px;
			}
			#previous-button, #current-page, #other-pages, #next-button {
				color: #000;
				margin: 0 10px;
			}
			#previous-button, #next-button {
				display: block;
				margin-top: 1.5px;
			}
			#current-page {
				color: red;
			}
			.nav-icon {
				font-size: 50px;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="voc">
			<h1>이용문의</h1>
				
			<form method="GET" action="/ddstudio/communicate/voc.do" id="search-form">
				<select name="category" id="category">
					<option value="type">구분</option>
					<option value="service_type">서비스유형</option>
					<option value="email">이메일</option>
				</select>
					
				<input type="text" name="word" id="search-field" size="50" placeholder="검색어를 입력하세요." required>
					
				<button type="submit" id="search-button"><span class="material-symbols-outlined">search</span></button>
			</form>
			
			<table id="voc-list">
				<thead>
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>서비스유형</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>답변상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto" varStatus="status">
					    <tr id="${empty dto.answer ? 'no-answer' : ''}">
					        <td>${totalVOC - status.index - map.startIndex + 1}</td>
					        <td>${dto.type}</td>
					        <td>${dto.service_type}</td>
					        <td><a href="/ddstudio/communicate/vocdetail.do?seq=${dto.voc_seq}">${dto.subject}</a></td>
					        <td>${dto.name}<br>(${dto.email})</td>
					        <td>${dto.regdate}</td>
					        <td>${empty dto.answer ? '미완료' : '완료'}</td>
					    </tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
		
		<div id="page-bar">${pageBar}</div>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>			
			document.addEventListener('DOMContentLoaded', function () {
		        var searchField = document.getElementById('search-field');

		        searchField.addEventListener('keyup', function (event) {
		            if (event.key === 'Enter') {
		                document.getElementById('search-form').submit();
		            }
		        });
		    });
			
			<c:if test="${map.searchStatus == 'y'}">
				$('#category').val('${map.category}');
				$('#search-field').val('${map.word}');
			</c:if>
			
			document.addEventListener('keydown', function(event) {
				if (event.key === 'F5' || ((event.ctrlKey || event.metaKey) && event.key === 'F5')) {
			        location.href='/ddstudio/communicate/voc.do';
			    }
			});
		</script>
	</body>
</html>