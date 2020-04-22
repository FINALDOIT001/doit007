<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeBoard List</title>
<style>
</style>
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
               <h2><span>DO IT</span> &nbsp;자유게시판</h2>
            </div>
         </div>
         <div class="card">
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
              <table class="table table-hover hyun_table01">
                <thead>
                  <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
           
                  </tr>
                </thead>
                <c:forEach var="b" items="${ list }">
                <tbody>
                  <tr>
                  	<td align="center">${ b.b_no }</td>
                  	<td align="left">
                  		<%-- <c:if test="${ !empty loginUser }"> --%>
                  			<c:url var="fbDetail" value="fbDetail.ev">
                  				<c:param name="b_no" value="${ b.b_no }"/>
                  				<c:param name="currentPage" value="${ pi_h.currentPage }"/>
                  			</c:url>
                  			<a href="${ fbDetail }">${ b.b_title }</a>
                  		<%-- </c:if> --%>
                  		<%-- <c:if test="${ empty loginUser }">
                  			${ b.b_title }
                  		</c:if> --%>
                  	</td>
                  	
                  	<c:choose>
                  		<c:when test="${ b.b_writer eq sessionScope.loginUser.mId }">
                  			<td align="center">
                  				${ b.b_writer }
                  			</td>
                  		</c:when>
                  		<c:otherwise>

		                  	<td align="center">
		                  	
		                  	<ul>
		                  	<li class="nav-item dropdown no-arrow mx-1">
		                  		<!-- <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
		                  			<span>${ b.b_writer }</span>
		                  		<!-- </a> -->
		                  		<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">
									${ b.b_writer }
								</h6>
								<a class="dropdown-item d-flex align-items-center" href="newMS.ms?recipientID=${ b.b_writer }" onclick="window.open(this.href, '_blanck', 'width=700, height=700, scrollbars=no'); return false">
								<div class="mr-3"></div>
								<div>
									<i class="fas fa-envelope fa-fw"></i>
								   <span class="font-weight-bold">쪽지보내기</span>
								</div>
								</a>
								
								<%-- <c:url var="newReport" value="report.rp">
	                  				<c:param name="rpUserID" value="${b.b_writer}"/>
	                  				<c:param name="rpTitle" value="${ b.b_title }"/>
	                  				<c:param name="rpBno" value="${ b.b_no }"/>
	                  				<c:param name="rpBType" value="FREEBOARD"/>
                  				</c:url> --%>
								
								<a id="reportAtag" class="dropdown-item d-flex align-items-center" href="report.rp?rpUserID=${b.b_writer}&rpTitle=${ b.b_title }&rpBno=${ b.b_no }&rpBType=FREEBOARD" onclick="window.open(this.href, '_blanck', 'width=700, height=700, scrollbars=no'); return false">
								<div class="mr-3"></div>
								<div>
									<i class="fas fa-user-alt-slash"></i>
								   <span class="font-weight-bold">신고하기</span>
								</div>
								</a>
								
		                  	</li>
		                  	</ul>
							
		                  	</td>
		                  	
                  		</c:otherwise>
                  	</c:choose>
                  	
                  	
                  	<td align="center">${ b.b_modifydate }</td> <!-- 날짜 다시 봐바 -->
                  	<td align="center">${ b.b_count }</td>
                  <%-- 	<td align="center">
                  		<c:if test="${ !empty b.b_org_filename }">
                  			○
                  		</c:if>
                  		<c:if test="${ b.b_org_filename }">
                  			&nbsp;
                         		</c:if>
                  	</td> --%>
                  </tr>
                </tbody>
                </c:forEach>
                
                <!-- 페이징 -->
                <tr align="center" height="20">
					<td colspan="6">
			
					<!-- [이전] -->
					<c:if test="${ pi_h.currentPage eq 1 }">
						prev &nbsp;
					</c:if>
					<c:if test="${ pi_h.currentPage ne 1 }">
						<c:url var="before" value="fblist.go">
							<c:param name="currentPage" value="${ pi_h.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi_h.startPage }" end="${ pi_h.endPage }">
						<c:if test="${ p eq pi_h.currentPage }">
							${ p }
						</c:if>
						
						<c:if test="${ p ne pi_h.currentPage }">
							<c:url var="pagination" value="fblist.go">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
				
					<!-- [다음] -->
					<c:if test="${ pi_h.currentPage eq pi_h.maxPage }">
						&nbsp;next
					</c:if>
					<c:if test="${ pi_h.currentPage ne pi_h.maxPage }">
						<c:url var="after" value="fblist.go">
							<c:param name="currentPage" value="${ pi_h.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">next</a>
					</c:if>
					</td>
				</tr>
		                
                
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <c:if test="${ !empty loginUser }">
          <div class="col-md-12" style="text-align: right; margin-top: 20px;">
            <button onclick="location.href='fbInsertForm.go';" class="genric-btn danger circle" style="font-size: 13px;">작성하기</button>
        </div>
        </c:if>
    </div>
    
    
    <!-- 페이징 부분 -->
   <!--  <nav class="col-md-12 blog-pagination justify-content-center d-flex">
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
    </nav> -->
    
   </section>
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>
