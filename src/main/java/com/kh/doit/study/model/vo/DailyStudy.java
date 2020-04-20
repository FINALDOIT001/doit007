package com.kh.doit.study.model.vo;

import org.springframework.stereotype.Component;

@Component
public class DailyStudy {
	
	private String ssNo;
	private int ssSgNo;
	private int zipcode;
	private String ssTitle;
	private String ssDayDate;
	private String ssTimeDate;
	private String ssAdd;
	private String ssExAdd;
	public DailyStudy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DailyStudy(String ssNo, int ssSgNo, int zipcode, String ssTitle, String ssDayDate, String ssTimeDate,
			String ssAdd, String ssExAdd) {
		super();
		this.ssNo = ssNo;
		this.ssSgNo = ssSgNo;
		this.zipcode = zipcode;
		this.ssTitle = ssTitle;
		this.ssDayDate = ssDayDate;
		this.ssTimeDate = ssTimeDate;
		this.ssAdd = ssAdd;
		this.ssExAdd = ssExAdd;
	}
	public String getSsNo() {
		return ssNo;
	}
	public void setSsNo(String ssNo) {
		this.ssNo = ssNo;
	}
	public int getSsSgNo() {
		return ssSgNo;
	}
	public void setSsSgNo(int ssSgNo) {
		this.ssSgNo = ssSgNo;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getSsTitle() {
		return ssTitle;
	}
	public void setSsTitle(String ssTitle) {
		this.ssTitle = ssTitle;
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
	public String getSsAdd() {
		return ssAdd;
	}
	public void setSsAdd(String ssAdd) {
		this.ssAdd = ssAdd;
	}
	public String getSsExAdd() {
		return ssExAdd;
	}
	public void setSsExAdd(String ssExAdd) {
		this.ssExAdd = ssExAdd;
	}
	@Override
	public String toString() {
		return "DailyStudy [ssNo=" + ssNo + ", ssSgNo=" + ssSgNo + ", zipcode=" + zipcode + ", ssTitle=" + ssTitle
				+ ", ssDayDate=" + ssDayDate + ", ssTimeDate=" + ssTimeDate + ", ssAdd=" + ssAdd + ", ssExAdd="
				+ ssExAdd + "]";
	}
	
}
