package com.kh.doit.hodu.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Hodu {
	private int hNo;     // 번호
	private int hmNo;    // 멤버번호
	private String hmId; // 멤버아이디
	private int hodu;    // 호두 개수
	private int hPrice;  // 호두 가격
	private Date hDate;  // 날짜
	
	public Hodu() {
		super();
	}

	public Hodu(int hNo, int hmNo, String hmId, int hodu, int hPrice, Date hDate) {
		super();
		this.hNo = hNo;
		this.hmNo = hmNo;
		this.hmId = hmId;
		this.hodu = hodu;
		this.hPrice = hPrice;
		this.hDate = hDate;
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

	public int getHodu() {
		return hodu;
	}

	public void setHodu(int hodu) {
		this.hodu = hodu;
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

	@Override
	public String toString() {
		return "Hodu [hNo=" + hNo + ", hmNo=" + hmNo + ", hmId=" + hmId + ", hodu=" + hodu + ", hPrice=" + hPrice
				+ ", hDate=" + hDate + "]";
	}
	
	
}
