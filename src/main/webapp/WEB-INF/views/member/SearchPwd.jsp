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
	           <!-- 필수정보는 required 나중에 필수로 넣어줄 것! -->
	           <form class="user" id="Searchpwd" action="Searchpwd.go" method="post">
	            <div class="form-group">
	                  <label>아이디</label>
	                 <input type="text" class="form-control hide-on-focus" id="checkid" name="checkid" placeholder="아이디를 입력하세요." required>
	            </div>
	            <div class="form-group" >
	                  <label style="display: block;">이메일</label>
	                 <input type="text" style="width: 300px; display: inline;"
	                 		class="form-control hide-on-focus" id="searchEmail" name="searchEmail" 
	                 		placeholder="이메일을 입력하세요." required>
	                 <button type="button" style="margin-bottom: 6px;" class="btn btn-outline-danger" 
	                 			onclick="insertcheck();">인증번호 전송</button>
	            </div>
	            <div class="form-group" id="emailcheck">
	            	<input type="text" style="width: 300px; display: inline;"
	            			class="form-control hide-on-focus" id="numcheck" name="numcheck" 
	            			placeholder="인증번호를 입력하세요." required/>
	            	<input type="hidden" path="random" id="random" value="${ random }" />
					<input type="button" style="margin-bottom: 6px;" class="btn btn-dark" value="인증하기"/>
	            </div>
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
	
	$("#emailcheck").hide();
	
		function insertcheck() {
 			var id = $("#checkid").val();
			var email = $("#searchEmail").val();
			var exptext=/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			
			if(id == ""){
				alert("아이디를 입력해주세요.");
				return false;
			}else if(exptext.test(email)==false){
				alert("이메일 형식이 아닙니다.");
				return false;
			}else{
				$.ajax({
					url:"startPwd.go",
					data: {id:id, email:email},
					type:"post",
					success:function(data){
						if(data == "no"){
							alert("입력하신 아이디나 이메일이 틀렸습니다.");
						}else{
							$("#emailcheck").show();
							
						}
					}
				});
			}
			
			
			
		}
	</script>
	<!-- login page end -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>