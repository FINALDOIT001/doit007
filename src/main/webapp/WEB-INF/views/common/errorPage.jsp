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


	<h1 align="center" style="margin-top:300px; margin-bottom:300px;">기본 에러페이지<br><br>${ msg }</h1>

	<jsp:include page="../common/footer.jsp"/>

</body>
</html>
