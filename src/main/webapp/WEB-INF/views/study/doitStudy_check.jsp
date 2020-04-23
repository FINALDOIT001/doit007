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
				<a>출석 날짜 : ${ssDayDate}</a>
			</div>
			<!-- CSS 적용 예정 -->
			<input type="hidden" value="${ssNo}"> <input type="hidden"
				value="${sgNo}">

			<table id="table2" style="margin-left: 11%; width: 700px;"
				class="table table-bordered">

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
							<td align="center" style="text-align: center;">
							<input id="${ml.mno}" type="checkbox" name="checked" value="${ml.mno}">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<div class="button-group-area mt-40">
				<button id="doitCheck" class="genric-btn primary">확인</button>
			</div>



	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/MSbootstrap.min_inseok.js"></script>

	<script>
	
	
	
		$(window).on('load',function(){
			window.resizeTo(850, 700);
		});
		
		
		$("#doitCheck").on("click",function(){
			
			var Arr = new Array();
			
			$("input:checkbox[name='checked']").each(function(){
				if($(this).is(":checked") == true) {
					
					var i={
					 mno : $(this).parents("tr").children("td").eq(0).text(),
					 mId:$(this).parents("tr").children("td").eq(1).text(),
					mName:$(this).parents("tr").children("td").eq(2).text()
					}
				}
				Arr.push(i);
				});
			
			console.log(Arr);
			
			
		});
		
	</script>

	<script src="https://kit.fontawesome.com/849a01517e.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<script src="${contextPath}/resources/js/contact.js"></script>



</body>
</html>