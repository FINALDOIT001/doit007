package com.kh.doit.bookShare.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BookShare implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5095011919981484942L;
	private int bsNo; 
	private String bsLocation; //지역
	private String bsCategory;
	private String bsTitle;
	private String bsCon;
	private String bsOriginalFileName;
	private String bsRenameFileName;
	private String bsWriter; // 글쓴이 이름
	private int bsWriterNo; // 글쓴이 넘버
	private String bsState;
	private Date bsDate;
	private String bsType;
	private String bsStatus;
	
	public BookShare() {
	}

	public BookShare(int bsNo, String bsLocation, String bsCategory, String bsTitle, String bsCon,
			String bsOriginalFileName, String bsRenameFileName, String bsWriter, int bsWriterNo, String bsState,
			Date bsDate, String bsType, String bsStatus) {
		this.bsNo = bsNo;
		this.bsLocation = bsLocation;
		this.bsCategory = bsCategory;
		this.bsTitle = bsTitle;
		this.bsCon = bsCon;
		this.bsOriginalFileName = bsOriginalFileName;
		this.bsRenameFileName = bsRenameFileName;
		this.bsWriter = bsWriter;
		this.bsWriterNo = bsWriterNo;
		this.bsState = bsState;
		this.bsDate = bsDate;
		this.bsType = bsType;
		this.bsStatus = bsStatus;
	}

	public int getBsNo() {
		return bsNo;
	}

	public void setBsNo(int bsNo) {
		this.bsNo = bsNo;
	}

	public String getBsLocation() {
		return bsLocation;
	}

	public void setBsLocation(String bsLocation) {
		this.bsLocation = bsLocation;
	}

	public String getBsCategory() {
		return bsCategory;
	}

	public void setBsCategory(String bsCategory) {
		this.bsCategory = bsCategory;
	}

	public String getBsTitle() {
		return bsTitle;
	}

	public void setBsTitle(String bsTitle) {
		this.bsTitle = bsTitle;
	}

	public String getBsCon() {
		return bsCon;
	}

	public void setBsCon(String bsCon) {
		this.bsCon = bsCon;
	}

	public String getBsOriginalFileName() {
		return bsOriginalFileName;
	}

	public void setBsOriginalFileName(String bsOriginalFileName) {
		this.bsOriginalFileName = bsOriginalFileName;
	}

	public String getBsRenameFileName() {
		return bsRenameFileName;
	}

	public void setBsRenameFileName(String bsRenameFileName) {
		this.bsRenameFileName = bsRenameFileName;
	}

	public String getBsWriter() {
		return bsWriter;
	}

	public void setBsWriter(String bsWriter) {
		this.bsWriter = bsWriter;
	}

	public int getBsWriterNo() {
		return bsWriterNo;
	}

	public void setBsWriterNo(int bsWriterNo) {
		this.bsWriterNo = bsWriterNo;
	}

	public String getBsState() {
		return bsState;
	}

	public void setBsState(String bsState) {
		this.bsState = bsState;
	}

	public Date getBsDate() {
		return bsDate;
	}

	public void setBsDate(Date bsDate) {
		this.bsDate = bsDate;
	}

	public String getBsType() {
		return bsType;
	}

	public void setBsType(String bsType) {
		this.bsType = bsType;
	}

	public String getBsStatus() {
		return bsStatus;
	}

	public void setBsStatus(String bsStatus) {
		this.bsStatus = bsStatus;
	}

	@Override
	public String toString() {
		return "BookShare [bsNo=" + bsNo + ", bsLocation=" + bsLocation + ", bsCategory=" + bsCategory + ", bsTitle="
				+ bsTitle + ", bsCon=" + bsCon + ", bsOriginalFileName=" + bsOriginalFileName + ", bsRenameFileName="
				+ bsRenameFileName + ", bsWriter=" + bsWriter + ", bsWriterNo=" + bsWriterNo + ", bsState=" + bsState
				+ ", bsDate=" + bsDate + ", bsType=" + bsType + ", bsStatus=" + bsStatus + "]";
	}
	
	
}
