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
	
    <section class="contact-section area-padding">
    <div class="container">
        <section class="project_gallery">
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
                         
                          <!-- 미리보기 영역 -->
                         <!--<div id="preview" class="content"></div> -->
                         
                         <!-- multipart 업로드시 영역 -->
                         <!-- <form id="uploadForm" style="display: none;" /> -->
                     </div>
                 </div>
               
                 <!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
                 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
                 <script>
                     //임의의 file object영역
                     var files = {};
                     var previewIndex = 0;
              
                     // image preview 기능 구현
                     // input = file object[]
                     function addPreview(input) {
                    	 if($("#preview") != null){
                          	$("#preview").removeChild($('.preview-box'));
                          }
                    	 
                         if (input[0].files) {
                             //파일 선택이 여러개였을 시의 대응
                             for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                                 var file = input[0].files[fileIndex];
              
                                 if (validation(file.name))
                                     continue;
              
                                 var reader = new FileReader();
                                 reader.onload = function(img) {
                                     //div id="preview" 내에 동적코드추가.
                                     //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                                     var imgNum = previewIndex++;
                                     
                                     $("#preview")
                                             .append(
                                                     "<div class=\"preview-box\" value=\"" + imgNum +"\">"
                                                             + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                                                             /* + "<p>"
                                                             + file.name
                                                             + "</p>"
                                                             + "<a href=\"javascript:\" value=\""
                                                             + imgNum
                                                             + "\" onclick=\"deletePreview(this)\">"
                                                             + "삭제" + "</a>" */ + "</div>");
                                     files[imgNum] = file;
                                 };
                                 reader.readAsDataURL(file);
                             }
                         } else
                             alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
                     }
              
                     //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
                     function deletePreview(obj) {
                         var imgNum = obj.attributes['value'].value;
                         delete files[imgNum];
                         $("#preview .preview-box[value=" + imgNum + "]").remove();
                         resizeHeight();
                     }
              
                     //client-side validation
                     //always server-side validation required
                     function validation(fileName) {
                         fileName = fileName + "";
                         var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
                         var fileNameExtension = fileName.toLowerCase().substring(
                                 fileNameExtensionIndex, fileName.length);
                         if (!((fileNameExtension === 'jpg')
                                 || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
                             alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                             return true;
                         } else {
                             return false;
                         }
                     }
              
                     $(document).ready(function() {
                         /* //submit 등록. 실제로 submit type은 아니다.
                         $('.submit a').on('click',function() {                        
                             var form = $('#uploadForm')[0];
                             var formData = new FormData(form);
                 
                             for (var index = 0; index < Object.keys(files).length; index++) {
                                 //formData 공간에 files라는 이름으로 파일을 추가한다.
                                 //동일명으로 계속 추가할 수 있다.
                                 formData.append('files',files[index]);
                             }
              
                             //ajax 통신으로 multipart form을 전송한다.
                             $.ajax({
                                 type : 'POST',
                                 enctype : 'multipart/form-data',
                                 processData : false,
                                 contentType : false,
                                 cache : false,
                                 timeout : 600000,
                                 url : '/imageupload',
                                 dataType : 'JSON',
                                 data : formData,
                                 success : function(result) {
                                     //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                                     //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                                     //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                                     if (result === -1) {
                                         alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
                                         // 이후 동작 ...
                                     } else if (result === -2) {
                                         alert('파일이 10MB를 초과하였습니다.');
                                         // 이후 동작 ...
                                     } else {
                                         alert('이미지 업로드 성공');
                                         // 이후 동작 ...
                                     }
                                 }
                                 //전송실패에대한 핸들링은 고려하지 않음
                             });
                         }); */
                         // <input type=file> 태그 기능 구현
                         $('#attach input[type=file]').change(function() {
                             addPreview($(this)); //preview form 추가하기
                         });
                     });
                 </script> -->
                    
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
  </section>
</body>

</html>