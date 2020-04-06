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
							<span>책을</span> 나눕시다
						</h2>
					</div>
					<c:if test="${ loginUser == null }">
						로그인 하신 후 보실 수 있습니다.
					</c:if>
					<div>
						<div id="kwon-inst01">
						<c:if test="${ loginUser != null }">
							<div id="kwon-inst-btn01" class="genric-btn danger circle">책 등록하기</div>
						</c:if>
						</div>
						<table id="test1" class="table table-bordered">
							<thead class="kwon-thead1">
								<tr class="kwon-tr1">
									<th width="5%" class="th1">No</th>
									<th width="15%" class="th1">카테고리</th>
									<th width="40%" class="th1">제목</th>
									<th width="5%" class="th1">글쓴이</th>
									<th width="10%" class="th1">지역</th>
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
								
								
		<c:forEach var="bs" items="${ list }">
		<tr class="kwon-tr1">
			<td align="center" class="kwon-td1">${ bs.bsNo }</td>
			<td align="center" class="kwon-td1">${ bs.bsCategory }</td>
			<td align="center" class="kwon-td1">
				<c:url var="bsView" value="bsView.go">
					<c:param name="bsNo" value="${ bs.bsNo }"/>
				</c:url>
			
			<c:if test="${ loginUser != null }">
				<a class="kwon-td1 tdtitle1" href="${ bsView }" 
				style="color:#5b5b5b !important;">${ bs.bsTitle }</a>
			</c:if>
			<c:if test="${ loginUser == null }">
				${ bs.bsTitle }
			</c:if>
			
			
			</td>
			<td align="center" class="kwon-td1">${ bs.bsWriter }</td>
			<td align="center" class="kwon-td1">${ bs.bsLocation }</td>
			<td align="center" class="kwon-td1">${ bs.bsDate }</td>
			<td align="center" class="kwon-td1">${ bs.bsState }</td>
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
