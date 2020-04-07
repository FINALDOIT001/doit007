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

<title>MESSAGE</title>
</head>
<body>

    <div class="button-group-area mt-10" style="display:flex;margin-top: 5%;margin-left: 5%;margin-right: 5%;margin-bottom: 5%;justify-content: center;" id="container">
        <a href="newMS.ms" class="genric-btn primary-border e-large size-fix">MESSAGE</a>
        <a href="#" class="genric-btn primary-border e-large size-fix">NEW</a>
        <a href="#" class="genric-btn primary-border e-large size-fix">RECEIVE</a>
        <a href="#" class="genric-btn primary-border e-large size-fix">SEND</a>
        <a href="#" class="genric-btn primary-border e-large size-fix">BLOCK</a>
    </div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<%-- <script src="${contextPath}/resources/js/MSbootstrap.min_inseok.js"></script> --%>
</body>
</html>