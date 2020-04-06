<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      * {
         font-family: 'Noto Sans KR', sans-serif;
      }
      .hyerim_div{
         width: 555px;
      }
   .filebox label {
    display: inline-block;
    background-image: url("${contextPath}/resources/img/user.png");
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
     /* 별점 */
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
   </style>
   <link rel="stylesheet" href="${contextPath}/resources/css/hyerim.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
		    <!-- Nav tabs -->
    <div style="margin-top: 130px;"></div> 
    <div class="container" style="margin-bottom: 100px;">
      <section class="about_part">
            <div class="row">
               <div class="section_tittle">
                  <h2><span>마이</span>페이지</h2>
               </div>
            </div>
      </section>
        <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link active" style="width: 200px; text-align: center;" data-toggle="tab" href="#home">내 정보 수정</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" style="width: 200px; text-align: center;" data-toggle="tab" href="#menu1">위시리스트</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" style="width: 200px; text-align: center;" data-toggle="tab" href="#menu2">나의 스터디</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="width: 200px; text-align: center;" data-toggle="tab" href="#menu3">작성 글 내역</a>
              </li>
          </ul>
          
          <!-- Tab panes -->
          <div class="tab-content">
            <!-- tab1 start-->
            <div class="tab-pane container active" id="home">
                <form class="user" id="joinForm" action="#" method="post">
                    <div class="col-lg-6" style="margin: auto; margin-top: 50px;">
                        <table>
                            <tr>
                                
                            </tr>
                        </table>
                        <div class="form-group">
                           <label><span style="color:red">*</span> 아이디</label>
                           <input type="text" class="form-control hide-on-focus" id="userid" value="ggghr" readonly>
                     </div>
                     <div class="form-group"> 
                        <label><span style="color:red">*</span> 비밀번호</label>
                        <input type="password" class="form-control form-control-user" id="userPwd1" name="userPwd1" required>
                     </div>
                     <div class="form-group"> 
                        <label><span style="color:red">*</span> 비밀번호 확인</label>
                        <input type="password" class="form-control form-control-user" id="userPwd2" name="userPwd2" required>
                        <label style="font-size: 12px; color:red">비밀번호가 일치하지 않습니다.</label>
                     </div>

                     <div class="form-group"> 
                        <label>내 이미지<span style="font-size: x-small;">(이미지를 클릭해주세요)</span></label>
                        <div>
                           <div class="about_img">
                              <div class="filebox">
                                 <label for="cma_file" id="imglabel" class="rounded-circle" alt="Cinque Terre">
                                    <input type="file" name="cma_file" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))" />
                                    <div id="cma_image" style="display:none;" ></div>
                                 </label>
                             </div>
                              
                           </div>
                        </div>
                     </div>
                     <div class="form-group"> 
                        <label><span style="color:red">*</span> 이름</label>
                        <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="이름" required>
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
                        <label style="display: block;"><span style="color:red">*</span> 이메일</label>
                        <input type="text" style="display: inline; width: 280px;" class="form-control form-control-user" id="email" name="email" placeholder="이메일" required>
                        <label style="font-weight: 600; ">@</label>   
                        <select style="width: 160px; display: inline;" class="form-control">
                           <option value="1">naver.com</option>
                           <option value="2">daum.net</option>
                           <option value="3">gmail.com</option>
                        </select>
                     </div>
                     <div class="form-group" style="margin-bottom: 50px;"> 
                        <label style="display: block;"><span style="color:red">*</span> 주소</label>
                        <input type="text" style="width: 253px; display: inline;" class="form-control form-control-user" id="address" name="address" required>
                        <a href="#" style="width:140px; font-weight: 400; margin-left: 3px; margin-bottom: 5px;" class="btn btn-dark" >우편번호 찾기</a>
                        <input type="text" style="margin-bottom: 5px;" class="form-control form-control-user" id="address2" name="address2" required>
                        <input type="text" class="form-control form-control-user" id="address3" name="address3" placeholder="상세주소 입력" required>
                     </div>
                     <div class="hyerim_div" style="text-align: center;">
                           <input type="reset" class="btn btn-outline-danger" style="font-weight: 400; width: 180px; margin-right: 10px;" value="취소하기" />
                           <a href="#" class="btn btn-dark" style="font-weight: 400; width: 180px;">
                              수정하기
                             </a>                     
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
                     <a href="studyDetail.go" style="display: block;"><label style="font-size: x-large; font-weight: bold;">JAVA 스터디 그룹</label>
                        <div class="starRev" style="width: 60px; display:inline;">
                           <span class="starR on" style="margin-left: 20px; width: 20px; height: 20px;"></span> 
                        </div>
                     </a>
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
                                       <a href="studyDetail.go" style="display: block;"><label style="font-size: x-large; font-weight: bold;">JAVA 스터디 그룹</label>
                                          <div class="starRev" style="width: 60px; display:inline;">
                                             <span class="starR on" style="margin-left: 20px; width: 20px; height: 20px;"></span> 
                                          </div>
                                       </a>
                                       <h5 class="mb-1 text-primary" style="font-weight: bold;">모집 중</h5>
                                       <ul class="study_ul">
                                          <li class="study_li">조장 : 박정호</li>
                                          <li class="study_li"><img src="img/user_icon2.png">3/8</li>
                                          <li class="study_li"><img src="img/add_icon2.png">서울시 강남구</li>
                                          <li class="study_li"><img src="img/money_icon3.png">20,000</li>
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
                           <a href="studyDetail.go" style="display: block;"><label style="font-size: x-large; font-weight: bold;">JAVA 스터디 그룹</label>
                              <div class="starRev" style="width: 60px; display:inline;">
                                 <span class="starR on" style="margin-left: 20px; width: 20px; height: 20px;"></span> 
                              </div>
                           </a>
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
               <div class="tab-pane container fade" id="menu3">
                  <div class="card" style="margin-top: 20px;">
                     <!-- /.card-header -->
                     <div class="card-body table-responsive p-0">
                       <table class="table table-hover hyun_table01">
                         <thead>
                           <tr>
                             <th>번호</th>
                             <th>제목</th>
                             <th>작성자</th>
                             <th>작성일</th>
                             <th>조회수</th>
                           </tr>
                         </thead>
                         <tbody>
                           <tr>
                             <td>5</td>
                             <td>admin</td>
                             <td><a href="hyun_notice_view.html">공지입니당5</a></td>
                             <td>2020-01-19</td>
                             <td>10</td>
                           </tr>
                           <tr>
                               <td>4</td>
                               <td>admin</td>
                               <td>공지입니다4</td>
                               <td>2020-01-13</td>
                               <td>8</td>
                           </tr>
                           <tr>
                               <td>3</td>
                               <td>admin</td>
                               <td>공지입니다3</td>
                               <td>2020-01-12</td>
                               <td>76</td>
                           </tr>							
                           <tr>
                               <td>2</td>
                               <td>admin</td>
                               <td>공지입니다2</td>
                               <td>2020-01-04</td>
                               <td>32</td>
                           </tr>							
                           <tr>
                               <td>1</td>
                               <td>admin</td>
                               <td>공지입니다1</td>
                               <td>2020-01-01</td>
                               <td>5</td>
                           </tr>
                         </tbody>
                       </table>
                     </div>
                     <!-- /.card-body -->
                  </div>
               </div>
            </div>
            
            
         </div>
         
         
         <script>
       

  
      </script>
      <!--tap end-->


	<jsp:include page="../common/footer.jsp"/>
	<!-- photo -->
 <script>
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
   </script>


<script>
   /*** 별점 ****************************************************/
   $('div.starRev').children('span').click(function(){
      
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
</body>
</html>
