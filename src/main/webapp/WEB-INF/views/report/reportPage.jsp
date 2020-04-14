<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${contextPath}/resources/css/MSstyle_inseok.css">
<link rel="stylesheet" href="${contextPath}/resources/css/MSstyle_inseok2.css">
<link rel="stylesheet" href="${contextPath}/resources/css/MSbootstrap.min_inseok.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<title>Report User</title>
</head>
<body>

	<table style="margin-left: 13%;width: 600px;height: 500px;margin-top: 5%;">
		<tr>
			<td style="width:150px;height:50px;text-align:center;">REPORT USER</td>
			<td>
				<b style="color:red;">${ rpUserID }</b>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;height:50px;">TITLE</td>
			<td>
				<input id="msTitle" type="text" class="form-control placeholder hide-on-focus" placeholder="TITLE">
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">CONTEXT</td>
			<td>
				<textarea id="msContext" class="form-control w-100 placeholder hide-on-focus" cols="30" rows="9" name="CONTEXT"
				placeholder="CONTEXT"></textarea>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">
				<div class="button-group-area mt-40">
					<a href="#" id="msCancle" class="genric-btn primary small">CANCLE</a>
				</div>
			</td>
			<td style="text-align:end;">
				<div class="button-group-area mt-40">
					<a href="#" id="msSend" class="genric-btn primary small">SEND</a>
				</div>
			</td>
		</tr>
	</table>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/MSbootstrap.min_inseok.js"></script>
	<script>
		$(window).on('load',function(){
			window.resizeTo(850, 700);
		});
	</script>
	
</body>
</html>