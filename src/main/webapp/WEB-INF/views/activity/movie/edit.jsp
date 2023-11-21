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
	
	/* Tagify 사용 시도 */
	.tagify{
		width: 500px;
		max-width: 500px;
	}
	
	.tagify--outside{
        border: 0;
    }

    .tagify--outside .tagify__input{
      order: -1;
      flex: 100%;
      border: 1px solid var(--tags-border-color);
      margin-bottom: 1em;
      /* transition: .1s; */
    }

    .tagify--outside .tagify__input:hover{ border-color:var(--tags-hover-border-color); }
    .tagify--outside.tagify--focus .tagify__input{
      transition:0s;
      border-color: var(--tags-focus-border-color);
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
    
</style>
</head>
<body>
	<!-- /ddstudio/activity/movie/edit.jsp -->
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>

	<!-- main -->
	<main id="main">
	<h1>영화 수정</h1>

	<div class="sub-title">
		<p>영화 정보 입력</p>
	</div>
		
	<div id="content">
			<div class="wide-item">
				<form method="POST" action="/ddstudio/activity/movieedit.do" enctype="multipart/form-data" onsubmit="return true;" id="form">
					<table>
						<!-- 영화명 필드 -->
						<tr>
							<th class="required">영화명</th>
							<td>
								<div>
									<input type="text" name="name" id="name" class="middle-flat" placeholder="영화명을 입력해주세요." value="${dto.movie_name}" required>
								</div>
							</td>
						</tr>
						<!-- 영화관 상영 시간 필드 -->
						<tr>
							<th class="required">상영 시간</th>
							<td>
								<div>
									<input type="text" name="time" id="time" class="middle-flat" placeholder="시간을 입력해주세요.(형식: HH:MM)" value="${dto.start_time}" required>
								</div>
							</td>
						</tr>
						<!-- 이용 정보 필드 -->
						<tr>
							<th class="required">러닝 타임</th>
							<td>
								<div>
									<input type="text" name="runningtime" id="runningtime" class="middle-flat" placeholder="영화의 러닝타임(분)을 입력해주세요." value="${dto.runningtime}" required />
								</div>
							</td>
						</tr>
						<!-- 영화 상영기간 시작일 입력 필드 -->
						<tr>
							<th class="required">영화 상영 시작 날짜</th>
							<td>
								<div>
									<input type="date" name="start_date" id="start_date"/>
								</div>
							</td>
						</tr>
						<!-- 영화 상영기간 종료일 입력 필드 -->
						<tr>
							<th class="required">영화 상영 종료 날짜</th>
							<td>
								<div>
									<input type="date" name="end_date" id="end_date"/>
								</div>
							</td>
						</tr>
						<!-- 상영 영화관 필드 -->
						<tr>
							<th class="required">상영 영화관</th>
							<td>
								<div>
									<select name="theater" id="theater">
										<c:forEach items="${theater_list}" var="dto">
											<option value="${dto.theater_seq}">${dto.name}</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						<!-- 해시태그 필드 -->
						<tr>
							<th class="required">해시태그</th>
							<td>
								<textarea name='tags' placeholder='반드시 태그를 입력해주세요.(최대 5개 입력 가능)'></textarea>
							</td>
						</tr>
						<!-- 이미지 필드 -->
						<tr>
	                    	<th>이미지</th>
		                	<td>
		                    	<input type="file" name="image" class="images">
		                    </td>
		                </tr>
		                <!-- 예고편 필드 -->
						<tr>
							<th>예고편</th>
							<td>
								<div>
									<input type="text" name="preview" id="preview" class="middle-flat" placeholder="영화의 예고편 영상의 링크를 입력해주세요." value="${dto.preview}"/>
								</div>
							</td>
						</tr>
		                <!-- 전달 부분 -->
						<tr>
							<th></th>
							<td>
								<div class="button-container">
									<button id="submit" class="check button">수정</button>
									<button type="button" id="cancel" class="button" onclick="location.href='/ddstudio/activity/moviedetail.do?seq=${dto.movie_seq}';">취소</button>
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="seq"	value="${dto.movie_seq}" />
				</form>
			</div>
		</div>
	</main>	
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
			 
		 //Tagify whitelist용 변수 생성
		 const taglist = ${taglist}
		 const valuelist = ${valuelist};
		 
		 //Tagify 태그 입력
		 var input = document.querySelector('textarea[name=tags]'),
		 	tagify = new Tagify(input, {
		    enforceWhitelist : true,
		    maxTags          : 5,
 		    delimiters       : null,
 		    whitelist        : taglist
		  });
		 
		 tagify.addTags(valuelist);
		 
		 //Tagify 드롭 다운 메뉴 표출
		 tagify.on('input', onInput)
		 function onInput(e){
	        console.log("onInput: ", e.detail);
	        
	        tagify.dropdown.show(e.detail.value); // 드롭다운 메뉴 보여주기
   		 }
		 
		 //날짜 입력 유효성 검사
		 
		const startdate = document.getElementById('start_date');
		 
	
		 $('#start_date').change(function() {
			selDate(0);
		 });
		 
		 function selDate(i) {
			 
			 const now = new Date();
			 const nowStr = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate();
			
			if (nowStr > date[i].start_date) {
				$('#start_date').val(date[i].start_date);
				$('#start_date').prop('readOnly', true);  //페스티벌 시작일이 현재날짜보다 이전이면 -> 페스티벌 이미 시작중이므로 변경 불가
			} else {
				$('#start_date').attr('min', nowStr);
				$('#start_date').val(date[i].start_date);
				$('#start_date').prop('readOnly', false);
			}
			
			changeDate(i)
	
		}
	
		 function changeDate(i) {
				$('#end_date').attr('min', startdate.value);  //end_date는 재선택한 페스티벌 시작일 넣어주기
				$('#end_date').val(date[i].end_date);
				$('#start_date').change(function() {
					$('#end_date').attr('min', startdate.value);
				});
				
		}
		
		
		const date = [];
		<c:forEach items="${list}" var="dto">
			date.push({
			start_date:'${dto.start_date}',
			end_date:'${dto.end_date}'
		});
		</c:forEach>
		/* console.log(date); */
		
		selDate(0);
		
		$('#theater').val(${dto.theater_seq}).prop("selected", true);
		 
		 
		 
	</script>
</body>
</html>


