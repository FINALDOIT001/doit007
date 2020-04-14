<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NEW BOX</title>
<style>
	.atag:link{
		text-decoration: none;
		color: #000000;
	}
	.atag:visited:{
		text-decoration: none;
		color: #bbbbbb;
	}
	.atag:active{
		text-decoration: none;
		color: #000000;
	}
	.atag:hover{
		text-decoration: none;
		color: #ff3334;
	}
	input[type="checkbox"]{
		display:none;
	}
	input[type="checkbox"]+label{
		display: inline-block;
		width: 15px;
		height: 15px;
		border: 1px solid #ffa9aa;
		cursor: pointer;
		margin-bottom: 0px;
	}
	input[type="checkbox"]:checked+label{
		display: inline-block;
		width: 15px;
		height: 15px;
		/* border: 1px solid #ff3334; */
		background-color: #ffa9aa;
		cursor: pointer;
		margin-bottom: 0px;
	}
	td{
		border: 1px solild #ff3334;
	}
</style>
<link rel="stylesheet" href="${contextPath}/resources/css/MSdatatables_inseok.css">
</head>
<body>

	<jsp:include page="../message/MsHeader.jsp" />
	
	<c:choose>
		<c:when test="${ Type eq 'New' }">
			<h2 style="margin-left:10%;">New</h2>
		</c:when>
		<c:when test="${ Type eq 'Receive' }">
			<h2 style="margin-left:10%;">Receive</h2>
		</c:when>
		<c:otherwise>
			<h2 style="margin-left:10%;">Send</h2>
		</c:otherwise>
	</c:choose>
	
	<div class="button-group-area mt-40" style="margin-left:12%;">
		<a id="deleteMS" href="#" class="genric-btn primary small">DELETE</a>
	</div>
	<table id="table2" style="margin-left: 11%;width:700px;" class="table table-bordered">
		
		<thead>
			<tr style="text-align: center;">
			
				<th width="5%" class="th1">
					<input type="checkbox" id="allcheck">
					<label for="allcheck"></label>
				</th>
				
				<th width="30%" class="th1">제목</th>
				
				<th width="8%" class="th1">보낸사람</th>
				
				<th width="15%" class="th1">보낸날짜</th>
				
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
		
	<!-- font awesome --><!-- font awesome -->
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

		
		$('#deleteMS').on("click",function(){
			
			var deleteCheck = false;
			var delList = new Array();
			
			$('input:checkbox[name=check]:checked').each(function() {
				/* console.log($(this).val()); */
				deleteCheck = true;
				delList.push($(this).val());
			});
			
			if(deleteCheck){
				
				var check = confirm("정말 삭제 하시겠습니까?");
				
				if(check){
					/* 삭제 ajax *//* 삭제 ajax */
					
					$.ajax({
						url:"MSdelete.ms",
						method:"POST",
						traditional:true,
						data:{
							delList:delList
						},type:"post",
						success:function(data){
							
							alert(data+"건의 메세지가 삭제되었습니다.");
							location.reload();
							
						},error:function(request, status, errorData){
							alert("error code : " + request.status + "\n"
									+ "message : " + request.responseText
									+ "error : " + errorData);
						}
					});
					
				}
				
			}else{
				alert("삭제할 메세지를 선택하세요.");
			}
			
		});
		
	</script>

	
	
</body>
</html>