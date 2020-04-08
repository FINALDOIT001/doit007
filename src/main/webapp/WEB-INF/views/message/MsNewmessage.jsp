<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>Write Message</title>
</head>
<body>
	
	<jsp:include page="../message/MsHeader.jsp" />
	
	<input type="hidden" id="writerId" value="${ sessionScope.loginUser.mId }">
	
	<table style="margin-left: 5%;width: 800px;height: 500px;">
		<tr>
			<td style="width:150px;height:50px;text-align:center;">RECIPIENT</td>
			<td>
				<input id="userId" class="form-control placeholder hide-on-focus" placeholder="RECIPIENT">
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
	
	<script>
	
		$(function(){
			var wId = ${ sessionScope.loginUser.mno };
			var list= new Array();
			var writerId = $('#writerId').val();

			/* 자신을 제외한 등록되어있는 회원 목록 불러오기 *//* 자신을 제외한 등록되어있는 회원 목록 불러오기 */
			
			$.ajax({
				url:"recipientList.ms",
				data:{
					wId: wId
				},dataType:"json",
				success:function(data){
					
					console.log(data);
					
					if(data != null){
						for(var i in data){
							var userInfo = data[i].mId + "(" + data[i].mName + ")";
							list.push(userInfo);
						}
					}else{
						list.push("가입된 그룹 없음.");
					}
	
				},error:function(request, status, errorData){
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText
							+ "error : " + errorData);
				}
				
			});
			
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
					this.value = terms.join(",");
					return false;
				}
			});
			
			/* 취소 버튼을 누르면 물어보고 보내기 *//* 취소 버튼을 누르면 물어보고 보내기 */
			
			$('#msCancle').on("click",function(){
				
				var check = confirm("작성한 내용이 있다면 삭제됩니다. 취소 하시겠습니까?");
				
				if(check){
					location.href="newMS.ms";
				}
			});
			
			/* Ajax로 SEND 누르면 저장하기. *//* Ajax로 SEND 누르면 저장하기. */
			
			var successList= new Array();
			var failList= new Array();
			
			$('#msSend').on("click",function(){
				
				var check2 = confirm("메세지를 보내시겠습니까?");
				
				send(check2);
				
				if(check2){
					location.href="newMS.ms";
				}
				
			});
			
			
			
			
			
			
			
			function send(check2){
				
				if(check2){
					var list = new Array();
					var recipient = $('#userId').val();
					var title = $('#msTitle').val();
					var context = $('#msContext').val();
					var check3 = false;
					var check4 = false;
					
					if(title == ""){
						var check3 = confirm("제목이 없습니다. 그대로 진행합니까?");
					}
					
					if(context == ""){
						var check4 = confirm("본문이 없습니다. 그대로 진행합니까?");
					}
					
					if(recipient == ""){
						alert("수신하는 사람의 아이디는 반드시 지정되어야 합니다.");
						return;
					}else{
						/* 받은 userId 배열로 쪼개서 넘기기 *//* 받은 userId 배열로 쪼개서 넘기기 */
						
						if( ($('#userId').val().indexOf(',') == -1) || ($('#userId').val().split(',').length<2) ){
							list.push(recipient);
						}else{
							recipient = $('#userId').val().split(',');
							
							for(var i=0; i<(recipient.length-1); i++){
								var index = recipient[i].indexOf('(');
								
								if(index == -1){
									list.push(recipient[i]);
								}else{
									var userId = recipient[i].substring(0,index);
									list.push(userId);
								}
								
							}
							
							
						}
						
						console.log(list);

						var uniq = list.reduce(function(a,b){
							if (a.indexOf(b) < 0 ) a.push(b);
							return a;
						  },[]);
						
						// 제거
						console.log(uniq);
						// 원본
						console.log(list);
						
						for(var i=0; i<uniq.length; i++){
							
							var checkID = uniq[i];
							var check = "";
							console.log(i + "번째로 들어오는 ID : "+checkID);
							
							var title = $('#msTitle').val();
							var context = $('#msContext').val();
							
							$.ajax({
								url:"msCheckId.ms",
								data:{
									sender:writerId,
									checkID:checkID,
									title:title,
									context:context
								},dataType:"json",
								success:function(data){
									
									if( data[0] == "ok"){
										
										console.log("성공 : " + data[1] );
										successList.push(data[1]);
									}else{
										
										console.log("실패 : " + data[1] );
										failList.push(data[1]);
										
										alert(data[1] + "에게 메시지 보내기 실패 [존재하지 않는 아이디]");
									}
									
									
								},error:function(request, status, errorData){
									alert("error code : " + request.status + "\n"
											+ "message : " + request.responseText
											+ "error : " + errorData);
								}
								
							});
							
							
							
						}
						
					}
					
					
					
				}else{
					
				}
			}
			
			
			
			
			
			
			
			
		});
		
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>