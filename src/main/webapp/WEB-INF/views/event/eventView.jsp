<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.doit.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.note-toolbar {
	display: none;
}
.kwon-span204 {
	cursor:pointer;
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
               <input type="hidden" id="eNo" value="${ ev.eNo }">
                  <div class="feature-img">
                     <img class="img-fluid" src="${contextPath}/resources/evUploadFiles/${ ev.eRenameFileName }" alt="">
                  </div>
                  <div class="blog_details">
                     <h2 id="eTitle"> ${ ev.eTitle } </h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="far fa-user"></i> IT, AI</a></li>
                        <li><a href="#comments-area"><i class="far fa-comments"></i><label id="cCnt"></label> Comments</a></li>
                        <li><a href="#"><i class="far fa-edit"></i> ${ ev.eWriter }</a></li>
                     </ul>
                     
                     <textarea id="summernote2"></textarea>
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
                                 <img class="img6060" src="" alt="">
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
                                 <img class="img6060" src="" alt="">
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
               <div class="comments-area" id="comments-area" style="padding-bottom:0px;">
                  <div class="comment-list">
                   
                  </div>
               </div>
               <div class="comment-form" style="margin-top:20px;">
                  <form class="form-contact comment_form" action="#" id="commentForm"></form>
                     <div class="row">
                        <div class="col-10">
                           <div class="form-group">
                              <textarea class="form-control w-100 placeholder hide-on-focus" name="ecCon" id="ecCon"
                                 cols="30" rows="9" placeholder="댓글을 입력해 주세요."></textarea>
                           </div>
                        </div>
                        <div class="col-2" style="margin-top: 76px;">
                           <div class="form-group">
                              <button type="submit" id="insertReply" class="button button-contactForm">등록</button>
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
	                 <c:url var="eUpdate" value="eUpdate.go">
                     	<c:param name="eNo" value="${ ev.eNo }"/>
                     </c:url>
                     
					<c:if test="${ loginUser.mName eq ev.eWriter }">                     
                      <button class="button rounded-0 primary-bg text-white w-100" type="button"
                       onclick="location.href='${ eUpdate }'">수정</button>
                      <button id="kwon-del204"class="button rounded-0 primary-bg text-white w-100" type="button">삭제</button>
                 	</c:if>
                 	<button id="kwon-back01" class="button rounded-0 primary-bg text-white w-100" type="button">BACK</button>
                    
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
	
	<%-- <script src="${contextPath}/resources/js/kwonCustom.js"></script> --%>
	
	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>

	<script>
      $('#summernote2').summernote({
         
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
      
      var markupStr = '${ev.eCon}';
		$('#summernote2').summernote("code", markupStr);
		$('#summernote2').summernote('disable');
		$('#summernote2').summernote().css('display','none');
      
      console.log(markupStr);
	</script>
	
	<script>
	 
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
	    		console.log("eNo : " + ecENo)
	    		
	    		var ecWriter = "<%=((Member) session.getAttribute("loginUser")).getmName()%>"; // 세션에 등록된 Member의 userId
	    		var ecWriterNo = "<%=((Member) session.getAttribute("loginUser")).getMno()%>";
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
	</script>
     
     
     <script>
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
                        html1 += "<input type='hidden' value='"+data[i].ecNo+"'>";
                        html1 += "<input type='hidden' value='"+data[i].ecWriterNo+"'>";
                        html1 += "<h5>";
                        html1 += "<a href=''>"+data[i].ecWriter+"</a> ";
                        html1 += "</h5>";
                        html1 += "<p class='date'>"+data[i].ecDate+"</p><span class='kwon-span204' style='margin-left:520px;'>삭제</span>";
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
                
                $("#cCnt").text(cCnt);
                $(".comment-list").html(html1);
                
            },
            error:function(request,status,error){
               
           } 
            
        });
    }
    
    /* 이벤트 글 삭제하기 */
    $('#kwon-del204').click(function() {
    	var title = $('#eTitle').text();
    	var eNo = $('#eNo').val();
    	var result = confirm(title+"을 삭제하시겠습니까?");
    	
    	if(result) {
    		location.href="deleteEv.do?eNo="+eNo;
    	} else {
    		
    	}
    });
    
    /* 뒤로 가기 버튼 */
    $('#kwon-back01').click(function() {
      window.history.back();
    });
    
    /* 댓글 삭제하기 */
	$(document).on("click",".kwon-span204",function(){
		
		
	    var ecNo = $(this).parent().children().eq(1).val();
	    var ecWriterNo = $(this).parent().children().eq(2).val();
	    var mno = "<%=((Member) session.getAttribute("loginUser")).getMno()%>";
	    console.log("댓글번호 : " + ecNo)
	    
	    var result = confirm("댓글을 삭제하시겠습니까?"); 
	    
	    if(result) {
	    	if( mno == ecWriterNo) {
	    		
	
			$.ajax({
				url:"deleteEr.go",
				data:{ecNo:ecNo},
				type:"post",
				success:function(data) {
					if(data == "success") {
						getCommentList(); 
					}
				},error:function(){
					console.log("댓글 삭제에 실패하였습니다"); 
				}
			});
	    	} else {
	    		alert('본인이 쓴 댓글만 삭제할 수 있습니다.');
	    	}	    	
	    } else {
	    	
	    }
	});


	
	</script>
	

</body>
</html>
