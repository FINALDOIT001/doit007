<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Message</title>
</head>
<body>
	
	<jsp:include page="../message/MsHeader.jsp" />

	<table style="margin-left: 10%;width: 800px;height: 500px;">
		<tr>
			<td style="width:150px;height:50px;text-align:center;">RECIPIENT</td>
			<td>
				<input id="userId" class="form-control placeholder hide-on-focus" placeholder="RECIPIENT">
			</td>
		</tr>
		<tr>
			<td style="text-align:center;height:50px;">TITLE</td>
			<td>
				<input type="text" class="form-control placeholder hide-on-focus" placeholder="TITLE">
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">CONTEXT</td>
			<td>
				<textarea class="form-control w-100 placeholder hide-on-focus" cols="30" rows="9" name="CONTEXT"
				placeholder="CONTEXT"></textarea>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">
				<div class="button-group-area mt-40">
					<a href="#" class="genric-btn primary small">CANCLE</a>
				</div>
			</td>
			<td style="text-align:end;">
				<div class="button-group-area mt-40">
					<a href="#" class="genric-btn primary small">SEND</a>
				</div>
			</td>
		</tr>
	</table>
	
	<script>
	
		$(function(){
			
			var list= [
				"후엥",
				"찡찡",
				"꾸엥"
			];
			
			/* 뒤에 스플릿 달기? */
			function split(val){
				return val.split(/,\s*/);
			}
			
			/* 마지막 추출? */
			function extractLast (term){
				return split(term).pop();
			}
			
			/* 아이디 선택? */
			$('#userId').on("keydown",function(event){
				if( event.keyCode === $.ui.keyCode.TAB && $(this).autocomplete("instance").menu.active){
					event.preventDefault();
				}
			})
			.autocomplete({
				minLength: 0,
				source: function(request, response){
					response($.ui.autocomplete.filter(
							list, extractLast(request.term)));
				},
				focus: function(){
					return false;
				},
				select:function(event,ui){
					var terms = split(this.value);
					terms.pop();
					terms.push(ui.item.value);
					terms.push("");
					this.value = terms.join(", ");
					return false;
				}
			});
		});
		
	</script>
	
</body>
</html>