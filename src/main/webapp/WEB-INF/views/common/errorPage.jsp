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

	<div style="height:800px; margin:auto;">
                  
                  
		
		
		<h1 align="center" style="margin-top:100px; margin-bottom:300px; padding-top:200px;">
<img src="${pageContext.request.contextPath}/resources/img/error_logo.png" alt="logo"><br><br><br>${ msg }</h1>
	
	</div>


	<jsp:include page="../common/footer.jsp"/>

</body>
</html>
