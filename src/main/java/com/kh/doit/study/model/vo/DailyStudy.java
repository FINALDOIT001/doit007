package com.kh.doit.study.model.vo;

import org.springframework.stereotype.Component;

@Component
public class DailyStudy {
	
	private int ssNo;
	private int ssSgNo;
	private String SStitle;
	private String ssDayDate;
	private String ssTimeDate;
	private String ssLocation;
	private String ssAdd;
	public DailyStudy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DailyStudy(int ssNo, int ssSgNo, String sStitle, String ssDayDate, String ssTimeDate, String ssLocation,
			String ssAdd) {
		super();
		this.ssNo = ssNo;
		this.ssSgNo = ssSgNo;
		SStitle = sStitle;
		this.ssDayDate = ssDayDate;
		this.ssTimeDate = ssTimeDate;
		this.ssLocation = ssLocation;
		this.ssAdd = ssAdd;
	}
	public int getSsNo() {
		return ssNo;
	}
	public void setSsNo(int ssNo) {
		this.ssNo = ssNo;
	}
	public int getSsSgNo() {
		return ssSgNo;
	}
	public void setSsSgNo(int ssSgNo) {
		this.ssSgNo = ssSgNo;
	}
	public String getSStitle() {
		return SStitle;
	}
	public void setSStitle(String sStitle) {
		SStitle = sStitle;
	}
	public String getSsDayDate() {
		return ssDayDate;
	}
	public void setSsDayDate(String ssDayDate) {
		this.ssDayDate = ssDayDate;
	}
	public String getSsTimeDate() {
		return ssTimeDate;
	}
	public void setSsTimeDate(String ssTimeDate) {
		this.ssTimeDate = ssTimeDate;
	}
	public String getSsLocation() {
		return ssLocation;
	}
	public void setSsLocation(String ssLocation) {
		this.ssLocation = ssLocation;
	}
	public String getSsAdd() {
		return ssAdd;
	}
	public void setSsAdd(String ssAdd) {
		this.ssAdd = ssAdd;
	}
	@Override
	public String toString() {
		return "DailyStudy [ssNo=" + ssNo + ", ssSgNo=" + ssSgNo + ", SStitle=" + SStitle + ", ssDayDate=" + ssDayDate
				+ ", ssTimeDate=" + ssTimeDate + ", ssLocation=" + ssLocation + ", ssAdd=" + ssAdd + "]";
	}
	

}
