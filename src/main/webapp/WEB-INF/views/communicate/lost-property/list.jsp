<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/inc/asset.jsp"%>
		<style>
			#lost-property {
				text-align: center;
				margin-top: 180px;
			}
			#lost-property > h1 {
				font-family: 'SUIT-Regular';
			}
			#search-form {
				margin-top: 50px;
			}
			#start-date, #end-date {
				width: 150px;
				height: 40px;
				margin: 0 5px;
				outline: none;
			}
			#category {
				width: 100px;
				height: 40px;
				margin-left: 60px;
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
			#lost-property-list {
				width: 80%;
				text-align: center;
				border-top: 2px solid #000;
				margin: 50px auto 0;
			}
			#lost-property-list th, #lost-property-list td {
				height: 60px;
				color: #444;
				padding: 10px;
				border-bottom: 1px solid #E1E1E1;
			}
			#lost-property-list th {
				font-size: 1.02rem;
				font-weight: bold;
			}
			#lost-property-list th:nth-child(1) {
				width: 5%;
			}
			#lost-property-list th:nth-child(2) {
				width: 6%;
			}
			#lost-property-list th:nth-child(3) {
				width: 8%;
			}
			#lost-property-list th:nth-child(4) {
				width: 25%;
			}
			#lost-property-list th:nth-child(5) {
				width: 7%;
			}
			#lost-property-list th:nth-child(6) {
				width: 30%;
			}
			#lost-property-list th:nth-child(7) {
				width: 11%;
			}
			#lost-property-list th:nth-child(8) {
				width: 10%;
			}
			#lost-property-list td:nth-child(4) {
				font-size: 1.1rem;
				font-weight: bold;
				color: #333;
			}
			#keep {
				background-color: #D5F1EA;
			}
			.open-modal-btn {
				width: 50px;
				height: 30px;
				background-color: transparent;
				border: 0;
			}
			.open-modal-btn i {
				margin-right: 5px;
			}
			.modal {
                display: none;
                width: 100%;
                height: 100%;
                background-color: rgba(22, 22, 22, 0.6);
                align-items: center;
                position: fixed;
                left: 0;
                top: 0;
            }
            .modal-content {
                display: flex;
                width: 50%;
                height: 70%;
                background-color: #FFF;
                align-items: center;
                justify-content: center;
                padding: 20px;
                border: 1px solid #888;
                border-radius: 10px;
                overflow-y: auto;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            .modal-content img {
                max-width: 100%;
                max-height: 100%;
                margin: auto;
            }
            .close {
                font-size: 28px;
                font-weight: bold;
                color: #9E9E9E;
                position: absolute;
                top: 5px;
                right: 15px;
            }
            .close:hover, .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
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
				color: #F00;
			}
			#button-list {
    			text-align: right;
			}
			#button-list i {
				margin-right: 10px;
			}
			#add-button, #edit-button, #delete-button {
				width: 90px;
				height: 40px;
				background-color: transparent;
				border: 2px solid #CCC;
				margin: 30px 10px 0;
			}
			#delete-button {
				margin-right: 150px;
			}
			.nav-icon {
				font-size: 50px;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		
		<main id="lost-property">
			<h1>분실물 센터</h1>
				
			<form method="GET" action="/ddstudio/communicate/lostproperty.do" id="search-form">
				<input type="date" name="start-date" id="start-date" value="${map.startDate}">
				~
				<input type="date" name="end-date" id="end-date" value="${map.endDate}">
			
				<select name="category" id="category">
					<option value="name">습득물</option>
					<option value="location">습득장소</option>
				</select>
					
				<input type="text" name="word" id="search-field" size="60" placeholder="검색어를 입력하세요.">
					
				<button type="submit" id="search-button"><span class="material-symbols-outlined">search</span></button>
			</form>
			
			<table id="lost-property-list">
				<thead>
					<tr>
						<th></th>
						<th>번호</th>
						<th>분류</th>
						<th>습득물</th>
						<th>이미지</th>
						<th>습득장소</th>
						<th>습득일</th>
						<th>처리결과</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto" varStatus="status">
						<tr id="${dto.result == '보관중' ? 'keep' : ''}" data-seq="${dto.lost_property_seq}">
							<td><input type="checkbox" class="check" ${lv != 2 ? 'disabled' : ''}></td>
				            <td>${totalLostproperty - status.index - map.startIndex + 1}</td>
				            <td>${dto.type}</td>
				            <td>${dto.name}</td>
				            <td>
				            	<c:if test="${not empty dto.img}">
				            		<button class="open-modal-btn" data-img="/ddstudio/asset/image/${dto.img}"><i class="fa-regular fa-image"></i></button>
				            	</c:if>
				            	
				            	<c:if test="${empty dto.img}">
				            		없음
				            	</c:if>
				            </td>
				            <td>${dto.location}</td>
				            <td>${dto.lost_property_date}</td>
				            <td>${dto.result}</td>
				        </tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div id="modal" class="modal" onclick="closeModal()">
			    <div class="modal-content" onclick="event.stopPropagation()">
			        <span class="close" onclick="closeModal()">&times;</span>
			        <img class="modal-img" src="" alt="분실물">
			    </div>
			</div>
		</main>
		
		<div id="page-bar">${pageBar}</div>
		
		<c:if test="${lv == 2}">
			<div id="button-list">
				<button type="button" id="add-button"><i class="fa-solid fa-plus"></i>등록</button>
				<button type="button" id="edit-button"><i class="fa-solid fa-pen-to-square"></i>수정</button>
				<button type="button" id="delete-button"><i class="fa-solid fa-trash"></i>삭제</button>
			</div>
		</c:if>

		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
		
		<script>
			document.addEventListener('DOMContentLoaded', function () {
		        var startDate = document.getElementById('start-date');
		        var endDate = document.getElementById('end-date');
	
		        startDate.addEventListener('change', function () {
		            var selectedStartDate = new Date(startDate.value);
		            var minEndDate = new Date(selectedStartDate.getTime());
		            var formattedMinEndDate = minEndDate.toISOString().split('T')[0];

		            endDate.setAttribute('min', formattedMinEndDate);

		            if (endDate.value && new Date(endDate.value) < minEndDate) {
		                endDate.value = formattedMinEndDate;
		            }
		        });
		        
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
			    	location.href='/ddstudio/communicate/lostproperty.do';
			    }
			});
            
			$('.open-modal-btn').click(function () {
	            var imgSrc = $(this).data('img');
	            openModal(imgSrc);
	        });

	        function openModal(imgSrc) {
	            var modal = document.querySelector('.modal');
	            var modalImg = modal.querySelector('.modal-img');

	            if (modal && modalImg) {
	                modal.style.display = 'block';
	                modalImg.src = imgSrc;
	            }
	        }

	        function closeModal() {
	            document.getElementById('modal').style.display = 'none';
	        }
			
			$('#add-button').click(function () {
				location.href='/ddstudio/communicate/lostpropertyadd.do';
			});
			
			$('#edit-button').click(function () {
			    var selectedCheckboxes = $('input.check:checked');
			    
			    if (selectedCheckboxes.length === 1) {
			        var selectedRow = selectedCheckboxes.closest('tr');
			        var seq = selectedRow.attr('data-seq');
			        
			        location.href = '/ddstudio/communicate/lostpropertyedit.do?seq=' + seq;
			    } else {
			        alert('하나의 항목을 선택하세요.');
			    }
			});

			$('#delete-button').click(function () {
			    var selectedCheckboxes = $('input.check:checked');
			    
			    if (selectedCheckboxes.length === 1) {
			        var selectedRow = selectedCheckboxes.closest('tr');
			        var seq = selectedRow.attr('data-seq');
			        
			        location.href = '/ddstudio/communicate/lostpropertydel.do?seq=' + seq;
			    } else {
			        alert('하나의 항목을 선택하세요.');
			    }
			});
		</script>
	</body>
</html>