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

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<!-- include Summernote CSS -->
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css"
		rel="stylesheet">


	<!--::breadcrumb part start::-->
	<section class="breadcrumb blog_bg_freeboard">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>GALLERY</h2>
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
					<h2>
						<span>DO IT</span> &nbsp;사진게시판
					</h2>
				</div>
			</div>
		</div>

		<!-- Main content -->
		<section class="content">
			<form action="photoUpload.go" method="POST"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-6" style="margin: auto;">
						<div class="card card-outline card-info">
							<div class="card-header" style="background-color: #fff;">
								<div class="card-body" style="background-color: #fff;">
									<div class="form-group">
										<input class="form-control placeholder hide-on-focus"
											name="g_Title" type="text" placeholder="제목">
									</div>
									<!-- <div class="form-group">
						                	<input class="form-control placeholder hide-on-focus" name="g_Con" type="text" placeholder="내용">
						                </div> -->
									<div class="form-group">
										<input class="form-control placeholder hide-on-focus"
											name="g_Sg_No" type="text" placeholder="스터디 그룹 번호"
											value="${param.sgNo}" hidden>
									</div>
									<div class="form-group">
										<input class="form-control placeholder hide-on-focus"
											name="g_Writer" type="text" placeholder="작성자"
											value="${sessionScope.loginUser.mName}" hidden>
									</div>
									<div class="form-group">
										<input class="form-control placeholder hide-on-focus"
											name="g_Writer_No" type="text" placeholder="작성자 번호"
											value="${loginUser.mno}" hidden>
									</div>
									<c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 1234)%></c:set>
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyMMdd" var="today" />
									<div class="form-group">
										<input class="form-control placeholder hide-on-focus"
											name="g_Num" type="text" placeholder="작성자 번호"
											value="${today}${ran}" hidden>
									</div>
								</div>

								<!-- /.card-header -->
								<div class="card-body pad">
									<div class="mb-3">
										<textarea class="textarea" id="summernote" name="g_Con"></textarea>
									</div>
								</div>

								<div class="form-group">
									<div class="btn btn-default btn-file">
										<i class="fas fa-paperclip"></i> 첨부파일 <input
											id="uploadInputBox" type="file" name="filedata" multiple />
									</div>

									<span style="font-size: small;">5MB 이하의 이미지 파일 (JPG,
										PNG, GIF) 여러개를 첨부하실 수 있습니다.</span>

								</div>
							</div>

							<!-- /.card-body -->
							<div class="card-footer" style="background-color: #fff;">
								<div style="text-align: center;">
									<input type="submit" value="등록" class="genric-btn danger circle" style="font-size: 13px; margin-right: 10px;"> 
										<a onclick="location.href='studyDetail.go?sgNo='+${param.sgNo}+'&mno='+${loginUser.mno}">
										<input type="reset" value="취소" class="genric-btn danger circle" style="font-size: 13px;"></a>
								</div>
							</div>

						</div>
					</div>
					<!-- /.col-->
				</div>
				<!-- ./row -->
			</form>
		</section>

		<!-- /.content -->
	</section>

	<jsp:include page="../common/footer.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>

	<script>
        $('#summernote').summernote({
    	
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
   </script>
</body>

</html>