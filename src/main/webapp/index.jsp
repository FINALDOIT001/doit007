<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<c:set var="fullcalPath" value="${ pageContext.servletContext.contextPath }/resources/plugins/fullcalenda" scope="application"/>
	

	<jsp:forward page="main.go"/>
 
</body>
</html>