jQuery(function($){
	$("#freeb").DataTable({
		order: [[0, 'desc']], // 몇번 인덱스에서 정렬할래요?asc 또는 desc
        // 표시 건수기능 숨기기 10건 보일래 20건 보일래 50건 보일래
        lengthChange: false,
        // 검색 기능 숨기기
        searching: true,
        // 정렬 기능 숨기기
        ordering: false,
        // 정보 표시 숨기기
        info: true,
        // 페이징 기능 숨기기
        paging: true,
        serverSide: false

        /* l:표시건수 f: 검색창, r: 이 뭐지?? 
           t: 테이블, i: 총 컬럼 갯수, p: 페이징 */ 
	});
});