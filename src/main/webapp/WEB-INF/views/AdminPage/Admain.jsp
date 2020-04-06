<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../AdminPage/sidebar_header_inseok.jsp"/>
	
	<!-- Begin Page Content -->
	<div class="container-fluid">
      <!-- Collapsable Card Example -->
      <div class="card shadow mb-4">
        <!-- Card Header - Accordion -->
        <a href="#collapseCardExample1" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample1">
          <h6 class="m-0 font-weight-bold text-primary">'회원 관리'에 <strong style="color:#ff5a5a">ISSUE</strong> 발생.</h6>
        </a>
        <!-- Card Content - Collapse -->
        <div class="collapse show" id="collapseCardExample1">
          <div class="card-body">
            <strong> '권구현' 님의 문의 사항입니다. </strong> <br> "관심 지역이 바뀌지 않습니다. 일 좀하세요."
          </div>
        </div>
      </div>

      <div class="card shadow mb-4">
        <!-- Card Header - Accordion -->
        <a href="#collapseCardExample2" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample2">
          <h6 class="m-0 font-weight-bold text-primary">'그룹 관리'에 <strong style="color:#ff5a5a">ISSUE</strong> 발생.</h6>
        </a>
        <!-- Card Content - Collapse -->
        <div class="collapse show" id="collapseCardExample2">
          <div class="card-body">
            <strong> '뭐해 일어나 코딩해야지?' 팀의 문의 사항입니다. </strong> <br> "결제를 했는데 보증금이 없어졌어 이 생키들아. 내돈 내놔."
          </div>
        </div>
      </div>
      
      <div class="card shadow mb-4">
        <!-- Card Header - Accordion -->
        <a href="#collapseCardExample3" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample3">
          <h6 class="m-0 font-weight-bold text-primary">'게시판 관리'에 <strong style="color:#ff5a5a">ISSUE</strong> 발생.</h6>
        </a>
        <!-- Card Content - Collapse -->
        <div class="collapse show" id="collapseCardExample3">
          <div class="card-body">
            <strong> '후방주의, 어머니 몰래 보세요.' 게시물 신고 사항입니다. </strong> <br> 문의 사항 : "불건전 컨탠츠 게시로 신고합니다."
          </div>
        </div>
      </div>

    </div>
    <!-- End of Main Content -->
    
    
    <!-- side_header에 메무리 /div -->
	</div>
</body>
</html>