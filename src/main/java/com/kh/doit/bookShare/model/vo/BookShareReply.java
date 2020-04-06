package com.kh.doit.bookShare.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BookShareReply {
	private int bscNo;
	private int bscBsNo;
	private String bscWriter;
	private int bscWriterNo;
	private Date bscDate;
	private String bscCon;
	private String bscStatus;
	
	public BookShareReply() {}

	public BookShareReply(int bscNo, int bscBsNo, String bscWriter, int bscWriterNo, Date bscDate, String bscCon,
			String bscStatus) {
		super();
		this.bscNo = bscNo;
		this.bscBsNo = bscBsNo;
		this.bscWriter = bscWriter;
		this.bscWriterNo = bscWriterNo;
		this.bscDate = bscDate;
		this.bscCon = bscCon;
		this.bscStatus = bscStatus;
	}

	public int getBscNo() {
		return bscNo;
	}

	public void setBscNo(int bscNo) {
		this.bscNo = bscNo;
	}

	public int getBscBsNo() {
		return bscBsNo;
	}

	public void setBscBsNo(int bscBsNo) {
		this.bscBsNo = bscBsNo;
	}

	public String getBscWriter() {
		return bscWriter;
	}

	public void setBscWriter(String bscWriter) {
		this.bscWriter = bscWriter;
	}

	public int getBscWriterNo() {
		return bscWriterNo;
	}

	public void setBscWriterNo(int bscWriterNo) {
		this.bscWriterNo = bscWriterNo;
	}

	public Date getBscDate() {
		return bscDate;
	}

	public void setBscDate(Date bscDate) {
		this.bscDate = bscDate;
	}

	public String getBscCon() {
		return bscCon;
	}

	public void setBscCon(String bscCon) {
		this.bscCon = bscCon;
	}

	public String getBscStatus() {
		return bscStatus;
	}

	public void setBscStatus(String bscStatus) {
		this.bscStatus = bscStatus;
	}

	@Override
	public String toString() {
		return "BookShareReply [bscNo=" + bscNo + ", bscBsNo=" + bscBsNo + ", bscWriter=" + bscWriter + ", bscWriterNo="
				+ bscWriterNo + ", bscDate=" + bscDate + ", bscCon=" + bscCon + ", bscStatus=" + bscStatus + "]";
	}

	
	
}