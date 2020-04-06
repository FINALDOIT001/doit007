<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

   <!--::breadcrumb part start::-->
   <section class="breadcrumb blog_bg_freeboard">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb_iner">
                  <div class="breadcrumb_iner_item">
                     <h2>FREE BOARD</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--::breadcrumb part start::-->

   <!--::team part end::-->
   <section class="about_part section-padding">
      <div class="container">
         <div class="row">
            <div class="section_tittle">
               <h2><span>DO IT</span> &nbsp;FREE BOARD</h2>
            </div>
         </div>
         <div class="card">
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
              <table class="table table-hover hyun_table01">
                <thead>
                  <tr>
                    <th>번호</th>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                  </tr>
                </thead>
                <c:forEach var="b" items="${ list }">
                <tbody>
                  <tr>
                  	<td align="center">${ b.b_no }</td>
                  	<td align="left">
                  		<c:if test="${ !empty loginUser }">
                  			<c:url var="fbDetail" value="fbDetail.go">
                  				<c:param name="b_no" value="${ b.b_no }"></c:param>
                  				<c:param name="currentPage" value="${ pi_h.currentPage }"></c:param>
                  			</c:url>
                  			<a href="${ fbDetail }">${ b.b_title }</a>
                  		</c:if>
                  		<c:if test="${ empty loginUser }">
                  			${ b.b_title }
                  		</c:if>
                  	</td>
                  	<td align="center">${ b.b_writer }</td>
                  	<td align="center">${ b.b_createdate }</td>
                  	<td align="center">${ b.b_count }</td>
                  	<td align="center">
                  		<c:if test="${ !empty b.b_org_filename }">
                  			○
                  		</c:if>
                  		<c:if test="${ b.b_org_filename }">
                  			&nbsp;
                         		</c:if>
                  	</td>
                  </tr>
                </tbody>
                </c:forEach>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <div class="col-md-12" style="text-align: right; margin-top: 20px;">
            <button onclick="location.href='fbInsertForm.go';" class="genric-btn danger circle" style="font-size: 13px;">작성하기</button>
        </div>
    </div>

    <!-- 페이징 부분 -->
    <nav class="col-md-12 blog-pagination justify-content-center d-flex">
        <ul class="pagination">
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Previous">
                    <span aria-hidden="true">
                        <span class="lnr lnr-chevron-left"> < </span>
                    </span>
                </a>
            </li>
            <li class="page-item active"><a href="#" class="page-link">01</a></li>
            <li class="page-item"><a href="#" class="page-link">02</a></li>
            <li class="page-item"><a href="#" class="page-link">03</a></li>
            <li class="page-item"><a href="#" class="page-link">04</a></li>
            <li class="page-item"><a href="#" class="page-link">05</a></li>
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Next">
                    <span aria-hidden="true">
                        <span class="lnr lnr-chevron-right"> > </span>
                    </span>
                </a>
            </li>
        </ul>
    </nav>
    
   </section>
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>
