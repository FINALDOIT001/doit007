<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${contextPath}/resources/css/datatables.css">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
</head>
<body>
	
	<input type="hidden" id="hNo" value="${ h.hNo }">
	<input type="hidden" id="hmNo" value="${ h.hmNo }">
	<input type="hidden" id="hoduNum" value="${ h.hoduNum }">
	<input type="hidden" id="hType" value="환불">
	
	<table class="table">
		<thead>
			<tr>
				<th width="15%" style="text-align:center;">호두</th>
				<th width="15%" style="text-align:center;">환불 금액</th>
				<th width="15%" style="text-align:center;">구매 날짜</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align:center;">내가 가진 호두 : </td>
				<td style="text-align:center;">${ h.member.mhodu }개</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align:center;">${ h.hoduNum }&nbsp;개</td>
				<td style="text-align:center;">${ h.hPrice }&nbsp;원</td>
				<td style="text-align:center;">${ h.hDate }</td>
			</tr>
			<tr>
				<td style="text-align:center;">
					<button onclick="cancle();" class="genric-btn danger" style="font-size:10px;padding:0px 20px;line-height:20px;">취소</button>
				</td>
				<td style="text-align:center;"></td>
				<td style="text-align:center;">
					<button onclick="refund();" class="genric-btn danger" style="font-size: 10px;padding:0px 20px;line-height:20px;">환불</button>
				</td>
			</tr>
		</tbody>
	</table>
	
	
	<script src="${contextPath}/resources/vendor_inseok/jquery/jquery.min.js"></script>
	<script>
	
		function cancle(){
			
			var check = confirm("환불을 취소하시겠습니까?");
			
			if( check ){
				window.close();
			}
		}
		
		
		function refund(){
			/* 내가 가진 호두 */
			var mhodu = ${ h.member.mhodu };
			/* 환불하려는 호두 */
			var hoduNum = $('#hoduNum').val();
			/* 호두 환불 타입 정하기 */
			var hType = $('#hType').val();
			
			var check = confirm("환불을 진행하시겠습니까?");
			var check2 = false;
			
			if( mhodu < hoduNum ){
				alert("보유신 호두(" + mhodu + "개)보다 환불하려는 호두("+ hoduNum +"개)가 많습니다.");
			}else{
				check2 = true;
			}
			
			if( check && check2 ){
				
				var hNo = $('#hNo').val();
				var hmNo = $('#hmNo').val();
				
				$.ajax({
					url:"hRefund.go",
					type:"post",
					data:{
						hNo:hNo,
						hmNo:hmNo,
						hoduNum:hoduNum,
						hType:hType
					},dataType:"json",
					success:function(data){
						
						console.log(data);
						
						if( data > 0 ){
							
							alert("환불이 완료되었습니다.");
							window.close();
							opener.location.reload();
							
						}
						
						
					},error:function(request, status, errorData){
						alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText
								+ "error : " + errorData);
					}
					
				});
				
				
				
			}
			
		}
	</script>
</body>
</html>