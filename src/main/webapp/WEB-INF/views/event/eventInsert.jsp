<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.doit.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
		<!-- include summernote js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
	

   	<!-- SEO jungdo CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/SEO.css">
	
	
	<!--::breadcrumb part start::-->
   <section class="breadcrumb blog_bg">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb_iner">
                  <div class="breadcrumb_iner_item">
                     <h2>contact</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--::breadcrumb part start::-->

  <!-- ================ contact section start ================= -->
  <section class="contact-section area-padding">
    <div class="container">
        <section class="project_gallery">
            <div class="project_gallery_tittle">
                <h2><span>글</span> 작성</h2>
            </div>
        </section>
      <div class="row">
        <div class="col-lg-12">
          <form class="form-contact contact_form" action="eventInsert.do" method="post" id="contactForm" novalidate="novalidate">
            <div class="row">
               <div class="col-sm-6">
                  <div class="form-group">
                     <input class="form-control placeholder hide-on-focus" name="photo" id="photo" type="file" placeholder="사진">
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="form-group">
                     <input class="form-control placeholder hide-on-focus" name="eTag" id="eTag" type="text" placeholder="태그">
                  </div>
               </div>
               <div class="col-12">
                  <div class="form-group">
                     <input class="form-control placeholder hide-on-focus" name="eTitle" id="eTitle" type="text" placeholder="제목">
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="form-group">
                     <input class="form-control placeholder hide-on-focus" name="eType" id="eType" type="text" placeholder="타입(세미나, 웨비나, 포럼 등)">
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="form-group">
                     <input class="form-control" name="eMonth" type="number" min="1" max="12" placeholder="월"> 
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="form-group">
                     <input class="form-control" name="eDays" type="number" min="1" max="31" placeholder="일">
                  </div>
               </div>

               <div class="col-12">
                  <div class="form-group">
                     <textarea class="form-control w-100 placeholder hide-on-focus" name="message" id="summernote3" cols="30" rows="9" placeholder="내용"></textarea>
                  </div>
               </div>
               <div class="offset-sm-9">
                   <div>
                       <input class="genric-btn primary radius fs1em" type="submit" value="작성">
                       <input class="genric-btn primary radius fs1em" type="submit" value="취소">
                       <input class="genric-btn primary radius fs1em" type="submit" value="목록">
                   </div>
               </div>
               
            </div>
        </div>
         </form>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ contact section end ================= -->


	<jsp:include page="../common/footer.jsp"/>
	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>

	<script>
      $('#summernote3').summernote({
         
         tabsize: 5,
         height: 300,
         toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['view', ['fullscreen', 'codeview', 'help']],
         ],
         placeholder: '상세 내용을 입력해주세요'

      });
      
      $('#summernote3').summernote('code');
      
      console.log(markupStr);
	</script>
	


</body>
</html>