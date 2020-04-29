<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책나눔 관리</title>

<link rel="stylesheet" href="${contextPath}/resources/css/MSdatatables_inseok.css">

</head>
<body>
	<jsp:include page="../AdminPage/sidebar_header_inseok.jsp"/>
	
	<table id="table">
		
		<thead>
			<tr style="text-align: center;">
				
				<th width="5%" class="th1">글번호</th>
				<th width="10%" class="th1">작성자</th>
				<th width="10%" class="th1">제목</th>
				<th width="10%" class="th1">게시날짜</th>
				<th width="10%" class="th1">게시글 상태</th>
				
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="bsList" items="${ bsList }">
			<tr style="text-align:center;">
			
				<td>${ bsList.bsNo }</td>
				<td>${ bsList.bsWriter }</td>
				<td>${ bsList.bsTitle }</td>
				<td>${ bsList.bsDate }</td>
				<td>${ bsList.bsStatus }</td>
				
			</tr>
				
			</c:forEach>
		</tbody>
		
		
	</table>
	
	
	<!-- 자유게시판 content 메무리 -->
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