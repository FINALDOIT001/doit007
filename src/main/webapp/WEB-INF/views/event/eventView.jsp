<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.note-toolbar {
	display: none;
}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
		<!-- include summernote js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
	

   	<!-- SEO jungdo CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/SEO.css">

   <!--::breadcrumb part start::-->
   <section class="breadcrumb blog_bg">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb_iner">
                  <div class="breadcrumb_iner_item">
                     <h2>IT 행사</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--::breadcrumb part start::-->

   <!--================Blog Area =================-->
   <section class="blog_area single-post-area area-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="feature-img">
                     <img class="img-fluid" src="${contextPath}/resources/evUploadFiles/${ ev.eRenameFileName }" alt="">
                  </div>
                  <div class="blog_details">
                     <h2>${ ev.eTitle }
                     </h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="far fa-user"></i> IT, AI</a></li>
                        <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                        <li><a href="#"><i class="far fa-edit"></i> ${ ev.eWriter }</a></li>
                     </ul>
                     
                     <textarea id="summernote">
                     </textarea>
                     <!-- <pre class="excert">
                        안녕하세요. 그래프 데이터베이스 전문기업 비트나인 입니다. 
                        다음 주에 진행되는 국내 온라인 세미나 주제 변동이 있어 공지 드립니다. 
                        기존 발표 주제에서 크게 벗어 나지 않으며, 좀 더 기술적인 내용을 다루게 되었습니다. 
                        하기의 변경된 주제 참고하여 다음 주 웨비나 참석해주시기 바랍니다. 
                        혹시 아직 사전 등록을 진행하지 않은 참석자분들은 Link를 통해 사전 등록 부탁 드립니다. 
                        참가 가능 인원이 제한되어 있으므로 등록 서둘러 주시기 바랍니다. 
                     </pre>
                     <pre>
                        날짜 : 2020년 3월 18일 (수)
                        시간 : 오후 2시 (1시간 진행)
                        주제 : [인공지능과의 연결고리, 그래프 기술 알아보기]
                        - 그래프 데이터베이스란?
                        - 그래프 데이터베이스 시장 현황
                        - 그래프 기술 발전 동향 
                        - 그래프 기반 인공지능 기술 적용 사례 
                        참가신청 : https://zoom.us/webinar/register/WN_x7id_4PoTtel4DRCNk0Prg 
                        ( 줌에서 진행하는 웨비나로, 참석을 위해 반드시 사전등록이 필요합니다! )

                        등록 후에는 웨비나 참가에 대한 정보가 포함된 확인 이메일을 받게됩니다.
                        관련 문의사항은 mjkang@bitnine.net  로 연락주시기 바랍니다.
                     </pre> -->
                  </div>
               </div>
               <div class="navigation-top">
                  <div class="navigation-area">
                     <div class="row">
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                           <div class="thumb">
                              <a href="#">
                                 <img class="img6060" src="img/blog/it_blog2.jpg" alt="">
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-left"></span>
                              </a>
                           </div>
                           <div class="detials">
                              <p>이전 게시물</p>
                              <a href="#">
                                 <h4>[우리금융그룹] 2020 ...</h4>
                              </a>
                           </div>
                        </div>
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                           <div class="detials">
                              <p>다음 게시물</p>
                              <a href="#">
                                 <h4>인공지능과의 연결고리...</h4>
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-right"></span>
                              </a>
                           </div>
                           <div class="thumb">
                              <a href="#">
                                 <img class="img6060" src="img/blog/it_blog1.jpg" alt="">
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
               <div class="comments-area">
                  <h4><label id="cCnt"></label></h4>


                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="desc">
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <div class="thumb">
                                       <img class="img5555" src="img/comment/comment_3.png" alt="" style="width: 55px; height: 55px;">
                                    </div>
                                    <h5>
                                       <a href="#">박길동</a>
                                    </h5>
                                    <p class="date">2020년 3월 14일, 오후 2:42 </p>
                                    <p class="date"><i class="far fa-heart"></i> 3</p>
                                 </div>
                              </div>
                              <p class="comment">
                              ㅁ
                              </p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="comment-form">
                  <form class="form-contact comment_form" action="#" id="commentForm"></form>
                     <div class="row">
                        <div class="col-10">
                           <div class="form-group">
                              <textarea class="form-control w-100 placeholder hide-on-focus" name="comment" id="comment"
                                 cols="30" rows="9" placeholder="댓글을 입력해 주세요."></textarea>
                           </div>
                        </div>
                        <div class="col-2" style="margin-top: 76px;">
                           <div class="form-group">
                              <button type="submit" class="button button-contactForm">등록</button>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
            <div class="col-lg-4">
               <div class="blog_right_sidebar">
                 <aside class="single_sidebar_widget search_widget">
                   <form action="#">
                     <div class="form-group">
                       <div class="input-group mb-3">
                         <input type="text" class="form-control placeholder hide-on-focus" placeholder="검색할 키워드를 입력하세요.">
                         <div class="input-group-append">
                           <button class="btn" type="button"><i class="ti-search"></i></button>
                         </div>
                       </div>
                     </div>
                     <button class="button rounded-0 primary-bg text-white w-100" type="submit">검색</button>
                   </form>
                 </aside>   
     
                 <aside class="single_sidebar_widget popular_post_widget">
                   <h3 class="widget_title">최근 게시물</h3>
                   <div class="media post_item">
                     <img class="img8080" src="img/blog/it_blog1.jpg" alt="post">
                     <div class="media-body">
                       <a href="single-blog.html">
                         <h3>인공지능과의 연결고리, 그래프 기술 알아보기</h3>
                       </a>
                       <p>2시간 전</p>
                     </div>
                   </div>
                   <div class="media post_item">
                     <img class="img8080" src="img/blog/it_blog2.jpg" alt="post">
                     <div class="media-body">
                       <a href="single-blog.html">
                         <h3>[우리금융그룹] 2020 『디노랩』모집 공고</h3>
                       </a>
                       <p>2020년-2월-14일</p>
                     </div>
                   </div>
                 </aside>
                 <aside class="single_sidebar_widget tag_cloud_widget">
                   <h4 class="widget_title">태그 모음</h4>
                   <ul class="list">
                     <li>
                       <a href="#">IT</a>
                     </li>
                     <li>
                       <a href="#">AI</a>
                     </li>
                     <li>
                       <a href="#">Bigdata</a>
                     </li>
                     <li>
                       <a href="#">Blockchain</a>
                     </li>
                   </ul>
                 </aside>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================Blog Area end =================-->



	<jsp:include page="../common/footer.jsp"/>
	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>

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
      var markupStr = '${ev.eCon}';
		$('#summernote').summernote("code", markupStr);
		$('#summernote').summernote('disable');
		$('#summernote').summernote().css('display','none');
      
      console.log(markupStr);
      
      
      
      /*
       * 댓글 등록하기(Ajax)
       */
       
      $(function() {
      	/**
      	 * 초기 페이지 로딩시 댓글 불러오기
      	 */

          getCommentList();

      	
      	$('#insertReply').on('click', function() {
      		
      		var ecENo = ${ ev.eNo };
      		var ecWriter = ${loginUser.mId}; // 세션에 등록된 Member의 userId
      		var ecWriterNo = ${ loginUser.mNo };
      		var ecCon = $('#ecCon').val();
      	    
      	    $.ajax({
      	        type:'POST',
      	        url : 'addEvReply.do',
      	        data:{
      	        	ecENo:ecENo,
      	        	ecWriter:ecWriter,
      	        	ecWriterNo:ecWriterNo,
      	        	ecCon:ecCon
      	        },
      	        success : function(data){
      	            if(data=="success")
      	            {
      	                getCommentList();
      	                $("#ecCon").val("");
      	            }
      	        },
      	        error:function(request,status,error){
      	            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      	       }
      	        
      	    });
      	});
      }); 

       
       
       
      /**
       * 댓글 불러오기(Ajax)
       */
      function getCommentList(){
          
      	var eNo = ${ ev.eNo };
      	console.log("eNo : " + eNo );
      	
          $.ajax({
              url : "eReply.do",
              data:{eNo:eNo},
              dataType : "json",
              success : function(data){
                  console.log(data);
      			
                  var html1 = "";
                  var cCnt = data.length;
                  
                  if(data.length > 0){
                  	
                      for(i=0; i<data.length; i++){
                          html1 += "<hr>";
                          html1 += "<div class='single-comment justify-content-between d-flex'>";
                          html1 += "<div class='user justify-content-between d-flex'>";
                          html1 += "<div class='desc'>";
                          html1 += "<div class='d-flex justify-content-between'>";
                          html1 += "<div class='d-flex align-items-center'>";
                          html1 += "<div class='thumb'>";
                          /* html1 += "<img src='${contextPath}/resources/img/"+data[i].mRenamefilename+"' alt='' style='width: 55px; height: 55px;'>"; */
                          /* html1 += "<input type='hidden' value='"+data[i].bscNo+"'>; */
                          html1 += "</div>";
                          html1 += "<h5>";
                          html1 += "<a href=''>"+data[i].ecWriter+"</a> ";
                          html1 += "</h5>";
                          html1 += "<p class='date'>"+data[i].ecDate+"</p><span class='kwon-span202' style='text-align:'>삭제<input type='hidden'></span>";
                          html1 += "</div>";
                          html1 += "</div>";
                          html1 += "<p class='comment'>"+data[i].ecCon+"</p>";
                          html1 += "</div>";
                          html1 += "</div>";
                          html1 += "</div>";
                      }
                      
                  } else {
                      
                      html1 += "<div>";
                      html1 += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                      html1 += "</table></div>";
                      html1 += "</div>";
                      
                  }
                  
                  $("#cCnt").text("댓글수 : " + cCnt);
                  $(".comment-list").html(html1);
                  
              },
              error:function(request,status,error){
                 
             } 
              
          });
      }

	</script>

</body>
</html>
