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
                    
                    
                    <table border="1" class="kwon-table202" cellpadding="10px" style="margin-left:57px;">
                        
                        <tr>
                            <td class="th02" colspan="1">*제목</td>
                        	<td class="td02" colspan="2"><input type="text" name="etcTitle" class="tdin02" required></td>
                        
                           <td colspan="1" class="th02">파일 추가</td>
                           <td colspan="2"><input id="uploadInputBox"  type="file" name="filedata" multiple/></td>
                        </tr>
                        
                    </table>
                    <div id="kwon-area1">
                        <textarea class="form-control" id="summernote" name="etcCon"></textarea>
                    </div>
        
                    <div style="text-align:center;">
                        <input type="submit" id="kwon-submit207" class="genric-btn danger circle" style="font-size: 13px;" value="질문하기"></input>
                        <input type="reset" id="kwon-reset01" class="genric-btn danger circle" style="font-size: 13px;" value="취소하기"></input>
                        <input type="button" id="kwon-back01" class="genric-btn danger circle" style="font-size: 13px;" value="뒤로가기"></input>
                    </div>
                </form>

            </div>
        </div>
    </div>
</section>
<!--::project part end::-->
    
    
    
    
        <%-- <section class="project_gallery">
            <div class="project_gallery_tittle">
                <h2><span>글</span> 작성</h2>
            </div>
        </section>
      <div class="row">
        <div class="col-lg-12">
          <form action="photoUpload.go" method="POST" enctype="multipart/form-data">
            <div class="row">
               <div class="col-12">
                  <div class="form-group">
                     <input class="form-control placeholder hide-on-focus" name="g_Title" type="text" placeholder="제목">
                  </div>
                  <div class="form-group">
                     <input class="form-control placeholder hide-on-focus" name="g_Con" type="text" placeholder="내용">
                  </div>
                  <div class="form-group">
                     <input class="form-control placeholder hide-on-focus" name="g_Sg_No" type="text" placeholder="스터디 그룹 번호" value="${param.sgNo}"hidden>
                  </div>
                  <div class="form-group">
                     <input class="form-control placeholder hide-on-focus" name="g_Writer" type="text" placeholder="작성자" value="${sessionScope.loginUser.mName}"hidden>
                  </div>
                  <div class="form-group">
                     <input class="form-control placeholder hide-on-focus" name="g_Writer_No" type="text" placeholder="작성자 번호" value="${loginUser.mno}"hidden>
                  </div>
               </div>
               <div class="col-12">
                  <div class="wrapper">
                     <div class="body">
                         <!-- 첨부 버튼 -->
                         <div id="attach">
                             <!-- <label class="genric-btn primary radius fs1em" for="uploadInputBox">사진 첨부</label> -->
                             <input id="uploadInputBox"  type="file" name="filedata" multiple />
                         </div>
                         
                     </div>
                 </div>
               
                    
                </div>  
               </div>
               <div class="offset-sm-9">
                   <div>
                       <input class="genric-btn primary radius fs1em" type="submit" value="취소">
                       <input class="genric-btn primary radius fs1em" type="submit" value="목록">
                       <input class="genric-btn primary radius fs1em" type="submit" value="작성">
                   </div>
               </div>
            </div>   
        </div>
        </div>
        </form>
      </div>
    </div> 
  </section>--%>
  
  
  
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
        
        $('#summernote').summernote('code');
    
		var pic = $('#uploadFile').val();
        console.log(pic);
        
        /* $('#kwon-submit207').on('click',function() {
        	var 
        	
        }); */
        
        
   </script>




</html>