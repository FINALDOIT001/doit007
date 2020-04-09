<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.doit.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<!-- include summernote js -->
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css"
		rel="stylesheet">


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
					<h2>
						<span>&nbsp;&nbsp;이벤트   </span>수정
					</h2>
				</div>
			</section>
			<div class="row">
				<div class="col-lg-12">
					<form action="eUpdate.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="eNo" value=" ${ ev.eNo }">
						<input type="hidden" name="eWriter" value="${ loginUser.mName }">
						<input type="hidden" name="eWriterNo" value="${ loginUser.mno }">
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<input class="form-control placeholder hide-on-focus"
										name="eTitle" id="eTitle" type="text" value="${ ev.eTitle }"placeholder="제목">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<!-- <input class="form-control placeholder hide-on-focus"
										name="evFileName" id="photo" type="file" placeholder="사진"> -->
									<input type="file" name="eFileName">
									<c:if test="${ !empty ev.eOriginalFileName }">
                 							현재 업로드 파일 :
                 							<a
											href="${ contextPath }/resources/evUploadFiles/${ ev.eRenameFileName }"
											download="${ ev.eOriginalFileName }"> ${ ev.eOriginalFileName }</a>
									</c:if>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control placeholder hide-on-focus"
										name="eTag" id="eTag" type="text" value="${ ev.eTag }" placeholder="태그">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control placeholder hide-on-focus"
										name="eType" id="eType" type="text" value="${ ev.eType }"
										placeholder="타입(세미나, 웨비나, 포럼 등)">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<input class="form-control" name="eMonth" type="number" value="${ ev.eMonth }" 
									min="1" max="12" placeholder="월">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<input class="form-control" name="eDays" type="number"  value="${ ev.eDays }"
									min="1" max="31" placeholder="일">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<textarea class="form-control w-100 placeholder hide-on-focus"
										name="eIntro" id="eIntro" cols="30" rows="9"
										placeholder="인트로 내용을 입력하세요">${ ev.eIntro }</textarea>
								</div>
							</div>

							<div class="col-12">
								<div class="form-group">
									<textarea class="form-control w-100 placeholder hide-on-focus"
										name="eCon" id="summernote3" cols="30" rows="9"
										placeholder="내용"></textarea>
								</div>
							</div>
							<div class="offset-sm-9">
								<div>
									<input type="submit" id="kwon-insert-205" class="genric-btn danger circle" style="font-size: 13px;" value="수정"></input>
			                        <input type="reset" id="kwon-reset01" class="genric-btn danger circle" style="font-size: 13px;" value="취소"></input>
			                        <input type="button" id="kwon-back01" class="genric-btn danger circle" style="font-size: 13px;" value="BACK"></input>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ contact section end ================= -->


	<jsp:include page="../common/footer.jsp" />
	<script src="${contextPath}/resources/js/kwonCustom.js"></script>
	
	
	

	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>

	<script>
		$('#summernote3')
				.summernote(
						{

							tabsize : 5,
							height : 300,
							toolbar : [
									[ 'style', [ 'style' ] ],
									[ 'font', [ 'bold', 'underline', 'clear' ] ],
									[ 'color', [ 'color' ] ],
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									[ 'table', [ 'table' ] ],
									[
											'view',
											[ 'fullscreen', 'codeview', 'help' ] ], ],
							placeholder : '상세 내용을 입력해주세요'

						});

		var markupStr = '${ ev.eCon }';
		$('#summernote3').summernote('code', markupStr);
		$('#summernote3').summernote.css('display','none');

	</script>
	
	<script>
 	$('#kwon-insert-205').click(function() {
		  location.href="eUpdate.do";
	});
 
	</script>



</body>
</html>