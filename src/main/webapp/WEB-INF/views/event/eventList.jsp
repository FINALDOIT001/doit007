\<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
   <!-- Required meta tags -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <title>Event</title>

</head>

<body>
   <jsp:include page="../common/header.jsp" />
   
   	<!-- SEO jungdo CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/SEO.css">
   
   <!--::breadcrumb part start::-->
   <section class="breadcrumb blog_bg2">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb_iner">
                  <div class="breadcrumb_iner_item">
                     <h2>IT 행사</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--::breadcrumb part start::-->


  <!--================Blog Area =================-->
  <section class="blog_area area-padding">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mb-5 mb-lg-0">
          <div class="blog_left_sidebar">
          
		<c:forEach var="event" items="${ elist }">
            <article class="blog_item eList001">
          	<input type="hidden" value="${ event.eNo }">
              <div class="blog_item_img">
                <img class="card-img rounded-0" src="${contextPath}/resources/evUploadFiles/${ event.eRenameFileName }" alt=""> <!-- 나중에 이미지 넣기 -->
                <a href="#" class="blog_item_date">
                  <h3>${ event.eDays }</h3>
                  <p>${ event.eMonth }월</p>
                </a>
              </div>

              <div class="blog_details">
                <a class="d-inline-block">
                  <h2>${ event.eTitle }</h2>
                </a>
                <p>${ event.eIntro }</p>
                <ul class="blog-info-link">
                  <li><i class="far fa-user"></i> IT, AI</li>
                  <li><i class="far fa-comments"></i> 03 Comments</li>
                  <li><i class="far fa-heart"></i> 21</li>
                  <li><i class="far fa-edit"></i> ${ event.eWriter }</li>
                </ul> 
              </div>
            </article>
            </c:forEach>
<!-- 페이징 처리 -->

	<table align="center">
		<tr align="center" height="20">
			<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ epi.currentPage eq 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ epi.currentPage ne 1 }">
					<c:url var="before" value="elist.go">
						<c:param name="currentPage" value="${ epi.currentPage - 1 }"/>
					</c:url>
                  	<a href="${ before }">[이전] &nbsp;</a>
					
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ epi.startPage }" end="${ epi.endPage }">
					<c:if test="${ p eq epi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne epi.currentPage }">
						<c:url var="pagination" value="elist.go">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ epi.currentPage eq epi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ epi.currentPage ne epi.maxPage }">
					<c:url var="after" value="elist.go">
						<c:param name="currentPage" value="${ epi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		</table>


		<%-- <!-- 페이징 처리 -->

            <nav class="blog-pagination justify-content-center d-flex">
              <ul class="pagination">
                <li class="page-item">
  				<c:if test="${ epi.currentPage eq 1 }">
                  <a href="#" class="page-link" aria-label="Previous" return="false">
                    <i class="ti-angle-left"></i>
                  </a>
               	</c:if>
   				<c:if test="${ epi.currentPage ne 1 }">
					<c:url var="before" value="elist.go">
						<c:param name="currentPage" value="${ epi.currentPage - 1 }"/>
					</c:url>
                  <a href="${ before }" class="page-link" aria-label="Previous">
                    <i class="ti-angle-left"></i>
                  </a>
               	</c:if>
                </li>
               	
                  
                  
  				<!-- 페이지 -->
  				<li>
				<c:forEach var="p" begin="${ epi.startPage }" end="${ epi.endPage }">
					
					<c:if test="${ p ne epi.currentPage }">
						<c:url var="EventPagination" value="elist.go">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a class="page-link" href="${ EventPagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				</li>
                  
                <!-- <li class="page-item">
                  <a href="#" class="page-link">1</a>
                </li>
                <li class="page-item active">
                  <a href="#" class="page-link">2</a>
                </li> -->
                
                
                
                <li class="page-item">
                  <a href="#" class="page-link" aria-label="Next">
                    <i class="ti-angle-right"></i>
                  </a>
                </li>
              </ul>
            </nav> --%>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="blog_right_sidebar">
            <aside class="single_sidebar_widget search_widget">
			<c:if test="${ loginUser != null }">
			<c:url var="evInsert" value="evInsert.go">
			</c:url>
             <a href="${ evInsert }"><button class="button rounded-0 primary-bg text-white w-100" type="button">글 작성하기</button></a><br><br>
             </c:if>
              <form action="evSearch.do">
                <div class="form-group">
                  <div class="input-group mb-3">
                    <input type="search" class="form-control placeholder hide-on-focus" name="evSearch" id="evSearch" placeholder="검색할 키워드를 입력하세요.">
                    <div class="input-group-append">
                      <button class="btn" type="button"><i class="ti-search"></i></button>
                    </div>
                  </div>
                </div>
                <button class="button rounded-0 primary-bg text-white w-100" id="searching" type="button">검색</button>
              </form>
            </aside>

            <aside class="single_sidebar_widget popular_post_widget">
              <h3 class="widget_title">최근 게시물</h3>
              <div class="media post_item">
                <img class="img8080" src="${contextPath}/resources/img/blog/it_blog1.jpg" alt="post">
                <div class="media-body">
                  <a href="single-blog.html">
                    <h3>인공지능과의 연결고리, 그래프 기술 알아보기</h3>
                  </a>
                  <p>2시간 전</p>
                </div>
              </div>
              <div class="media post_item">
                <img class="img8080" src="${contextPath}/resources/img/blog/it_blog2.jpg" alt="post">
                <div class="media-body">
                  <a href="single-blog.html">
                    <h3>[우리금융그룹] 2020 『디노랩』모집 공고</h3>
                  </a>
                  <p>2020년-2월-14일</p>
                </div>
              </div>
            </aside>
            <aside class="single_sidebar_widget tag_cloud_widget">
              <h4 class="widget_title">태그 모음</h4>
              <ul class="list">
                <li>
                  <a href="#">IT</a>
                </li>
                <li>
                  <a href="#">AI</a>
                </li>
                <li>
                  <a href="#">Bigdata</a>
                </li>
                <li>
                  <a href="#">Blockchain</a>
                </li>
              </ul>
            </aside>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--================Blog Area =================-->
  
  
  <jsp:include page="../common/footer.jsp" />

	<script>
		$('.eList001').on('click',function() {
			var eNo = $(this).children().eq(0).val();

			location.href="eventView.ev?eNo="+eNo;
		})
		

		$('#searching').on('click',function() {
			var evSearch = $('#evSearch').val();
			
			location.href="evSearch.do?evSearch="+evSearch;
		})
	
	
	</script>


</body>


</html>