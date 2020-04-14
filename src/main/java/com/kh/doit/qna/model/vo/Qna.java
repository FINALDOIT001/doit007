package com.kh.doit.qna.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Qna {
	
	private int qNo; 
	private String qCategory;
	private String qTitle;
	private String qCon;
	private String qOriginalFileName;
	private String qRenameFileName;
	private String qWriter; // 글쓴이 이름
	private int qWriterNo; // 글쓴이 넘버
	private String qState;
	private Date qDate;
	private String qType;
	private String qStatus;
	
	public Qna() {
	}

	public Qna(int qNo, String qCategory, String qTitle, String qCon, String qOriginalFileName, String qRenameFileName,
			String qWriter, int qWriterNo, String qState, Date qDate, String qType, String qStatus) {
		super();
		this.qNo = qNo;
		this.qCategory = qCategory;
		this.qTitle = qTitle;
		this.qCon = qCon;
		this.qOriginalFileName = qOriginalFileName;
		this.qRenameFileName = qRenameFileName;
		this.qWriter = qWriter;
		this.qWriterNo = qWriterNo;
		this.qState = qState;
		this.qDate = qDate;
		this.qType = qType;
		this.qStatus = qStatus;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqCategory() {
		return qCategory;
	}

	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqCon() {
		return qCon;
	}

	public void setqCon(String qCon) {
		this.qCon = qCon;
	}

	public String getqOriginalFileName() {
		return qOriginalFileName;
	}

	public void setqOriginalFileName(String qOriginalFileName) {
		this.qOriginalFileName = qOriginalFileName;
	}

	public String getqRenameFileName() {
		return qRenameFileName;
	}

	public void setqRenameFileName(String qRenameFileName) {
		this.qRenameFileName = qRenameFileName;
	}

	public String getqWriter() {
		return qWriter;
	}

	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}

	public int getqWriterNo() {
		return qWriterNo;
	}

	public void setqWriterNo(int qWriterNo) {
		this.qWriterNo = qWriterNo;
	}

	public String getqState() {
		return qState;
	}

	public void setqState(String qState) {
		this.qState = qState;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public String getqType() {
		return qType;
	}

	public void setqType(String qType) {
		this.qType = qType;
	}

	public String getqStatus() {
		return qStatus;
	}

	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	@Override
	public String toString() {
		return "Qna [qNo=" + qNo + ", qCategory=" + qCategory + ", qTitle=" + qTitle + ", qCon=" + qCon
				+ ", qOriginalFileName=" + qOriginalFileName + ", qRenameFileName=" + qRenameFileName + ", qWriter="
				+ qWriter + ", qWriterNo=" + qWriterNo + ", qState=" + qState + ", qDate=" + qDate + ", qType=" + qType
				+ ", qStatus=" + qStatus + "]";
	}

	
	
}
