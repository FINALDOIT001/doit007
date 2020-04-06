// dataTables 사용설명서 : https://ponyozzang.tistory.com/220
jQuery(function($){ 
    $("#test1").DataTable({
    	order: [[0, 'desc']], // 몇번 인덱스에서 정렬할래요?asc 또는 desc
        // 표시 건수기능 숨기기 10건 보일래 20건 보일래 50건 보일래
        lengthChange: false,
        // 검색 기능 숨기기
        searching: true,
        // 정렬 기능 숨기기
        ordering: true,
        // 정보 표시 숨기기
        info: true,
        // 페이징 기능 숨기기
        paging: true,
        serverSide: false

        /* l:표시건수 f: 검색창, r: 이 뭐지?? 
           t: 테이블, i: 총 컬럼 갯수, p: 페이징 */ 
        

        //  "dom": '<"col-sm-6"r>t<"col-sm-6"f>p'
        // ordering: true, serverSide: false 값은 order 정렬 설정시 필요한 값입니다. 없는 경우 동작하지 않을 수 있으니 참고하세요.
    });


    // study deatil 테이블명만 바꿔주자... 첫번째 칸에 input hidden으로 모임의 아이디값을 넣어준다.
    var table = $("#kwon-table101").DataTable({
      lengthChange: false,
      searching: false,
      ordering: true,
      info: true,
      paging: true,

  });

  $('#kwon-table101 tbody').on('click','tr',function() {
     var test = $(this).children().eq(0).val();
     console.log('id값 찾기 위한 번호 : '+test);
  });

});

// $(".td1").on({
//     click:function(){
//        $(".btn1").click(function(){
//                //console.log($(this).parent().children().eq(0).text());
//                var marketId = $(this).parent().parent().children().eq(0).text();
//                location.href="<%=request.getContextPath()%>/selectMarketOne.ad?marketId=" + marketId;
//             });
//     }
//  });
// $(function selectOne(){
//    $(".kwon-td1").click(function(){
//       console.log($(this).parent().children().eq(0).text());
//       location.href="kwon_detailForm.html";
//       // var marketId = $(this).parent().children().eq(0).text();
//       // location.href="<%=request.getContextPath()%>/selectMarketOne.ad?marketId=" + marketId;      
//    });
// });

// $(function selectOne(){
//    $(".kwon-td101").click(function(){
//       console.log($(this).parent().children().eq(0).text());
//       location.href="doitStudy_Schedule.html";
//       // var marketId = $(this).parent().children().eq(0).text();
//       // location.href="<%=request.getContextPath()%>/selectMarketOne.ad?marketId=" + marketId;
//    });
// });

$(".kwon-span01").on({
   click:function(){
      $(".kwon-td1").click(function(){
         console.log($(this).parent().children().eq(0).text());
         var bsId = $(this).parent().parent().children().eq(0).text();
         location.href="bsView.go?bsId="+bsId;
      });
   }
});

// $(".kwon-span101").on({
//    click:function(){
//       $(".kwon-td101").click(function(){
//          // console.log($(this).parent().children().eq(0).val());
//          var marketId = $(this).parent().parent().children().input.val();
//          console.log(marketId);
//          alert('왜 알람이 안됩니까!');
//             //   location.href="<%=request.getContextPath()%>/selectMarketDetail.ad?marketId=" + marketId;
//          location.href="doitStudy_Schedule.html";
//       });
//    }
// });


 /* required 체크해서 필수항목이 없을 경우 return false로 submit 막아주는 기능 */
//  function manualValidate(ev) {
//    ev.target.checkValidity();
//    return false;
//   }
 
//   $("#kwon-Form01").bind("submit", manualValidate);


$('#kwon-inst-btn01').click(function() {
  location.href="bsInsert.go";
});

/*$('#kwon-btn02').click(function() {
   location.href="bsUpdate.go";
});
*/

$('#kwon-deleteBtn02').click(function() {
	var title = $('#bsTitle').val();
	var bsNo = $('#bsNo').val();
	var result = confirm(title+"을 삭제하시겠습니까?");
	
	if(result) {
		location.href="deleteBs.do?bsNo="+bsNo;
	} else {
		
	}
});


$('#kwon-back01').click(function() {
  window.history.back();
});




