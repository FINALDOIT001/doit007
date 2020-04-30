package com.kh.doit.study.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class StudyGroup {
	
	private int sgNo ;
	private String sgTitle;
	private String sgWriter;
	private int sgWriterNo;
	private int sgNowPeople;
	private int sgMaxPeople;
	private String sgAddr;
	private int sgDeposit;
	private Date sgCreateDate;
	private String sgStartDate;
	private String sgEndDate;
	private String sgLocation;
	private String sgJoin;
	private String sgCon;
	private String sgOriginalFileName;
	private String sgRenameFileName;
	private String sgTag;
	private String sgPayment;
	private String sgStatus;
	private String sgConfirm;
	
	public StudyGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudyGroup(int sgNo, String sgTitle, String sgWriter, int sgWriterNo, int sgNowPeople, int sgMaxPeople,
			String sgAddr, int sgDeposit, Date sgCreateDate, String sgStartDate, String sgEndDate, String sgLocation,
			String sgJoin, String sgCon, String sgOriginalFileName, String sgRenameFileName, String sgTag,
			String sgPayment, String sgStatus, String sgConfirm) {
		super();
		this.sgNo = sgNo;
		this.sgTitle = sgTitle;
		this.sgWriter = sgWriter;
		this.sgWriterNo = sgWriterNo;
		this.sgNowPeople = sgNowPeople;
		this.sgMaxPeople = sgMaxPeople;
		this.sgAddr = sgAddr;
		this.sgDeposit = sgDeposit;
		this.sgCreateDate = sgCreateDate;
		this.sgStartDate = sgStartDate;
		this.sgEndDate = sgEndDate;
		this.sgLocation = sgLocation;
		this.sgJoin = sgJoin;
		this.sgCon = sgCon;
		this.sgOriginalFileName = sgOriginalFileName;
		this.sgRenameFileName = sgRenameFileName;
		this.sgTag = sgTag;
		this.sgPayment = sgPayment;
		this.sgStatus = sgStatus;
		this.sgConfirm = sgConfirm;
	}

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
	}
	public String getSgTitle() {
		return sgTitle;
	}

	public void setSgTitle(String sgTitle) {
		this.sgTitle = sgTitle;
	}

	public String getSgWriter() {
		return sgWriter;
	}

	public void setSgWriter(String sgWriter) {
		this.sgWriter = sgWriter;
	}

	public int getSgWriterNo() {
		return sgWriterNo;
	}

	public void setSgWriterNo(int sgWriterNo) {
		this.sgWriterNo = sgWriterNo;
	}

	public int getSgNowPeople() {
		return sgNowPeople;
	}

	public void setSgNowPeople(int sgNowPeople) {
		this.sgNowPeople = sgNowPeople;
	}

	public int getSgMaxPeople() {
		return sgMaxPeople;
	}

	public void setSgMaxPeople(int sgMaxPeople) {
		this.sgMaxPeople = sgMaxPeople;
	}

	public String getSgAddr() {
		return sgAddr;
	}

	public void setSgAddr(String sgAddr) {
		this.sgAddr = sgAddr;
	}

	public int getSgDeposit() {
		return sgDeposit;
	}

	public void setSgDeposit(int sgDeposit) {
		this.sgDeposit = sgDeposit;
	}

	public Date getSgCreateDate() {
		return sgCreateDate;
	}

	public void setSgCreateDate(Date sgCreateDate) {
		this.sgCreateDate = sgCreateDate;
	}

	public String getSgStartDate() {
		return sgStartDate;
	}

	public void setSgStartDate(String sgStartDate) {
		this.sgStartDate = sgStartDate;
	}

	public String getSgEndDate() {
		return sgEndDate;
	}

	public void setSgEndDate(String sgEndDate) {
		this.sgEndDate = sgEndDate;
	}

	public String getSgLocation() {
		return sgLocation;
	}

	public void setSgLocation(String sgLocation) {
		this.sgLocation = sgLocation;
	}

	public String getSgJoin() {
		return sgJoin;
	}

	public void setSgJoin(String sgJoin) {
		this.sgJoin = sgJoin;
	}

	public String getSgCon() {
		return sgCon;
	}

	public void setSgCon(String sgCon) {
		this.sgCon = sgCon;
	}

	public String getSgOriginalFileName() {
		return sgOriginalFileName;
	}

	public void setSgOriginalFileName(String sgOriginalFileName) {
		this.sgOriginalFileName = sgOriginalFileName;
	}

	public String getSgRenameFileName() {
		return sgRenameFileName;
	}

	public void setSgRenameFileName(String sgRenameFileName) {
		this.sgRenameFileName = sgRenameFileName;
	}

	public String getSgTag() {
		return sgTag;
	}

	public void setSgTag(String sgTag) {
		this.sgTag = sgTag;
	}

	public String getSgPayment() {
		return sgPayment;
	}

	public void setSgPayment(String sgPayment) {
		this.sgPayment = sgPayment;
	}

	public String getSgStatus() {
		return sgStatus;
	}

	public void setSgStatus(String sgStatus) {
		this.sgStatus = sgStatus;
	}

	public String getSgConfirm() {
		return sgConfirm;
	}

	public void setSgConfirm(String sgConfirm) {
		this.sgConfirm = sgConfirm;
	}

	@Override
	public String toString() {
		return "StudyGroup [sgNo=" + sgNo + ", sgTitle=" + sgTitle + ", sgWriter=" + sgWriter + ", sgWriterNo="
				+ sgWriterNo + ", sgNowPeople=" + sgNowPeople + ", sgMaxPeople=" + sgMaxPeople + ", sgAddr=" + sgAddr
				+ ", sgDeposit=" + sgDeposit + ", sgCreateDate=" + sgCreateDate + ", sgStartDate=" + sgStartDate
				+ ", sgEndDate=" + sgEndDate + ", sgLocation=" + sgLocation + ", sgJoin=" + sgJoin + ", sgCon=" + sgCon
				+ ", sgOriginalFileName=" + sgOriginalFileName + ", sgRenameFileName=" + sgRenameFileName + ", sgTag="
				+ sgTag + ", sgPayment=" + sgPayment + ", sgStatus=" + sgStatus + ", sgConfirm=" + sgConfirm + "]";
	}
	
	
}
	
