package com.kh.doit.study.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Etc {
	
	private int etcNo;
	private int etcSgNo; // 현재 스터디의 번호
	private String etcTitle;
	private String etcCon;
	private String etcWriter;
	private int etcWriterNo;
	private String etcWriterId;
	private Date etcDate;
	private String etcStatus;
	
	public Etc() {
	}

	public Etc(int etcNo, int etcSgNo, String etcTitle, String etcCon, String etcWriter, int etcWriterNo,
			String etcWriterId, Date etcDate, String etcStatus) {
		super();
		this.etcNo = etcNo;
		this.etcSgNo = etcSgNo;
		this.etcTitle = etcTitle;
		this.etcCon = etcCon;
		this.etcWriter = etcWriter;
		this.etcWriterNo = etcWriterNo;
		this.etcWriterId = etcWriterId;
		this.etcDate = etcDate;
		this.etcStatus = etcStatus;
	}

	public int getEtcNo() {
		return etcNo;
	}

	public void setEtcNo(int etcNo) {
		this.etcNo = etcNo;
	}

	public int getEtcSgNo() {
		return etcSgNo;
	}

	public void setEtcSgNo(int etcSgNo) {
		this.etcSgNo = etcSgNo;
	}

	public String getEtcTitle() {
		return etcTitle;
	}

	public void setEtcTitle(String etcTitle) {
		this.etcTitle = etcTitle;
	}

	public String getEtcCon() {
		return etcCon;
	}

	public void setEtcCon(String etcCon) {
		this.etcCon = etcCon;
	}

	public String getEtcWriter() {
		return etcWriter;
	}

	public void setEtcWriter(String etcWriter) {
		this.etcWriter = etcWriter;
	}

	public int getEtcWriterNo() {
		return etcWriterNo;
	}

	public void setEtcWriterNo(int etcWriterNo) {
		this.etcWriterNo = etcWriterNo;
	}

	public String getEtcWriterId() {
		return etcWriterId;
	}

	public void setEtcWriterId(String etcWriterId) {
		this.etcWriterId = etcWriterId;
	}

	public Date getEtcDate() {
		return etcDate;
	}

	public void setEtcDate(Date etcDate) {
		this.etcDate = etcDate;
	}

	public String getEtcStatus() {
		return etcStatus;
	}

	public void setEtcStatus(String etcStatus) {
		this.etcStatus = etcStatus;
	}

	@Override
	public String toString() {
		return "Etc [etcNo=" + etcNo + ", etcSgNo=" + etcSgNo + ", etcTitle=" + etcTitle + ", etcCon=" + etcCon
				+ ", etcWriter=" + etcWriter + ", etcWriterNo=" + etcWriterNo + ", etcWriterId=" + etcWriterId
				+ ", etcDate=" + etcDate + ", etcStatus=" + etcStatus + "]";
	}

	
	
}
