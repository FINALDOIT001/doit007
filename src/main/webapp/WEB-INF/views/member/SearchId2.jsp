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
	            <div class="form-group" id="idshow" style="text-align:center;">
	                 <label>회원님의 아이디는 <span style="font-size:large; font-weight:600; color:#d64748 !important;">${id}</span> 입니다.</label>
	            </div>
	           
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
	
	<!-- login page end -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>