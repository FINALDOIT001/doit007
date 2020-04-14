<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/hyun.css">
<meta charset="UTF-8">
<title>MESSAGE VIEW</title>
</head>
<body>
	
	<jsp:include page="../message/MsHeader.jsp" />

	<input type="hidden" id="userId" value="${sessionScope.loginUser.mId}">
	
	<table class="" style="margin-left: 6.5%;width:300px;" border="0" cellspacing="0" ellpadding="0">

		<tr>
			<th width="50px" height="50px" class="btLine">제목</th>
			<td colspan="5" width="250px" height="50px" class="btLine">${ m.msTitle }</td>
			<!-- 제목 -->
		</tr>
		
		<tr>
			<th width="20px" height="50px">보낸사람</th>
			<td width="80px" height="50px">${ m.msSender }</td>

			<th width="20px" height="50px">보낸일</th>
			<td width="80px" height="50px">${ m.msDate1 }</td>
			
			<c:choose>
			<c:when test="${ m.msCheck eq 'N' }">
				<th width="20px" height="50px">읽은일</th>
				<td width="80px" height="50px">읽지 않음.</td>
			</c:when>
			<c:otherwise>
				<th width="20px" height="50px">읽은일</th>
				<td width="80px" height="50px">${ m.msDate2 }</td>
			</c:otherwise>
			</c:choose>
		</tr>
	
		<tr>
			<td colspan="6">
				<textarea name="" class="freeboard_content" style="height:250px;width:800px;" readonly>   
					${ m.msContext }
   				</textarea>
			</td>
		</tr>
		
		
		<tr>
			<c:choose>
				<c:when test="${ sessionScope.loginUser.mId eq m.msSender }">
					
					<td style="text-align:end;" colspan="6">
						<div class="button-group-area mt-40">
							<a href="#" id="msDeleteBtn" class="genric-btn primary small" style="vertical-align: super;margin-top: 2%;margin-bottom: 2%;margin-right: 10%;">DELETE</a>
						</div>
					</td>
					
				</c:when>
				<c:otherwise>
					
					<td style="text-align:left;" colspan="3">
						<div class="button-group-area mt-40">
							<a href="#" id="msAnswerBtn" class="genric-btn primary small" style="vertical-align: super;margin-top: 2%;margin-bottom: 2%;margin-left: 10%;">ANSWER</a>
						</div>
					</td>
					
					
					<td style="text-align:end;" colspan="3">
						<div class="button-group-area mt-40">
							<a href="#" id="msDeleteBtn" class="genric-btn primary small" style="vertical-align: super;margin-top: 2%;margin-bottom: 2%;margin-right: 10%;">DELETE</a>
						</div>
					</td>
					
				</c:otherwise>
			</c:choose>
		</tr>
		
	</table>
	
	<script>
		
		$(function(){
			
			$('#msDeleteBtn').on("click",function(){
				
				var check = confirm("삭제하시겠습니까?");
				var listType = "${ Type }";
				var userId = $('#userId').val();
				
				if(check){
					
					var delList = new Array();
					var delmsNo = ${ m.msNo };
					delList.push(delmsNo);
					
					$.ajax({
						url:"MSdelete.ms",
						method:"POST",
						traditional:true,
						data:{
							delList:delList
						},type:"post",
						success:function(data){
							
							alert("메세지가 삭제되었습니다.");
							location.href = "ListPage.ms?userID="+ userId + "&Type=" + listType;
							
						},error:function(request, status, errorData){
							alert("error code : " + request.status + "\n"
									+ "message : " + request.responseText
									+ "error : " + errorData);
						}
					});
					
				}
				
			});
			
			
			$('#msAnswerBtn').on("click",function(){
				
				var recipientID = "${ m.msSender }";
				
				location.href = "newMS.ms?recipientID=" + recipientID;
				
			});
			
			
			
			
		});
		
		
	</script>
	
</body>
</html>