package com.kh.doit.message.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Message implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6068934399278091633L;
	private int msNo;
	private String msSender;
	private String msRecipient;
	private String msTitle;
	private String msContext;
	private Date msDate1;
	private Date msDate2;
	private String msCheck;
	
	public Message() {}
	
	
	public Message(String msSender, String msRecipient, String msTitle, String msContext) {
		this.msSender = msSender;
		this.msRecipient = msRecipient;
		this.msTitle = msTitle;
		this.msContext = msContext;
	}



	public Message(int msNo, String msSender, String msRecipient, String msTitle, String msContext, Date msDate1,
			Date msDate2, String msCheck) {
		super();
		this.msNo = msNo;
		this.msSender = msSender;
		this.msRecipient = msRecipient;
		this.msTitle = msTitle;
		this.msContext = msContext;
		this.msDate1 = msDate1;
		this.msDate2 = msDate2;
		this.msCheck = msCheck;
	}

	public int getMsNo() {
		return msNo;
	}

	public void setMsNo(int msNo) {
		this.msNo = msNo;
	}

	public String getMsSender() {
		return msSender;
	}

	public void setMsSender(String msSender) {
		this.msSender = msSender;
	}

	public String getMsRecipient() {
		return msRecipient;
	}

	public void setMsRecipient(String msRecipient) {
		this.msRecipient = msRecipient;
	}

	public String getMsTitle() {
		return msTitle;
	}

	public void setMsTitle(String msTitle) {
		this.msTitle = msTitle;
	}

	public String getMsContext() {
		return msContext;
	}

	public void setMsContext(String msContext) {
		this.msContext = msContext;
	}

	public Date getMsDate1() {
		return msDate1;
	}

	public void setMsDate1(Date msDate1) {
		this.msDate1 = msDate1;
	}

	public Date getMsDate2() {
		return msDate2;
	}

	public void setMsDate2(Date msDate2) {
		this.msDate2 = msDate2;
	}

	public String getMsCheck() {
		return msCheck;
	}

	public void setMsCheck(String msCheck) {
		this.msCheck = msCheck;
	}

	@Override
	public String toString() {
		return "Message [msNo=" + msNo + ", msSender=" + msSender + ", msRecipient=" + msRecipient + ", msTitle="
				+ msTitle + ", msContext=" + msContext + ", msDate1=" + msDate1 + ", msDate2=" + msDate2 + ", msCheck="
				+ msCheck + "]";
	}

}
