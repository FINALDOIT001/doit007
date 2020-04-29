<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보증금 관리</title>

<link rel="stylesheet" href="${contextPath}/resources/css/MSdatatables_inseok.css">

</head>
<body>
	<jsp:include page="../AdminPage/sidebar_header_inseok.jsp"/>
	
	
	<table id="table">
		
		<thead>
			<tr style="text-align: center;">
				
				<th width="5%" class="th1">스터디 그룹 목록</th>
				<!-- <th width="10%" class="th1">이름</th>
				<th width="10%" class="th1">아이디</th>
				<th width="15%" class="th1">호두</th>
				<th width="15%" class="th1">가입날짜</th>
				<th width="15%" class="th1">최근접속일</th> -->
				
			</tr>
		</thead>
		
		<tbody>
			
			<c:forEach var="sgList" items="${ sgList }">
			<tr style="text-align:center;">
			
				<td>
					
				<div class="container-fluid">
			      <!-- Collapsable Card Example -->
			      <div class="card shadow mb-4">
			        <!-- Card Header - Accordion -->
			        <a href="#${ sgList.sgNo }" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample1">
			          <h6 class="m-0 font-weight-bold text-primary">${ sgList.sgTitle }</h6>
			        </a>
			        <!-- Card Content - Collapse -->
			        <div class="collapse show" id="${ sgList.sgNo }">
			          <div class="card-body">
			            <strong> ${ sgList.sgWriter }</strong> DO It!
			          </div>
			        </div>
			      </div>
				</div>
	
				</td>
				
			</tr>
			</c:forEach>
		</tbody>

		
	</table>
	
	

	
	
	
	<!-- 보증금 관리 content 메무리 -->
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

</body>
</html>