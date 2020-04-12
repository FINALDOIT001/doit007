package com.kh.doit.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Hodu {
	private int hNo;     // 번호
	private int hmNo;    // 멤버번호
	private String hmId; // 멤버아이디
	private int hoduNum;    // 호두 개수
	private int hPrice;  // 호두 가격
	private Date hDate;  // 날짜
	private Member member; 
	
	public Hodu() {
		super();
	}

	public Hodu(int hNo, int hmNo, String hmId, int hoduNum, int hPrice, Date hDate, Member member) {
		super();
		this.hNo = hNo;
		this.hmNo = hmNo;
		this.hmId = hmId;
		this.hoduNum = hoduNum;
		this.hPrice = hPrice;
		this.hDate = hDate;
		this.member = member;
	}

	public int gethNo() {
		return hNo;
	}

	public void sethNo(int hNo) {
		this.hNo = hNo;
	}

	public int getHmNo() {
		return hmNo;
	}

	public void setHmNo(int hmNo) {
		this.hmNo = hmNo;
	}

	public String getHmId() {
		return hmId;
	}

	public void setHmId(String hmId) {
		this.hmId = hmId;
	}

	public int getHoduNum() {
		return hoduNum;
	}

	public void setHoduNum(int hoduNum) {
		this.hoduNum = hoduNum;
	}

	public int gethPrice() {
		return hPrice;
	}

	public void sethPrice(int hPrice) {
		this.hPrice = hPrice;
	}

	public Date gethDate() {
		return hDate;
	}

	public void sethDate(Date hDate) {
		this.hDate = hDate;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Hodu [hNo=" + hNo + ", hmNo=" + hmNo + ", hmId=" + hmId + ", hoduNum=" + hoduNum + ", hPrice=" + hPrice
				+ ", hDate=" + hDate + ", member=" + member + "]";
	}

	
}
