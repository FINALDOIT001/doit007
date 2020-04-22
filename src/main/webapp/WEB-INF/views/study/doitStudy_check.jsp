<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${contextPath}/resources/css/MSstyle_inseok.css">
<link rel="stylesheet" href="${contextPath}/resources/css/MSstyle_inseok2.css">
<link rel="stylesheet" href="${contextPath}/resources/css/MSbootstrap.min_inseok.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<title>MESSAGE</title>

<style>
   *{font-family: 'Noto Sans KR', sans-serif;}
</style>

</head>
<body>

	<div>
	<form action="studyCheck.do" method="POST">

    <table id="table2" style="margin-left: 11%;width:700px;" class="table table-bordered">
		
		<thead>
			<tr style="text-align: center;">
			
				<!-- <th width="5%" class="th1">
					<input type="checkbox" id="allcheck">
					<label for="allcheck"></label>
				</th> -->
				<th width="5%" class="th1">No.</th>
				<th width="20%" class="th1">날짜</th>
				
				<th width="20%" class="th1">이름</th>
				
				<th width="15%" class="th1">출석여부</th>
				
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="msList" items="${ msList }">
			<tr style="text-align:center;">
			
				<td align="center" style="text-align: center;">
					<input id="${ msList.msNo }" type="checkbox" name="check" value="${ msList.msNo }">
					<label for="${ msList.msNo }"></label>
				</td>
				
				<c:url var="msDetailView" value="msDetailView.ms">
					<c:param name="ms_No" value="${ msList.msNo }"></c:param>
					<c:param name="Type" value="${ Type }"></c:param>
					<c:param name="ms_loginId" value="${ sessionScope.loginUser.mId }"></c:param>
				</c:url>
				
				<c:choose>
					<c:when test="${ msList.msCheck eq 'N' }">
						<td align="center" style="text-align: center;"><a class="atag" href="${ msDetailView }">
						<i class="far fa-envelope"></i>
						&nbsp;&nbsp;${ msList.msTitle }</a></td>
					</c:when>
					<c:otherwise>
						<td align="center" style="text-align: center;"><a class="atag" style="color: #bbbbbb;" href="${ msDetailView }">
						<i class="far fa-envelope-open"></i>
						&nbsp;&nbsp;${ msList.msTitle }</a></td>
					</c:otherwise>
				</c:choose>
				
				<td align="center" style="text-align: center;">${ msList.msSender }</td>
				
				<td align="center" style="text-align: center;">${ msList.msDate1 }</td>
				
			</tr>
				
			</c:forEach>
		</tbody>
		
	</table>
	
				<div class="button-group-area mt-40">
					<button id="doitCheck" class="genric-btn primary">확인</button>
				</div>
				
				
				</form>
	
	
	
	</div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/MSbootstrap.min_inseok.js"></script>
	
	<script>
		$(window).on('load',function(){
			window.resizeTo(850, 700);
		});
	</script>
	
		<script src="https://kit.fontawesome.com/849a01517e.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<script src="${contextPath}/resources/js/contact.js"></script>
	<script>
		$(function(){
			
			
			
			
		});
		
		
		$('#table2').dataTable( {
			lengthChange: false,
			ordering: false,
			searching: true,
			info: false,
			serverSide: false,
	        "language": {
	        "decimal":        "",
	        "emptyTable":     "표에서 사용할 수있는 데이터가 없습니다.",
	        "info":           "총 _TOTAL_명   _START_에서 _END_까지 표시",
	        "infoEmpty":      "0 개 항목 중 0 ~ 0 개 표시",
	        "infoFiltered":   "(_MAX_ 총 항목에서 필터링 됨)",
	        "infoPostFix":    "",
	        "thousands":      ",",
	        "lengthMenu":     "_MENU_",
	        "loadingRecords": "로드 중 ...",
	        "processing":     "처리 중 ...",
	        "search":         "검색 : ",
	        "zeroRecords":    "일치하는 레코드가 없습니다.",
	        "paginate": {
	            "first":      "처음",
	            "last":       "마지막",
	            "next":       "다음",
	            "previous":   "이전"
	        },
	        "aria": {
	            "sortAscending":  ": 오름차순으로 정렬",
	            "sortDescending": ": 내림차순으로 정렬"
	        }
	    }
	         
	} );
		
		/* 삭제 체크 찍기. *//* 삭제 체크 찍기. *//* 삭제 체크 찍기. */
		$('#allcheck').change(function(){
			
			if($('#allcheck').is(":checked")){
				$('input:checkbox[name=check]').each(function() {
					this.checked = true;
				});
			}else{
				$('input:checkbox[name=check]').each(function() {
					this.checked = false;
				});
			}
			
		});
	
	
</body>
</html>