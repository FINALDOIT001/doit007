<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 신고 조회</title>

<link rel="stylesheet" href="${contextPath}/resources/css/MSdatatables_inseok.css">

<link rel="stylesheet" href="${contextPath}/resources/css/MSstyle_inseok.css">
<link rel="stylesheet" href="${contextPath}/resources/css/MSstyle_inseok2.css">
<link rel="stylesheet" href="${contextPath}/resources/css/MSbootstrap.min_inseok.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
	input[type="checkbox"]{
		display:none;
	}
	input[type="checkbox"]+label{
		display: inline-block;
		width: 15px;
		height: 15px;
		border: 1px solid #cccccc;
		cursor: pointer;
		margin-bottom: 0px;
	}
	input[type="checkbox"]:checked+label{
		display: inline-block;
		width: 15px;
		height: 15px;
		/* border: 1px solid #ff3334; */
		background-color: #cccccc;
		cursor: pointer;
		margin-bottom: 0px;
	}
	td{
		border: 1px solid #e8e8e8;
	}
</style>

</head>
<body>
	<jsp:include page="../AdminPage/sidebar_header_inseok.jsp"/>
	
	
	<h2>FREEBOARD</h2>
	
	<div class="button-group-area mt-40" style="margin-left: 4%;">
		<a id="deleteBoard" href="#" class="genric-btn primary small">게시물 삭제</a>
	</div>
	
	<table id="table">
		
		<thead>
			<tr style="text-align: center;">
				
				<th width="5%" class="th1">
  					<input id="All" type="checkbox">
					<label for="All" style="vertical-align: middle;"></label>
				</th>
				<th width="5%" class="th1">신고 번호</th>
				<th width="8%" class="th1">리폿한 아이디</th>
				<th width="8%" class="th1">리폿당한 아이디</th>
				<th width="10%" class="th1">리폿한 날짜</th>
				<th width="5%" class="th1">처리상태</th>
				<th width="20%" class="th1">신고내용</th>
				<th width="5%" class="th1">게시물</th>
				
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="rpList" items="${ rpList }">
  			
			<tr style="text-align:center;">
  				
  				<td>
  					<input id="${ rpList.rpNo }" type="checkbox" name="check" value="${ rpList.rpBno }">
					<label for="${ rpList.rpNo }" style="vertical-align: middle;"></label>
					<input type="hidden" value="${ rpList.rpNo  }"/>
  				</td>
  				
				<td>${ rpList.rpNo }</td>
				<td>${ rpList.rpWriter }</td>
				<td>${ rpList.rpUserID }</td>
				<td>${ rpList.rpDate1 }</td>
				<td>${ rpList.rpStatus }</td>
				<td>${ rpList.rpCotext }</td>
				<td>
					<c:url var="fbDetail" value="fbDetail2.ev">
          				<c:param name="b_no" value="${ rpList.rpBno }"/>
          			</c:url>
					<a href="${ fbDetail }" onclick="window.open(this.href, '_blanck', 'width=1300, height=1300, scrollbars=no'); return false">
						<i class="fas fa-search"></i>
					</a>
				</td>
			</tr>

			</c:forEach>
		</tbody>
		
		
	</table>
	
	<!-- 회원관리페이지 content 메무리 -->
	</div>

<script src="${contextPath}/resources/js/datatables.js"></script>
<script>

$('#table').dataTable( {
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

</script>

<script>
	
	/* 삭제 체크 찍기. *//* 삭제 체크 찍기. *//* 삭제 체크 찍기. */
	$('#All').change(function(){
		
		if($('#All').is(":checked")){
			$('input:checkbox[name=check]').each(function() {
				this.checked = true;
			});
		}else{
			$('input:checkbox[name=check]').each(function() {
				this.checked = false;
			});
		}
		
	});
	
	
	$('#deleteBoard').on("click",function(){
		
		var deleteCheck = false;
		
		/* 신고된 자유게시물 번호 */
		var delList = new Array();
		/* 신고테이블에있는 상태 */
		var delList2 = new Array();
		
		$('input:checkbox[name=check]:checked').each(function() {
			/* console.log($(this).val()); */
			deleteCheck = true;
			delList.push($(this).val());
			delList2.push($(this).attr('id'));
		});
		
		if(deleteCheck){
			
			var check = confirm("정말 삭제 하시겠습니까?");
			
			if(check){
				/* 삭제 ajax *//* 삭제 ajax */
				
				console.log(delList);
				console.log(delList2);
				
				$.ajax({
					url:"fbdelete2.go",
					method:"POST",
					traditional:true,
					data:{
						delList:delList
					},type:"post",
					success:function(data){
						
						/* 바꾸자 신고번호! *//* 바꾸자 신고번호! */
						$.ajax({
							url:"FBdelete.ad",
							method:"POST",
							traditional:true,
							data:{
								delList:delList2
							},type:"post",
							success:function(data){
								
								console.log("신고처리 "+data+"건 완료!");
								
							},error:function(request, status, errorData){
								alert("error code : " + request.status + "\n"
										+ "message : " + request.responseText
										+ "error : " + errorData);
							}
						});
						
						
						alert(data+"건의 게시물이 삭제되었습니다.");
						location.reload();
						
					},error:function(request, status, errorData){
						alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText
								+ "error : " + errorData);
					}
				});
				
				
			}
			
		}else{
			alert("삭제할 게시물을 선택하세요.");
		}
		
	});
	
</script>

</body>
</html>