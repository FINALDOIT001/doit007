package com.kh.doit.qna.model.vo;

import java.sql.Date;

public class QnaReply {

	private int qcNo;
	private int qcBsNo;
	private String qcWriter;
	private int qcWriterNo;
	private Date qcDate;
	private String qcCon;
	private String qcStatus;
	public QnaReply() {
	}
	public QnaReply(int qcNo, int qcBsNo, String qcWriter, int qcWriterNo, Date qcDate, String qcCon, String qcStatus) {
		this.qcNo = qcNo;
		this.qcBsNo = qcBsNo;
		this.qcWriter = qcWriter;
		this.qcWriterNo = qcWriterNo;
		this.qcDate = qcDate;
		this.qcCon = qcCon;
		this.qcStatus = qcStatus;
	}
	public int getQcNo() {
		return qcNo;
	}
	public void setQcNo(int qcNo) {
		this.qcNo = qcNo;
	}
	public int getQcBsNo() {
		return qcBsNo;
	}
	public void setQcBsNo(int qcBsNo) {
		this.qcBsNo = qcBsNo;
	}
	public String getQcWriter() {
		return qcWriter;
	}
	public void setQcWriter(String qcWriter) {
		this.qcWriter = qcWriter;
	}
	public int getQcWriterNo() {
		return qcWriterNo;
	}
	public void setQcWriterNo(int qcWriterNo) {
		this.qcWriterNo = qcWriterNo;
	}
	public Date getQcDate() {
		return qcDate;
	}
	public void setQcDate(Date qcDate) {
		this.qcDate = qcDate;
	}
	public String getQcCon() {
		return qcCon;
	}
	public void setQcCon(String qcCon) {
		this.qcCon = qcCon;
	}
	public String getQcStatus() {
		return qcStatus;
	}
	public void setQcStatus(String qcStatus) {
		this.qcStatus = qcStatus;
	}
	@Override
	public String toString() {
		return "QnaReply [qcNo=" + qcNo + ", qcBsNo=" + qcBsNo + ", qcWriter=" + qcWriter + ", qcWriterNo=" + qcWriterNo
				+ ", qcDate=" + qcDate + ", qcCon=" + qcCon + ", qcStatus=" + qcStatus + "]";
	}

	
	
	
}
