<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoitStudyDtail</title>

<style>
      #preview img {
          width: 145px;
          height: 145px;
      }
      
      #preview p {
          text-overflow: ellipsis;
          overflow: hidden;
          text-align: center;
      }
      
      a:link { color: red; text-decoration: none;}
      a:visited { color: black; text-decoration: none;}
      a:hover { color: blue; text-decoration: underline;}
      
      #preview a {
          text-align: center;
          margin-left: 40%;
      }
      
      .preview-box {
          float: left;
          padding: 5px;
          border-radius: 2px;
          margin-bottom: 10px;
      }
      
      #attach { 
         text-align: center;
      }
</style>

</head>

<body>
	<jsp:include page="../common/header.jsp" />
	
		<!-- Kwon CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/kwonCustom.css">
	
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
	
	<!-- include Summernote CSS -->
	
	
	
	
	
   <!--::project part start::-->
   <section class="about_part section-padding ">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_tittle">
                    <h2><span>자료</span> 올리기</h2>
                </div>
                <form action="insertEtc.do" id="kwon-Form01" enctype="multipart/form-data" method="POST">
                    <input type="hidden" name="etcWriterNo" value="${ loginUser.mno }">
                    <input type="hidden" name="etcWriter" value="${ loginUser.mName }">
                    <input type="hidden" name="etcWriterId" value="${ loginUser.mId }">
                    <input type="hidden" name="etcNo" value="${ etc.etcNo }">
                    
                    
                    <table border="1" class="kwon-table202" cellpadding="10px" style="margin-left:57px;">
                        
                        <tr>
                            <td class="th02" colspan="1" style="width:200px;">제목</td>
                        	<td class="td02" colspan="4" style="width:800px;">${ etc.etcTitle }</td>
                        </tr>
   					
   					
   					<c:forEach var="etcf" items="${multiFile}">
						<c:if test="${ !empty etcf.etcfOriginalFileName }">
						<tr>
                           <td colspan="1" class="th02">파일</td>
                           <td colspan="4"><a href="${ contextPath }/resources/sgUploadFiles/${etcf.etcfRenameFileName}" download="${etcf.etcfOriginalFileName}">${etcf.etcfOriginalFileName}  
                           <span style="color:gray; font-size:12px;">(다운로드 가능)</span></a></td>
						</tr>
							
						</c:if>
					</c:forEach>
                        
                        
                    </table>
                    <div id="kwon-area1">
                        <textarea class="form-control" id="summernote4" name="etcCon"></textarea>
                    </div>
        
                    <div style="text-align:center;">
                        <!-- <input type="submit" id="kwon-submit207" class="genric-btn danger circle" style="font-size: 13px;" value="질문하기"></input> -->
                        <c:if test="${ loginUser.mId eq etc.etcWriterId }">
						<c:url var="etcDelete" value="etcDelete.do">
							<c:param name="etcNo" value="${ etc.etcNo }"/>
						</c:url>
                        <input type="button" id="kwon-delete021" class="genric-btn danger circle" style="font-size: 13px;" 
                        onclick="location.href='${etcDelete}'" value="삭제"></input>
                        </c:if>
                        <input type="button" id="kwon-back01" class="genric-btn danger circle" style="font-size: 13px;" value="BACK"></input>
                    </div>
                </form>
            </div>
        </div>
        <div id="disqus_thread"></div>
    </div>
</section>
<!--::project part end::-->
    
    
    
  
  
	<jsp:include page="../common/footer.jsp"/>
	
		<!-- dataTables js -->
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<!-- <script src="js/datatables-min.js"></script> -->
	<script src="${contextPath}/resources/js/kwonCustom.js"></script>
	
    <!-- include summernote js -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
    
  
</body>



	   <script>
        $('#summernote4').summernote({
    	
            tabsize: 5,
            height: 300,
            toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['view', ['fullscreen', 'codeview', 'help']]
            ],
            placeholder: '상세 내용을 입력해주세요'

        });
        var markupStr = '${etc.etcCon}';

		$('#summernote4').summernote("code", markupStr);
		$('#summernote4').summernote('disable');
		$('#summernote4').summernote().css('display','none');

        $('#summernote4').summernote('code');
    
		var pic = $('#uploadFile').val();
        console.log(pic);
        
        /* $('#kwon-submit207').on('click',function() {
        	var 
        	
        }); */
        
        
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




</html>