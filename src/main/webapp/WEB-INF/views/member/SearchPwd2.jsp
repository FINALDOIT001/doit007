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
	<jsp:include page="../common/header.jsp"/>

	<!-- login page start -->
	<div class="container" style="margin-top:130px;">
	      <!-- Nested Row within Card Body -->
	      <div class="row" style="margin-top: 200px; margin-bottom: 150px;">
	        <div class="" style="margin: auto;">
	         <div class=" card o-hidden border-0 shadow-lg my-5" style="padding:50px; width:522px;">
	           <div class="text-center">
	            <h3 style="font-weight: 1000; margin-bottom: 30px;">비밀번호 찾기</h3>
	           </div>
	           <form class="user" id="rePwdForm" action="rePwd.go" method="post">
	             <input type="hidden" id="userid" name="userid" value="${id}"/>
	           	 <div class="form-group">
                     <label><span style="color: red">*</span> 비밀번호(회원님이 변경하실 비밀번호를 입력해주세요.)</label>
                     <input type="password" class="form-control form-control-user"
                           id="userPwd" name="mPwd" placeholder="비밀번호"
                           required>
                 </div>
                 <div class="form-group">
                      <label><span style="color: red">*</span> 비밀번호 확인</label> 
                      <input type="password" class="form-control form-control-user"
                              id="userPwd2" name="userPwd2" placeholder="비밀번호 확인" required>
                      <div class="Pwdcheck_font" id="Pwdcheck_font"></div>
                  </div>
                  <button type="submit" class="btn btn-dark btn-block"
                           style="font-weight: 600;" onclick='return validate();'> 비밀번호 변경 </button>
                  </form>
	           <hr>
	           <div class="text-center">
	            <a class="small" href="moveJoin.go"><label style="font-size: small;">회원가입</label></a>&nbsp;&nbsp;|&nbsp;
	            <a class="small" href="searchId.go" style=""><label style="font-size: small;">아이디 찾기</label></a>
	           </div>
	         </div>
	        </div>
	      </div>
	</div>
	<script type="text/javascript">
	function validate(){
        if($("#userPwd2").val()!=$("#userPwd").val()){
           alert("비밀번호가 일치하지 않습니다.");
           $("#userPwd2").focus();
           return false; 
              
        } else {
        	alert("비밀번호 변경 완료!");
           return true;
        }
     }
	
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
                  
                  return false;
               }
            }
         });
       });
    });
	</script>
	<!-- login page end -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>