<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice View</title>
<style>
	.thumbnail {
			width:350px;
			padding:10px;
		}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<!-- include summernote js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
	
   <!--::breadcrumb part start::-->
   <section class="breadcrumb blog_bg_notice">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb_iner">
                  <div class="breadcrumb_iner_item">
                     <h2>Notice</h2>
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
             <h2><span>DO IT</span> &nbsp;NOTICE</h2>
          </div>
       </div>
       <table class="" width="1244" border="0" cellspacing="0" cellpadding="0">
       <tr>
           <th width="134" height="50" class="btLine">제목</th>
           <td colspan="5" width="1107" height="50" class="btLine">${ n.n_title }</td> <!-- 제목 -->
       </tr>
       <tr>
			<th width="134" height="50">작성자</th>
			<td width="208" height="50">${ n.n_writer }</td>
			<!-- 작성자 -->
			<th width="134" height="50">작성일</th>
			<td width="208" height="50">${ n.n_modifydate }</td>
			<!-- 작성일 -->
			<th width="134" height="50">조회수</th>
			<td width="208" height="50">${ n.n_count }</td>
			<!-- 조회수 -->
	   </tr>
	   <tr>
			<th width="134" height="50">첨부파일</th>
			<td colspan="5" width="1107" height="50">
				<c:if test="${ !empty n.n_re_filename }">
					<a href="${ contextPath }/resources/buploadFiles/${ n.n_re_filename }" download="${ n.n_re_filename }">${ n.n_re_filename }  <span style="color:gray; font-size:12px;">(다운로드 가능)</span></a>
				</c:if>
			</td>
			<!-- 첨부파일 -->
			</tr>
			<tr>
				<th width="134" height="50">첨부파일<br>미리보기</th>
				<td colspan="5" width="1107" height="50">
					<c:if test="${ !empty n.n_org_filename }">
						<img class="thumbnail" src="${contextPath}/resources/buploadFiles/${n.n_re_filename}">
					</c:if>
				</td>
				</tr>
				<tr>
      	   <tr>
           <td colspan="6">                              
		   <!-- 본문 내용 -->	
		   <input type="textarea" class="" id="summernote" name="">
           </td>
        </tr>
       </table>
       <div class="not_btn" style="margin-top: 20px; text-align: center;"> 
            
			<div class="not_btn" style="margin-top:100px; text-align: center;">
						
				<c:url var="nUpdateForm" value="nUpdateForm.go">
					<c:param name="n_no" value="${ n.n_no }"/>
				</c:url>
				<c:url var="ndelete" value="ndelete.go">
					<c:param name="n_no" value="${ n.n_no }"/>
				</c:url>
				<c:url var="nlist" value="nlist.go">
					<c:param name="currentPage" value="${ currentPage }"/>
				</c:url>
				
				<!-- 관리자만 수정,삭제 가능하게~@ -->					
				<c:if test="${ loginUser.mUserroles eq 777 }">
					<a href="${ nUpdateForm }" class="genric-btn danger circle"
					style="font-size: 13px;">수정</a>
					<a href="${ ndelete }" class="genric-btn danger circle"
					style="font-size: 13px;">삭제</a>
				</c:if>
								
				<a href="${ nlist }" class="genric-btn danger circle" style="font-size: 13px;">목록</a>
       </div>
    </div>
   </section>
  
	

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
      
      var markupStr = '${n.n_content}';

		$('#summernote').summernote("code", markupStr);
		$('#summernote').summernote('disable');
		$('#summernote').summernote().css('display','none');
    
	</script>
	

</body>
</html>
