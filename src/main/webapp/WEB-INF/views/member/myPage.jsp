<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.doit.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO IT</title>
<style>
      * {
         font-family: 'Noto Sans KR', sans-serif;
      }
      .hyerim_div{
         width: 555px;
      }
	   .filebox label {
    display: inline-block;
    background-size: 60px;
    cursor: pointer;
    width: 60px;
    height: 60px;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
   }
/* 위시버튼 */
.starR{
  background: url(${contextPath}/resources/img/like_icon.png) no-repeat right 0;
  background-size: auto 94%;
  width: 40px;
  height: 40px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

.hodu_border {
	border: 1.4px solid #d5d5d5;
    padding: 15px;
    margin-top:5px;
}

.hodu_list {
	border-top: 1px solid #c8c8c8;
	margin-top: 10px;
}

#myhodu {
	font-weight: bold;
    font-size: initial;
    margin-bottom:5px;
}

.font-style {
	width: 200px; 
	text-align: center; 
	font-weight: bold;

}
</style>
   <link rel="stylesheet" href="${contextPath}/resources/css/hyerim.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/kwonCustom.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/datatables.css">

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
		    <!-- Nav tabs -->
    <div style="margin-top: 130px;"></div> 
    <div class="container" style="margin-bottom: 100px;">
      <section class="about_part">
            <div class="row">
               <div class="section_tittle">
                  <h2><span> 마이</span>페이지</h2>
               </div>
            </div>
      </section>
        <ul class="nav nav-tabs" style="margin-bottom: 20px;">
            <li class="nav-item">
              <a class="nav-link active font-style" data-toggle="tab" href="#menu3" id="tabhome"><span>마일리지</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-style" data-toggle="tab" href="#home"><span>정보 수정</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-style" data-toggle="tab" href="#menu1"><span>나의 스터디</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link font-style" data-toggle="tab" href="#menu2"><span>위시리스트</span></a>
              </li>
          </ul>
          
          <!-- Tab panes -->
          <div class="tab-content">
            <!-- tab1 start-->
            <div class="tab-pane container fade" id="home">
                <form class="user" action="mupdate.go" method="post" enctype="multipart/form-data" style="margin-top:40px;">
                
                    <div class="col-lg-6" style="margin: auto;">

                        <div class="form-group">
                           	<label><span style="color: red">*</span> 아이디 </label> <span style="font-size: x-small;">(4글자 이상 입력해주세요.)</span>
							<input type="text" class="form-control hide-on-focus" id="userId" name="mId" value="${ m.mId }"
									readonly> 
                     </div>
                     <div class="form-group">
						<label><span style="color: red">*</span> 비밀번호</label>
						<input type="password" class="form-control form-control-user"
								id="userPwd" name="mPwd"  required>
					</div>
					<div class="form-group">
						<label><span style="color: red">*</span> 비밀번호 확인</label> <input
									type="password" class="form-control form-control-user"
									id="userPwd2" name="userPwd2"  required>
						<div class="Pwdcheck_font" id="Pwdcheck_font"></div>
					</div>
                     <div class="form-group"> 
                        <label><span style="color: red">*</span> 이름</label> <input
										type="text" class="form-control form-control-user"
										id="mName" name="mName" value="${ m.mName }" >
                     </div>

                     <div class="form-group"> 
                     <input type="hidden" name="mOriginalfilename" value="${ m.mOriginalfilename }">
                     
					 <input type="hidden" name="mRenamefilename" value="${ m.mRenamefilename }">
					 
                        <label>내 이미지<span style="font-size: x-small;">(이미지를 클릭해주세요)</span></label>
                        <div>
                           <div class="about_img">
                              <div class="filebox">
                              	<c:if test="${ empty m.mRenamefilename }">
                                 <label for="cma_file" id="imglabel" class="rounded-circle" alt="Cinque Terre"
                                 		style="background-image: url('${contextPath}/resources/img/${m.mOriginalfilename}');">
                                    <input type="file" name="updatefile" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))" />
                                    <div id="cma_image" style="display:none;" ></div>
                                 </label>                              
                              	
                              	</c:if>
                              	<c:if test="${ !empty m.mRenamefilename }">
                                 <label for="cma_file" id="imglabel" class="rounded-circle" alt="Cinque Terre"
                                 		style="background-image: url('${contextPath}/resources/img/user/${m.mRenamefilename}');">
                                    <input type="file" name="updatefile" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))" />
                                    <div id="cma_image" style="display:none;" ></div>
                                 </label>                              
                              	</c:if>
                             </div>               
                           </div>
                        </div>
                     </div>
                     
                     <div class="form-group"> 
                        <label style="display: block;"><span style="color:red">*</span> 전화번호</label>
                        <input type="text" style="display: inline; width: 119px;" class="form-control form-control-user" id="phone1" name="phone1" required>
                        <label style="font-weight: 600; margin-left: 5px; margin-right: 5px;">-</label>
                        <input type="text" style="display: inline; width: 119px;" class="form-control form-control-user" id="phone2" name="phone2" required>
                        <label style="font-weight: 600; margin-left: 5px; margin-right: 5px;">-</label>
                        <input type="text" style="display: inline; width: 119px;" class="form-control form-control-user" id="phone3" name="phone3" required>
                     </div>
                     <div class="form-group"> 
                        <label style="display: block;">
                        <span style="color: red">*</span>이메일</label> 
                        <input type="text" style="display: inline; width: 290px;"
								class="form-control form-control-user" id="email" name="email"
								placeholder="이메일" required> 
						<label style="font-weight: 600;">@</label> 
						<select style="width: 185px; display: inline;" class="form-control" id="selbox" name="selbox">
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="direct" id="direct">직접입력</option>
						</select>
						<input type="text" style="width: 185px; display: inline;" class="form-control" id="selboxDirect" name="selboxDirect"/>
						<input type="button" onclick="selReset()"style="margin-left:3px; background:url(${contextPath}/resources/img/cancel.png) no-repeat; border:none; width:13px; height:13px; background-size:12px;"/>
                     </div>
                     <div class="form-group" style="margin-bottom: 50px;"> 
                        <label style="display: block;"><span style="color: red">*</span>
										주소</label> <input type="text" style="width: 253px; display: inline;"
										class="form-control form-control-user" id="address1"
										name="address1" required readonly> 
										<button type="button" style="width: 140px; font-weight: 400; margin-left: 3px; margin-bottom: 5px;"
										class="btn btn-dark" onclick="execPostCode();">우편번호 찾기</button>
										<input type="text" style="margin-bottom: 5px;" class="form-control form-control-user" id="address2"
										name="address2" required readonly> 
										<input type="text" class="form-control form-control-user" id="address3"
										name="address3" placeholder="상세주소 입력" required>
                     </div>
                     <div class="hyerim_div" style="text-align: center;">
                     		<c:url var="mdelete" value="mdelete.go">
                     			<c:param name="mId" value="${m.mId}" />
                     		</c:url>
                           <input type="reset" class="btn btn-outline-danger" style="font-weight: 400; width: 150px; margin-right: 10px;" value="취소하기" />
                           <input type="submit" class="btn btn-dark" style="font-weight: 400; width: 150px; margin-right: 10px;" onclick="return validate();" value="수정하기"/>     
                           <button type="button" class="btn btn-danger" style="text-align:center;" onclick="location.href='${ mdelete }';">회원 탈퇴</button>               
                     </div>
                  </div>
               </form>
            </div>
            <!-- tab1 end -->
<!-- tab2 start -->
            <div class="tab-pane container fade" id="menu1">
               <div class="row" style="padding: 20px;">
                  <!-- study list start -->
                  <div class="col-md-2" style="text-align: center;">
                     <img src="${contextPath}/resources/img/project-5.png" class="rounded" alt="Cinque Terre" style="width: 90px; height: 90px;">
                  </div>
                  <div class="col-md-9 mt-sm-20">
                     <a href="studyDetail.go" style="display: inline;"><label style="font-size: x-large; font-weight: bold;">JAVA 스터디 그룹</label>
                     </a>
                        <div class="starRev" style="width: 60px; display:inline;">
                           <span class="starR on" style="margin-left: 20px; width: 20px; height: 20px;"></span> 
                        </div>
                     <h5 class="mb-1 text-primary" style="font-weight: bold;">모집 중</h5>
                     <ul class="study_ul">
                        <li class="study_li">조장 : 박정호</li>
                        <li class="study_li"><img src="${contextPath}/resources/img/user_icon2.png">3/8</li>
                        <li class="study_li"><img src="${contextPath}/resources/img/add_icon2.png">서울시 강남구</li>
                        <li class="study_li"><img src="${contextPath}/resources/img/money_icon3.png">20,000</li>
                     </ul>
                     <ul class="study_">
                        <li class="study_tag">Java</li>
                        <li class="study_tag">오프라인</li>
                        <li class="study_tag">스터디그룹</li>
                        
                     </ul>

                  </div>

                  <div class="col-lg-12">
                     <hr>
                  </div>
                  <!-- study list end -->

                  </div>
                  
               </div>
               <!-- tab2 end -->
               <!-- tab3 start -->
               <div class="tab-pane container fade" id="menu2">
                  <div class="row" style="padding: 20px;">
                  <!-- study list start -->
                  <div class="col-md-2" style="text-align: center;">
                     <img src="${contextPath}/resources/img/project-5.png" class="rounded" alt="Cinque Terre" style="width: 90px; height: 90px;">
                  </div>
                  <div class="col-md-9 mt-sm-20">
                     <a href="studyDetail.go" style="display: inline;"><label style="font-size: x-large; font-weight: bold;">JAVA 스터디 그룹</label>
                     </a>
                        <div class="starRev" style="width: 60px; display:inline;">
                           <span class="starR on" style="margin-left: 20px; width: 20px; height: 20px;"></span> 
                        </div>
                     <h5 class="mb-1 text-primary" style="font-weight: bold;">모집 중</h5>
                     <ul class="study_ul">
                        <li class="study_li">조장 : 박정호</li>
                        <li class="study_li"><img src="${contextPath}/resources/img/user_icon2.png">3/8</li>
                        <li class="study_li"><img src="${contextPath}/resources/img/add_icon2.png">서울시 강남구</li>
                        <li class="study_li"><img src="${contextPath}/resources/img/money_icon3.png">20,000</li>
                     </ul>
                     <ul class="study_">
                        <li class="study_tag">Java</li>
                        <li class="study_tag">오프라인</li>
                        <li class="study_tag">스터디그룹</li>
                        
                     </ul>

                  </div>

                  <div class="col-lg-12">
                     <hr>
                  </div>
                  <!-- study list end -->
                  <!-- study list start -->
                  <div class="col-md-2" style="text-align: center;">
                     <img src="${contextPath}/resources/img/project-5.png" class="rounded" alt="Cinque Terre" style="width: 90px; height: 90px;">
                  </div>
                  <div class="col-md-9 mt-sm-20">
                     <a href="studyDetail.go" style="display: inline;"><label style="font-size: x-large; font-weight: bold;">JAVA 스터디 그룹</label>
                     </a>
                        <div class="starRev" style="width: 60px; display:inline;">
                           <span class="starR on" style="margin-left: 20px; width: 20px; height: 20px;"></span> 
                        </div>
                     <h5 class="mb-1 text-primary" style="font-weight: bold;">모집 중</h5>
                     <ul class="study_ul">
                        <li class="study_li">조장 : 박정호</li>
                        <li class="study_li"><img src="${contextPath}/resources/img/user_icon2.png">3/8</li>
                        <li class="study_li"><img src="${contextPath}/resources/img/add_icon2.png">서울시 강남구</li>
                        <li class="study_li"><img src="${contextPath}/resources/img/money_icon3.png">20,000</li>
                     </ul>
                     <ul class="study_">
                        <li class="study_tag">Java</li>
                        <li class="study_tag">오프라인</li>
                        <li class="study_tag">스터디그룹</li>
                        
                     </ul>

                  </div>

                  <div class="col-lg-12">
                     <hr>
                  </div>
                  <!-- study list end -->
                     </div>
               </div>
               <!-- tab3 end -->
               <!-- tab4 start -->
               <div class="tab-pane container active" id="menu3">
					<div class="col-lg-12">
						<label id="myhodu">나의 이용정보</label>
						<div class="hodu_border" style="margin-bottom:30px;">
							<img src="${contextPath}/resources/img/hodu2.png" style="width:40px;">
							<input type="hidden" id="membermno" value="${loginUser.mno}"/>
							<label style="font-weight:700; margin-left:5px;">보유 중인 호두 &nbsp;
							<a id="hodumnum" style="margin:5px; font-size:large; color: #d64748 !important;"></a>개</label>
							<button id="hodu" class="genric-btn danger" style="float: right;font-size: 13px;">호두 충전</button>
						</div>
						<label id="myhodu">충전내역</label>
						<table id="hodu_list" class="table">
							<thead>
							  <tr>
							  <th width="5%">No</th>
								<th width="20%">충전호두</th>
								<th width="20%">결제금액</th>
								<th width="10%">구입일</th>
							  </tr>
							</thead>
							<tbody>
								<c:forEach var ="h" items="${ hlist }" varStatus="status">
								<tr class="kwon-tr1" style="text-align:center;">
									
									<td style="text-align:center;" class="kwon-td1">${ status.count }</td>
									<td style="text-align:center;" class="kwon-td1">${ h.hoduNum }개</td>
									<td style="text-align:center;" class="kwon-td1">${ h.hPrice }원</td>
									<td style="text-align:center;" class="kwon-td1">${ h.hDate }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</div>
               </div>
               <!-- tab4 end -->
            </div>

         </div>
         
      <!--tap end-->


	<jsp:include page="../common/footer.jsp"/>
	<!-- photo -->
<script src="${contextPath}/resources/js/datatables.js"></script>
 <script>

 	/* 사용자 이미지 변경 */
   function getThumbnailPrivew(html, $target) {
       if (html.files && html.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $target.css('display', '');
               //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
               $('label[id="imglabel"]').css('background-image','url("")');
               $target.html('<img src="' + e.target.result + '" border="0" style="width:60px; height: 60px;" class="rounded-circle" alt="Cinque Terre" />');
           }
           reader.readAsDataURL(html.files[0]);
       }
   }
  
   /*** 별점 ****************************************************/
   $('div.starRev').children('span').click(function(){
      
    $(this).toggleClass("on");
    star = $('div.starRev').children('span.starR.on').length;

    
   return false;
 });

   function validate(){
	   if($("#userPwd2").val()!=$("#userPwd").val()){
		   alert("비밀번호가 일치하지 않습니다.");
		   $("#userPwd2").focus();
		   return false;
	   }else {
		   return true;
	   }
   }
   /* 비밀번호 확인  */
	 $(function(){
		 $("#userPwd2").keyup(function(){
			var pwd1 = $("#userPwd").val();
			var pwd2 = $("#userPwd2").val();
			
			$.ajax({
				url:"pwdCheck.do",
				data:{mPwd:pwd1,userPwd2:pwd2},
				type:"post",
				success:function(data){
					if(data == "ok"){
						$("#Pwdcheck_font").text("비밀번호가 일치합니다.");
						$("#Pwdcheck_font").css({"color":"black","font-size": "12px"});
					}else{
						$("#Pwdcheck_font").text("비밀번호가 일치하지 않습니다.");
						$("#Pwdcheck_font").css({"color":"red","font-size": "12px"});
					}
				}
			});
		 });
	 });
	 /* 이메일 직접입력 만들기 */
	    $(function(){
	      $("#selboxDirect").hide();
	      
	      $("#selbox").change(function(){
	         if($("#selbox").val() == "direct"){
	            $("#selbox").hide();
	            $("#selboxDirect").show();
	            
	         }else{
	            $("#selboxDirect").hide();
	            
	         }
	      }); 
	    });
	    $(function(){
			hoduNum();
			
			
		});
	 /* 호두 개수 나오기 */
	 function hoduNum(){
		 var mno = "<%=((Member) session.getAttribute("loginUser")).getMno()%>";
		 $.ajax({
			 url:"hodunum.go",
			 data:{mno:mno},
			 
			 dataType:"json",
			 success:function(data){
				 $("#hodumnum").text(data.mhodu);
			 }
		 });
		 
	 }

	    function selReset(){
	      $("#selbox").show();
	      $("#selboxDirect").hide();
	      
	      $("#selbox option:eq(0)").prop("selected",true);
	    }
	    
	    /* 호두충전 페이지 생성 */
	    $('#hodu').click(function(){
			window.open("hodu.me", "호두 충전", "width=600, height=700, scrollbars=no;");

		});
	    
	    /* 호두충전 내역 테이블 생성 */
	    $('#hodu_list').dataTable( {
		lengthChange: false,
		ordering: false,
		info: false,
		searching: false,
		serverSide: false,
		order: [[0, 'desc']],
        "language": {
        "decimal":        "",
        "emptyTable":     "구입한 호두가 없습니다.",
        "info":           "총 _TOTAL_명   _START_에서 _END_까지 표시",
        "infoEmpty":      "0 개 항목 중 0 ~ 0 개 표시",
        "infoFiltered":   "(_MAX_ 총 항목에서 필터링 됨)",
        "infoPostFix":    "",
        "thousands":      ",",
        "lengthMenu":     "_MENU_",
        "loadingRecords": "로드 중 ...",
        "processing":     "처리 중 ...",
        "search":         "검색 : ",
        "zeroRecords":    "일치하는 게시글이 없습니다.",
        "paginate": {
            "first":      "처음",
            "last":       "마지막",
            "next":       ">",
            "previous":   "<"
        },
        "aria": {
            "sortAscending":  ": 오름차순으로 정렬",
            "sortDescending": ": 내림차순으로 정렬"
        }
    }
         
} );
	    
	    /* 다음 주소 api 부분 */
	    function execPostCode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                console.log(data.zonecode);
	                console.log(fullRoadAddr);
	                
	                
	                $("[name=address1]").val(data.zonecode);
	                $("[name=address2]").val(fullRoadAddr);
	                
	                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	            }
	         }).open();
	     }
</script>
</body>
</html>
