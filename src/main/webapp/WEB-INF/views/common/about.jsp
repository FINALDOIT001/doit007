<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do it ABOUT</title>

<style>
   .blog_bg_about {
       background-image: url("resources/img/study3.jpg");
        background-position: top;
        background-repeat: no-repeat;
        background-size: cover;
   }
</style>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
   
   <!--::breadcrumb part start::-->
    <section class="breadcrumb blog_bg_about">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb_iner">
                  <div class="breadcrumb_iner_item">
                     <h2>DO IT?</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
    </section>
    <!--::breadcrumb part start::-->
       <section class="about_part section-padding">
         <div class="container">
         
              <div class="row">
               <div class="col-lg-12 col-md-6">
                    <div>
                     <img src="${contextPath}/resources/img/about_page.jpg" alt="">
                  </div>
               </div>
            </div>
         </div>
      </section>
    

   <jsp:include page="../common/footer.jsp"/>

</body>
</html>