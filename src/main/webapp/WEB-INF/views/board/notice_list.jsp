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
   <section class="breadcrumb blog_bg_notice">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb_iner">
                  <div class="breadcrumb_iner_item">
                     <h2>Notice</h2>
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
               <h2><span>DO IT</span> &nbsp;NOTICE</h2>
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
                <tbody>
                  <tr>
                    <td>5</td>
                    <td>admin</td>
                    <td><a href="ntView.go">공지입니당5</a></td>
                    <td>2020-01-19</td>
                    <td>10</td>
                  </tr>
                  <tr>
                      <td>4</td>
                      <td>admin</td>
                      <td>공지입니다4</td>
                      <td>2020-01-13</td>
                      <td>8</td>
                  </tr>
                  <tr>
                      <td>3</td>
                      <td>admin</td>
                      <td>공지입니다3</td>
                      <td>2020-01-12</td>
                      <td>76</td>
                  </tr>							
                  <tr>
                      <td>2</td>
                      <td>admin</td>
                      <td>공지입니다2</td>
                      <td>2020-01-04</td>
                      <td>32</td>
                  </tr>							
                  <tr>
                      <td>1</td>
                      <td>admin</td>
                      <td>공지입니다1</td>
                      <td>2020-01-01</td>
                      <td>5</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
	       	작성하기 버튼은  loginUser 의 네임 혹은 Roles가 운영자일 경우에만 보이도록 해주세요 
	       	<%--<c:if test="${ loginUser.userRoles eq 777 }">  --%>
	         <div class="col-md-12" style="text-align: right; margin-top: 20px;">
	           <a href="ntWrite.go" class="genric-btn danger circle" style="font-size: 13px;">작성하기</a>
	       </div>
	       <%-- </c:if> --%>
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
