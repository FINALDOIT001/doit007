package com.kh.doit.board.common;

import com.kh.doit.board.model.vo.PageInfo_ha;

public class Pagination_ha {
	
	public static PageInfo_ha getPageInfo_ha(int currentPage,int listCount) {
		
		PageInfo_ha pi_h = null; 
		
		int pageLimit = 10;
		int maxPage; 
		int startPage;
		int endPage;
		
		int boardLimit = 5;
		
		// * maxPage : 총 페이지 수
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
				
		// * startPage : 현재 페이지에 보여질 시작 페이지 수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				
		// * endPage : 현재 페이지에서 보여질 마지막 페이지 수
		endPage = startPage + pageLimit + 1;
				
		// 마지막 페이지 수가 총 페이지 수보다 클 경우
		if(maxPage < endPage) {
			endPage = maxPage;
		}
				
		pi_h = new PageInfo_ha(currentPage,listCount,pageLimit
						,maxPage,startPage,endPage,boardLimit);
			
		return pi_h;
	}

}
