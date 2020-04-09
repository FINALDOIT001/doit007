package com.kh.doit.notice.model.vo;

import org.springframework.stereotype.Component;

@Component
public class PageInfo_no {
	
	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int noticeLimit; 
	
	public PageInfo_no() {
		super(); 
	}

	public PageInfo_no(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int noticeLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.noticeLimit = noticeLimit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getNoticeLimit() {
		return noticeLimit;
	}

	public void setNoticeLimit(int noticeLimit) {
		this.noticeLimit = noticeLimit;
	}

	@Override
	public String toString() {
		return "PageInfo_no [currentPage=" + currentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", noticeLimit="
				+ noticeLimit + "]";
	}
	
	
}
