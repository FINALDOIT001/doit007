<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoitStudyDtail</title>




<style>

/* 별점 */
.starR {
	background: url(${contextPath}/resources/img/like_icon.png) no-repeat
		right 0;
	background-size: auto 94%;
	width: 40px;
	height: 40px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
}
</style>

</head>

<body>


	<jsp:include page="../common/header.jsp" />

	<!-- Kwon CSS -->
	<link rel="stylesheet"
		href="${contextPath}/resources/css/kwonCustom.css">
	<!-- jung  -->
	<link rel="stylesheet" href="${contextPath}/resources/css/jungho.css">
	<!-- 데이타테이블 CSS -->
	<link rel="stylesheet"
		href="${contextPath}/resources/css/datatables.css">



	<!-- Start Align Area -->
	<!-- ================ contact section start ================= -->
	<section class="contact-section area-padding">
		<div class="whole-wrap">
			<div class="container box_1170">
				<div class="row">
					<div class="col-md-4">
						<div class="subject">
							<c:if test="${!empty sg.sgRenameFileName}">
								<img
									src="${contextPath}/resources/sgloadFiles/${sg.sgRenameFileName}"
									class="rounded" style="width: 350px; height: 360px;">
							</c:if>
							<c:if test="${empty sg.sgRenameFileName}">
								<img src="${contextPath}/resources/img/project-5.png"
									class="rounded" style="width: 350px; height: 360px;">
							</c:if>
						</div>
					</div>
					<div class="col-md-4 mt-sm-30">
						<label
							style="font-size: xx-large; font-weight: bold; margin-bottom: 20px;">
							${sg.sgTitle} </label> <br>
						<ul>
							<!-- 아이콘 : font Awesome -->
							<li style="margin-bottom: 3px;"><i
								class="fas fa-street-view"></i>&nbsp;&nbsp;&nbsp;지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역
								&nbsp;:&nbsp; ${sg.sgAddr}</li>
							<li style="margin-bottom: 3px;"><i class="fas fa-users"></i>&nbsp;&nbsp;모집인원
								&nbsp;:&nbsp; ${sg.sgNowPeople}/${sg.sgMaxPeople}</li>
							<li style="margin-bottom: 3px;"><i class="fas fa-medal"></i>&nbsp;&nbsp;&nbsp;팀&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장
								&nbsp;:&nbsp; ${sg.sgWriter}</li>
							<li style="margin-bottom: 3px;"><i class="fas fa-coins"></i>&nbsp;&nbsp;&nbsp;보&nbsp;&nbsp;증&nbsp;&nbsp;금
								&nbsp;:&nbsp; <fmt:formatNumber value="${sg.sgDeposit}"
									groupingUsed="true" />원</li>
							<li style="margin-bottom: 3px;"><i class="fas fa-spinner"></i>&nbsp;&nbsp;&nbsp;진&nbsp;&nbsp;행&nbsp;&nbsp;도
								&nbsp;:&nbsp; <c:if test="${ sg.sgConfirm eq 'Y'}">모집중</c:if>
								<c:if test="${ sg.sgConfirm ne 'Y'}">모집 종료</c:if></li>
							<li style="margin-bottom: 3px;"><i class="fas fa-user-check"></i>&nbsp;&nbsp;중간참여
								&nbsp;:&nbsp; <c:if test="${ sg.sgJoin eq 'Y' }">
									<b style="color: blue">참여 가능</b>
								</c:if> <c:if test="${ sg.sgJoin eq 'N' }">
									<b>참여 불가능</b>
								</c:if></li>
						</ul>
						<br>
						<ul>
							<li><c:if
									test="${sessionScope.loginUser.mno ne sg.sgWriterNo}">
									<button class="genric-btn info radius"
										style="margin-bottom: 10px; width: 130px;">스터디 가입</button>
								</c:if> <c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
									<button class="genric-btn info radius"
										style="margin-bottom: 10px; width: 130px;">스터디 시작</button>
								</c:if> <c:url var="sgUpview" value="sgUpview.go">
									<c:param name="sgNo" value="${sg.sgNo}" />
								</c:url> <c:url var="sgDelete" value="sgDelete.go">
									<c:param name="sgNo" value="${sg.sgNo}" />
								</c:url> <c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
									<button class="genric-btn danger radius" style="width: 130px;"
										onclick="location.href='${sgUpview}'">스터디 수정</button>
								</c:if> <c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
									<button class="genric-btn danger radius" style="width: 130px;"
										onclick="location.href='${sgDelete}'">스터디 삭제</button>
								</c:if> <c:if test="${sessionScope.loginUser.mno ne sg.sgWriterNo}">
									<button class="genric-btn danger radius" style="width: 130px;"
										onclick="location.href='studyInsertSc.go'">스터디 탈퇴</button>
								</c:if>
								<div class="starRev"
									style="width: 60px; display: inline; float: right;">
									<span class="starR"></span>
								</div></li>
						</ul>
					</div>
					<div class="col-md-4 mt-sm-20">
						<label class="mb-20"
							style="margin-left: 45px; font-size: large; font-weight: bold;">참석자(${fn:length(ml)}명)</label>

						<div class="checkuserscroll">

							<ul class="checkuser">
								<c:forEach var="m" items="${ml}">
									<li><div class="checkuserdiv">
											<img
												src="${contextPath}/resources/img/${m.mOriginalfilename}"
												class="rounded-circle " style="height: 70px;"
												alt="Cinque Terre">
											<c:out value="${m.mName}" />
										</div></li>
								</c:forEach>
							</ul>
						</div>

						<!-- 참가자 리스 확인 -->
					</div>


				</div>
				<hr>


				<ul class="nav nav-tabs justify-content-center"
					style="margin-top: 30px;">
					<li class="nav-item"><a class="nav-link active"
						style="width: 200px; text-align: center; font-weight: bold;"
						data-toggle="tab" href="#home">스터디 소개</a></li>
					<li class="nav-item"><a class="nav-link"
						style="width: 200px; text-align: center; font-weight: bold;"
						data-toggle="tab" href="#menu1">일정</a></li>
					<c:if test="${sg.sgPayment eq 'Y'}">
						<li class="nav-item"><a class="nav-link"
							style="width: 200px; text-align: center; font-weight: bold;"
							data-toggle="tab" href="#menu3">자료실</a></li>
						<li class="nav-item"><a class="nav-link"
							style="width: 200px; text-align: center; font-weight: bold;"
							data-toggle="tab" href="#menu2">갤러리</a></li>
					</c:if>
				</ul>

				<br> <br>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane container active" id="home">
						<!--
				
				<div class="col-lg-8">
					<div class="progress">
						<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 30%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>

			-->
						<div class="col-lg-12 div_border">
							<span
								style="font-size: x-large; font-weight: bold; display: block; margin-bottom: 30px;">활동
								계획</span> ${sg.sgCon}
						</div>




					</div>
					<div class="tab-pane container fade" id="menu1">
						<div id="kwon-inst01">
							<div id="kwon-inst-btn101" class="btn btn-outline-success"
								onclick="location.href='studyInsertSc.go'">모임 등록</div>
						</div>

						<div>

							<table id="kwon-table101" class="table table-bordered">
								<thead class="kwon-thead101">
									<th width="10%" class="th101">모임일자</th>
									<th width="10%" class="th101">시간</th>
									<th width="10%" class="th101">지역</th>
									<th width="10%" class="th101">장소</th>
									<th width="10%" class="th101">카테고리</th>
									<th width="10%" class="th101">모임명</th>
									<th width="8%" class="th101">참석 인원</th>
									</tr>
								</thead>
								<tbody>
									<tr class="kwon-tr1" onclick="location.href='studySc.go'">
										<input type="hidden" value="모임의 아이디 값1" name="아이디 네임">
										<td class="kwon-td101">2020.03.11</td>
										<td class="kwon-td101">PM 18:00</td>
										<td class="kwon-td101">강남</td>
										<td class="kwon-td101">Test021</td>
										<td class="kwon-td101">사당역 부근</td>
										<td class="kwon-td101">2020.03.11</td>
										<td class="kwon-td101">0/10</td>
									</tr>
									<tr class="kwon-tr1" onclick="location.href='studySc.go'">
										<input type="hidden" value="모임의 아이디 값2" name="아이디 네임">
										<td class="kwon-td101">2020.03.12</td>
										<td class="kwon-td101">PM 18:00</td>
										<td class="kwon-td101">강남</td>
										<td class="kwon-td101">Test021</td>
										<td class="kwon-td101">사당역 부근</td>
										<td class="kwon-td101">2020.03.11</td>
										<td class="kwon-td101">9/10</td>
									</tr>
									<tr class="kwon-tr1" onclick="location.href='studySc.go'">
										<input type="hidden" value="모임의 아이디 값3" name="아이디 네임">
										<td class="kwon-td101">2020.03.13</td>
										<td class="kwon-td101">PM 18:00</td>
										<td class="kwon-td101">강남</td>
										<td class="kwon-td101">Test021</td>
										<td class="kwon-td101">사당역 부근</td>
										<td class="kwon-td101">2020.03.11</td>
										<td class="kwon-td101">10/10</td>
									</tr>
								</tbody>
							</table>
						</div>



					</div>

					<!------------------------------------- 사진 파트 --------------------------------------->
					<div class="tab-pane container fade" id="menu2">

						<section class="about_part section">
							<div class="container">
								<div class="row">
									<div class="section_tittle">
										<h2>
											<span>NEW</span> PHOTO
										</h2>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<div class="about_img">
											<img src="${contextPath}/resources/img/about.png" alt="">
										</div>
									</div>
									<div class="offset-lg-1 col-lg-5 col-sm-8 col-md-6">
										<div class="about_text">
											<h2>새로 업로드된 <span>사진</span>
											</h2>
											<h5>
												<ul>
													<!-- 아이콘 : font Awesome -->
													<li style="margin-bottom: 3px;"><i
														class="fas fa-street-view"></i>&nbsp;&nbsp;&nbsp;지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역
														&nbsp;:&nbsp; ${sg.sgAddr}</li>
													<li style="margin-bottom: 3px;"><i
														class="fas fa-medal"></i>&nbsp;&nbsp;&nbsp;작&nbsp;&nbsp;성&nbsp;&nbsp;자
														&nbsp;:&nbsp; ${sg.sgWriter}</li>
													<li style="margin-bottom: 3px;"><i
														class="fas fa-coins"></i>&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용
														&nbsp;:&nbsp; 가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하</li>
												</ul>
											</h5>
											<br><br><br>
											<a href="#" class="btn_1" style="float: right;">사진 추가</a>
											<div class="about_part_counter">
												<div class="single_counter">
													<p style="font-size: 30px; width: 390px;">저장된 사진&nbsp;<span class="counter" style="color:red;">1000</span>&nbsp;장</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
					<div class="tab-pane container fade" id="menu3"></div>

				</div>

				<br> <br> <br> <br>


			</div>
		</div>
	</section>
	<!-- End Align Area -->

	<jsp:include page="../common/footer.jsp" />

	<script>
		/*** 별점 ****************************************************/
		$('div.starRev').children('span').click(function() {

			$(this).toggleClass("on");
			star = $('div.starRev').children('span.starR.on').length;
			/*
			  var star = 0;
			if(star == 0){
				$(this).addClass('on').prevAll('span').addClass('on');
				star = $('div.starRev').children('span.starR.on').length;
				
			}else{
				$('div.starRev').children('span').className = "starR"; 
				star = 0;
			} */

			return false;
		});
	</script>


	<!-- dataTables js -->
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<script src="${contextPath}/resources/js/kwonCustom.js"></script>
	<script src="${contextPath}/resources/js/jungho.js"></script>




</body>

</html>