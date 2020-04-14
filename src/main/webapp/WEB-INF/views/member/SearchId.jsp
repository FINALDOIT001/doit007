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
	            <h3 style="font-weight: 1000; margin-bottom: 30px;">아이디 찾기</h3>
	           </div>
	           <!-- 필수정보는 required 나중에 필수로 넣어줄 것! -->
	           <form class="user" id="checkPwd" action="#" method="post">
	            <div class="form-group" id="emaildiv">
	                  <label>이메일</label>
	                 <input type="text" class="form-control hide-on-focus" id="checkEmail" name="checkEmail" placeholder="이메일을 입력해주세요." required>
	            </div>
	            <button id="buttondiv" class="btn btn-dark btn-block" style="font-weight: 600;" onclick="idbutton();">아이디 찾기</button>
	           </form>
	           <hr>
	           <div class="text-center">
	            <a class="small" href="moveJoin.go"><label style="font-size: small;">회원가입</label></a>&nbsp;&nbsp;|&nbsp;
	            <a class="small" href="searchPwd.go" style=""><label style="font-size: small;">비밀번호 찾기</label></a>
	           </div>
	         </div>
	        </div>
	      </div>
	</div>
	<script>
		function idbutton(){
			var email = $("#checkEmail").val();
			var exptext=/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

			if(exptext.test(email)==false){
				alert("이메일 형식이 아닙니다.");
				return false;
			}else{
				$.ajax({
	    				url:"startSearch.go",
	    				data: {email:email},
	    				type: "post",
	    				dataType:"json",
	    				success:function(data){
	    					if(data == "no"){
	    						alert("가입하신 이메일이 아닙니다.");
	    					}else{
	    						alert(data);
	    					}
	    				},error:function(){
	    				}
	    			}); 
			 	return true;
			}
		}
	</script>
	<!-- login page end -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>