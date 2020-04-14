<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
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
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                  </tr>
                </thead>
                <c:forEach var="n" items="${ nlist }">
                <tbody>
                  <tr>
                    <td align="center">${ n.n_no }</td>
                    <td align="left">
                    	<%-- <c:if test="${ !empty loginUser }"> --%>
                    		<c:url var="nDetail" value="nDetail.ev">
                    			<c:param name="n_no" value="${ n.n_no }"/>
                    			<c:param name="currentPage" value="${ pi_n.currentPage }"/>
                    		</c:url>
                    		<a href="${ nDetail }">${ n.n_title }</a>
                    	<%-- </c:if>
                    	<c:if test="${ empty loginUser }">
                    		${ n.n_title }
                    	</c:if> --%>
                    </td>
                    <td align="center">${ n.n_writer }</td>
                    <td align="center">${ n.n_modifydate }</td>
                    <td align="center">${ n.n_count }</td>
                  </tr>
                </tbody>
                </c:forEach>
                
                <!-- 페이징 -->
                <tr align="center" height="20">
					<td colspan="6">
			
					<!-- [이전] -->
					<c:if test="${ pi_n.currentPage eq 1 }">
						prev &nbsp;
					</c:if>
					<c:if test="${ pi_n.currentPage ne 1 }">
						<c:url var="before" value="fblist.go">
							<c:param name="currentPage" value="${ pi_n.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi_n.startPage }" end="${ pi_n.endPage }">
						<c:if test="${ p eq pi_n.currentPage }">
							${ p }
						</c:if>
						
						<c:if test="${ p ne pi_n.currentPage }">
							<c:url var="pagination" value="nlist.go">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
				
					<!-- [다음] -->
					<c:if test="${ pi_n.currentPage eq pi_n.maxPage }">
						&nbsp;next
					</c:if>
					<c:if test="${ pi_n.currentPage ne pi_n.maxPage }">
						<c:url var="after" value="nlist.go">
							<c:param name="currentPage" value="${ pi_n.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
					</c:if>
					</td>
				</tr>
				<!-- 페이징 끝 -->
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
           <!-- 관리자만 작성가능하게~@ -->
	       <c:if test="${ loginUser.mUserroles eq 777 }">  
	         <div class="col-md-12" style="text-align: right; margin-top: 20px;">
	           <button onclick="location.href='nInsertForm.go';" class="genric-btn danger circle" style="font-size: 13px;">작성하기</a></button>
	       </div>
	       </c:if> 
	    </div>
	   </section>


	<jsp:include page="../common/footer.jsp"/>

</body>
</html>
