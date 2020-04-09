<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호두 충전</title>
<!-- Bootstrap CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
   <!-- animate CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/animate.css">
   <!-- owl carousel CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/owl.carousel.min.css">
   <!-- themify CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/themify-icons.css">
   <!-- flaticon CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/flaticon.css">
   <!-- magnific-popup CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/magnific-popup.css">
   <!-- slick CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/slick.css">
   <!-- font awesome CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/fontawesome/resources/css/all.min.css">
   <!-- style CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
   <!-- font css -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
<style>
	* {
	font-family: 'Noto Sans KR', sans-serif;
	}
	
	#hodu {
		font-weight: bold;
    	font-size: initial;
    	margin-bottom:5px;
	}
	.span_price {
		margin:5px; 
		font-size:large; 
		color: #d64748 !important;
	}

	.hodu_num {
    font-size: inherit;
    line-height: 1.5;
    display: block;
    vertical-align: top;
    margin-right: 1.5rem;
    margin-left: 10px;
}

	.hodu_price {
	margin-left: 40px;
	font-size: 12px;
    line-height: 1.5;
    display: inline-block;
    padding: 0.1875rem 0.5rem;
    vertical-align: top;
    border-radius: 0.25rem;
    font-weight: 500;
    color: white;
    background-color: #d64748;
}
	.hodu_border {
	border: 1.4px solid #d5d5d5;
    padding: 20px;
    margin-top:5px;
    display:flex;
}

	.div_margin {
		margin-bottom:10px;
	}
</style>
</head>
<body>
	<div class="col-lg-12" style="margin-top:20px;">
	<img src="${contextPath}/resources/img/hodu2.png" style="width:30px;">
		<label style="font-size:large; font-weight:700;">'호두'란?</label><br>
		<label style="margin-left: 35px;">DO IT 내에서 사용하는 결제수단으로 <span class="span_price">1</span>개당 
												<span class="span_price">500</span>원 입니다.</label>
		<hr>
	</div>
	<div class="col-lg-12" style="margin-top:20px;">
		<label style="font-size:large; font-weight:700;">구매하기</label><br>
		
		<div class="hodu_border">
			<div style="width:50%">
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-1">호두 10개 <span class="hodu_price">5000원</span></label>
			</div>
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-2">호두 20개 <span class="hodu_price">9500원</span></label>
			</div>
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-3" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-3">호두 30개 <span class="hodu_price">14000원</span></label>
			</div>
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-4" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-4">호두 40개 <span class="hodu_price">18000원</span></label>
			</div>
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-5" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-5">호두 50개 <span class="hodu_price">22000원</span></label>
			</div>
			</div>
			<div style="width:50%; margin-left: 50px;">
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-6" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-6">호두 60개 <span class="hodu_price">25000원</span></label>
			</div>
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-7" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-7">호두 80개 <span class="hodu_price">30000원</span></label>
			</div>
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-8" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-8">호두 100개 <span class="hodu_price">40000원</span></label>
			</div>
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-9" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-9">호두 200개 <span class="hodu_price">75000원</span></label>
			</div>
			<div class="custom-control custom-radio div_margin">
				<input type="radio" name="jb-radio" id="jb-radio-10" class="custom-control-input">
				<label class="custom-control-label hodu_num" for="jb-radio-10">호두 499개 <span class="hodu_price">99000원</span></label>
			</div>
			</div>
		</div>
		<div class="col-lg-12" style="margin-top:40px; text-align:center;">
			<button id="hodupay" class="genric-btn danger" style="font-size: 13px;">결제하기</button>
		</div>
	</div>
	

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		
		$('#hodupay').on("click",function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp71796721');
			
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 100,
		    buyer_email : 'ggghr@naver.com',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		    	// 1) 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기 
		    	jQuery.ajax({
		    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
		    		}
		    	}).done(function(data) {
		    		// 2)  서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;

		    			alert(msg);
		    		} else {
		    			// 3) 아직 제대로 결제가 되지 않았습니다.
		    			// 4)결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	}); 
		    	// 성공시 이동할 페이지
		    	location.href="#";
		    } else {
		        var msg = '';
		        msg += '' + rsp.error_msg;
				// 실패시 이동할 페이지
				location.href="#";
		        alert(msg);
		    }
		});
	});
	</script>
</body>
</html>