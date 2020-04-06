package com.kh.doit.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board {
	
	private int b_no; 
	private String b_title;
	private String b_writer;
	private String b_content;
	private String b_org_filename;
	private String b_re_filename; 
	private Date b_createdate;
	private Date b_modifydate;
	private String b_status;
	private int b_count; 
	
	public Board() {}

	public Board(int b_no, String b_title, String b_writer, String b_content, String b_org_filename,
			String b_re_filename, Date b_createdate, Date b_modifydate, String b_status, int b_count) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_org_filename = b_org_filename;
		this.b_re_filename = b_re_filename;
		this.b_createdate = b_createdate;
		this.b_modifydate = b_modifydate;
		this.b_status = b_status;
		this.b_count = b_count;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_org_filename() {
		return b_org_filename;
	}

	public void setB_org_filename(String b_org_filename) {
		this.b_org_filename = b_org_filename;
	}

	public String getB_re_filename() {
		return b_re_filename;
	}

	public void setB_re_filename(String b_re_filename) {
		this.b_re_filename = b_re_filename;
	}

	public Date getB_createdate() {
		return b_createdate;
	}

	public void setB_createdate(Date b_createdate) {
		this.b_createdate = b_createdate;
	}

	public Date getB_modifydate() {
		return b_modifydate;
	}

	public void setB_modifydate(Date b_modifydate) {
		this.b_modifydate = b_modifydate;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	@Override
	public String toString() {
		return "Board [b_no=" + b_no + ", b_title=" + b_title + ", b_writer=" + b_writer + ", b_content=" + b_content
				+ ", b_org_filename=" + b_org_filename + ", b_re_filename=" + b_re_filename + ", b_createdate="
				+ b_createdate + ", b_modifydate=" + b_modifydate + ", b_status=" + b_status + ", b_count=" + b_count
				+ "]";
	}
	
	

}
