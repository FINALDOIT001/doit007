<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoitStudyDtail</title>




<style>

/* 별점 */
.starR {
	background: url(${contextPath}/resources/img/like_icon.png) no-repeat right 0;
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
	<link rel="stylesheet" href="${contextPath}/resources/css/kwonCustom.css">
	<!-- jung  -->
	<link rel="stylesheet" href="${contextPath}/resources/css/jungho.css">
	<!-- 데이타테이블 CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/datatables.css">



	<!-- Start Align Area -->
	<!-- ================ contact section start ================= -->
	<section class="contact-section area-padding">
		<div class="whole-wrap">
			<div class="container box_1170">
				<div class="row">
					<div class="col-md-4">
						<div class="subject">
							<img src="${contextPath}/resources/img/project-5.png" class="rounded"
								style="width: 350px; height: 360px;">
						</div>
					</div>
					<div class="col-md-4 mt-sm-30">
						<label
							style="font-size: xx-large; font-weight: bold; margin-bottom: 20px;">
							JAVA 스터디 그룹 </label> <br>
						<ul>
							<li style="margin-bottom: 3px;"><span>지역 :</span> ${sg.sgAddr}</li>
							<li style="margin-bottom: 3px;">모집인원 : 3/${sg.sgMaxPeople}</li>
							<li style="margin-bottom: 3px;">팀장: ${sg.sgWriter}</li>
							<li style="margin-bottom: 3px;">보증금 : ${sg.sgDeposit}</li>
							<li style="margin-bottom: 3px;">수업 진행도 : 모집 중</li>
							<li style="margin-bottom: 3px;">중간 참여 : <c:if test="${ sg.sgJoin eq 'Y' }"><b style="color:blue">참여 가능</b></c:if>
																	 <c:if test="${ sg.sgJoin eq 'N' }"><b>참여 불가능</b></c:if>
							</li>
						</ul>
						<br>
						<button class="genric-btn info radius"
							style="margin-bottom: 10px; width: 130px;">스터디 가입</button>
						팀장일 경우 (스터디 시작) 버튼
						<div class="starRev"
							style="width: 60px; display: inline; float: right;">
							<span class="starR"></span>
						</div>
						<br>
						<button class="genric-btn danger radius btn-block"
							style="width: 130px;" onclick="location.href='studyInsertSc.go'">스터디 수정</button>
						팀장만 보이는 버튼 / 스터디 가입한 사람일 경우 (스터디 탈퇴) 버튼 나오기
					</div>
					<div class="col-md-4 mt-sm-20">
						<label class="mb-20"
							style="margin-left: 45px; font-size: large; font-weight: bold;">참석자
							(3명)</label>

						<div class="checkuserscroll">

							<ul class="checkuser">
								<c:forEach var="g" items="${gm}">
								<li><div class="checkuserdiv">
										<img src="${contextPath}/resources/img/client_2.png" class="rounded-circle "
											style="height: 70px;" alt="Cinque Terre"><c:out value="${g.memberList[0].mName}"/>
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
					<li class="nav-item"><a class="nav-link"
						style="width: 200px; text-align: center; font-weight: bold;"
						data-toggle="tab" href="#menu3">자료실</a></li>
					<li class="nav-item"><a class="nav-link"
						style="width: 200px; text-align: center; font-weight: bold;"
						data-toggle="tab" href="#menu2">갤러리</a></li>
				</ul>

				<br>
				<br>
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
							<div id="kwon-inst-btn101" class="btn btn-outline-success" onclick="location.href='studyInsertSc.go'">모임
								등록</div>
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
									<tr class="kwon-tr1"  onclick="location.href='studySc.go'">
										<input type="hidden" value="모임의 아이디 값2" name="아이디 네임">
										<td class="kwon-td101">2020.03.12</td>
										<td class="kwon-td101">PM 18:00</td>
										<td class="kwon-td101">강남</td>
										<td class="kwon-td101">Test021</td>
										<td class="kwon-td101">사당역 부근</td>
										<td class="kwon-td101">2020.03.11</td>
										<td class="kwon-td101">9/10</td>
									</tr>
									<tr class="kwon-tr1"  onclick="location.href='studySc.go'">
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
					<div class="tab-pane container fade" id="menu2">글씨 나옴??</div>
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