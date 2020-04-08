<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.doit.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      * {
         font-family: 'Noto Sans KR', sans-serif;
      }
      .kwon-tr1 td {
      	text-align: center;
      }
      .dataTables_filter {
      	float: right;
      }
      .pagination {
      	float: right;
      }

   </style>
   <link rel="stylesheet" href="${contextPath}/resources/css/hyerim.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/kwonCustom.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/datatables.css">
   

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
		    <!-- Nav tabs -->
    <div style="margin-top: 130px;"></div> 
    <div class="container" style="margin-bottom: 100px;">
      <section class="about_part">
            <div class="row">
               <div class="section_tittle">
                  <h2><span>작성</span>글 내역</h2>
               </div>
            </div>
      </section>
        <ul class="nav nav-tabs" style="margin-bottom: 40px;">
            <li class="nav-item">
              <a class="nav-link active" style="width: 200px; text-align: center;" data-toggle="tab" href="#home">자유게시판</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" style="width: 200px; text-align: center;" data-toggle="tab" href="#menu1">질문게시판</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" style="width: 200px; text-align: center;" data-toggle="tab" href="#menu2">나눔게시판</a>
            </li>
          </ul>
          
          <!-- Tab panes -->
          <div class="tab-content">
            <!-- tab1 start-->
            <div class="tab-pane container active" id="home">
            		
            		<table id="freeb" class="table table-bordered">
					<thead class="kwon-thead1">
						<tr class="kwon-tr1">
							<th width="5%" class="th1">No</th>
							<th width="40%" class="th1">제목</th>
							<th width="8%" class="th1">글쓴이</th>
							<th width="10%" class="th1">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="fb" items="${ fblist }">
						<tr class="kwon-tr1" style="text-align:center;">
							<td align="center" class="kwon-td1">${ fb.b_no }</td>
							<c:url var="fbview" value="fbDetail.go">
								<c:param name="b_no" value="${fb.b_no}"></c:param>
							</c:url>
							<td align="center" class="kwon-td1"><a href="${fbview}">${ fb.b_title }</a></td>
							<td align="center" class="kwon-td1">${ fb.b_writer }</td>
							<td align="center" class="kwon-td1">${ fb.b_modifydate }</td>
						</tr>
							
						</c:forEach>
					</tbody>
				</table>
            	
    		</div>
            <!-- tab1 end -->
			<!-- tab2 start -->
            <div class="tab-pane container fade" id="menu1">
          
            </div>
            <!-- tab2 end -->
            <!-- tab3 start -->
            <div class="tab-pane container fade" id="menu2">
            	<table id="freeb" class="table table-bordered">
					<thead class="kwon-thead1">
						<tr class="kwon-tr1">
							<th width="5%" class="th1">No</th>
							<td width="13%" class="th1">카테고리</td>
							<th width="40%" class="th1">제목</th>
							<th width="8%" class="th1">글쓴이</th>
							<th width="10%" class="th1">등록일</th>
							<td width="10%" class="th1">상태</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bs" items="${ bslist }">
						<tr class="kwon-tr1" style="text-align:center;">
							<td align="center" class="kwon-td1">${ bs.bsNo }</td>
							<td align="center" class="kwon-td1">${ bs.bsCategory }</td>
							<c:url var="bsview" value="bsView.go">
								<c:param name="bsNo" value="${ bs.bsNo }"></c:param>
							</c:url>
							<td align="center" class="kwon-td1"><a href="${bsview}">${ bs.bsTitle }</a></td>
							<td align="center" class="kwon-td1">${ bs.bsWriter }</td>
							<td align="center" class="kwon-td1">${ bs.bsDate }</td>
							<td align="center" class="kwon-td1">${ bs.bsState }</td>
						</tr>
							
						</c:forEach>
					</tbody>
				</table>
                  
           	</div>
            <!-- tab3 end -->
 
        </div>    
    </div>
         
    <!--tap end-->


	<jsp:include page="../common/footer.jsp"/>

	
	
<!--  	<script>
 		$("#menu1").click(function(){
 			location.href="mylist.me?mno="+${loginUser.mno};
 		});
	
	</script>  -->
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<!-- <script src="js/datatables-min.js"></script> -->
	<%-- <script src="${contextPath}/resources/js/hyerimtable.js"></script> --%> 
	<script>
	$('#freeb').dataTable( {
		lengthChange: false,
		ordering: false,
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
