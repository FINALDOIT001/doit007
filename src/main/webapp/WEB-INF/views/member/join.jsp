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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- join page start -->
	<div style="margin-top: 130px;"></div>
	<div class="container">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="" style="margin: auto;">
						<div
							class="integrated-sign-inner card o-hidden border-0 shadow-lg my-5"
							style="padding: 70px; width: 600px;">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">REGISTER</h1>
							</div>
							<!-- 필수정보는 required 나중에 필수로 넣어줄 것! -->
							<form class="user" id="joinForm" action="join.me"
								method="post">
								<div class="form-group row"></div>
								<div class="form-group">
									<label><span style="color: red">*</span> 아이디 </label> <span style="font-size: x-small;">(4글자 이상 입력해주세요.)</span>
									<input type="text" class="form-control hide-on-focus" id="userId" name="mId"
										placeholder="아이디" required> 
									<div class="check_font" id="check_font"></div>
									<!-- <span class="check_ok" style="font-size: 12px;">사용하실 수 있는 아이디입니다.</span>
									<span class="check_error" style="color:red; font-size: 12px;">사용하실 수 없는 아이디입니다.</span> -->
									<input type="hidden" name="idCheck" id="idCheck" value="0"/>									
										
								</div>
								<div class="form-group">
									<label><span style="color: red">*</span> 비밀번호</label>
									<input type="password" class="form-control form-control-user"
										id="userPwd" name="mPwd" placeholder="비밀번호를 입력하세요."
										required>
								</div>
								<div class="form-group">
									<label><span style="color: red">*</span> 비밀번호 확인</label> <input
										type="password" class="form-control form-control-user"
										id="userPwd2" name="userPwd2" placeholder="비밀번호 확인" required>
									<div class="Pwdcheck_font" id="Pwdcheck_font"></div>
								</div>
								<div class="form-group">
									<label><span style="color: red">*</span> 이름</label> <input
										type="text" class="form-control form-control-user"
										id="mName" name="mName" placeholder="이름" required>
								</div>
								<div class="form-group">
									<label style="display: block;"><span style="color: red">*</span>
										전화번호</label> <input type="text" style="display: inline; width: 119px;"
										class="form-control form-control-user" id="phone1"
										name="phone1" required> <label
										style="font-weight: 600; margin-left: 5px; margin-right: 5px;">-</label>
									<input type="text" style="display: inline; width: 119px;"
										class="form-control form-control-user" id="phone2"
										name="phone2" required> <label
										style="font-weight: 600; margin-left: 5px; margin-right: 5px;">-</label>
									<input type="text" style="display: inline; width: 119px;"
										class="form-control form-control-user" id="phone3"
										name="phone3" required>
								</div>
								<div class="form-group">
									<label style="display: block;"><span style="color: red">*</span>
										이메일</label> <input type="text" style="display: inline; width: 260px;"
										class="form-control form-control-user" id="email" name="email"
										placeholder="이메일" required> <label
										style="font-weight: 600;">@</label> 
									<select style="width: 160px; display: inline;" class="form-control" id="selbox" name="selbox">
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="direct" id="direct">직접입력</option>
									</select>
									<input type="text" style="width: 160px; display: inline;" class="form-control" id="selboxDirect" name="selboxDirect"/>
									<input type="button" onclick="selReset()"style="margin-left:3px; background:url(${contextPath}/resources/img/cancel.png) no-repeat; border:none; width:13px; height:13px; background-size:12px;"/>
								</div>

								<div class="form-group">
									<label style="display: block;"><span style="color: red">*</span>
										주소</label> <input type="text" style="width: 253px; display: inline;"
										class="form-control form-control-user" id="address1"
										name="address1" required readonly> 
										<button style="width: 140px; font-weight: 400; margin-left: 3px; margin-bottom: 5px;"
										class="btn btn-dark" onclick="execPostCode();">우편번호 찾기</button>
										<input type="text" style="margin-bottom: 5px;" class="form-control form-control-user" id="address2"
										name="address2" required readonly> 
										<input type="text" class="form-control form-control-user" id="address3"
										name="address3" placeholder="상세주소 입력" required>
								</div>

								<button type="submit" class="btn btn-dark btn-block"
									style="font-weight: 600;"> 가입하기 </button>

							</form>
							<hr>

							<div class="text-center">
								<a class="small" href="#" data-target="#modal-login"
									data-toggle="modal">이미 계정이 있으신가요? 로그인!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- join page end -->

	<jsp:include page="../common/footer.jsp" />
	

	<script>
	 /* 아이디 중복 체크 */
		function validate(){
			if($("#idCheck").val()==0){
				alert("중복된 아이디입니다. 사용 가능한 아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}else{
				return true;
			}
		}
	 
	 $(function(){
/* 		$(".check_ok").hide();
		$(".check_error").hide(); */
		$("#userId").on("keyup",function(){
			var userId = $(this).val();
			
			if(userId.length < 4){
				/* $(".check_ok").hide();
				$(".check_error").show(); */
				$("#check_font").text("사용하실 수 없는 아이디입니다.");
				$("#check_font").css({"color":"red","font-size": "12px"});
				
				$("#idCheck").val(0);
				
				return;
			} 
			
			$.ajax({
				url:"idCheck.do",
				data:{id:userId},
				type:"post",
				success:function(data){
					console.log(data);
					if(data == "ok"){
						$("#check_font").text("사용 가능한 아이디입니다.");
						$("#check_font").css({"color":"black","font-size": "12px"});
						
						$("#idCheck").val(1);
					}else if(data == "fail"){
						$("#check_font").text("사용하실 수 없는 아이디입니다.");
						$("#check_font").css({"color":"red","font-size": "12px"});
						
						$("#idCheck").val(0);
					}
				},error:function(jqxhr, textStatus, errorThrown){
					console.log("ajax 처리실패");
					
					// 에러로그
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		});
	 });
	 
	 /* 비밀번호 확인  */
	 $(function(){
		 $("#userPwd2").keyup(function(){
			var pwd1 = $("#userPwd").val();
			var pwd2 = $("#userPwd2").val();
			
			$.ajax({
				url:"pwdCheck.do",
				data:{mPwd:pwd1,userPwd2:pwd2},
				type:"post",
				success:function(data){
					if(data == "ok"){
						$("#Pwdcheck_font").text("비밀번호가 일치합니다.");
						$("#Pwdcheck_font").css({"color":"black","font-size": "12px"});
					}else{
						$("#Pwdcheck_font").text("비밀번호가 일치하지 않습니다.");
						$("#Pwdcheck_font").css({"color":"red","font-size": "12px"});
					}
				}
			});
		 });
	 });
	 /* 이메일 직접입력 만들기 */
	 $(function(){
		$("#selboxDirect").hide();
		
		$("#selbox").change(function(){
			if($("#selbox").val() == "direct"){
				$("#selbox").hide();
				$("#selboxDirect").show();
				
			}else{
				$("#selboxDirect").hide();
				
			}
		}); 
	 });
	 
	 function selReset(){
		$("#selbox").show();
		$("#selboxDirect").hide();
		
		$("#selbox option:eq(0)").prop("selected",true);
	 }
	 /* 다음 주소 api 부분 */
	 function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=address1]").val(data.zonecode);
                $("[name=address2]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }
	</script>
</body>
</html>
