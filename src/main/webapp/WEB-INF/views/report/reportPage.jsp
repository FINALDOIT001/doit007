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

<style>

	input[type="radio"]{
		display:none;
	}
	input[type="radio"]+label{
		display: inline-block;
		width: 15px;
		height: 15px;
		border: 1px solid #ffa9aa;
		cursor: pointer;
		margin-bottom: 0px;
	}
	input[type="radio"]:checked+label{
		display: inline-block;
		width: 15px;
		height: 15px;
		/* border: 1px solid #ff3334; */
		background-color: #ffa9aa;
		cursor: pointer;
		margin-bottom: 0px;
	}
	#list1{
		display:none;
		list-style:circle;
	}
	#list2{
		display:none;
		list-style:circle;
	}
	#list3{
		display:none;
		list-style:circle;
	}
	#rpCotextDetail{
		display:none;
	}
</style>

<title>Report User</title>
</head>
<body>

	<input type="hidden" name="rpWriter" value="${ sessionScope.loginUser.mId }"/>
	<input type="hidden" name="rpUserID" value="${ r.rpUserID }"/>
	<input type="hidden" name="rpTitle" value="${ r.rpTitle }"/>
	<input type="hidden" name="rpBno" value="${ r.rpBno }"/>
	<input type="hidden" name="rpBType" value="${ r.rpBType }"/>
	
	<table style="margin-left: 13%;width: 650px;height: 500px;margin-top: 5%;">
		<tr>
			<td style="width:150px;height:50px;text-align:center;">REPORT USER</td>
			<td>
				<b style="color:red;">${ r.rpUserID }</b>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;height:50px;">TITLE</td>
			<td>
				[ ${ r.rpBType } ] 
				<b style="color:red;">${ r.rpTitle }</b>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">CONTEXT</td>
			<td>
				<span style="color: #adadad;">여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요.</span>
				<br><br>
				<input id="1" type="radio" name="rpCotext" value="부적절한 홍보 게시글">
				<label for="1"></label>&nbsp;&nbsp;부적절한 홍보 게시글
				<br><br>
				<input id="2" type="radio" name="rpCotext" value="음란성 또는 청소년에게 부적합한 내용">
				<label for="2"></label>&nbsp;&nbsp;음란성 또는 청소년에게 부적합한 내용
				<br><br>
				<input id="3" type="radio" name="rpCotext" value="명예훼손/사생활 침해 및 저작권 침해등">
				<label for="3"></label>&nbsp;&nbsp;명예훼손/사생활 침해 및 저작권 침해등
				<br><br>
				<input id="4" type="radio" name="rpCotext" value="기타">
				<label for="4"></label>&nbsp;&nbsp;기타
				<br><br>
				
				<textarea id="rpCotextDetail" cols="30" rows="1" name="rpCotext" class="form-control w-100 placeholder hide-on-focus" placeholder="해당 신고는 운영자에게 전달됩니다. 우리 홈페이지 규정을 위반한 경우 매니저에게 문의해주세요."></textarea>
				
				<ul id="list1">
					<li>불법 사행성, 도박 사이트를 홍보하는 경우</li>
					<li>개인정보, 이미테이션, 성인의약품, 마약, 대포폰 등 불법 제품 및 정보를 홍보, 판매하는 경우</li>
					<li>성매매, 장기매매 등의 신체 관련 거래 정보</li>
					<li>홍보/스팸성 내용을 반복하여 등록하는 경우</li>
				</ul>
				
				<ul id="list2">
					<li>음란물 또는 음란한 행위(노골적인 성행위 장면)를 묘사하는 이미지/동영상</li>
					<li>살해/상해/폭력 등 잔인한 장면을 묘사하는 이미지/동영상</li>
					<li>중고 속옷 판매, 가출 유도 등의 청소년 유해 정보 공유</li>
				</ul>
				
				<ul id="list3">
					<li style="list-style:none;color:darkgrey;">게시글로 인해 개인(단체)이 명예훼손(사생활침해/악성루머/허위사실 등) 피해를 입었거나 저작권을 침해 당한 경우에는 아래의 별도 창구를 통해 접수해 주시기 바랍니다.</li>
					<li>명예훼손 관련 게시중단 요청하기(정통망법 제 44조의 2에 의거)</li>
					<li>저작권 관련 게시중단 요청하기(저작권법 103조에 의거)</li>
					<li style="list-style:none;">인터넷 거래중 피해를 입은 경우에는 <a href="http://www.police.go.kr/www/security/cyber.jsp">경찰청 사이버안전국</a>으로 신고해 주시기 바랍니다.</li>
				</ul>

			</td>
		</tr>
		<tr>
			<td style="text-align:center;">
				<div class="button-group-area mt-40">
					<a href="#" id="rpCancle" class="genric-btn primary small">CANCLE</a>
				</div>
			</td>
			<td style="text-align:end;">
				<div class="button-group-area mt-40">
					<a href="#" id="rpSend" class="genric-btn primary small">REPORT</a>
				</div>
			</td>
		</tr>
	</table>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/MSbootstrap.min_inseok.js"></script>
	<script>
	
		$(window).on('load',function(){
			window.resizeTo(800, 700);
		});
		
		$(function(){
			
			$('#1').on("change",function(){
				$('#list1').css({"display":"block"})
				
				$('#list2').css({"display":"none"})
				$('#list3').css({"display":"none"})
				$('#rpCotextDetail').css({"display":"none"})
			});
			
			$('#2').on("change",function(){
				$('#list2').css({"display":"block"})
				
				$('#list1').css({"display":"none"})
				$('#list3').css({"display":"none"})
				$('#rpCotextDetail').css({"display":"none"})
			});
			
			$('#3').on("change",function(){
				$('#list3').css({"display":"block"})
				
				$('#list2').css({"display":"none"})
				$('#list1').css({"display":"none"})
				$('#rpCotextDetail').css({"display":"none"})
			});
			
			$('#4').on("change",function(){
				$('#rpCotextDetail').css({"display":"block"})
				
				$('#list1').css({"display":"none"})
				$('#list2').css({"display":"none"})
				$('#list3').css({"display":"none"})
			});
			
		});
		
		$('#rpCancle').on("click",function(){
			
			var check = confirm("취소 하시겠습니까?");
			
			if(check){
				window.close();
			}
		});
		
		$('#rpSend').on("click",function(){
			
			var check = confirm("신고 하시겠습니까?");
			var check2 = true;
			var check3 = true;

			var rpCotext = $('input[name=rpCotext]:checked').val();
			
			if( !rpCotext ){
				alert("사유를 선택하세요.");
				check2 = false;
			}
			
			var rpCotextDetail = $('#rpCotextDetail').val();
			
			if( !rpCotextDetail && rpCotext == "기타"){
				
				alert("기타 사유가 작성되지 않았습니다.");
				check3 = false;
			}
			
			if( check && check2 && check3 ){
				
				$.ajax({
					url:"Write.rp",
					type:"post",
					data:{
						rpWriter:$('input[name=rpWriter]').val(),
						rpUserID:$('input[name=rpUserID]').val(),
						rpTitle:$('input[name=rpTitle]').val(),
						rpBno:$('input[name=rpBno]').val(),
						rpBType:$('input[name=rpBType]').val(),
						rpCotext:rpCotext,
						rpCotextDetail:$('#rpCotextDetail').val()
					},dataType:"json",
					success:function(data){
						
						alert(data);
						
						window.close();
						
					},error:function(request, status, errorData){
						alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText
								+ "error : " + errorData);
					}
				});
				
			}
		});
		
	</script>
	
</body>
</html>