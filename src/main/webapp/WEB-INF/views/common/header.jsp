<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
 
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>DOIT 두잇!</title>
	<link rel="icon" href="${contextPath}/resources/img/doit_logo.png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
	<!-- animate CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/animate.css">
	<!-- owl carousel CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/owl.carousel.min.css">
	<!-- themify CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/themify-icons.css">
	<!-- flaticon CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/flaticon.css">
	<!-- magnific-popup CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/magnific-popup.css">
	<!-- slick CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/slick.css">
	<!-- font awesome CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/fontawesome/resources/css/all.min.css">
	<!-- style CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
	<!-- hyun.css-->
	<link rel="stylesheet" href="${contextPath}/resources/css/hyun.css">
	
	<!-- inseok.css -->
	<link href="${contextPath}/resources/vendor_inseok/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<%-- 	<link href="${contextPath}/resources/css/sb-admin-2.min_inseok.css" rel="stylesheet"> --%>
	
	
	<!-- 각자 자신의 css 파일을 넣어주시기 바랍니다. -->
	
	<!-- font css -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- summernote -->
	<link rel="stylesheet" href="${contextPath}/resources/plugins/summernote/summernote-bs4.css">
	<style>
		*{font-family: 'Noto Sans KR', sans-serif;}
	</style>
  
</head>

<body>
   <!--::menu part start::-->
   <header class="main_menu home_menu">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <nav class="navbar navbar-expand-lg navbar-light">
                  <a class="navbar-brand" href="main.go"> <img src="${pageContext.request.contextPath}/resources/img/doit_logo.png" alt="logo"> </a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                     aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse main-menu-item" id="navbarNav">
                     <ul class="navbar-nav">
                        <li class="nav-item active">
                           <a class="nav-link" href="main.go">home</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" href="#">about</a>
                        </li>
                        <li class="nav-item">
                        <c:url var="sglist" value="sgList.go"/>
                           <a class="nav-link" href="${sglist}">Study</a>
                        </li>
                        <li class="nav-item dropdown">
                           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Community
                           </a>
                           <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                              <a class="dropdown-item" href="moveNT.go">Notice</a>
                              <a class="dropdown-item" href="fblist.go">Board</a>
                              <a class="dropdown-item" href="moveBS.go">Book-Share</a>
                           </div>
                        </li>
                        <li class="nav-item dropdown">
                           <a class="nav-link" href="#">Event</a>
                        </li>
                       	<li class="nav-item">
                         	<a class="nav-link" href=""></a>
                      	</li>
                      	
                      	<c:if test="${ empty sessionScope.loginUser }">
                      	    <li class="nav-item">
                         		<a class="nav-link" style="margin-left:95px;"></a>
                      		</li>
	                     	<li class="nav-item">
	                         	<a class="nav-link" href="moveLogin.go">LOGIN</a>
	                      	</li>
	                      	<li class="nav-item">
	                         	<a class="nav-link" href="moveJoin.go">JOIN</a>
	                      	</li>
	                      	<li>
                      	</c:if>
                      	<c:if test="${ !empty sessionScope.loginUser && (sessionScope.loginUser.mno != 0) }">
                      	
 							<li class="nav-item dropdown no-arrow mx-1">
								<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="fas fa-envelope fa-fw"></i>
									<span class="badge badge-danger badge-counter">4+</span>
								</a>
								
								
								<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
									<h6 class="dropdown-header">
									쪽지
									</h6>
									
									<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">권샌세 믿고있었다고!</span>
									</div>
									</a>
									
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-success">
												<i class="fas fa-donate text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">December 7, 2019</div>
											믿음 천국 불신 지옥
										</div>
									</a>
									
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-warning">
												<i class="fas fa-exclamation-triangle text-white"></i>
											</div>
										</div>
										<div>
										<div class="small text-gray-500">December 2, 2019</div>
											파이널 가즈아
										</div>
									</a>
									
									<a class="dropdown-item text-center small text-gray-500" href="#">Show All Messages</a>
								</div>
							</li>
                      		

                      	
                      		<li>
                      			<a class="nav-link"><label><span style="color:#d64748 !important;">${ loginUser.mName }</span>&nbsp;님</label></a>
                      		</li>
                      		<li class="nav-item">
	                         	<a class="nav-link" href="myinfo.me">MYPAGE</a>
                      		</li>
                      		<li class="nav-item">
	                         	<a class="nav-link" href="logout.do">LOGOUT</a>
                      		</li>
                      	</c:if>
                      	<c:if test="${ !empty sessionScope.loginUser && (sessionScope.loginUser.mno == 0) }">
                      		<li>
                      			<a class="nav-link"><label><span style="color:#d64748 !important;">${ loginUser.mName }</span>&nbsp;님</label></a>
                      		</li>
                      		<li class="nav-item">
	                         	<a class="nav-link" href="go.ad">ADMINPAGE</a>
                      		</li>
                      		<li class="nav-item">
	                         	<a class="nav-link" href="myinfo.me">MYPAGE</a>
                      		</li>
                      		<li class="nav-item">
	                         	<a class="nav-link" href="logout.do">LOGOUT</a>
                      		</li>
                      	</c:if>
                     	  <%-- <c:if test="${ !empty sessionScope.loginUser }">
					         <h3 align="right">
					            <li class="">
		                         	<label>${ loginUser.mName }님</label>
		                      	</li>
		                      	<li>
		                      	<a class="nav-link" href="myinfo.me">정보수정</a>
					            </li>
					           	<li>
		                      	<a class="nav-link" href="logout.do">로그아웃</a>
					            </li>
					         </h3>
					      </c:if> --%>
                     </ul>
                  </div>
               </nav>
            </div>
         </div>
      </div>
   </header>
   <!--::menu part end::-->
   
	<!-- inseok.js -->
   	<script src="${contextPath}/resources/vendor_inseok/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor_inseok/jquery-easing/jquery.easing.min.js"></script>
	<script src="${contextPath}/resources/js/sb-admin-2.min_inseok.js"></script>
	<script src="${contextPath}/resources/vendor_inseok/chart.js/Chart.min.js"></script>
	<script src="${contextPath}/resources/vendor_inseok/jquery/jquery.min.js"></script>
   
</body>
</html> 
   
