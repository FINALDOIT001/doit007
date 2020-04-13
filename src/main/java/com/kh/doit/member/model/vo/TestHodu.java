package com.kh.doit.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class TestHodu {
	
	private int hmNo; // 멤버  No
	private int hoduNum; // 추가되는 호두 갯수
	public TestHodu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TestHodu(int hmNo, int hoduNum) {
		super();
		this.hmNo = hmNo;
		this.hoduNum = hoduNum;
	}
	public int getHmNo() {
		return hmNo;
	}
	public void setHmNo(int hmNo) {
		this.hmNo = hmNo;
	}
	public int getHoduNum() {
		return hoduNum;
	}
	public void setHoduNum(int hoduNum) {
		this.hoduNum = hoduNum;
	}
	@Override
	public String toString() {
		return "TestHodu [hmNo=" + hmNo + ", hoduNum=" + hoduNum + "]";
	}
	
	

}
