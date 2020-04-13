<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${contextPath}/resources/css/MSstyle_inseok.css">
<link rel="stylesheet" href="${contextPath}/resources/css/MSstyle_inseok2.css">
<link rel="stylesheet" href="${contextPath}/resources/css/MSbootstrap.min_inseok.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<title>MESSAGE</title>

<style>
   *{font-family: 'Noto Sans KR', sans-serif;}
</style>

</head>
<body>

    <div class="button-group-area mt-10" style="display:flex;margin-top: 5%;margin-left: 5%;margin-right: 5%;margin-bottom: 5%;justify-content: center;" id="container">
        <a href="newMS.ms" class="genric-btn primary-border e-large size-fix">MESSAGE</a>
		
        <c:url var="ListPageNew" value="ListPage.ms">
			<c:param name="userID" value="${ sessionScope.loginUser.mId }"/>
			<c:param name="Type" value="New"/>
		</c:url>
        <a href="${ ListPageNew }" class="genric-btn primary-border e-large size-fix">NEW</a>
        
		<c:url var="ListPageReceive" value="ListPage.ms">
			<c:param name="userID" value="${ sessionScope.loginUser.mId }"/>
			<c:param name="Type" value="Receive"/>
		</c:url>
        <a href="${ ListPageReceive }" class="genric-btn primary-border e-large size-fix">RECEIVE</a>
        
        <c:url var="ListPageSend" value="ListPage.ms">
			<c:param name="userID" value="${ sessionScope.loginUser.mId }"/>
			<c:param name="Type" value="Send"/>
		</c:url>
        <a href="${ ListPageSend }" class="genric-btn primary-border e-large size-fix">SEND</a>
        
        
        <!-- <a href="#" class="genric-btn primary-border e-large size-fix">BLOCK</a> -->
    </div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/MSbootstrap.min_inseok.js"></script>
</body>
</html>