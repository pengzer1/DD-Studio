<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#voc-detail {
				text-align: center;
				margin-top: 150px;
			}
			#date {
				margin-top: 30px;
			}
			#date > span {
				margin: 0 30px;
			}
			#date span i {
				margin-right: 5px;
			}
			#date span span {
				font-size: 1.02rem;
				font-weight: bold;
				margin-right: 8px;
			}
			#detail {
				width: 80%;
				border-top: 2px solid black;
				margin: 20px auto 0;
			}
			#content {
			    font-size: 1.03rem;
			    color: #555;
			    text-align: left;
			    padding: 30px 40px;
			    border-bottom: 2px solid black;
			}
			#detail:has(#attach) #content {
			    border-bottom: 2px solid #E1E1E1;
			}
			#attach {
			    padding: 30px 0;
			    border-bottom: 2px solid black;
			}
			.button-list i {
				margin-right: 10px;
			}
			#back-button, #delete-button, #add-answer-button, #edit-answer-button, #delete-answer-button {
				width: 90px;
				height: 40px;
				background-color: transparent;
				border: 2px solid #CCC;
				margin: 50px 10px 0;
			}
			#answer {
			    text-align: center;
			    margin-top: 50px;
			    position: relative;
			}
			#add-form {
			    width: 80%;
			    background-color: #EEFAF0;
			    padding: 20px;
			    border-radius: 15px;
			    margin: 0 auto;
			}
			#add-form th {
			    width: 30%;
			    height: 200px;
			    font-size: 1.2rem;
			    color: #555;
			}
			#add-form textarea {
			    width: 95%;
			    height: 250px;
			    padding: 10px;
			    border: none;
			    border-radius: 8px;
			    margin: 20px 0 15px;
			    resize: none;
			    outline: none;
			    overflow-y: scroll;
			    overflow: auto;
			}
			#add-form:before {
			    content: '';
			    border-width: 15px;
			    border-style: solid;
			    border-color: #EEFAF0 transparent transparent transparent;
			    margin-left: -15px;
			    position: absolute;
			    top: -28px;
			    left: 50%;
			    transform: rotate(180deg);
			}
			.nav-icon {
				font-size: 50px;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="voc-detail">
			<h1>${dto.subject}</h1>
			
			<div id="date">
				<span><i class="fa-regular fa-calendar"></i><span>방문일</span> ${dto.visit_date}</span>
				<span><i class="fa-regular fa-calendar"></i><span>등록일</span> ${dto.regdate}</span>
			</div>
			
			<table id="detail">
				<c:if test="${dto.content != null && !dto.content.trim().equals('')}">
					<tr>
						<td id="content">${dto.content}</td>
					</tr>
				</c:if>
				
				<c:if test="${dto.attach != null}">
					<tr>
						<td id="attach"><img src="/ddstudio/asset/image/${dto.attach}"></td>
					</tr>
				</c:if>
			</table>
			
			<div class="button-list">
				<button type="button" id="back-button"><i class="fa-solid fa-list"></i>목록</button>
				<button type="button" id="delete-button"><i class="fa-solid fa-trash"></i>삭제</button>
			</div>
		</main>
		
		<div id="answer">
			<form method="POST" action="/ddstudio/communicate/vocanswer.do?seq=${dto.voc_seq}">
				<table id="add-form">
					<tr>
						<th>답변</th>
						<td><textarea name="answer">${dto.answer}</textarea></td>
					</tr>
				</table>
				
				<div class="button-list">
					<button type="submit" id="add-answer-button"><i class="fa-solid fa-plus"></i>등록</button>
					<button type="submit" id="edit-answer-button"><i class="fa-solid fa-pen-to-square"></i>수정</button>
					<button type="submit" id="delete-answer-button"><i class="fa-solid fa-trash"></i>삭제</button>
				</div>
			</form>
		</div>
		
		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
			$('#back-button').click(function () {
				location.href='/ddstudio/communicate/voc.do';
			});
			
			$('#delete-button').click(function () {
				location.href='/ddstudio/communicate/vocdel.do?seq=${dto.voc_seq}';
			});
			
			$('#add-answer-button').click(function () {
				var url = '/ddstudio/communicate/vocanswer.do?seq=${dto.voc_seq}&action=add';
				$(this).closest('form').attr('action', url);
			});
			
			$('#edit-answer-button').click(function () {
				var url = '/ddstudio/communicate/vocanswer.do?seq=${dto.voc_seq}&action=edit';
				$(this).closest('form').attr('action', url);
			});
			
			$('#delete-answer-button').click(function () {
				var url = '/ddstudio/communicate/vocanswer.do?seq=${dto.voc_seq}&action=delete';
				$(this).closest('form').attr('action', url);
			});
		</script>
	</body>
</html>