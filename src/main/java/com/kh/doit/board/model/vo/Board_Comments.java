package com.kh.doit.board.model.vo;

import java.sql.Date;

public class Board_Comments {
	
	private int bc_no;
	private int bc_b_no;
	private String mId; 
	private Date bc_createdate;
	private Date bc_modifydate;
	private String bc_content;
	private String bc_status; 
	
	public Board_Comments() {}

	public Board_Comments(int bc_no, int bc_b_no, String mId, Date bc_createdate, Date bc_modifydate, String bc_content,
			String bc_status) {
		super();
		this.bc_no = bc_no;
		this.bc_b_no = bc_b_no;
		this.mId = mId;
		this.bc_createdate = bc_createdate;
		this.bc_modifydate = bc_modifydate;
		this.bc_content = bc_content;
		this.bc_status = bc_status;
	}

	public int getBc_no() {
		return bc_no;
	}

	public void setBc_no(int bc_no) {
		this.bc_no = bc_no;
	}

	public int getBc_b_no() {
		return bc_b_no;
	}

	public void setBc_b_no(int bc_b_no) {
		this.bc_b_no = bc_b_no;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public Date getBc_createdate() {
		return bc_createdate;
	}

	public void setBc_createdate(Date bc_createdate) {
		this.bc_createdate = bc_createdate;
	}

	public Date getBc_modifydate() {
		return bc_modifydate;
	}

	public void setBc_modifydate(Date bc_modifydate) {
		this.bc_modifydate = bc_modifydate;
	}

	public String getBc_content() {
		return bc_content;
	}

	public void setBc_content(String bc_content) {
		this.bc_content = bc_content;
	}

	public String getBc_status() {
		return bc_status;
	}

	public void setBc_status(String bc_status) {
		this.bc_status = bc_status;
	}

	@Override
	public String toString() {
		return "Board_Comments [bc_no=" + bc_no + ", bc_b_no=" + bc_b_no + ", mId=" + mId + ", bc_createdate="
				+ bc_createdate + ", bc_modifydate=" + bc_modifydate + ", bc_content=" + bc_content + ", bc_status="
				+ bc_status + "]";
	}
	
	
	

}
