<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.doit.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.note-toolbar {
	display: none;
}
.kwon-span202 {
	cursor:pointer;
}

</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<!-- Kwon CSS -->
	<link rel="stylesheet"
		href="${contextPath}/resources/css/kwonCustom.css">

	<!-- 데이타테이블 CSS -->
	<link rel="stylesheet"
		href="${contextPath}/resources/css/datatables.css">

	<!-- include summernote js -->
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css"
		rel="stylesheet">


	<!--::project part start::-->
	<section class="about_part section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_tittle">
						<h2>
							<span>책을</span> 가지고싶다
						</h2>
					</div>
					<form action="select.do" id="kwon-Form01"
						enctype="multipart/form-data" method="POST">
						<input type="hidden" name="mId" value=""> 
						<input type="hidden" name="mName" value="">
						<input type="hidden" name="bsNo" id="bsNo" value="${ bs.bsNo }">
						<table border="1" class="kwon-table1" cellpadding="10px">

							<tr>
								<td class="th02">지역</td>
								<td colspan="2"><input type="text" name="bsLocation"
									value="${ bs.bsLocation }" disabled></td>
								<td class="th02 th03" colspan="1">분류</td>
								<td colspan="2"><label name="bsCategory">${ bs.bsCategory }</label></td>
							</tr>
							<tr>

								<td class="th02" colspan="1">제목</td>
								<td class="td02" colspan="4"><input type="text" id="bsTitle"
									name="title" class="tdin02" value="${ bs.bsTitle }" disabled>
								</td>
							</tr>
							<tr>
								<td colspan="6" class="td-img01">
									<div>
										<c:if test="${ !empty bs.bsRenameFileName }">
										<img class="img01"
											src="${contextPath}/resources/bsUploadFiles/${bs.bsRenameFileName}"
											alt="사진 있었음">
										</c:if>
										<c:if test="${ empty bs.bsRenameFileName }">
											<img class="img01"
											src="${contextPath}/resources/bsUploadFiles/default.jpg"
											alt="사진 없음">
										
										</c:if>
									</div>
								</td>
							</tr>
						</table>
						<div id="kwon-area1">
							<input type="textarea" class="" id="summernote" name="">
							</textarea>
						</div>

						<div style="text-align: center;">
							<c:if test="${ loginUser.mName eq bs.bsWriter }">
							
							<c:url var="bsUpdate" value="bsUpdate.go">
								<c:param name="bsNo" value="${ bs.bsNo }"/>
							</c:url>
							
							
								<a href="${ bsUpdate }"><input type="button" id="kwon-btn02" name="bsNo"
									class="genric-btn danger circle" style="font-size: 13px;"
									value="수정하기"></input></a>
								<input type="button" id="kwon-deleteBtn02" name="bsNo"
									class="genric-btn danger circle" style="font-size: 13px;"
									value="삭제하기"></input>
								<input type="button" id="kwon-outBtn02" name="bsNo"
									class="genric-btn danger circle" style="font-size: 13px; margin-left:10px;"
									value="나눔완료"></input>
									
									
							</c:if>
							<input type="button" id="kwon-back01"
								class="genric-btn danger circle" style="font-size: 13px; margin-left:10px;"
								value="돌아가기"></input>
						</div>
					</form>

					<!-- comment area start -->
					<div class="comments-area">
						<h4><label id="cCnt"></label></h4>
						<div class="comment-list">
						
						</div>



						<hr>
						<div class="comment-form">
							<form class="form-contact comment_form" action=""
								id="commentForm"></form>
							<div class="row">
								<div class="col-10">
									<div class="form-group">
										<textarea class="form-control w-100 placeholder hide-on-focus"
											name="bscCon" id="bscCon" cols="30" rows="5"
											placeholder="댓글을 입력해 주세요."></textarea>
									</div>
								</div>
								<div class="col-2" style="margin-top: 40px;">
									<div class="form-group">
										<button id="insertReply"class="genric-btn danger radius"
											style="font-size: 13px;">등록</button>
									</div>
								</div>
							</div>
							<!-- comment area end -->
							</form>
						</div>
					</div>





				</div>
			</div>
		</div>
	</section>
	<!--::project part end::-->



	<jsp:include page="../common/footer.jsp" />

	<!-- dataTables js -->
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<!-- <script src="js/datatables-min.js"></script> -->
	<script src="${contextPath}/resources/js/kwonCustom.js"></script>

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
      
      var markupStr = '${bs.bsCon}';

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
		
		var bscBsNo = ${ bs.bsNo };
		var bscWriter = "<%=((Member) session.getAttribute("loginUser")).getmName()%>"; // 세션에 등록된 Member의 userId
		var bscWriterNo = "<%=((Member) session.getAttribute("loginUser")).getMno()%>";
		var bscCon = $('#bscCon').val();
	    
	    $.ajax({
	        type:'POST',
	        url : 'addReply.do',
	        data:{
	        	bscBsNo:bscBsNo,
	        	bscWriter:bscWriter,
	        	bscWriterNo:bscWriterNo,
	        	bscCon:bscCon
	        },
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	                $("#bscCon").val("");
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
    
	var bsNo = ${ bs.bsNo };
    var testmno = "<%=((Member) session.getAttribute("loginUser")).getMno()%>";
	
    $.ajax({
        url : "bsReply.do",
        data:{bsNo:bsNo},
        dataType : "json",
        success : function(data){
			
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
                    html1 += "<input type='hidden' value='"+data[i].bscNo+"'>";
                    html1 += "<input type='hidden' value='"+data[i].bscWriterNo+"'>";
                    html1 += "<div class='thumb'>";
                    html1 += "<img src='${contextPath}/resources/img/"+data[i].member.mRenamefilename+"' alt='' style='width: 55px; height: 55px;'>";
                    /* html1 += "<input type='hidden' value='"+data[i].bscNo+"'>; */
                    html1 += "</div>";
                    html1 += "<h5>";
                    html1 += "<a href=''>"+data[i].bscWriter+"</a> ";
                    html1 += "</h5>";
                    html1 += "<p class='date'>"+data[i].bscDate+"</p><span class='kwon-span202' style='margin-left:800px;'>삭제</span>";
                    html1 += "</div>";
                    html1 += "</div>";
                    html1 += "<p class='comment'>"+data[i].bscCon+"</p>";
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
<script>
$('#kwon-deleteBtn02').click(function() {
	var title = $('#bsTitle').val();
	var bsNo = $('#bsNo').val();
	var result = confirm(title+" 글을 삭제하시겠습니까?");
	
	if(result) {
		location.href="deleteBs.do?bsNo="+bsNo;
	} else {
		
	}
	
});

$('#kwon-outBtn02').click(function() {
	var bsNo = $('#bsNo').val();
	var result = confirm("(~˘▾˘)~♫•*¨*•.¸¸♪끝?");
	
	if(result) {
		location.href="endBs.do?bsNo="+bsNo;
	} else {
		
	}
});

</script>

<script>
$(document).on("click",".kwon-span202",function(){
    var bscNo = $(this).parent().children().eq(0).val();
    console.log(bscNo);
 });

/* 댓글 삭제하기 */
$(document).on("click",".kwon-span202",function(){
	
    var bscNo = $(this).parent().children().eq(0).val();
    var bscWriterNo = $(this).parent().children().eq(1).val();
    var mno = "<%=((Member) session.getAttribute("loginUser")).getMno()%>";
    console.log("댓글번호 : " + bscNo)

    var result = confirm("댓글을 삭제하시겠습니까?");
    
    if(result) {
    	
    	if( mno == bscWriterNo) {
    
			$.ajax({
				url:"delBsReply.do",
				data:{bscNo:bscNo},
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
