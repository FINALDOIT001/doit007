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
	
	<!-- Kwon CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/kwonCustom.css">

	<!-- 데이타테이블 CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/datatables.css">
	
	<!-- include Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
	
	
	
	
	
   <!--::project part start::-->
   <section class="about_part section-padding ">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_tittle">
                    <h2><span>DO IT</span> 질문하기</h2>
                </div>
                <form action="insertQna.do" id="kwon-Form01" enctype="multipart/form-data" method="POST">
                    <input type="hidden" name="qWriterNo" value="${ loginUser.mno }">
                    <input type="hidden" name="qWriter" value="${ loginUser.mId }">
                    <table border="1" class="kwon-table1" cellpadding="10px">
                        
                        <tr>
                           <td colspan="1" class="th02">사진 추가</td>
                           <td colspan="2"><input id="bsFile" type="file" name="qFileName"></td>
                           <td class="th02">*분류</td>
                            <td colspan="3">
                                 <select name="qCategory" style="text-align: right;" required>
                                    <option value="">category</option>
                                    <option value="JAVA">JAVA</option>
                                    <option value="JavaScript">JavaScript</option>
                                    <option value="Pyhton">파이썬</option>     
                                    <option value="Spring">스프링</option>
                                    <option value="C-like">C-like 계열</option>
                                    <option value="HTML">HTML</option>
                                    <option value="기타">기타</option>
                                </select> 
                            </td>
                       </tr>
                        <td class="th02" colspan="1">*제목</td>
                        <td class="td02" colspan="4"><input type="text" name="qTitle" class="tdin02" required></td>
                        
                    </table>
                    <div id="kwon-area1">
                        <textarea class="form-control" id="summernote4" name="qCon"></textarea>
                    </div>
        
                    <div style="text-align:center;">
                        <input type="submit" id="kwon-submit07" class="genric-btn danger circle" style="font-size: 13px;" value="질문하기"></input>
                        <input type="reset" id="kwon-reset01" class="genric-btn danger circle" style="font-size: 13px;" value="취소하기"></input>
                        <input type="button" id="kwon-back01" class="genric-btn danger circle" style="font-size: 13px;" value="뒤로가기"></input>
                    </div>
                </form>

            </div>
        </div>
    </div>
</section>
<!--::project part end::-->
	

	<jsp:include page="../common/footer.jsp"/>
	
		<!-- dataTables js -->
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<!-- <script src="js/datatables-min.js"></script> -->
	<script src="${contextPath}/resources/js/kwonCustom.js"></script>
	
    <!-- include summernote js -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
    
	
	   <script>
	   
	   $(document).ready(function() {
		   $('#summernote4').summernote({
			   height:600,
		     popover: {
		       image: [

		         // This is a Custom Button in a new Toolbar Area
		         ['custom', ['examplePlugin']],
		         ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
		         ['float', ['floatLeft', 'floatRight', 'floatNone']],
		         ['remove', ['removeMedia']]
		       ]
		     }
		   });
		 });
	   
   </script>
	

</body>
</html>
