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
	<jsp:include page="../common/header.jsp" />

	<!-- Kwon CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/kwonCustom.css">

	<!-- 데이타테이블 CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/datatables.css">

	<!--::project part start::-->
	<section class="about_part section-padding ">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_tittle">
						<h2>
							<span>질문</span> 합시다
						</h2>
					</div>
					<div>
						<div id="kwon-inst01">
						<c:if test="${ loginUser != null }">
							<div id="kwon-inst-btn06" class="genric-btn danger circle">질문합니다</div>
						</c:if>
						</div>
						<table id="test1" class="table table-bordered">
							<thead class="kwon-thead1">
								<tr class="kwon-tr1">
									<th width="5%" class="th1">No</th>
									<th width="15%" class="th1">카테고리</th>
									<th width="40%" class="th1">제목</th>
									<th width="5%" class="th1">글쓴이</th>
									<th width="10%" class="th1">등록일</th>
									<th width="8%" class="th1">상태</th>
								</tr>
							</thead>
							<tbody>
								<!-- <tr class="kwon-tr1">
									<td class="kwon-td1">00021</td>
									<td class="kwon-td1">자바</td>
									<td class="kwon-td1 tdtitle1"><span class="kwon-span01">자바의 정석(3판)</span></td>
									<td class="kwon-td1">Test021</td>
									<td class="kwon-td1">사당역 부근</td>
									<td class="kwon-td1">2020.03.11</td>
									<td class="kwon-td1">판매중</td>
								</tr> -->
								
								
		<c:forEach var="q" items="${ qlist }">
		<tr class="kwon-tr1">
			<td align="center" class="kwon-td1">${ q.qNo }</td>
			<td align="center" class="kwon-td1">${ q.qCategory }</td>
			<td align="center" class="kwon-td1">
				<c:url var="qnaView" value="qnaView.ev">
					<c:param name="qNo" value="${ q.qNo }"/>
				</c:url>
			
				<a class="kwon-td1 tdtitle1" href="${ qnaView }" 
				style="color:#5b5b5b !important;">${ q.qTitle }</a>
			
			</td>
			
			
			
			
			
			
			
			
			
			<c:choose>
                  		<c:when test="${ q.qWriter eq sessionScope.loginUser.mId }">
                  			
                  			<td align="center" class="kwon-td1">${ q.qWriter }</td>
                  			
                  		</c:when>
                  		<c:otherwise>

		                  	<td align="center" class="kwon-td1">
		                  	
		                  	<ul>
		                  	<li class="nav-item dropdown no-arrow mx-1">
		                  		<!-- <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
		                  			<span>${ q.qWriter }</span>
		                  		<!-- </a> -->
		                  		<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">
									${ q.qWriter }
								</h6>
								<a class="dropdown-item d-flex align-items-center" href="newMS.ms?recipientID=${ q.qWriter }" onclick="window.open(this.href, '_blanck', 'width=700, height=700, scrollbars=no'); return false">
								<div class="mr-3"></div>
								<div>
									<i class="fas fa-envelope fa-fw"></i>
								   <span class="font-weight-bold">쪽지보내기</span>
								</div>
								</a>
								
								<%-- <c:url var="newReport" value="report.rp">
	                  				<c:param name="rpUserID" value="${b.b_writer}"/>
	                  				<c:param name="rpTitle" value="${ b.b_title }"/>
	                  				<c:param name="rpBno" value="${ b.b_no }"/>
	                  				<c:param name="rpBType" value="FREEBOARD"/>
                  				</c:url> --%>
								
								<a id="reportAtag" class="dropdown-item d-flex align-items-center" href="report.rp?rpUserID=${q.qWriter}&rpTitle=${ q.qTitle }&rpBno=${ q.qNo }&rpBType=QNA" onclick="window.open(this.href, '_blanck', 'width=700, height=700, scrollbars=no'); return false">
								<div class="mr-3"></div>
								<div>
									<i class="fas fa-user-alt-slash"></i>
								   <span class="font-weight-bold">신고하기</span>
								</div>
								</a>
								
		                  	</li>
		                  	</ul>
							
		                  	</td>
		                  	
                  		</c:otherwise>
                  	</c:choose>
			
			
			
			
			
			
			
			
			
			
			
			
			
			<td align="center" class="kwon-td1">${ q.qDate }</td>
			<td align="center" class="kwon-td1">${ q.qState }</td>
		</tr>
		</c:forEach>
		
								
							</tbody>
						</table>
					</div>


				</div>
			</div>
		</div>
	</section>
	<!--::project part end::-->
	<jsp:include page="../common/footer.jsp" />

	<!-- dataTables js -->
	<script src="${contextPath}/resources/js/datatables.js"></script>
	<!-- <script src="js/datatables-min.js"></script> -->
	<script src="${contextPath}/resources/js/kwonCustom.js"></script>


</body>
</html>
