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
	private int sgMaxPeople;
	private String sgAddr;
	private String sgDeposit;
	private Date sgCreateDate;
	private String sgStartDate;
	private String sgEndDate;
	private String sgLocation;
	private String sgJoin;
	private String sgCon;
	private String sgOrginalFileName;
	private String sgRenameFileName;
	private String sgTag;
	private String sgPayment;
	private String sgStatus;
	public StudyGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudyGroup(int sgNo, String sgTitle, String sgWriter, int sgMaxPeople, String sgAddr, String sgDeposit,
			Date sgCreateDate, String sgStartDate, String sgEndDate, String sgLocation, String sgJoin, String sgCon,
			String sgOrginalFileName, String sgRenameFileName, String sgTag, String sgPayment, String sgStatus) {
		super();
		this.sgNo = sgNo;
		this.sgTitle = sgTitle;
		this.sgWriter = sgWriter;
		this.sgMaxPeople = sgMaxPeople;
		this.sgAddr = sgAddr;
		this.sgDeposit = sgDeposit;
		this.sgCreateDate = sgCreateDate;
		this.sgStartDate = sgStartDate;
		this.sgEndDate = sgEndDate;
		this.sgLocation = sgLocation;
		this.sgJoin = sgJoin;
		this.sgCon = sgCon;
		this.sgOrginalFileName = sgOrginalFileName;
		this.sgRenameFileName = sgRenameFileName;
		this.sgTag = sgTag;
		this.sgPayment = sgPayment;
		this.sgStatus = sgStatus;
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

	public String getSgDeposit() {
		return sgDeposit;
	}

	public void setSgDeposit(String sgDeposit) {
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

	public String getSgOrginalFileName() {
		return sgOrginalFileName;
	}

	public void setSgOrginalFileName(String sgOrginalFileName) {
		this.sgOrginalFileName = sgOrginalFileName;
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

	@Override
	public String toString() {
		return "StudyGroup [sgNo=" + sgNo + ", sgTitle=" + sgTitle + ", sgWriter=" + sgWriter + ", sgMaxPeople="
				+ sgMaxPeople + ", sgAddr=" + sgAddr + ", sgDeposit=" + sgDeposit + ", sgCreateDate=" + sgCreateDate
				+ ", sgStartDate=" + sgStartDate + ", sgEndDate=" + sgEndDate + ", sgLocation=" + sgLocation
				+ ", sgJoin=" + sgJoin + ", sgCon=" + sgCon + ", sgOrginalFileName=" + sgOrginalFileName
				+ ", sgRenameFileName=" + sgRenameFileName + ", sgTag=" + sgTag + ", sgPayment=" + sgPayment
				+ ", sgStatus=" + sgStatus + "]";
	}
	
	
}
	
