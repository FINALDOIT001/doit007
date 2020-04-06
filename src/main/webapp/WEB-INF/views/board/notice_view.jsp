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
           <td colspan="5" width="1107" height="50" class="btLine">공지사항입니당5</td> <!-- 제목 -->
       </tr>
       <tr>
           <th width="134" height="50">작성자</th>
           <td width="208" height="50">admin</td> <!-- 작성자 -->
           <th width="134" height="50">작성일</th> 
           <td width="208" height="50">2020-01-19</td> <!-- 작성일 -->
           <th width="134" height="50">조회수</th>
           <td width="208" height="50">10</td> <!-- 조회수 -->
       </tr>
       <tr>
           <td colspan="6">                              
<!-- 본문 내용 -->	<textarea name="" class="notice_content" readonly>
공지사항입니다~~               
           </textarea>
           </td>
        </tr>
       </table>
       <div class="not_btn" style="margin-top: 20px; text-align: center;"> 
            <a href="moveNT.go" class="genric-btn danger circle" style="font-size: 13px;">목록</a>
       </div>
    </div>
   </section>
  
	

	<jsp:include page="../common/footer.jsp"/>

</body>
</html>
