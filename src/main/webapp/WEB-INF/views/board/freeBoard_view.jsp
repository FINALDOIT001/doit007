<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.doit.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeBoard View</title>
<style>
	.hyun_del {
		padding:10px;
	}
	.hyun_del img {
		margin-left:7px;
		width:18px;
		height:18px;
	}
	.x_comment {
		padding:10px;
	}
	.thumbnail {
		width:350px;
		padding:10px;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<!-- include summernote js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">


	<!--::breadcrumb part start::-->
	<section class="breadcrumb blog_bg_freeboard">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>FREE BOARD</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::breadcrumb part start::-->

	<!--::team part end::-->
	<section class="about_part section-padding">
		<div class="container">
			<div class="row">
				<div class="section_tittle">
					<h2>
						<span>DO IT</span> &nbsp;자유게시판
					</h2>
				</div>
			</div>
			<table class="" width="1244" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<th width="134" height="50" class="btLine">제목</th>
					<td colspan="5" width="1107" height="50" class="btLine">${ b.b_title }</td>
					<!-- 제목 -->
					
				</tr>
				<tr>
					<th width="134" height="50">작성자</th>
					<td width="208" height="50">${ b.b_writer }</td>
					<!-- 작성자 -->
					<th width="134" height="50">작성일</th>
					<td width="208" height="50">${ b.b_modifydate }</td>
					<!-- 작성일 -->
					<th width="134" height="50">조회수</th>
					<td width="208" height="50">${ b.b_count }</td>
					<!-- 조회수 -->
				</tr>
				<tr>
				<th width="134" height="50">첨부파일</th>
				<td colspan="5" width="1107" height="50">
					<c:if test="${ !empty b.b_re_filename }">
						<a href="${ contextPath }/resources/buploadFiles/${ b.b_re_filename }" download="${ b.b_re_filename }">${ b.b_re_filename }  <span style="color:gray; font-size:12px;">(다운로드 가능)</span></a>
					</c:if>
				</td>
				<!-- 첨부파일 -->
				</tr>
				<tr>
				<th width="134" height="50">첨부파일<br>미리보기</th>
				<td colspan="5" width="1107" height="50">
					<c:if test="${ !empty b.b_org_filename }">
						<img class="thumbnail" src="${contextPath}/resources/buploadFiles/${b.b_re_filename}">
					</c:if>
				</td>
				</tr>
				<tr>
					<td colspan="6" style="padding:15px;">
						<!-- 본문 내용 --> 
						<input type="textarea" class="" id="summernote" name=""> 
					</td>
				</tr>
			</table>
			
			
			



			<!-- comment area start -->
				<!-- <hr>
				<div class="comment_wrap">
					<div class="comment_person"
						style="font-size: 16px; padding-bottom: 10px; margin-left: 10px;">
						박스터</div>
					<div class="com" style="margin-left: 15px;">3등,,</div>
				</div>
				<hr>
				<div class="comment_wrap">
					<div class="comment_person"
						style="font-size: 16px; padding-bottom: 10px; margin-left: 10px;">
						김스터디</div>
					<div class="com" style="margin-left: 15px;">2등,,</div>
				</div>
				<hr>
				<div class="comment_wrap" style="margin-bottom: 20px;">
					<div class="comment_person"
						style="font-size: 16px; padding-bottom: 10px; margin-left: 10px;">
						송스터</div>
					<div class="com" style="margin-left: 15px;">1등,,!!~!</div>
				</div> -->
				
				
		
				<table>
					<tr>
						<td style="border-bottom:none;">
						<textarea class="form-control placeholder hide-on-focus" id="bc_content" style="width:1050px; height:80px; margin:15px; margin-top:40px;" placeholder="댓글을 입력해 주세요."></textarea>
						</td>
						<td style="border-bottom:none;">
						<button id="bcSubmit" class="genric-btn danger radius" style="font-size:12px;width:87px; height:40px; margin-top:25px;">등록</button>
						</td>
					</tr>
				</table>	
				
				
				<table width="1050" cellspacing="0" id="bctb" style="margin:15px; margin-left:40px;">
				<thead>
					<tr>
						<td style="padding:10px;" colspan="4"><b id="bcCount" style="color:black; margin-left:7px;"></b></td>
					</tr>
				</thead>
				<tbody>
				
				</tbody> <!-- tbody꼭 써주기 안에 넣을것 -->
				</table>
					
		
					<!-- comment area end -->
					
					<div class="not_btn" style="margin-top:100px; text-align: center;">
						
						<c:url var="fbUpdateForm" value="fbUpdateForm.go">
							<c:param name="b_no" value="${ b.b_no }"/>
						</c:url>
						<c:url var="fbdelete" value="fbdelete.go">
							<c:param name="b_no" value="${ b.b_no }"/>
						</c:url>
						<c:url var="fblist" value="fblist.go">
							<c:param name="currentPage" value="${ currentPage }"/>
						</c:url>
									
						<c:if test="${ loginUser.mId eq b.b_writer }">
							<a href="${ fbUpdateForm }" class="genric-btn danger circle"
							style="font-size: 13px;">글수정</a>
							<a href="${ fbdelete }" class="genric-btn danger circle"
							style="font-size: 13px;">글삭제</a>
						</c:if>
								
						<a href="${ fblist }" class="genric-btn danger circle"
								style="font-size: 13px;">목록</a>
							
					</div>


				</div>
	</section>

	<script>
		$(function(){
			getCommentList(); 
			
			/* setInterval(function(){
				getCommentList();
			},3000); */
			
			/* 댓글 등록 */
			$("#bcSubmit").on("click",function(){
				var bc_content = $("#bc_content").val();
				var bc_b_no = ${ b.b_no };
				var mId = "<%= ((Member)session.getAttribute("loginUser")).getmId() %>";
				
				$.ajax({
					url:"addComment.go",
					data:{bc_content:bc_content,bc_b_no:bc_b_no,mId:mId},
					type:"post",
					success:function(data) {
						if(data == "success"){
							getCommentList();
							
							$('#bc_content').val(""); // 초기화 
						}
					},error:function(){
						console.log("댓글 등록에 실패하였습니다"); 
					}
				});
			});
			
			
		});
	
		
		function getCommentList() {
			
			var b_no = ${ b.b_no };
			
			$.ajax({
				url:"bcList.go",
				data:{b_no:b_no},
				dataType:"json",
				success:function(data){
					$tableBody = $("#bctb tbody");
					$tableBody.html(""); 
					
					var $bc_no;
					var $tr;
					var $mId;
					var $bc_content;
					var $bc_createdate;
					/* var $bc_status; */
					
					$('#bcCount').text("댓글("+data.length+")");
					
					if(data.length > 0) {
						for(var i in data){
							$tr = $("<tr>");
							$mId = $("<td width='200'>").text(data[i].mId);
							$bc_no = data[i].bc_no;
							$bc_content = $("<td width='570'>").text(data[i].bc_content); 
							$bc_createdate = $("<td width='200'>").text(data[i].bc_createdate);
							/* $bc_status = $("<td width='100'>").text(data[i].bc_status); */
							
							$tr.append("<input type='hidden' value='"+$bc_no+"'>");
							$tr.append($mId);
							$tr.append($bc_content);
							$tr.append($bc_createdate);
							/* $tr.append($bc_status); */
							$tr.append("<td width='60'><label class='hyun_del'><img src='resources/img/delete.png'></label></td>");
							$tableBody.append($tr);
						}
					}else {
						$tr = $("<tr>");
						$bc_content = $("<td colspan='4' class='x_comment'>").text("등록된 댓글이 없습니다.");
						$tr.append($bc_content);
						$tableBody.append($tr);
					}
				}
			});
		};
		
		/* 댓글 삭제 */
		$(document).on("click",".hyun_del",function(){
			
		    var bc_no = $(this).parent().parent().children().eq(0).val();
		    
		    alert("삭제하시겠습니까?");
		
			$.ajax({
				url:"deleteComment.go",
				data:{bc_no:bc_no},
				type:"post",
				success:function(data) {
					if(data == "success") {
						getCommentList(); 
					}
				},error:function(){
					console.log("댓글 삭제에 실패하였습니다"); 
				}
			});
		});
		
	</script>
	
	<jsp:include page="../common/footer.jsp" />
	
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
      
      var markupStr = '${b.b_content}';

		$('#summernote').summernote("code", markupStr);
		$('#summernote').summernote('disable');
		$('#summernote').summernote().css('display','none');
    
	</script>

</body>
</html>
