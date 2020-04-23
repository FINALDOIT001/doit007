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
	<jsp:include page="../common/header.jsp" />
	

	<!--::banner part start::-->
	<section class="banner_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 offset-lg-1 col-sm-8 offset-sm-2">
					<div class="banner_text aling-items-center">
						<div class="banner_text_iner">
							<h5><p>Develop a passion for learning.</p></h5>
							<h2>
								If you do,<br>you will never cease to grow.
							</h2>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::banner part end::-->


	<!--::team part end::-->
	<section class="about_part section-padding">
		<div class="container">
			<div class="row">
				<div class="section_tittle">
					<h2>
						<span>about</span>&nbsp;&nbsp;Doit Study
					</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="about_img">
						<img src="${contextPath}/resources/img/study2.jpg" alt="">
					</div>
				</div>
				<div class="offset-lg-1 col-lg-5 col-sm-8 col-md-6">
					<div class="about_text">
						<h2>
							Many programmers are developing<br><span>with Passion</span><br>in the world.
						</h2>
						<p>많은 개발자들이 Do it을 통해 발전해나가고 있습니다.<br>
						     다양한 study에 Do it을 활용하여 참여해보세요.
						</p>
						<a href="sgList.go" class="btn_1">learn More</a>
						<div class="about_part_counter">
							<div class="single_counter">
								<span class="counter">120</span>
								<p>STUDY</p>
							</div>
							<div class="single_counter">
								<span class="counter">300</span>
								<p>PROGRAMMERS</p>
							</div>
							<div class="single_counter">
								<span class="counter">150</span>
								<p>PROJECT</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::team part end::-->

	<!--::project part start::-->
	<section class="portfolio_area pt_30 padding_bottom">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_tittle">
						<h2>
							<span>TOP</span> &nbsp;&nbsp;Study
						</h2>
					</div>
					<div class="portfolio-filter">
						<h2>
							Do it 의 <br> TOP 3 <span> STUDY</span>
						</h2>
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li><a class="active" id="Architecture-tab"
								data-toggle="tab" href="#Architecture" role="tab"
								aria-controls="Architecture" aria-selected="true">
									JAVA </a></li>
							<li><a id="Exterior-tab" data-toggle="tab" href="#Exterior"
								role="tab" aria-controls="Exterior" aria-selected="false">
									ORACLE/MYSQL </a></li>
							<li><a id="Landing-tab" data-toggle="tab" href="#Landing"
								role="tab" aria-controls="Landing" aria-selected="false">
									JavaScript/jQuery </a></li>
						</ul>
					</div>
					<div class="portfolio_item tab-content" id="myTabContent" style="margin-top:150px;">
						<div
							class="row align-items-center justify-content-between tab-pane fade show active"
							id="Architecture" role="tabpanel"
							aria-labelledby="Architecture-tab">
							<div class="col-lg-6 col-sm-12 col-md-6">
								<div class="portfolio_box">
									<a href="${contextPath}/resources/img/JAVA.png" class="img-gal">
										<div class="single_portfolio">
											<img class="img-fluid w-100" src="${contextPath}/resources/img/JAVA4.png" alt="">
										</div>
									</a>
									<div class="short_info">
										<p><img style="width:18px;" src="${contextPath}/resources/img/add_icon2.png">서울 강남</p>
										<h4>
											<a href="#">Java 및  <br> 알고리즘 스터디
											</a>
										</h4>
									</div>
								</div>
							</div>
							<div class="col-lg-5 col-md-6">
								<div class="row">
									<div
										class="col-lg-12 col-sm-6 col-md-12 single_portfolio_project">
										<div class="portfolio_box">
											<a href="${contextPath}/resources/img/JAVA2.jpg" class="img-gal">
												<div class="single_portfolio">
													<img class="img-fluid w-100" src="${contextPath}/resources/img/JAVA2.jpg" alt="">
												</div>
											</a>
											<div class="short_info">
												<p><img style="width:18px;" src="${contextPath}/resources/img/add_icon2.png">서울 건대</p>
												<h4>
													<a href="#">오직 JAVA 정복을<br>위한 스터디
													</a>
												</h4>
											</div>
										</div>
									</div>
									<div
										class="col-lg-12 col-sm-6 col-md-12 single_portfolio_project">
										<div class="portfolio_box">
											<a href="${contextPath}/resources/img/JAVA3.jpg" class="img-gal">
												<div class="single_portfolio">
													<img class="img-fluid w-100" src="${contextPath}/resources/img/JAVA3.jpg" alt="">
												</div>
											</a>
											<div class="short_info">
												<p><img style="width:18px;" src="${contextPath}/resources/img/add_icon2.png">서울 여의도</p>
												<h4>
													<a href="#">JAVA STUDY
													</a>
												</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div
							class="row align-items-center justify-content-between tab-pane fade"
							id="Exterior" role="tabpanel" aria-labelledby="Exterior-tab">
							<div class="col-lg-6 col-sm-12 col-md-6">
								<div class="portfolio_box">
									<a href="${contextPath}/resources/img/database.jpg" class="img-gal">
										<div class="single_portfolio">
											<img class="img-fluid w-100" src="${contextPath}/resources/img/database.jpg" alt="">
										</div>
									</a>
									<div class="short_info">
										<p><img style="width:18px;" src="${contextPath}/resources/img/add_icon2.png">서울 노원</p>
										<h4>
											<a href="#">Database Study
											</a>
										</h4>
									</div>
								</div>
							</div>
							<div class="col-lg-5 col-md-6">
								<div class="row">
									<div
										class="col-lg-12 col-sm-6 col-md-12 single_portfolio_project">
										<div class="portfolio_box">
											<a href="${contextPath}/resources/img/database2.jpeg" class="img-gal">
												<div class="single_portfolio">
													<img class="img-fluid w-100" src="${contextPath}/resources/img/database2.jpeg" alt="">
												</div>
											</a>
											<div class="short_info">
												<p><img style="width:18px;" src="${contextPath}/resources/img/add_icon2.png">서울 홍대</p>
												<h4>
													<a href="#">Database 파헤치기!
													</a>
												</h4>
											</div>
										</div>
									</div>
									<div
										class="col-lg-12 col-sm-6 col-md-12 single_portfolio_project">
										<div class="portfolio_box">
											<a href="${contextPath}/resources/img/database3.jpg" class="img-gal">
												<div class="single_portfolio">
													<img class="img-fluid w-100" src="${contextPath}/resources/img/database3.jpg" alt="">
												</div>
											</a>
											<div class="short_info">
												<p><img style="width:18px;" src="${contextPath}/resources/img/add_icon2.png">서울 강남</p>
												<h4>
													<a href="#">DB전문가를 향해서 가는 STUDY
													</a>
												</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div
							class="row align-items-center justify-content-between tab-pane fade"
							id="Landing" role="tabpanel" aria-labelledby="Landing-tab">
							<div class="col-lg-6 col-sm-12 col-md-6">
								<div class="portfolio_box">
									<a href="${contextPath}/resources/img/javascript.png" class="img-gal">
										<div class="single_portfolio">
											<img class="img-fluid w-100" src="${contextPath}/resources/img/javascript.png" alt="">
										</div>
									</a>
									<div class="short_info">
										<p><img style="width:18px;" src="${contextPath}/resources/img/add_icon2.png">경기 수원</p>
										<h4>
											<a href="#">JavaScript Study(2~3인)
											</a>
										</h4>
									</div>
								</div>
							</div>
							<div class="col-lg-5 col-md-6">
								<div class="row">
									<div
										class="col-lg-12 col-sm-6 col-md-12 single_portfolio_project">
										<div class="portfolio_box">
											<a href="${contextPath}/resources/img/jqeury.jpg" class="img-gal">
												<div class="single_portfolio">
													<img class="img-fluid w-100" src="${contextPath}/resources/img/jqeury.jpg" alt="">
												</div>
											</a>
											<div class="short_info">
												<p><img style="width:18px;" src="${contextPath}/resources/img/add_icon2.png">서울 서초전체</p>
												<h4>
													<a href="#">jQuery(+javascript)
													</a>
												</h4>
											</div>
										</div>
									</div>
									<div
										class="col-lg-12 col-sm-6 col-md-12 single_portfolio_project">
										<div class="portfolio_box">
											<a href="${contextPath}/resources/img/jqeury2.jpg" class="img-gal">
												<div class="single_portfolio">
													<img class="img-fluid w-100" src="${contextPath}/resources/img/jqeury2.jpg" alt="">
												</div>
											</a>
											<div class="short_info">
												<p><img style="width:18px;" src="${contextPath}/resources/img/add_icon2.png">서울 영등포</p>
												<h4>
													<a href="#">JQUERY 완벽 정복!
													</a>
												</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::project part end::-->

	<!--::service part end::-->
	<section class="service_part">
		<div class="container">
			<div class="row justify-content-between align-items-center">
				<div class="col-lg-7 col-xl-6">
					<div class="section_tittle">
						<h2>
							our <span>Community</span>
						</h2>
					</div>
					<div class="service_part_iner">
						<div class="row">
							<div class="col-lg-6 col-sm-6">
								<div class="single_service_text ">
									<img src="${contextPath}/resources/img/icon/service_1.svg" alt="">
									<a href="fblist.go"><h4>Free Board</h4></a>
									<p>자유롭게 말할 수 있는 <br>공간입니다.</p>
								</div>
							</div>
							<div class="col-lg-6 col-sm-6">
								<div class="single_service_text">
									<img src="${contextPath}/resources/img/icon/service_2.svg" alt="">
									<a href="nlist.go"><h4>Notice</h4></a>
									<p style="margin-top:30px;">Do it의 공지사항들을 <br>볼 수 있는 공간입니다.</p>
								</div>
							</div>
							<div class="col-lg-6 col-sm-6">
								<div class="single_service_text">
									<img src="${contextPath}/resources/img/icon/service_3.svg" alt="">
									<a href="moveBS.go"><h4>Book Share</h4></a>
									<p>무료 책 나눔의 공간입니다.<br>필요한 책들을 구경해보세요.</p>
								</div>
							</div>
							<div class="col-lg-6 col-sm-6">
								<div class="single_service_text">
									<img src="${contextPath}/resources/img/icon/service_4.svg" alt="">
									<a href="qna.go"><h4>Q&A</h4></a>
									<p style="margin-top:30px;">궁금한 것이 있다면 <br>질문하세요!<br>답변해드립니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-10">
					<div class="service_text">
						<h2>
							Do it offers you a variety of <span> Services.</span>
						</h2>
						<p>다양한 정보와 서비스를 제공합니다. <br>자유롭게 말할 수 있고, <br>책을 나누고, <br>질문과 답변을 할 수 있습니다.</p>
						<a href="fblist.go" class="btn_1">learn more</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::service part end::-->

	<%-- <!--::team part end::-->
	<section class="project_gallery section-padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="project_gallery_tittle">
						<h2>
							<span>Do it</span>&nbsp;&nbsp; Gallery 이부분은 사진갤러리로쓸지.고민중@@
						</h2>
					</div>
					<div class="grid">
						<div class="grid-sizer"></div>
						<div class="grid-item big_weight">
							<div class="project_img">
								<img src="${contextPath}/resources/img/gallery/gallery_1.png" alt="">
								<div class="project_gallery_hover_text">
									<p>Home Apartment</p>
									<h3>
										<a href="apartment.html"> Detached House For Sale</a>
									</h3>
									<ul>
										<li><a href=""><span class="flaticon-bath"></span></a> 04</li>
										<li><a href=""><span class="flaticon-bed"></span></a> 03</li>
										<li><a href=""><span class="flaticon-frame"></span></a>
											2400 sqft</li>
										<li><a href=""><span class="ti-heart"></span></a> like</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="grid-item big_height">
							<div class="project_img">
								<img src="${contextPath}/resources/img/gallery/gallery_4.png" alt="">
								<div class="project_gallery_hover_text">
									<p>Home Apartment</p>
									<h3>
										<a href="apartment.html"> Detached House For Sale</a>
									</h3>
									<ul>
										<li><a href=""><span class="flaticon-bath"></span></a> 04</li>
										<li><a href=""><span class="flaticon-bed"></span></a> 03</li>
										<li><a href=""><span class="flaticon-frame"></span></a>
											2400 sqft</li>
										<li><a href=""><span class="ti-heart"></span></a> like</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="grid-item">
							<div class="project_img">
								<img src="${contextPath}/resources/img/gallery/gallery_2.png" alt="">
								<div class="project_gallery_hover_text">
									<p>Home Apartment</p>
									<h3>
										<a href="apartment.html"> Detached House For Sale</a>
									</h3>
									<ul>
										<li><a href=""><span class="flaticon-bath"></span></a> 04</li>
										<li><a href=""><span class="flaticon-bed"></span></a> 03</li>
										<li><a href=""><span class="flaticon-frame"></span></a>
											2400 sqft</li>
										<li><a href=""><span class="ti-heart"></span></a> like</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="grid-item">
							<div class="project_img">
								<img src="${contextPath}/resources/img/gallery/gallery_3.png" alt="">
								<div class="project_gallery_hover_text">
									<p>Home Apartment</p>
									<h3>
										<a href="apartment.html"> Detached House For Sale</a>
									</h3>
									<ul>
										<li><a href=""><span class="flaticon-bath"></span></a> 04</li>
										<li><a href=""><span class="flaticon-bed"></span></a> 03</li>
										<li><a href=""><span class="flaticon-frame"></span></a>
											2400 sqft</li>
										<li><a href=""><span class="ti-heart"></span></a> like</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::team part end::--> --%>

	<!--::blog_part start::-->
	<div class="blog_part padding_bottom" style="margin-top:200px;">
		<div class="container">
			<div class="row">
				<div class="col-md-7 col-lg-5">
					<div class="blog_part_tittle">
						<h2>
							our <span>Event</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-7">
					<div class="single_blog"> 
						<div class="appartment_img">
							<img src="${contextPath}/resources/img/blog/it_blog1.jpg" alt="">
						</div>
						<div class="single_appartment_content">
							<p>
								<a href="#">Event</a> / March 18, 2020
							</p>
							<a href="elist.go">
								<h4>인공지능의 연결고리, 그래프 기술 알아보기</h4>
							</a>
							<ul class="list-unstyled">
								<li><a href=""> <span class="ti-comment"></span>
								</a> 2 comment</li>
								<li><a href=""> <span class="ti-heart"></span>
								</a> 22 like</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="right_single_blog">
						<div class="single_blog">
							<div class="media">
								<div class="media-body align-self-center">
									<p>
										<a href="#">Event</a> / February 14, 2020
									</p>
									<a href="blog.html">
										<h5 class="mt-0">[우리금융그룹] 2020 『디노랩』<br>모집 공고</h5>
									</a>
									<ul class="list-unstyled">
										<li><a href=""> <span class="ti-time"></span>
										</a> Feb 2</li>
										<li><a href=""> <span class="ti-heart"></span>
										</a> 24 like</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="single_blog">
							<div class="media">
								<div class="media-body align-self-center">
									<p>
										<a href="#">Event</a> / June 29, 2020
									</p>
									<a href="blog.html">
										<h5 class="mt-0">GIGDC2020 글로벌 인디 게임 <br>제작 경진대회</h5>
									</a>
									<ul class="list-unstyled">
										<li><a href=""> <span class="ti-time"></span>
										</a> Mar 30</li>
										<li><a href=""> <span class="ti-heart"></span>
										</a> 8 like</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--::blog_part end::-->

	<jsp:include page="../common/footer.jsp" />
</body>
</html>