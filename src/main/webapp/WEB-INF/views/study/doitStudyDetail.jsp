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

<%-- <link href='${contextPath}/resources/plugins/fullcalenda/daygrid/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/plugins/fullcalenda/core/main.css' rel='stylesheet' /> --%>

<link href='${fullcalPath}/daygrid/main.css' rel='stylesheet' />
<link href='${fullcalPath}/core/main.css' rel='stylesheet' />


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

<!--
모달 css -->.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
}
<!--
모달css--
>
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


	<!-- Datepicker -->
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">




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
							<input type="hidden" name="sLmno" value="${loginUser.mno}">
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
								&nbsp;:&nbsp; <c:if test="${ sg.sgConfirm eq 'Y'}">모집중</c:if> <c:if
									test="${ sg.sgConfirm ne 'Y'}">모집 종료</c:if></li>
							<li style="margin-bottom: 3px;"><i class="fas fa-user-check"></i>&nbsp;&nbsp;중간참여
								&nbsp;:&nbsp; <c:if test="${ sg.sgJoin eq 'Y' }">
									<b style="color: blue">참여 가능</b>
								</c:if> <c:if test="${ sg.sgJoin eq 'N' }">
									<b>참여 불가능</b>
								</c:if></li>
						</ul>
						<br>
						<ul>
							<li><c:url var="sgJoin" value="sgJoin.go">
									<c:param name="sgNo" value="${sg.sgNo}" />
									<c:param name="mno" value="${loginUser.mno}" />
								</c:url> <c:url var="sgStart" value="sgStart.go">
									<c:param name="sgNo" value="${sg.sgNo}" />
								</c:url> <c:if test="${sessionScope.loginUser.mno ne sg.sgWriterNo}">
									<button class="genric-btn info radius"
										style="margin-bottom: 10px; width: 130px;"
										onclick="location.href='${sgJoin}'">스터디 가입</button>
								</c:if> <c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
									<button class="genric-btn info radius"
										style="margin-bottom: 10px; width: 130px;"
										onclick="location.href='${sgStart}'">스터디 시작</button>
								</c:if> <c:url var="sgUpview" value="sgUpview.go">
									<c:param name="sgNo" value="${sg.sgNo}" />
								</c:url> <c:url var="sgDelete" value="sgDelete.go">
									<c:param name="sgNo" value="${sg.sgNo}" />
								</c:url> <c:url var="sgGroupOut" value="sgGroupOut.go">
									<c:param name="mno" value="${loginUser.mno}" />
								</c:url> <c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
									<button class="genric-btn danger radius" style="width: 130px;"
										onclick="location.href='${sgUpview}'">스터디 수정</button>
								</c:if> <c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
									<button class="genric-btn danger radius" style="width: 263px;"
										onclick="location.href='${sgDelete}'">스터디 삭제</button>
								</c:if> <c:if test="${sessionScope.loginUser.mno ne sg.sgWriterNo}">
									<button class="genric-btn danger radius" style="width: 130px;"
										onclick="location.href='${sgGroupOut}'">스터디 탈퇴</button>
								</c:if>
								
								<c:if test="${!empty sessionScope.loginUser}">
								<div class="starRev"
									style="width: 60px; display: inline; float: right;">
									<c:if test ="${empty sl}">
									<span class="starR"></span>
									</c:if>
									<c:if test="${!empty sl}">
									<span class="starR on"></span>
									</c:if>
								</div>
								</c:if>
								</li>
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
						data-toggle="tab" href="#home">일정</a></li>
					<li class="nav-item"><a class="nav-link"
						style="width: 200px; text-align: center; font-weight: bold;"
						data-toggle="tab" href="#menu1">스터디 소개</a></li>
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
						<div class="col-lg-12 div_border">
							<div id='calendar'></div>
						</div>
					</div>
					<div class="tab-pane container fade" id="menu1">
						<span
							style="font-size: x-large; font-weight: bold; display: block; margin-bottom: 30px;">활동계획</span>
						${sg.sgCon}
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
											<h2>
												새로 업로드된 <span>사진</span>
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
														&nbsp;:&nbsp;
														가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하</li>
												</ul>
											</h5>
											<br> <br> <br>

											<c:url var="galleryInsertFrom" value="galleryInsertFrom.go">
												<c:param name="sgNo" value="${sg.sgNo}" />
											</c:url>
											<a class="btn_1" style="float: right;"
												href="${galleryInsertFrom}">사진 추가</a>

											<div class="about_part_counter">
												<div class="single_counter">
													<p style="font-size: 30px; width: 390px;">
														저장된 사진&nbsp;<span class="counter" style="color: red;">1000</span>&nbsp;장
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<br> <br> <br> <br>

						<div class="page-wrap">
							<!-- Main -->
							<section id="main">

								<!-- Gallery -->
								<section id="galleries">

									<!-- Photo Galleries -->
									<div class="gallery">
										<div class="content"
											style="display: inline-block; text-align: center;">


											<c:forEach var="g" items="${galleryList}">
												<c:url var="gDetail" value="galleryDetail.go">
													<c:param name="sgNo" value="${sg.sgNo}" />
													<c:param name="gNo" value="${g.g_No}" />
													<c:param name="gNum" value="${g.g_Num}" />
												</c:url>
												<div class="media all people"
													style="display: inline-block; max-width: 20%; margin: 5px;">
													<a href="${gDetail}"> <img
														src="${contextPath}/resources/sgUploadFiles/${g.g_Rename_FileName}"
														style="width: 200px; height: 200px;"
														/></a> <span hidden>${g.g_No}</span><span
														hidden>${g.g_Num}</span>
												</div>
											</c:forEach>
										</div>

									</div>
						</div>
					</div>
					
					<div class="tab-pane container fade" id="menu3"></div>

				</div>

				<br> <br> <br> <br>


			</div>
		</div>
	</section>
	<!-- 모달이 가자 -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content" style='width: 50%; height: 65%;'>
			<section class="about_part">
				<div class="container">


					<div class="row">
						<div class="col-lg-6 col-md-6">



							<div id="map" style="width: 100%; height: 100%;"
								onclick="relaycl();"></div>


						</div>

						<div class="offset-lg-1 col-lg-5 col-sm-8 col-md-6">
							<div class="about_text">

								<!-- 폼 태그 시작 부분 나중에 추가-->
								<form id="studyDaily" action="dailyStudyinsert.go" method="post"
									class="was-validated">
									<div class="row">

										<div class="col">
											<input type="hidden" name="ssNo" id="ssNo"> <input
												type="hidden" name="ssSgNo" id="ssSgNo" value="${sg.sgNo}">
											<input type="text" class="form-control"
												placeholder="공부 주제 입력" name="ssTitle" id="ssTitle"
												pattern=".{2,15}" required>
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback" name="checkchar">공부 주제
												10글자 이내 입력 요망</div>
											<!-- 방 개설 자 아이디 자동 입력 구간-->
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col">
											<input type="time" class="form-control" name="ssTimeDate"
												id="ssTimeDate" required>
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">만남 시간 설정</div>
										</div>
										<div class="col">
											<fmt:parseDate value="${sg.sgStartDate}" var="sDataFmt"
												pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${sDataFmt}" var="sgStartDate"
												pattern="yyyy-MM-dd" />
											<fmt:parseDate value="${sg.sgEndDate}" var="eDataFmt"
												pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${eDataFmt}" var="sgEndDate"
												pattern="yyyy-MM-dd" />

											<input type="date" class="form-control" id="dailyDate"
												min="${sgStartDate}" max="${sgEndDate}" name="ssDayDate"
												value="${sgStartDate}" required>
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">스터디 일정 설정</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="col">
											<input type="text" class="form-control addressmagin"
												placeholder="우편번호" id="postcode" name="zipcode" required>
										</div>
										<div class="col">
											<c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
												<input type="button" class="genric-btn danger radius"
													onclick="DaumPostcode();"
													style="margin-bottom: 10px; font-size: 13px;"
													value="우편번호 찾기">
											</c:if>

										</div>
									</div>
									<div class="row">
										<div class="col">
											<input type="text" class="form-control addressmagin"
												id="address" placeholder="주소" name="ssAdd" required>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<input type="text" class="form-control" placeholder="상세주소"
												id="detailAddress" name="ssExAdd" required>
										</div>
									</div>
									<br> <br> <br>
								</form>
							</div>
						</div>
					</div>
					<hr>
					<br>
					<div style="text-align: center;">
						<c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
							<button id="insertbtn" onclick="ssinsertGo();"
								class="genric-btn danger circle"
								style="font-size: 13px; margin-right: 10px;">등록</button>
							<button id="updatebtn" onclick="ssupdatego();"
								class="genric-btn danger circle"
								style="font-size: 13px; margin-right: 10px;">수정</button>
							<button id="checkBtn" class="genric-btn danger circle"
							style="font-size: 13px; margin-right: 10px;">출석</button>
							<!-- 정도씨가 구경 정호형이 ajax 할  예정  -->
							<button id="deletebtn" onclick="deleteDailyBtn();"
								class="genric-btn danger circle"
								style="font-size: 13px; margin-right: 10px;">삭제</button>
						</c:if>
						<button onclick="closebtn();" class="genric-btn danger circle"
							style="font-size: 13px;">닫기</button>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!--  모달이 꺼져 -->



	<!-- End Align Area -->

	<jsp:include page="../common/footer.jsp" />


	<!-- 지도 주소 검색  js-->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1b439b4a0ff0544fb67982c72bca1e3&libraries=services"></script>
	<!-- 지도 주소 검색  js끝 -->

	<script src='${fullcalPath}/core/main.js'></script>
	<script src='${fullcalPath}/daygrid/main.js'></script>
	<script src='${fullcalPath}/interaction/main.js'></script>




	<!-- 다음 지도 와 주소 검색 시작-->
	<script>
	function acctiveMap(data){
		
		var address;
		var ssExAdd;
		
		 var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	     mapOption = {
	         center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	         level: 5 // 지도의 확대 레벨
	     };

	 //지도를 미리 생성
		 var map = new daum.maps.Map(mapContainer, mapOption);
	 	
	if (data!=null){
		address = data.ssAdd;
		ssExAdd = data.ssExAdd;
		
		//주소-좌표 변환 객체를 생성
		 var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
	geocoder.addressSearch(address, function(result, status) {

   // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

       // 결과값으로 받은 위치를 마커로 표시합니다
       var marker = new kakao.maps.Marker({
           map: map,
           position: coords
       });

       // 인포윈도우로 장소에 대한 설명을 표시합니다
       var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ssExAdd+'</div>'
       });
       infowindow.open(map, marker);

       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       map.setCenter(coords);
   }
});    
		

	}
	};

 function DaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             var addr = data.address;
             var postcode = data.zonecode// 최종 주소 변수
             var geocoder = new daum.maps.services.Geocoder();

             // 주소 정보를 해당 필드에 넣는다.
             document.getElementById("address").value = addr;
             document.getElementById('postcode').value = postcode;
             document.getElementById("detailAddress").focus();
             
             // 주소로 상세 정보를 검색
             geocoder.addressSearch(data.address, function(results, status) {
                 // 정상적으로 검색이 완료됐으면
                 if (status === daum.maps.services.Status.OK) {

                     var result = results[0]; //첫번째 결과의 값을 활용

                     // 해당 주소에 대한 좌표를 받아서
            
                     
                      var coords = new daum.maps.LatLng(result.y, result.x);
                     var mapContainer = document.getElementById('map'),
                     mapOption = {
            	         center: coords, // 지도의 중심좌표
            	         level: 5 // 지도의 확대 레벨
            	     };
                     var map = new daum.maps.Map(mapContainer, mapOption);
                     
                     var marker = new kakao.maps.Marker({
                         map: map,
                         position: coords
                     });
                     
                    
                     map.setCenter(coords);
                     // 마커를 결과값으로 받은 위치로 옮긴다.
                     marker.setPosition(coords)
                 }
             });
         }
     }).open();
 }
	
	//다음 지도 와 주소 검색 끝 
	</script>



	<script>
	function deleteDailyBtn(){
		var ssSgNo = $("#ssSgNo").val();
		var ssNo = $("#ssNo").val();
		console.log(ssNo);
		$.ajax({
			url:"dailyStudyDelete.go",
			data:{ssNo:ssNo},
			success:function(data){
				if(data=="ok"){
					alert("삭제성공")
					location.href="studyDetail.go?sgNo="+ssSgNo;
				}else{
					alert("삭제실패")
				}
			},error:function(reqeust, status, errorDate){
				alert("error code : "+ reqeust.status + "\n"
						+"message : "+ reqeust.responseText
						+"error : "+errorDate);
			}
		
		});
	};
	
	
		// 스터디 스케쥴 Update form 태그 post 방식으로 보내기 
		function ssupdatego(){
			$("#studyDaily").attr("action","dailyStudyUpdate.go")
			$("#studyDaily").submit();
			console.log(sub1);
		}
	
		// 스터디 스케쥴 insert form 태그 post 방식으로 보내기
		function ssinsertGo(){
			$("#studyDaily").attr("action","dailyStudyinsert.go")
			var sub = $("#studyDaily").submit();
			console.log(sub);
			
		}
		// 스터디 스케쥴 insert 모달장 display : none 처리 
		function closebtn() {//모달창 닫기
			$("#myModal").css("display", "none");
		}
		

		document.addEventListener('DOMContentLoaded', function() {
			var sgNo = ${sg.sgNo};
			var dailystudy=new Array();
			
			var list;
			
			console.log(sgNo);
			
			var calendarEl = document.getElementById('calendar');
			
			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : [ 'dayGrid', 'interaction' ],
				header : {
					left : 'prev,next',
					center : 'title',
					right : 'today, myCustomButton',	
				},
				locale : 'ko',
				defaultView : 'dayGridMonth',
				selectable : false,
				// event 처리 Gson 으로 처리 후 리터럴 값 ecvents Array 변수에 넣어 출력 처리함. fullCalendal 4.0 적용.
					events: function(fetchInfo, successCallback, failureCallback){
						$.ajax({
							  data:{sgNo:sgNo},
							  url:"dailyStudyList.go",
								dataType:"json",
								success:function(result){
									console.log(result);
									var events=[];
								$.each(result, function(i, data){
									events.push({
										id:data.ssNo,
										title:data.ssTitle,
										start:data.ssDayDate +"T"+ data.ssTimeDate
									});
								});
								console.log(events);
								successCallback(events);									
								},
								error: function(jqXHR, textStatus, errorThrown) {
						            console.log( textStatus +" - "+ errorThrown );
								}	
						});
					},
					//event cilck 시 상세 페이지 모탈창 구현 Gson 사용 각 리터럴 값을 Jquey 사용사여 값 입력 처리
					eventClick : function(info){
						var id = info.event.id;
						console.log(id);
						$.ajax({
							data:{ssNo:id},
							url:"dailyStudyView.go",
							dataType:"json",
							success:function(data){

							    	  $('#myModal').css("display", "block");
							    	  $("#deletebtn").css("display", "inline");
							    	  $("#updatebtn").css("display","inline");
							    	  $("#insertbtn").css("display","none");
								      $("#ssNo").val(data.ssNo);
								      $("#ssSgNo").val(data.ssSgNo);
								      $("#ssTitle").val(data.ssTitle);
								      $("#ssTimeDate").val(data.ssTimeDate);
								      $("#dailyDate").val(data.ssDayDate);
								      $("#postcode").val(data.zipcode);
								      $("#address").val(data.ssAdd);
								      $("#detailAddress").val(data.ssExAdd);
								      
								      acctiveMap(data); 
								      
								      
								
							}
						});
						
						
					},
					<c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
					customButtons: {
					    myCustomButton: {
					      text: '일정등록',
					      click: function() {
					    	  $('#myModal').css("display", "block");
					    	  $("#deletebtn").css("display", "none");
					    	  $("#updatebtn").css("display","none");
					    	  $("#checkBtn").css("display","none");
					    	  $("#insertbtn").css("display","inline");
					    	  $('form').each(function() {
					    	      this.reset();
					    	      acctiveMap();
					    	  });
					      }
					    }
					  },
					</c:if>
			});

			calendar.render();
			
		});
	</script>


	<script>
		/*** 별점 ****************************************************/
		$('div.starRev').children('span').click(function() {
			var mno = $("input[name=sLmno]").val();
			var sgNo = $("input[name=ssSgNo]").val();
			var star;
			

			$(this).toggleClass("on");
			star = $('div.starRev').children('span.starR.on').length;
			console.log(star);
			
			if(star==1){
				$.ajax({
					url:"studyLikeInsert.go",
					data:{slmNo:mno,slsgNo:sgNo},
					success:function(data){
						console.log(data);
						if(data=="ok"){
							console.log("좋아요 완료");
						}else{
							console.log("좋아요 로직 실패");
						}
					},error:function(reqeust, status, errorDate){
						alert("error code : "+ reqeust.status + "\n"
								+"message : "+ reqeust.responseText
								+"error : "+errorDate);
					}
				});
				}else{
					
					$.ajax({
						url:"studyLikeDelete.go",
						data:{slmNo:mno,slsgNo:sgNo},
						success:function(data){
							console.log(data);
							if(data=="ok"){
								console.log("좋아요 지우기");
							}else{
								console.log("좋아요 지우기 실패");
							}
						},error:function(reqeust, status, errorDate){
							alert("error code : "+ reqeust.status + "\n"
									+"message : "+ reqeust.responseText
									+"error : "+errorDate);
						}
					});
					
				}
			
			
			
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
	
	<script>
      /* 출석체크지 새창 띄우기 */
      $('#checkBtn').click(function(){
         window.open("checkStudy.go?Type=New", "MESSAGE", "width=700, height=700, scrollbars=no;")
         /* window.open("checkStudy.do?userID="+"${ sessionScope.loginUser.mId }"+"&Type=New", "MESSAGE", "width=700, height=700, scrollbars=no;") */
      });
      
      $(function(){
    	  
    	  var userID = "${ sessionScope.loginUser.mId }";
    	  
    	  $.ajax({
    		  url:"getHeadMS.ms",
    		  data:{
    			  userID:userID
    		  },type:"post",
    		  dataType:"json",
    		  success:function(data){
    			  
    			  console.log(data);
    			  
    			  var datasize = data.length;
    			  $('#msListSize').text(datasize + "+");
    			  
    			  if(datasize == 0){
    				  
    				  $('#msListSize').text("");
    				  
    				  $('#msContext0').text("메세지가 없습니다.");
    				  
    			  }else if(datasize > 4){
    				  datasize = 4;
    			  }
    			  
    			  var size = datasize;

    			  for(var i=0; i<size; i++ ){
    				  
    				  var aID = "#msAtag" + i;
    				  var dID = "#msDate" + i;
    				  var cID = "#msContext" + i;
    				  
    				  var userID = "${ sessionScope.loginUser.mId }";
						
    				  $(aID).attr('href',"msDetailView.ms?ms_No="+data[i].msNo+"&ms_loginId="+userID+"&Type=New");
    				  $(dID).text(data[i].msDate1);
    				  $(cID).text(data[i].msContext);
    			  }
    			  
    		  },error:function(request, status, errorData){
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText
							+ "error : " + errorData);
				}
    		  
    	  });
    	  
      });
      
      
      
   </script>


	<!-- dataTables js -->
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<script src="${contextPath}/resources/js/kwonCustom.js"></script>
	<script src="${contextPath}/resources/js/jungho.js"></script>

</body>

</html>