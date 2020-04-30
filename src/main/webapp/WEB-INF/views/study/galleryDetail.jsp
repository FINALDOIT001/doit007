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
							<h2>Gallery</h2>
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
						<span>DO IT</span> &nbsp;Gallery
					</h2>
				</div>
			</div>
			<table class="" width="1244" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<th width="134" height="50" class="btLine">제목</th>
					<td colspan="5" width="1107" height="50" class="btLine">${ g.g_Title }</td>
					<!-- 제목 -->
					
				</tr>
				<tr>
					<th width="134" height="50">작성자</th>
					<td width="208" height="50">${ g.g_Writer }</td>
					<!-- 작성자 -->
					<th width="134" height="50">작성일</th>
					<td width="208" height="50">${ g.g_Date }</td>
					<!-- 작성일 -->
					<%-- <th width="134" height="50">조회수</th>
					<td width="208" height="50">${ b.b_count }</td> --%>
					<!-- 조회수 -->
				</tr>
				<tr>
				<th width="134" height="50">첨부파일</th>
				<td colspan="5" width="1107" height="50">
					<c:forEach var="mf" items="${multiFile}">
						<c:if test="${ !empty mf.g_Original_FileName }">
							<a href="${ contextPath }/resources/sgUploadFiles/${mf.g_Rename_FileName}" download="${mf.g_Rename_FileName}">${mf.g_Rename_FileName}  <span style="color:gray; font-size:12px;">(다운로드 가능)</span></a>
						</c:if>
					</c:forEach>
				</td>
				<!-- 첨부파일 -->
				</tr>
				<tr>
				<th width="134" height="50">첨부파일<br>미리보기</th>
				<td colspan="5" width="1107" height="50">
					<c:forEach var="mf" items="${multiFile}">
						<c:if test="${ !empty mf.g_Original_FileName}">
							<img class="thumbnail" style="width:200px; height:200px" src="${contextPath}/resources/sgUploadFiles/${mf.g_Rename_FileName}">
						</c:if>
					</c:forEach>
				</td>
				</tr>
				<tr>
					<td colspan="6">
						<!-- 본문 내용 --> 
						<input type="textarea" class="" id="summernote" name="" value="">
					</td>
				</tr>
			</table>
				</div>
				<div class="not_btn" style="margin-top:100px; text-align: center;">
						
						<c:url var="gdelete" value="gDelete.go">
							<c:param name="gNum" value="${ param.gNum }"/>
							<c:param name="sgNo" value="${ param.sgNo }"/>
							<c:param name="mNo" value="${ loginUser.mno }"/>
						</c:url>
									
						<c:if test="${ loginUser.mName eq g.g_Writer }">
							<a href="${ gdelete }" class="genric-btn danger circle"
							style="font-size: 13px;">글삭제</a>
						</c:if>
								
						<a href="javascript:" onclick="location.href='studyDetail.go?sgNo='+${param.sgNo}+'&mno='+${loginUser.mno}" class="genric-btn danger circle"
								style="font-size: 13px;">목록</a>
							
					</div>
	</section>

	
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
      
      var markupStr = '${g.g_Con}';

		$('#summernote').summernote("code", markupStr);
		$('#summernote').summernote('disable');
		$('#summernote').summernote().css('display','none');
    
	</script>

</body>
</html>
