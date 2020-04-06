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
	<jsp:include page="../common/header.jsp" />



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
					<h2>
						<span>DO IT</span> &nbsp;FREE BOARD
					</h2>
				</div>
			</div>
			<table class="" width="1244" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<th width="134" height="50" class="btLine">제목</th>
					<td colspan="5" width="1107" height="50" class="btLine">스터디
						어떤가요??</td>
					<!-- 제목 -->
				</tr>
				<tr>
					<th width="134" height="50">작성자</th>
					<td width="208" height="50">hyunzzang</td>
					<!-- 작성자 -->
					<th width="134" height="50">작성일</th>
					<td width="208" height="50">2020-03-15</td>
					<!-- 작성일 -->
					<th width="134" height="50">조회수</th>
					<td width="208" height="50">10</td>
					<!-- 조회수 -->
				</tr>
				<tr>
					<td colspan="6">
						<!-- 본문 내용 --> <textarea name="" class="freeboard_content"
							readonly>
스터디 하고 싶은데 어떤지 궁금해요~!~!               
           </textarea>
					</td>
				</tr>
			</table>

			<!-- comment area start -->
			<div class="comments-area">
				<hr>
				<div class="comment_wrap">
					<div class="comment_person"
						style="font-size: 16px; padding-bottom: 10px; margin-left: 10px;">
						박스터</div>
					<div class="com" style="margin-left: 15px;">3등,,</div>
				</div>
				<hr>
				<div class="comment_wrap">
					<div class="comment_person"
						style="font-size: 16px; padding-bottom: 10px; margin-left: 10px;">
						김스터디</div>
					<div class="com" style="margin-left: 15px;">2등,,</div>
				</div>
				<hr>
				<div class="comment_wrap" style="margin-bottom: 20px;">
					<div class="comment_person"
						style="font-size: 16px; padding-bottom: 10px; margin-left: 10px;">
						송스터</div>
					<div class="com" style="margin-left: 15px;">1등,,!!~!</div>
				</div>
				<hr>



				<div class="comment-form">
					<form class="form-contact comment_form" action="#" id="commentForm"></form>
					<div class="row">
						<div class="col-10">
							<div class="form-group">
								<textarea class="form-control w-100 placeholder hide-on-focus"
									name="comment" id="comment" cols="30" rows="4"
									placeholder="댓글을 입력해 주세요."></textarea>
							</div>
						</div>
						<div class="col-2" style="margin-top: 30px;">
							<div class="form-group">
								<button type="submit" class="genric-btn danger radius"
									style="font-size: 13px;">등록</button>
							</div>
						</div>
					</div>
					<!-- comment area end -->


					<div class="not_btn" style="margin-top: 20px; text-align: center;">
						<a href="hyun_freeboard.html" class="genric-btn danger circle"
							style="font-size: 13px;">목록</a>
					</div>
				</div>
	</section>


	<jsp:include page="../common/footer.jsp" />

</body>
</html>
