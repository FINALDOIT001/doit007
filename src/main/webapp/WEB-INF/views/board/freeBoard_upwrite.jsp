<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	
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
               <h2><span>DO IT</span> &nbsp;FREE BOARD 수정하기</h2>
            </div>
         </div>
      
    </div>

     <!-- Main content -->
     <section class="content">
     <form action="fbUpdate.go" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-6" style="margin: auto;">
                <div class="card card-outline card-info">
                    <div class="card-header" style="background-color: #fff;">
                        <div class="card-body" style="background-color: #fff;">
                        	<input type="hidden" name="b_no" value="${ b.b_no }">
                        	<input type="hidden" name="b_org_filename" value="${ b.b_org_filename }">
                        	<input type="hidden" name="b_re_filename" value="${ b.b_re_filename }">
                            <div class="form-group">
                              <input class="form-control" name="b_title" value="${ b.b_title }" placeholder="제목을 입력하세요.">
                            </div>
                            <div class="form-group">
                              <input class="form-control" name="b_writer" value="${ b.b_writer }" readonly>
                            </div>
                           
                    <!-- /.card-header -->
                    <div class="card-body pad">
                        <div class="mb-3">
                            <textarea class="textarea" name="b_content" placeholder="수정할 내용을 입력하세요."
                                style="width: 100%; height: 600px; font-size: 14px; line-height: 18px; border: 1px solid rgb(219, 212, 212); padding: 10px;">
${ b.b_content }
                            </textarea>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="btn btn-default btn-file">
                          <i class="fas fa-paperclip"></i> 첨부파일
                          <input type="file" name="reloadFile">
                          <c:if test="${ !empty b.b_org_filename }">
                          <br>현재 업로드한 파일 :
                          <a href="${ contextPath }/resources/buploadFiles/${ b.b_re_filename}" download="${ b.b_org_filename }">${ b.b_org_filename }</a>
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
                        <a href="fblist.go"><input type="reset" value="취소" class="genric-btn danger circle" style="font-size: 13px;"></a>
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

</body>
</html>
