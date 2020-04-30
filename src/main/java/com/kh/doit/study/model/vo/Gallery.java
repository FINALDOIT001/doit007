package com.kh.doit.study.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Gallery {

	private int g_No;
	private int g_Sg_No;
	private String g_Title;
	private String g_Writer;
	private String g_Writer_No;
	private String g_Con;
	private Date g_Date;
	private String g_Original_FileName;
	private String g_Rename_FileName;
	private int g_Num;
	private String g_Status;
	
	private int count;
	
	public Gallery() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Gallery(int g_No, int g_Sg_No, String g_Title, String g_Writer, String g_Writer_No, String g_Con,
			Date g_Date, String g_Original_FileName, String g_Rename_FileName, int g_Num, String g_Status, int count) {
		super();
		this.g_No = g_No;
		this.g_Sg_No = g_Sg_No;
		this.g_Title = g_Title;
		this.g_Writer = g_Writer;
		this.g_Writer_No = g_Writer_No;
		this.g_Con = g_Con;
		this.g_Date = g_Date;
		this.g_Original_FileName = g_Original_FileName;
		this.g_Rename_FileName = g_Rename_FileName;
		this.g_Num = g_Num;
		this.g_Status = g_Status;
		this.count = count;
	}

	public int getG_No() {
		return g_No;
	}

	public void setG_No(int g_No) {
		this.g_No = g_No;
	}

	public int getG_Sg_No() {
		return g_Sg_No;
	}

	public void setG_Sg_No(int g_Sg_No) {
		this.g_Sg_No = g_Sg_No;
	}

	public String getG_Title() {
		return g_Title;
	}

	public void setG_Title(String g_Title) {
		this.g_Title = g_Title;
	}

	public String getG_Writer() {
		return g_Writer;
	}

	public void setG_Writer(String g_Writer) {
		this.g_Writer = g_Writer;
	}

	public String getG_Writer_No() {
		return g_Writer_No;
	}

	public void setG_Writer_No(String g_Writer_No) {
		this.g_Writer_No = g_Writer_No;
	}

	public String getG_Con() {
		return g_Con;
	}

	public void setG_Con(String g_Con) {
		this.g_Con = g_Con;
	}

	public Date getG_Date() {
		return g_Date;
	}

	public void setG_Date(Date g_Date) {
		this.g_Date = g_Date;
	}

	public String getG_Original_FileName() {
		return g_Original_FileName;
	}

	public void setG_Original_FileName(String g_Original_FileName) {
		this.g_Original_FileName = g_Original_FileName;
	}

	public String getG_Rename_FileName() {
		return g_Rename_FileName;
	}

	public void setG_Rename_FileName(String g_Rename_FileName) {
		this.g_Rename_FileName = g_Rename_FileName;
	}

	public int getG_Num() {
		return g_Num;
	}

	public void setG_Num(int g_Num) {
		this.g_Num = g_Num;
	}

	public String getG_Status() {
		return g_Status;
	}

	public void setG_Status(String g_Status) {
		this.g_Status = g_Status;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Gallery [g_No=" + g_No + ", g_Sg_No=" + g_Sg_No + ", g_Title=" + g_Title + ", g_Writer=" + g_Writer
				+ ", g_Writer_No=" + g_Writer_No + ", g_Con=" + g_Con + ", g_Date=" + g_Date + ", g_Original_FileName="
				+ g_Original_FileName + ", g_Rename_FileName=" + g_Rename_FileName + ", g_Num=" + g_Num + ", g_Status="
				+ g_Status + ", count=" + count + "]";
	}

	
}
