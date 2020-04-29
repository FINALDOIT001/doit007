<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${contextPath}/resources/css/jungho.css">
<link rel="stylesheet" href="${contextPath}/resources/css/hyerim.css">
<script src="${contextPath}/resources/js/jungho.js"></script>

</head>


<body>
	<jsp:include page="../common/header.jsp" />

	<!--::breadcrumb part start::-->
	<section class="breadcrumb blog_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>Do It Study</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::breadcrumb part start::-->
	<!-- ================ contact section start ================= -->
	<section class="contact-section area-padding">
		<div class="container">
			<div class="row">

				<div class="col-lg-3" style="float: left; margin-right: 30px;">
					<div class="blog_right_sidebar_h" style="width: 300px;">
						<aside class="single_sidebar_widget search_widget">
							<form action="studySearch.do">
								<div class="form-group">
									<div class="input-group mb-3">
										<input type="text" name="studySearch" id="stydySearch" 
											class="form-control placeholder hide-on-focus"
											placeholder="스터디 이름을 검색하세요.">
										<div class="input-group-append">
											<button class="btn" type="button" id="sSearch">
												<i class="ti-search"></i>
											</button>
										</div>
									</div>
								</div>
							</form>
						</aside>
					</div>
				</div>
				<div class="col-lg-8" style="margin-left: auto;">
					<c:if test="${!empty sessionScope.loginUser}">
						<input type="button" class="genric-btn danger"
							style="float: right; width: 120px;" value="스터디 개설"
							onclick="location.href='studyInsert.go'" />
					</c:if>
				</div>
				<div class="col-lg-12" style="margin-top: 20px;">

					<label style="font-weight: bold;"><span
						style="font-size: large;">${listCount}</span> 개의 스터디</label>
					<hr>
					<div class="row">
						<!-- study list start -->

						<c:forEach var="sg" items="${sgList}">

							<c:if test="${!empty sg.sgRenameFileName}">

								<div class="col-md-2" style="text-align: center;">
									<img
										src="${contextPath}/resources/sgloadFiles/${sg.sgRenameFileName}"
										class="rounded" alt="Cinque Terre"
										style="width: 120px; height: 120px;">
								</div>
							</c:if>

							<c:if test="${empty sg.sgRenameFileName}">

								<div class="col-md-2" style="text-align: center;">
									<img src="${contextPath}/resources/img/project-5.png"
										class="rounded" alt="Cinque Terre"
										style="width: 90px; height: 90px;">
								</div>
							</c:if>


							<div class="col-md-9 mt-sm-20">
								<c:url var="sgDetail" value="studyDetail.go">
									<c:param name="sgNo" value="${sg.sgNo}" />
									<c:param name="currentPage" value="${pi.currentPage}" />
									<c:param name="mno" value="${sessionScope.loginUser.mno}"/>
								</c:url>
								<a href="${sgDetail}" style="display: block;"><label
									style="font-size: x-large; font-weight: bold;">${sg.sgTitle}</label></a>
								
								<c:if test="${sg.sgConfirm eq 'Y'}">
									<h5 class="mb-2 text-primary" style="font-weight: bold;">모집
										중</h5>
								</c:if>
								
								
								<c:if test="${sg.sgJoin eq 'Y'}">
									<h5 class="mb-1 text-primary" style="font-weight: bold;"> 중간참여 가능
										</h5>
								</c:if>
								

								<c:if test="${sg.sgConfirm eq 'N'}">
								<h5 class="mb-1 text-danger"
										style="font-weight: bold; color: red;">모집 완료</h5>
										
								</c:if>

								<c:if test="${sg.sgJoin eq 'N'}">
									<h5 class="mb-1 text-danger"
										style="font-weight: bold; color: red;">중간참여 불가</h5>
								</c:if>
								


								<ul class="study_ul">
									<li class="study_li"><img
										src="${contextPath}/resources/img/man.png">${sg.sgWriter}</li>
									
																	
									<c:set var="maxPeople" value="${sg.sgMaxPeople}"/>
									<c:set var="newPeople" value="${sg.sgNowPeople}"/>
									<c:if test="${sg.sgMaxPeople == sg.sgNowPeople}">
									<li class="study_li text-danger"><img
										src="${contextPath}/resources/img/classroom.png">${sg.sgNowPeople}/${sg.sgMaxPeople}</li>
									</c:if>
									<c:if test="${sg.sgMaxPeople != sg.sgNowPeople}">
									<li class="study_li"><img
										src="${contextPath}/resources/img/classroom.png">${sg.sgNowPeople}/${sg.sgMaxPeople}</li>
									</c:if>
									<li class="study_li"><img
										src="${contextPath}/resources/img/location.png">${sg.sgAddr}</li>
									<li class="study_li"><img
										src="${contextPath}/resources/img/hodu.png"><fmt:formatNumber value="${sg.sgDeposit}" groupingUsed="true"/> 개</li>
								</ul>


								<ul class="study_">
									<c:forTokens var="teg" items="${sg.sgTag}" delims="@">

										<li class="study_tag">${teg}</li>
									</c:forTokens>

								</ul>
							</div>
							<div class="col-lg-12">
								<hr>
							</div>
						</c:forEach>
						<!-- study list end -->

						<!-- paging start -->
						<nav
							class="col-md-12 blog-pagination_h justify-content-center d-flex">
							<ul class="pagination">
								<c:if test="${pi.currentPage eq 1}">
									<li class="page-item"><a class="page-link"
										aria-label="Previous"> <span aria-hidden="true"> <span>〈</span>
										</span>
									</a></li>
								</c:if>
								<c:if test="${pi.currentPage ne 1 }">
									<li class="page-item"><c:url var="backPage"
											value="sgList.go">
											<c:param name="currentPage" value="${pi.currentPage-1}" />
										</c:url> <a href="${backPage}" class="page-link" aria-label="Previous">
											<span aria-hidden="true"> <span>〈</span>
										</span>
									</a></li>
								</c:if>
								<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
									<c:if test="${p eq pi.currentPage}">
										<li class="page-item active"><a class="page-link">${p}</a></li>
									</c:if>
									<c:if test="${p ne pi.currentPage}">
										<c:url var="pageNext" value="sgList.go">
											<c:param name="currentPage" value="${p}" />
										</c:url>
										<li class="page-item"><a href="${pageNext}"
											class="page-link">${p}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${pi.currentPage eq pi.maxPage}">
									<li class="page-item"><a class="page-link"
										aria-label="Next"> <span aria-hidden="true"> <span>〉</span>
										</span>
									</a></li>
								</c:if>
								<c:if test="${pi.currentPage ne pi.maxPage}">
									<c:url var="next" value="sgList.go">
										<c:param name="currentPage" value="${pi.currentPage +1 }" />
									</c:url>
									<li class="page-item"><a href="${next}" class="page-link"
										aria-label="Next"> <span aria-hidden="true"> <span>〉</span>
										</span>
									</a></li>
								</c:if>
							</ul>
						</nav>
						<!-- paging end-->
					</div>
				</div>
			</div>
	</section>
	
	
	<!-- ================ contact section end ================= -->


	<jsp:include page="../common/footer.jsp" />

	<script>
		$('#sSearch').on('click',function() {
			var ssSearch = $('#stydySearch').val();
			console.log(ssSearch);
			
			location.href="studySearch.do?ssSearch="+ssSearch;
		})
	</script>
</body>

</html>