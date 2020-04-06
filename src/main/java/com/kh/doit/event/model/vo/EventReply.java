package com.kh.doit.event.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class EventReply {

	private int ecNo;
	private int ecENo;
	private String ecWriter;
	private int ecWriterNo;
	private Date ecDate;
	private String ecCon;
	private String ecStatus;
	
	public EventReply() {
	}

	public EventReply(int ecNo, int ecENo, String ecWriter, int ecWriterNo, Date ecDate, String ecCon,
			String ecStatus) {
		this.ecNo = ecNo;
		this.ecENo = ecENo;
		this.ecWriter = ecWriter;
		this.ecWriterNo = ecWriterNo;
		this.ecDate = ecDate;
		this.ecCon = ecCon;
		this.ecStatus = ecStatus;
	}

	public int getEcNo() {
		return ecNo;
	}
	public void setEcNo(int ecNo) {
		this.ecNo = ecNo;
	}
	public int getEcENo() {
		return ecENo;
	}
	public void setEcENo(int ecENo) {
		this.ecENo = ecENo;
	}
	public String getEcWriter() {
		return ecWriter;
	}
	public void setEcWriter(String ecWriter) {
		this.ecWriter = ecWriter;
	}
	public int getEcWriterNo() {
		return ecWriterNo;
	}
	public void setEcWriterNo(int ecWriterNo) {
		this.ecWriterNo = ecWriterNo;
	}
	public Date getEcDate() {
		return ecDate;
	}
	public void setEcDate(Date ecDate) {
		this.ecDate = ecDate;
	}
	public String getEcCon() {
		return ecCon;
	}
	public void setEcCon(String ecCon) {
		this.ecCon = ecCon;
	}
	public String getEcStatus() {
		return ecStatus;
	}
	public void setEcStatus(String ecStatus) {
		this.ecStatus = ecStatus;
	}
	@Override
	public String toString() {
		return "EventReply [ecNo=" + ecNo + ", ecENo=" + ecENo + ", ecWriter=" + ecWriter + ", ecWriterNo=" + ecWriterNo
				+ ", ecDate=" + ecDate + ", ecCon=" + ecCon + ", ecStatus=" + ecStatus + "]";
	}
	
	
}
