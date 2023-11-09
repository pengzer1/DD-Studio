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
				margin-top: 50px;
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
			#notice-list {
				width: 80%;
				text-align: center;
				border-top: 2px solid black;
				margin: 50px auto 0;
			}
			#notice-list th, #notice-list td {
				height: 60px;
				color: #444;
				padding: 10px;
				border-bottom: 1px solid #E1E1E1;
			}
			#notice-list th {
				font-size: 1.02rem;
				font-weight: bold;
			}
			#notice-list td:nth-child(2) a {
				color: #333;
				font-weight: bold;
			}
			#notice-list th:nth-child(1) {
				width: 20%;
			}
			#notice-list th:nth-child(2) {
				width: 60%;
			}
			#notice-list th:nth-child(3) {
				width: 20%;
			}
			#notice-list td:nth-child(2) {
				font-size: 1.1rem;
			}
			#fixed {
				background-color: #EDFFFC;
			}
			#fix-icon {
				color: #F00;
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
			#button-list {
				display: flex;
    			justify-content: flex-end;
			}
			#add-button {
				width: 100px;
				height: 33px;
				background-color: #FBF2F3;
				border: 2px solid #F49097;
				border-radius: 15px;
				margin-top: 10px;
			    margin-right: 150px;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="notice">
			<h1>공지사항</h1>
				
			<form method="GET" action="/ddstudio/communicate/notice.do" id="search-form">
				<select name="category" id="category">
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
					
				<input type="text" name="word" id="search-field" size="60" pattern=".{2,}" placeholder="두 글자 이상의 단어를 입력하세요." required>
					
				<button type="submit" id="search-button"><span class="material-symbols-outlined">search</span></button>
			</form>
			
			<table id="notice-list">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto" varStatus="status">
						<c:if test="${dto.fix == 'n'}">
							<tr>
					            <td>${totalPosts - status.index - map.startIndex + 1}</td>
					            <td><a href="/ddstudio/communicate/noticedetail.do?seq=${dto.notice_seq}">${dto.subject}</a></td>
					            <td>${dto.regdate}</td>
					        </tr>
					    </c:if>
						
						<c:if test="${dto.fix == 'y'}">
							<tr id="fixed">
								<td><span id="fix-icon" class="material-symbols-outlined">report</span></td>
								<td><a href="/ddstudio/communicate/noticedetail.do?seq=${dto.notice_seq}">${dto.subject}</a></td>
								<td>${dto.regdate}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</main>
		
		<div id="page-bar">${pageBar}</div>
		
		<c:if test="${not empty email && lv == 2}">
			<div id="button-list"><button type="button" id="add-button" onclick="location.href='/ddstudio/communicate/noticeadd.do';">등록</button></div>
		</c:if>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
			<c:if test="${map.searchStatus == 'y'}">
				$('#category').val('${map.category}');
				$('#search-field').val('${map.word}');
			</c:if>
			
			document.addEventListener('DOMContentLoaded', function () {
		        var searchField = document.getElementById('search-field');

		        searchField.addEventListener('keyup', function (event) {
		            if (event.key === 'Enter') {
		                document.getElementById('search-form').submit();
		            }
		        });
		    });
		</script>
	</body>
</html>