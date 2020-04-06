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
	      <div class="row" style="margin-top: 200px;">
	        <div class="" style="margin: auto;">
	         <div class=" card o-hidden border-0 shadow-lg my-5" style="padding:50px; width:400px;">
	           <div class="text-center">
	            <h2 style="font-weight: 1000;">로그인</h2>
	           </div>
	           <!-- 필수정보는 required 나중에 필수로 넣어줄 것! -->
	           <form class="user" id="loginForm" action="login.me" method="post">
	            <div class="form-group row">
	            </div>
	               <div class="form-group">
	                  <label>아이디</label>
	                 <input type="text" class="form-control hide-on-focus" id="userId" name="mId" placeholder="아이디" required>
	            </div>
	            <div class="form-group">
	               <label>비밀번호</label>
	               <input type="password" class="form-control form-control-user" id="userPwd" name="mPwd" placeholder="비밀번호" required>
	            </div>
	
	            <!-- <a href="login.me" class="btn btn-dark btn-block" style="font-weight: 600;">
	               로그인
	              </a> -->
	           <input type="submit" class="btn btn-dark btn-block" style="font-weight: 600;" value="로그인">   
	           
	
	           </form>
	           <hr>
	           <div class="text-center">
	            <a class="small" href="moveJoin.go" data-target="" data-toggle="">회원가입</a> |
	            <a class="small" href="#" data-target="#modal-login" data-toggle="modal">아이디 / 비밀번호 찾기</a> 
	           </div>
	         </div>
	        </div>
	      </div>
	</div>
	<!-- login page end -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>