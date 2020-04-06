package com.kh.doit.study.common;

import com.kh.doit.study.model.vo.PageInfojung;

public class paginationJung {

	public static PageInfojung getPageInfo(int currentPage, int listCount) {

		PageInfojung pi = null;

		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;

		int boardLimit = 10;

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		System.out.println(startPage);

		endPage = startPage + pageLimit + 1;

		if (maxPage < endPage) {
			endPage = maxPage;

		}
		pi = new PageInfojung(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

		return pi;
	}
}
