<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${contextPath}/resources/css/MSstyle_inseok.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/MSstyle_inseok2.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/MSbootstrap.min_inseok.css">

<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<title>MESSAGE</title>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

</head>
<body>

	<div>
		<form action="studyCheck.do" method="POST">

			<div>
				<a>출석 날짜 : </a><a id="ssDate">${ssDayDate}</a>
			</div>
			<!-- CSS 적용 예정 -->
			<input type="hidden" value="${ssNo}" name="ssNo"> <input
				type="hidden" value="${sgNo}" name="sgNo"> <input
				type="hidden" value="${sgWriterNo}" name="sgWriterNo"> <input
				type="hidden" value="${usermno}" name="usermno">


			<table id="table2" style="margin-left: 11%; width: 700px;"
				class="table table-bordered">

				<c:if test="${empty sc}">

					<thead>
						<tr style="text-align: center;">
							<th width="5%" class="th1">No.</th>
							<th width="20%" class="th1">ID</th>
							<th width="20%" class="th1">이름</th>
							<th width="15%" class="th1">출석여부</th>

						</tr>
					</thead>

					<tbody>
						<c:forEach var="ml" items="${ml}">
							<tr style="text-align: center;">
								<td align="center" style="text-align: center;">${ml.mno}</td>
								<td align="center" style="text-align: center;">${ml.mId}</td>
								<td align="center" style="text-align: center;">${ml.mName}</td>
								<td align="center" style="text-align: center;"><input
									id="${ml.mno}" type="checkbox" name="checked" value="${ml.mno}">
								</td>

							</tr>
						</c:forEach>
					</tbody>

				</c:if>

				<c:if test="${!empty sc}">

					<thead>
						<tr style="text-align: center;">
							<th width="5%" class="th1">No.</th>
							<th width="20%" class="th1">ID</th>
							<th width="20%" class="th1">이름</th>
							<th width="15%" class="th1">출석여부</th>
							<th width="15%" class="th1">출석확인</th>


						</tr>
					</thead>

					<tbody>
						<c:forEach var="sc" items="${sc}">
							<tr style="text-align: center;">
								<td align="center" style="text-align: center;">${sc.scMno}</td>
								<td align="center" style="text-align: center;">${sc.userId}</td>
								<td align="center" style="text-align: center;">${sc.userName}</td>
								<td align="center" style="text-align: center;"><input
									id="${sc.scMno}" type="checkbox" name="checked"
									value="${sc.scMno}"></td>
								<td align="center" style="text-align: center;">${sc.scCheck}</td>

							</tr>
						</c:forEach>
					</tbody>
				</c:if>

			</table>
		</form>
		<c:if test="${usermno == sgWriterNo}">
			<div class="button-group-area mt-40">
				<c:if test="${empty sc}">
					<button id="doitCheck" class="genric-btn primary">확인</button>
				</c:if>
				<c:if test="${!empty sc}">
					<button id="doitCheckUpdate" class="genric-btn primary">수정</button>
				</c:if>
			</div>
		</c:if>



	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/MSbootstrap.min_inseok.js"></script>

	<script>
		$(window).on('load', function() {
			window.resizeTo(850, 700);

		});

		var ssNo = $("input[name=ssNo]").val();
		var sgNo = $("input[name=sgNo]").val();
		var scDate = $("#ssDate").text();

		$("#doitCheck").on(
				"click",
				function() {

					var checkmember = [];
					var checklist = [];

					$("input:checkbox[name='checked']").each(function() {
						checkmember.push($(this).val());
						if ($(this).is(":checked") == true) {
							checklist.push($(this).val());
						}

					});
					console.log(checklist);
					console.log(checkmember);
					jQuery.ajaxSettings.traditional = true;

					$.ajax({
						url : 'doitCheckInsert.go',
						type : "post",
						data : {
							checkmember : checkmember,
							checklist : checklist,
							ssNo : ssNo,
							sgNo : sgNo,
							scDate : scDate
						},
						success : function(data) {
							console.log(data);
							if (data == "ok") {
								alert("출첵 완료");
								alert("출첵 안하면 니 호두 내가 냠냠");
								window.close();
							} else {
								alert("출첵 실패");
							}
						},
						error : function(reqeust, status, errorDate) {
							alert("error code : " + reqeust.status + "\n"
									+ "message : " + reqeust.responseText
									+ "error : " + errorDate);
						}

					})

				});

		$("#doitCheckUpdate").on(
				"click",
				function() {
					var changelist = [];

					$("input:checkbox[name='checked']").each(function() {
						if ($(this).is(":checked") == true) {
							changelist.push($(this).val());
						}
					});
					jQuery.ajaxSettings.traditional = true;

					$.ajax({
						url : 'doitCheckUpdate.go',
						type : "post",
						data : {
							changelist : changelist,
							ssNo : ssNo

						},
						success : function(data) {
							console.log(data);
							if (data == "ok") {
								alert("출첵 수정 완료");
								alert("출첵 안한사람 호두 너랑 나랑 냠냠");
								window.close();
							} else {
								alert("출첵 실패");
							}
						},
						error : function(reqeust, status, errorDate) {
							alert("error code : " + reqeust.status + "\n"
									+ "message : " + reqeust.responseText
									+ "error : " + errorDate);
						}

					})

				});
	</script>

	<script src="https://kit.fontawesome.com/849a01517e.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<script src="${contextPath}/resources/js/contact.js"></script>



</body>
</html>