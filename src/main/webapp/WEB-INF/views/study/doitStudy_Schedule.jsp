<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoitStudyDtail</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.note-toolbar {
	display: none;
}
</style>

</head>

<body>

	<jsp:include page="../common/header.jsp" />
	
	<!-- 데이타테이블 CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/datatables.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/jungho.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/kwonCustom.css">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.css" rel="stylesheet">
	
	


	<!-- Start Align Area -->
	<div class="whole-wrap">
		<div class="container box_1170">
			<div style="margin-bottom: 130px;"></div>
			<div class="row">
				<div class="col-md-4">
					<div class="subject">
						<div id="map" style="width: 100%; height: 450px;"></div>
					</div>
				</div>
				<div class="col-md-4 mt-sm-30">
					<label
						style="font-size: xx-large; font-weight: bold; margin-bottom: 20px;">
						JAVA 스터디 그룹 </label> <br>
					<ul>
						<li style="margin-bottom: 3px;">스터디 주제 :</li>
						<li style="margin-bottom: 3px;">일정 :</li>
						<li style="margin-bottom: 3px;">지역 :</li>
						<li style="margin-bottom: 3px;">모임장소 :</li>
					</ul>
					<br>
					<button class="genric-btn info radius"
						style="margin-bottom: 10px; width: 130px;">출석부</button>
					팀장만 보이는 버튼

					<button class="genric-btn danger radius btn-block"
						style="width: 130px;">스터디 수정</button>
					팀장만 보이는 버튼
				</div>
				<div class="col-md-4 mt-sm-20">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active"
							style="text-align: center;" data-toggle="tab" href="#tab1">참석자</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							style="text-align: center;" data-toggle="tab" href="#tab2">비참석자</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane container fade" id="tab1">
							<div class="checkuserscroll"
								style="width: 105%; margin-left: 0px;">
								<ul class="checkuser">
									<li><div class="checkuserdiv">
											<img src="${contextPath}/resources/img/client_2.png"
												class="rounded-circle " style="height: 70px;"
												alt="Cinque Terre">박정호
										</div></li>
									<li><div class="checkuserdiv">
											<img src="${contextPath}/resources/img/client_1.png"
												class="rounded-circle " style="height: 70px;"
												alt="Cinque Terre">케빈
										</div></li>


								</ul>

							</div>



						</div>
						<div class="tab-pane container fade" id="tab2">만약 탭이 뜨지 않는다면
							이름에 배경색 넣기</div>
					</div>


					<!-- 참가자 리스 확인 -->
				</div>


			</div>
			<hr>



			<br> <br>
			<!-- Tab panes -->
			<div>

				<div>
					<div>
						<div id="kwon-area102">
							<input type="textarea" class="" id="summernote" name="">
							</textarea>
						</div>
					</div>
					<br> <br>
					<!-- comment area start -->
					<div class="comments-area">
						<h4>댓글 3</h4>
						<div class="comment-list">
							<hr>
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="desc">
										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<div class="thumb">
													<img src="${contextPath}/resources/img/comment/comment_1.png" alt=""
														style="width: 55px; height: 55px;">
												</div>

												<h5>
													<a href="#">홍길동</a>
												</h5>
												<p class="date">2020년 3월 14일, 오후 2:40</p>
												<p class="date">
													<i class="far fa-heart"></i> 3
												</p>
											</div>
										</div>
										<p class="comment">1등</p>
									</div>
								</div>
							</div>
						</div>
						<div class="comment-list">
							<hr>
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="desc">
										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<div class="thumb">
													<img src="${contextPath}/resources/img/comment/comment_2.png" alt=""
														style="width: 55px; height: 55px;">
												</div>
												<h5>
													<a href="#">김길동</a>
												</h5>
												<p class="date">2020년 3월 14일, 오후 2:41</p>
												<p class="date">
													<i class="far fa-heart"></i> 3
												</p>
											</div>
										</div>
										<p class="comment">2등</p>
									</div>
								</div>
							</div>
						</div>
						<div class="comment-list">
							<hr>
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="desc">
										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<div class="thumb">
													<img src="${contextPath}/resources/img/comment/comment_3.png" alt=""
														style="width: 55px; height: 55px;">
												</div>
												<h5>
													<a href="#">박길동</a>
												</h5>
												<p class="date">2020년 3월 14일, 오후 2:42</p>
												<p class="date">
													<i class="far fa-heart"></i> 3
												</p>
											</div>
										</div>
										<p class="comment">ㅁ</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="comment-form">
						<form class="form-contact comment_form" action="#"
							id="commentForm"></form>
						<div class="row">
							<div class="col-10">
								<div class="form-group">
									<textarea class="form-control w-100 placeholder hide-on-focus"
										name="comment" id="comment" cols="30" rows="9"
										placeholder="댓글을 입력해 주세요."></textarea>
								</div>
							</div>
							<div class="col-2" style="margin-top: 76px;">
								<div class="form-group">
									<button type="submit" class="button button-contactForm">등록</button>
								</div>
							</div>
						</div>
						<!-- comment area end -->

					</div>


				</div>

				<br> <br> <br> <br>


			</div>
		</div>



		<script>
		$('#summernote').summernote({
		   
		   tabsize: 5,
		   height: 300,
		   toolbar: [
			  ['style', ['style']],
			  ['font', ['bold', 'underline', 'clear']],
			  ['color', ['color']],
			  ['para', ['ul', 'ol', 'paragraph']],
			  ['table', ['table']],
			  ['view', ['fullscreen', 'codeview', 'help']],
		   ]
		});
		
		 <%-- var markupStr = '<%=n.getnContent()%>'; --%>
		var markupStr = 'note-editable';
		  $('#summernote').summernote("code", markupStr);
		  $('#summernote').summernote('disable');
		  $('#summernote').summernote().css('display','none');
		
		console.log(markupStr);
	 </script>



		<script>
		var mapOptions = {
			center: new naver.maps.LatLng(37.3595704, 127.105399),
			zoom: 10
		};
		var map = new naver.maps.Map('map', mapOptions);

		</script>
		
		
		
		<jsp:include page="../common/footer.jsp" />




<!-- include summernote js -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
		<script src="${contextPath}/resources/js/kwonCustom.js"></script>
		<script src="${contextPath}/resources/js/jungho.js"></script>

		<script src="${contextPath}/resources/js/datatables.js"></script>
</body>



</html>