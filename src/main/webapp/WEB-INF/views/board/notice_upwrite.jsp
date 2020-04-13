<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice 수정하기</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<!-- include summernote CSS -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
	

   <!--::breadcrumb part start::-->
   <section class="breadcrumb blog_bg">
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
               <h2><span>DO IT</span> &nbsp;NOTICE 수정하기</h2>
            </div>
         </div>
      
    </div>

     <!-- Main content -->
     <section class="content">   
      <form action="nUpdate.go" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-6" style="margin: auto;">
                <div class="card card-outline card-info">
                    <div class="card-header" style="background-color: #fff;">
                        <div class="card-body" style="background-color: #fff;">
                       		<input type="hidden" name="n_no" value="${ n.n_no }">
                        	<input type="hidden" name="n_org_filename" value="${ n.n_org_filename }">
                        	<input type="hidden" name="n_re_filename" value="${ n.n_re_filename }">
                            <div class="form-group">
                              <input class="form-control" name="n_title" value="${ n.n_title }" placeholder="제목을 입력하세요.">
                            </div>
                            <div class="form-group">
                              <input class="form-control" name="n_writer" value="${ n.n_writer }" readonly>
                            </div>
                           
                    <!-- /.card-header -->
                    <div class="card-body pad">
                        <div class="mb-3">
                            <input type="textarea" class="" id="summernote" name="n_content">
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="btn btn-default btn-file">
                          <i class="fas fa-paperclip"></i> 첨부파일
                          <input type="file" name="reloadFile">
                          <c:if test="${ !empty n.n_org_filename }">
                          <br>현재 업로드한 파일 :
                          <a href="${ contextPath }/resources/buploadFiles/${ n.n_re_filename}" download="${ n.n_org_filename }">${ n.n_org_filename }</a>
                          </c:if>
                        </div>
                        <br>
                        <span style="font-size: small;">5MB 이하의 이미지 파일 (JPG, PNG, GIF) 1개를 첨부하실 수 있습니다.</span>
                    </div>
                    </div>
                    <!-- /.card-body -->
                    <hr>
                    <div class="card-footer" style="background-color: #fff;">
                      <div style="text-align: center;">
                        <input type="submit" value="수정" class="genric-btn danger circle" style="font-size: 13px; margin-right: 10px;">
                        <a href="nlist.go"><input type="reset" value="취소" class="genric-btn danger circle" style="font-size: 13px;"></a>
                      </div>
                    </div>
                    <!-- /.card-footer -->
                </div>
            </div>
            <!-- /.col-->
        </div>
        <!-- ./row -->
        </form>
    </section>
    <!-- /.content -->

   	</section>
   	
	<jsp:include page="../common/footer.jsp"/>
	
    <!-- summernote js -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
	
	<script>
		$('#summernote').summernote(
				{

					tabsize : 5,
					height : 300,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ],
					placeholder : '상세 내용을 입력해주세요'

				});
		var markupStr = '${n.n_content}';
		$('#summernote').summernote("code", markupStr);
		$('#summernote').summernote().css('display', 'none');
	</script>
	

</body>
</html>
