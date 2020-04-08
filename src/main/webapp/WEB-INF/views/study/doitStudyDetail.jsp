<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- 모달 css -->
   .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 8% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
           
                                     
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
<!-- 모달 css -->
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
						<c:if test="${!empty sg.sgRenameFileName}">
							<img src="${contextPath}/resources/sgloadFiles/${sg.sgRenameFileName}" class="rounded"
								style="width: 350px; height: 360px;">	
						</c:if>
						<c:if test="${empty sg.sgRenameFileName}">
							<img src="${contextPath}/resources/img/project-5.png" class="rounded"
								style="width: 350px; height: 360px;">	
						</c:if>
						</div>
					</div>
					<div class="col-md-4 mt-sm-30">
						<label
							style="font-size: xx-large; font-weight: bold; margin-bottom: 20px;">
							${sg.sgTitle} </label> <br>
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
						<c:if test="${sessionScope.loginUser.mno ne sg.sgWriterNo}">
						<button class="genric-btn info radius"
							style="margin-bottom: 10px; width: 130px;">스터디 가입</button>
						</c:if>
						<c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
						<button class="genric-btn info radius"
							style="margin-bottom: 10px; width: 130px;">스터디 시작</button>
						</c:if>
						<div class="starRev"
							style="width: 60px; display: inline; float: right;">
							<span class="starR"></span>
						</div>
						<br>
						<c:url var="sgUpview" value="sgUpview.go">
						<c:param name="sgNo" value="${sg.sgNo}"/>
						</c:url>
						<c:url var="sgDelete" value="sgDelete.go">
						<c:param name="sgNo" value="${sg.sgNo}"/>
						</c:url>
						<c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
						<button class="genric-btn danger radius btn-block"
							style="width: 130px;" onclick="location.href='${sgUpview}'">스터디 수정</button>
						</c:if>
						<c:if test="${sessionScope.loginUser.mno eq sg.sgWriterNo}">
						<button class="genric-btn danger radius btn-block"
							style="width: 130px;" onclick="location.href='${sgDelete}'">스터디 삭제</button>
						</c:if>
						<c:if test="${sessionScope.loginUser.mno ne sg.sgWriterNo}">
						<button class="genric-btn danger radius btn-block"
							style="width: 130px;" onclick="location.href='studyInsertSc.go'">스터디 탈퇴</button>
						</c:if>
					</div>
					<div class="col-md-4 mt-sm-20">
						<label class="mb-20"
							style="margin-left: 45px; font-size: large; font-weight: bold;">참석자
							(3명)</label>

						<div class="checkuserscroll">

							<ul class="checkuser">
								<c:forEach var="m" items="${ml}">
								<li><div class="checkuserdiv">
											<img src="${contextPath}/resources/img/${m.mOrginalfilename}" class="rounded-circle "
											style="height: 70px;" alt="Cinque Terre">
											<c:out value="${m.mName}"/>
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
						<div class="col-lg-12 div_border">
							
								<div id='calendar'></div>
								
								
						</div>




					</div>
					<div class="tab-pane container fade" id="menu1">
					
					<span style="font-size: x-large; font-weight: bold; display: block; margin-bottom: 30px;">활동계획</span> ${sg.sgCon}
							
					</div>



					<!------------------------------------- 사진 파트 --------------------------------------->
					<div class="tab-pane container fade" id="menu2">글씨 나옴??</div>
					<div class="tab-pane container fade" id="menu3"></div>

				</div>

				<br> <br> <br> <br>


			</div>
		</div>
	</section>
	<!-- 모달이 가자 -->
	<div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content" style='width:60%; height:70%;'>
        <span class="close" onclick="closebtn();" >&times;</span>
        <br>
            <section class="about_part">
		<div class="container">
		<form action="sgInsert.go" method="post"
							enctype="multipart/form-data" class="was-validated">
			<div class="row">
				<div class="col-lg-6 col-md-6">


					<div class="filebox">
						<label for="cma_file" class="rounded"> <input type="file"
							name="sbul" id="cma_file" accept="image/*" capture="camera"
							onchange="getThumbnailPrivew(this,$('#cma_image'))" />
							<div id="cma_image"></div>
						</label>

					</div>
				</div>
				
				<div class="offset-lg-1 col-lg-5 col-sm-8 col-md-6"
					style="margin-top: 3%;">
					<div class="about_text">

							<div class="row">
								<div class="col">
									<input type="text" class="form-control" placeholder="공부방 제목 입력"
										name="sgTitle" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">공부방 제목 입역</div>
									<input type="text" class="form-control" value="${loginUser.mId}"
										name="sgWriter" hidden>
									<input type="number" class="form-control" value="${loginUser.mno}"
										name="sgWriterNo" hidden>
									<!-- 방 개설 자 아이디 자동 입력 구간-->
								</div>
							</div>
							<br>

								
							<div class="row">
								<div class="col">
									<input type="text" id="from" class="form-control"
										placeholder="시작 날짜 설정" name="sgStartDate" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">시작 기간 설정</div>
								</div>
								<div class="col">
									<input type="text" id="to" class="form-control"
										placeholder="종료 날짜 설정" name="sgEndDate" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">종료 기간 설정</div>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col">
									<input type="text" class="form-control" placeholder="지역 입력"
										name="sgAddr" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">지역입력 예) 서울</div>
								</div>
								<div class="col">
									<input type="text" class="form-control" placeholder="장소 입력"
										name="sgLocation" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">장소입력 예) xxx커피집</div>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col">
									<input type="number" min="0" class="form-control"
										placeholder="보증금 입력" name="sgDeposit" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">인당 보증급 설정</div>
								</div>
								<div class="col">
									<input type="number" min="1" class="form-control"
										placeholder="모집 인원" name="sgMaxPeople" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">모집 인원 설정</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">
									<input type="text" id="teg" class="form-control"
										placeholder="검색어 등록" name="sgTag" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">검색어 입력 예) @JAVA</div>
								</div>
							</div>
							<br> <br>

							<div class="form-group form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" name="sgJoin"
									> 수업 중간 참여 가능 여부 체크 해주세요.
									<div class="valid-feedback">중간참여 가능여부 체크 필요</div>
									
								</label>
							</div>
					</div>
				</div>
			</div>
			<hr>
			<div style="text-align: center; margin-top: 20px;">
	
				<button type="submit" class="genric-btn danger circle"
					style="font-size: 13px; margin-right: 10px;">등록</button>
				<button type="reset" class="genric-btn danger circle"
					style="font-size: 13px;">취소</button>
			</div>
			</form>
		</div>
	</section>                                                    
        
      </div>
 
    </div>
    <!--  모달이 꺼져 -->
    
	
	<!-- End Align Area -->
	
	   <jsp:include page="../common/footer.jsp" />
	   
	   
	<script src='${fullcalPath}/core/main.js'></script>
	<script src='${fullcalPath}/daygrid/main.js'></script>
	<script src='${fullcalPath}/interaction/main.js'></script>
	
	
	
	<script>
	
	function closebtn(){//모달창 닫기
		$("#myModal").css("display","none");
	}
	
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'dayGrid', 'interaction' ],
        header: {
            left: 'prev,next',
            center: 'title',
            right: 'today',
          },
          locale: 'ko',
          defaultView: 'dayGridMonth',
          selectable: true,
          select:function(){
        	
                  $('#myModal').css("display","block");
              		
          },
         
          events:[
        	  
        	  {
        		  title:'java',
        		  description: 'description for Long Event',
        		  start : '2020-04-09'
        	  }
          ]
          
      });
    
      calendar.render();
    });
	</script>
	
	
	<script>

	</script>
	
	   
	   
	
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