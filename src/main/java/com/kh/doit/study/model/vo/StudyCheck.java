package com.kh.doit.study.model.vo;

import org.springframework.stereotype.Component;

@Component
public class StudyCheck {

	private int scNo;
	private int ssNo;
	private int sgNo;
	private int scMno;
	private String scDate;
	private char scCheck;

	public StudyCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudyCheck(int scNo, int ssNo, int sgNo, int scMno, String scDate, char scCheck) {
		super();
		this.scNo = scNo;
		this.ssNo = ssNo;
		this.sgNo = sgNo;
		this.scMno = scMno;
		this.scDate = scDate;
		this.scCheck = scCheck;
	}

	public int getScNo() {
		return scNo;
	}

	public void setScNo(int scNo) {
		this.scNo = scNo;
	}

	public int getSsNo() {
		return ssNo;
	}

	public void setSsNo(int ssNo) {
		this.ssNo = ssNo;
	}

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
	}

	public int getScMno() {
		return scMno;
	}

	public void setScMno(int scMno) {
		this.scMno = scMno;
	}

	public String getScDate() {
		return scDate;
	}

	public void setScDate(String scDate) {
		this.scDate = scDate;
	}

	public char getScCheck() {
		return scCheck;
	}

	public void setScCheck(char scCheck) {
		this.scCheck = scCheck;
	}

	@Override
	public String toString() {
		return "StudyCheck [scNo=" + scNo + ", ssNo=" + ssNo + ", sgNo=" + sgNo + ", scMno=" + scMno + ", scDate="
				+ scDate + ", scCheck=" + scCheck + "]";
	}

}
