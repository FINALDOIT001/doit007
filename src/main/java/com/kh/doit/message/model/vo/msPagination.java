package com.kh.doit.message.model.vo;

public class msPagination {
	
	// PageInfo 객체를 리턴하는 static 메소드
		public static msPageInfo getPageInfo(int currentPage, int listCount) {
			
			// 페이지 정보를 담아줄 PageInfo 참조변수 선언
			msPageInfo pi = null;
			
			int pageLimit = 5;			// 한 페이지에서 보여질 페이징 
			int maxPage;				// 전체 페이징 수 중 가장 마지막 페이지
			int startPage;				// 현재 페이지에서 보여질 페이징 버튼의 시작 페이지
			int endPage;				// 현재 페이지에서 보여질 페이징 버튼의 끝 페이지
			
			int boardLimit = 10;			// 한 페이지에 보여질 게시글 갯수
			
			// maxPage : 총 페이지 
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
			// startPage : 현재 페이지에 보여질 시작 페이지 수
			startPage = (currentPage - 1)/ pageLimit * pageLimit + 1;
			
			// endPage : 현재 페이지에서 보여질 마지막 페이지 수
			endPage = startPage + pageLimit + 1;
			
			// 마지막 페이지수가 총 페이지 수보다 클 경우
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			pi = new msPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			
			return pi;
		}
		
}