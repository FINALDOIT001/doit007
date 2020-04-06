<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㄹ</title>
<head>

<link rel="stylesheet" href="${contextPath}/resources/css/jungho.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/kwonCustom.css">
<script src="${contextPath}/resources/js/kwonCustom.js"></script>
<script src="${contextPath}/resources/js/jungho.js">
	
</script>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>

</head>

<body>

	<jsp:include page="../common/header.jsp" />


	<!--::team part end::-->
	<section class="about_part section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="filebox">
						<div id="map" style="width: 100%; height: 450px;"></div>
					</div>

				</div>
				<div class="offset-lg-1 col-lg-5 col-sm-8 col-md-6">
					<div class="about_text">
						<form action="" class="was-validated">
							<!-- 폼 태그 시작 부분 나중에 추가-->

							<div class="row">
								<div class="col">
									<input type="text" class="form-control" placeholder="공부 주제 입력"
										name="studytitle" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">공부 주제 입력</div>
									<input type="text" class="form-control" vlaue="니돈먹튀"
										name="userId" hidden>
									<!-- 방 개설 자 아이디 자동 입력 구간-->
								</div>
							</div>
							<br>


							<div class="row">
								<div class="col">
									<input type="time" class="form-control" name="stime" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">만남 시간 설정</div>
								</div>
								<div class="col">
									<input type="date" class="form-control" name="scdate" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">스터디 일정 설정</div>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col">
									<input type="text" class="form-control addressmagin"
										placeholder="주소 자동 입력" name="addddd" required>
								</div>
								<div class="col">
									<input type="button" class="genric-btn danger radius"
										style="margin-bottom: 10px; font-size: 13px;" value="우편번호 찾기">
									</button>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<input type="text" class="form-control addressmagin"
										placeholder="주소 자동 입력" name="addd" required>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<input type="text" class="form-control" placeholder="주소 상세 입력"
										name="adddd" required>
								</div>
							</div>
							<br> <br>
							<br>
					</div>
				</div>
			</div>
			<hr>
			<div
				style="text-align: center; padding-top: 20px; padding-bottom: 20px;">
				<h2>About Schedule</h2>
			</div>
			<div id="summernote"></div>
			<br>
			<div style="text-align: center;">
				<button type="submit" class="genric-btn danger circle"
					style="font-size: 13px; margin-right: 10px;">등록</button>
				<button type="reset" class="genric-btn danger circle"
					style="font-size: 13px;">취소</button>
			</div>

			</form>

		</div>
		</div>
	</section>


	<script>
		$('#summernote').summernote(
				{
					placeholder : '스터디 스케줄을 작성해주세요',
					tabsize : 2,
					height : 600,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
				});

		var markupStr = $('#summernote').summernote('code');
	</script>




	<script>
		var mapOptions = {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
		};
		var map = new naver.maps.Map('map', mapOptions);
	</script>

	<jsp:include page="../common/footer.jsp" />






</body>

</html>