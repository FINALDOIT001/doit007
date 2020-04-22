package com.kh.doit.study.model.vo;

import org.springframework.stereotype.Component;

@Component
public class StudyLike {
	
	private int slNo;
	private int slmNo;
	private int slsgNo;
	public StudyLike() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudyLike(int slNo, int slmNo, int slsgNo) {
		super();
		this.slNo = slNo;
		this.slmNo = slmNo;
		this.slsgNo = slsgNo;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public int getSlmNo() {
		return slmNo;
	}
	public void setSlmNo(int slmNo) {
		this.slmNo = slmNo;
	}
	public int getSlsgNo() {
		return slsgNo;
	}
	public void setSlsgNo(int slsgNo) {
		this.slsgNo = slsgNo;
	}
	@Override
	public String toString() {
		return "StudyLike [slNo=" + slNo + ", slmNo=" + slmNo + ", slsgNo=" + slsgNo + "]";
	}
	
	
}
