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
	
	<jsp:include page="../AdminPage/sidebar_header_inseok.jsp"/>
	
	
	<c:if test="${ rpList[0].rpNo == 0 }">
		
		<div class="container-fluid">
	      <!-- Collapsable Card Example -->
	      <div class="card shadow mb-4">
	        <!-- Card Header - Accordion -->
	        <a href="#collapseCardExample1" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample1">
	          <h6 class="m-0 font-weight-bold text-primary">오늘 신고된 <strong style="color:#ff5a5a">내용</strong>이 없습니다.</h6>
	        </a>
	        <!-- Card Content - Collapse -->
	        <div class="collapse show" id="collapseCardExample1">
	          <div class="card-body">
	            <strong> 오늘도 클린한 </strong> DO It!
	          </div>
	        </div>
	      </div>
	
	    </div>
		
	</c:if>
	
	<c:if test="${ rpList[0].rpNo != 0 }">

		<!-- Begin Page Content -->
		
		<c:forEach var="rpList" items="${ rpList }">
		
		<div class="container-fluid">
	      <!-- Collapsable Card Example -->
	      <div class="card shadow mb-4">
		        <!-- Card Header - Accordion -->
		        <a href="#rpList${ rpList.rpNo }" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample1">
		          <h6 class="m-0 font-weight-bold text-primary">'${ rpList.rpBType }'에 <strong style="color:#ff5a5a">ISSUE</strong> 발생.</h6>
		        </a>
		        <!-- Card Content - Collapse -->
		        <div class="collapse show" id="rpList${ rpList.rpNo }">
		          <div class="card-body">
		          	<span>${ rpList.rpDate1 }</span><br>
		            <strong> '${ rpList.rpWriter }' 님의 신고 사항입니다. </strong> <br>
		            신고 내용 : ${ rpList.rpCotext } <br> 
		            신고 당한 유저 : '${ rpList.rpUserID }' 
		          </div>
		        </div>
		    </div>
	      </div>
	
		</c:forEach>
	
	    <!-- End of Main Content -->
		
	</c:if>
	
    <!-- side_header에 메무리 /div -->
	</div>
</body>
</html>