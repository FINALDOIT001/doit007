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

   </style>
   <link rel="stylesheet" href="${contextPath}/resources/css/hyerim.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/datatable.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/kwonCustom.css">
   

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
        <ul class="nav nav-tabs" style="margin-bottom: 30px;">
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
						<tr class="kwon-tr1">
							<td align="center" class="kwon-td1">${ fb.b_no }</td>
							<td align="center" class="kwon-td1">${ fb.b_title }</td>
							<td align="center" class="kwon-td1">${ fb.b_writer }</td>
							<td align="center" class="kwon-td1">${ fb.b_b_modifydate }</td>
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
                  
           	</div>
            <!-- tab3 end -->
 
        </div>    
    </div>
         
    <!--tap end-->


	<jsp:include page="../common/footer.jsp"/>

	<script>


	</script>
	
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<!-- <script src="js/datatables-min.js"></script> -->
	<script src="${contextPath}/resources/js/hyerim.js"></script>

</body>
</html>
