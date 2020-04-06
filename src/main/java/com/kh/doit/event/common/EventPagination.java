package com.kh.doit.event.common;

import com.kh.doit.event.model.vo.EventPageInfo;

public class EventPagination {

	// PageInfo 객체를 리턴하는 static 메소드
	public static EventPageInfo getPageInfo(int currentPage, int listCount) {
		// 페이지 정보를 담아 줄 PageInfo 참조변수 선언
		EventPageInfo pi = null;
		
		// currentPage와 listCount가 넘어온 상태
		// 페이징 처리에 필요한 나머지 변수만 선언
		int pageLimit = 5; 	// 한 페이지에 보여질 페이지 수
		int maxPage;			// 전체 페이지 수 중 가장 마지막 페이지
		int startPage;			// 현재 페이지에서 보여질 페이징 버튼의 시작 페이지
		int endPage;			// 현재 페이지에서 보여질 페이지 버튼의 마지막 페이지
		
		int boardLimit = 5;		// 한 페이지에 보여질 게시글의 갯수
		
		// maxPage : 총 페이지 수
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		// startPage : 현재 페이지에 보여질 시작 페이지 수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// endPage : 현재 페이지에 보여질 마지막 페이지 수
		endPage = startPage + pageLimit + 1;
		
		// 마지막 페이지 수 > 총 페이지 수 일 경우
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		pi = new EventPageInfo(currentPage, listCount, pageLimit, 
						maxPage, startPage, endPage, boardLimit);
		
		return pi;
		
	}
}
