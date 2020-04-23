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
							<span>DO IT</span> Q&A
						</h2>
					</div>
					<form action="select.do" id="kwon-Form01"
						enctype="multipart/form-data" method="POST">
                    <input type="hidden" name="qWriterNo" value="${ loginUser.mno }">
                    <input type="hidden" name="qWriter" value="${ loginUser.mName }">
						<input type="hidden" name="qNo" id="qNo" value="${ qna.qNo }">
						<table border="1" class="kwon-table1" cellpadding="10px">

							<tr>
								<td class="th02">상태</td>
								<td colspan="2"><input type="text" name="qLocation"
									value="${ qna.qState }" disabled></td>
								<td class="th02 th03" colspan="1">분류</td>
								<td colspan="2"><label name="qCategory">${ qna.qCategory }</label></td>
							</tr>
							<tr>

								<td class="th02" colspan="1">제목</td>
								<td class="td02" colspan="4"><input type="text" id="qTitle"
									name="title" class="tdin02" value="${ qna.qTitle }" disabled>
								</td>
							</tr>
							<tr>
								<td colspan="6" class="td-img01">
									<div>
										<c:if test="${ !empty qna.qRenameFileName }">
										<img class="img01"
											src="${contextPath}/resources/qUploadFiles/${qna.qRenameFileName}"
											alt="사진 있었음">
										</c:if>
										<c:if test="${ empty qna.qRenameFileName }">
											<%-- <img class="img01"
											src="${contextPath}/resources/qUploadFiles/default.jpg"
											alt="사진 없음"> --%>
										
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
							<c:if test="${ loginUser.mName eq qna.qWriter }">
							
							<c:url var="qnaUpdate" value="qnaUpdate.go">
								<c:param name="qNo" value="${ qna.qNo }"/>
							</c:url>
							
							
								<a href="${ qnaUpdate }"><input type="button" id="kwon-btn07" name=""
									class="genric-btn danger circle" style="font-size: 13px; margin-right:10px;"
									value="수정하기"></input></a>
								<input type="button" id="kwon-deleteBtn07" name=""
									class="genric-btn danger circle" style="font-size: 13px;"
									value="삭제하기"></input>
								<input type="button" id="kwon-outBtn07" name=""
									class="genric-btn danger circle" style="font-size: 13px; margin-left:10px;"
									value="답변완료"></input>
							</c:if>
							<input type="button" id="kwon-back201"
								class="genric-btn danger circle" style="font-size: 13px; margin-left:10px;"
								value="돌아가기"></input>
						</div>
					</form>


					<div id="disqus_thread"></div>



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
         height: 600,
         toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['view', ['fullscreen', 'codeview', 'help']],
         ]
      });
      
      var markupStr = '${qna.qCon}';

		$('#summernote').summernote("code", markupStr);
		$('#summernote').summernote('disable');
		$('#summernote').summernote().css('display','none');
      
      console.log(markupStr);
 
</script>

<script>
	/*
	 * 댓글 등록하기(Ajax)
	 */
	
	/**
	*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
	*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
	/*
	var disqus_config = function () {
	this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
	this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
	};
	*/
	(function() { // DON'T EDIT BELOW THIS LINE
	var d = document, s = d.createElement('script');
	s.src = 'https://doit-2.disqus.com/embed.js';
	s.setAttribute('data-timestamp', +new Date());
	(d.head || d.body).appendChild(s);
	})();
</script>

<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                            
<script>
$('#kwon-deleteBtn07').click(function() {
	var title = $('#qTitle').val();
	var qNo = $('#qNo').val();
	var result = confirm(title+" 글을 삭제하시겠습니까?");
	
	if(result) {
		location.href="deleteQna.do?qNo="+qNo;
	} else {
		
	}
	
});

$('#kwon-outBtn07').click(function() {
	var qNo = $('#qNo').val();
	var result = confirm("(~˘▾˘)~♫•*¨*•.¸¸♪끝?");
	
	if(result) {
		location.href="endQna.do?qNo="+qNo;
	} else {
		
	}
});

$('#kwon-back201').click(function() {
	location.href="qna.go";
});

</script>

<script>
$(document).on("click",".kwon-span207",function(){
    var qcNo = $(this).parent().children().eq(0).val();
    console.log(qcNo);
 });
	
</script>

</body>
</html>

















