package com.kh.doit.notice.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Notice {
	
	private int n_no;
	private String n_title;
	private String n_writer;
	private Date n_createdate;
	private Date n_modifydate;
	private String n_content;
	private String n_org_filename;
	private String n_re_filename;
	private String n_status;
	private int n_count; 
	
	public Notice() {
		super();
	}

	public Notice(int n_no, String n_title, String n_writer, Date n_createdate, Date n_modifydate, String n_content,
			String n_org_filename, String n_re_filename, String n_status, int n_count) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_writer = n_writer;
		this.n_createdate = n_createdate;
		this.n_modifydate = n_modifydate;
		this.n_content = n_content;
		this.n_org_filename = n_org_filename;
		this.n_re_filename = n_re_filename;
		this.n_status = n_status;
		this.n_count = n_count;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_writer() {
		return n_writer;
	}

	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}

	public Date getN_createdate() {
		return n_createdate;
	}

	public void setN_createdate(Date n_createdate) {
		this.n_createdate = n_createdate;
	}

	public Date getN_modifydate() {
		return n_modifydate;
	}

	public void setN_modifydate(Date n_modifydate) {
		this.n_modifydate = n_modifydate;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_org_filename() {
		return n_org_filename;
	}

	public void setN_org_filename(String n_org_filename) {
		this.n_org_filename = n_org_filename;
	}

	public String getN_re_filename() {
		return n_re_filename;
	}

	public void setN_re_filename(String n_re_filename) {
		this.n_re_filename = n_re_filename;
	}

	public String getN_status() {
		return n_status;
	}

	public void setN_status(String n_status) {
		this.n_status = n_status;
	}

	public int getN_count() {
		return n_count;
	}

	public void setN_count(int n_count) {
		this.n_count = n_count;
	}

	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", n_title=" + n_title + ", n_writer=" + n_writer + ", n_createdate="
				+ n_createdate + ", n_modifydate=" + n_modifydate + ", n_content=" + n_content + ", n_org_filename="
				+ n_org_filename + ", n_re_filename=" + n_re_filename + ", n_status=" + n_status + ", n_count="
				+ n_count + "]";
	}
	
	

}
