<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	   <!-- summernote -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/summernote/summernote-bs4.css">
	



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
               <h2><span>DO IT</span> &nbsp;NOTICE</h2>
            </div>
         </div>
      
    </div>

     <!-- Main content -->
     <section class="content">
        <div class="row">
            <div class="col-md-6" style="margin: auto;">
                <div class="card card-outline card-info">
                    <div class="card-header" style="background-color: #fff;">
                        <div class="card-body" style="background-color: #fff;">
                            <div class="form-group">
                              <input class="form-control" placeholder="제목을 입력하세요.">
                            </div>
                            <div class="form-group">
                              <input class="form-control" value="admin" readonly>
                            </div>
                           
                    <!-- /.card-header -->
                    <div class="card-body pad">
                        <div class="mb-3">
                            <textarea class="textarea" placeholder="내용을 입력하세요."
                                style="width: 100%; height: 600px; font-size: 14px; line-height: 18px; border: 1px solid rgb(219, 212, 212); padding: 10px;"></textarea>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="btn btn-default btn-file">
                          <i class="fas fa-paperclip"></i> 첨부파일
                          <input type="file" name="attachment">
                        </div>
                        <span style="font-size: small;">5MB 이하의 이미지 파일 (JPG, PNG, GIF) 1개를 첨부하실 수 있습니다.</span>
                    </div>
                    </div>
                    <!-- /.card-body -->
                    <hr>
                    <div class="card-footer" style="background-color: #fff;">
                      <div style="text-align: center;">
                        <button type="submit" class="genric-btn danger circle" style="font-size: 13px; margin-right: 10px;"><i class="far fa-envelope"></i> 등록</button>
                        <button type="reset" class="genric-btn danger circle" style="font-size: 13px;" onclick="location.href='moveNT.go'"><i class="fas fa-times"></i> 취소</button>
                      </div>
                    </div>
                    <!-- /.card-footer -->
                </div>
            </div>
            <!-- /.col-->
        </div>
        <!-- ./row -->
    </section>
    <!-- /.content -->

   	</section>
   	
	<jsp:include page="../common/footer.jsp"/>
	
    <script src="${contextPath}/resources/plugins/summernote/summernote-bs4.min.js"></script>
    <script>
         $(function(){
            $('.textarea').summernote()
         });
    </script>
	

</body>
</html>
