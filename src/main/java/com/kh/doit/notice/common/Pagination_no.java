package com.kh.doit.notice.common;

import com.kh.doit.notice.model.vo.PageInfo_no;

public class Pagination_no {

	public static PageInfo_no getPageInfo(int currentPage,int listCount) {
		
		PageInfo_no pi_n = null;
		
		int pageLimit = 10; 	
		int maxPage;			
		int startPage;			
		int endPage;			
		
		int boardLimit = 5;		
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit + 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi_n = new PageInfo_no(currentPage,listCount,pageLimit
				,maxPage,startPage,endPage,boardLimit);
	
		return pi_n;
		
	}
}
