package com.kh.doit.event.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Event implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3481771784935065328L;
	private int eNo;
	private String eIntro;
	private String eTitle;
	private String eCon;
	private String eTag;
	private String eOriginalFileName;
	private String eRenameFileName;
	private String eWriter;
	private int eWriterNo;
	private String eType; // 세미나인지 웨비나인지 포럼인지 등등
	private int eMonth;
	private int eDays;
	private Date eDate;
	private String eStatus;
	
	public Event() {
	}

	public Event(int eNo, String eIntro, String eTitle, String eCon, String eTag, String eOriginalFileName,
			String eRenameFileName, String eWriter, int eWriterNo, String eType, int eMonth, int eDays, Date eDate,
			String eStatus) {
		super();
		this.eNo = eNo;
		this.eIntro = eIntro;
		this.eTitle = eTitle;
		this.eCon = eCon;
		this.eTag = eTag;
		this.eOriginalFileName = eOriginalFileName;
		this.eRenameFileName = eRenameFileName;
		this.eWriter = eWriter;
		this.eWriterNo = eWriterNo;
		this.eType = eType;
		this.eMonth = eMonth;
		this.eDays = eDays;
		this.eDate = eDate;
		this.eStatus = eStatus;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public String geteIntro() {
		return eIntro;
	}

	public void seteIntro(String eIntro) {
		this.eIntro = eIntro;
	}

	public String geteTitle() {
		return eTitle;
	}

	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}

	public String geteCon() {
		return eCon;
	}

	public void seteCon(String eCon) {
		this.eCon = eCon;
	}

	public String geteTag() {
		return eTag;
	}

	public void seteTag(String eTag) {
		this.eTag = eTag;
	}

	public String geteOriginalFileName() {
		return eOriginalFileName;
	}

	public void seteOriginalFileName(String eOriginalFileName) {
		this.eOriginalFileName = eOriginalFileName;
	}

	public String geteRenameFileName() {
		return eRenameFileName;
	}

	public void seteRenameFileName(String eRenameFileName) {
		this.eRenameFileName = eRenameFileName;
	}

	public String geteWriter() {
		return eWriter;
	}

	public void seteWriter(String eWriter) {
		this.eWriter = eWriter;
	}

	public int geteWriterNo() {
		return eWriterNo;
	}

	public void seteWriterNo(int eWriterNo) {
		this.eWriterNo = eWriterNo;
	}

	public String geteType() {
		return eType;
	}

	public void seteType(String eType) {
		this.eType = eType;
	}

	public int geteMonth() {
		return eMonth;
	}

	public void seteMonth(int eMonth) {
		this.eMonth = eMonth;
	}

	public int geteDays() {
		return eDays;
	}

	public void seteDays(int eDays) {
		this.eDays = eDays;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	public String geteStatus() {
		return eStatus;
	}

	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Event [eNo=" + eNo + ", eIntro=" + eIntro + ", eTitle=" + eTitle + ", eCon=" + eCon + ", eTag=" + eTag
				+ ", eOriginalFileName=" + eOriginalFileName + ", eRenameFileName=" + eRenameFileName + ", eWriter="
				+ eWriter + ", eWriterNo=" + eWriterNo + ", eType=" + eType + ", eMonth=" + eMonth + ", eDays=" + eDays
				+ ", eDate=" + eDate + ", eStatus=" + eStatus + "]";
	}

	
}
